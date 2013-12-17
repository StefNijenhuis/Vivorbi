class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates_presence_of :title, :body, :category_id
  validates :category_id, :numericality => true

  include PgSearch
  pg_search_scope :search_by_keyword,
    :against => [:title,:body],
    :using => {
      :tsearch => {
        :dictionary => "dutch",
        :any_word => true
      }
    }

  # attribute accessors
  def distance
    read_attribute(:distance).to_f
  end
  
  # finders
  def self.find_by_popularity(limit = 10, offset = 0, order_count = "DESC", order_create = "DESC")
    self.all(:joins => :comments,
             :group => 'messages.id',
             :order => "count(*) #{order_count}, created_at #{order_create}",
             :limit => limit,
             :offset => offset)
  end

  def self.find_by_keyword(keyword)
    self.search_by_keyword(keyword)
  end
  
  # order and limit in controller!
  def self.find_by_keyword_location_and_radius(keyword,location,radius)
    latitude = location['latitude']
    longitude = location['longitude']
    distance = "6371 * acos( cos( radians( #{latitude} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{longitude} ) ) + sin( radians( #{latitude} ) ) * sin( radians( users.latitude ) ) )"
    search_result = self.search_by_keyword(keyword)
    # return false when there is no search result returned
    if(search_result.empty?)
      return false
    else
      search_result.joins(:user).select("messages.*, #{distance} AS distance").where("#{distance} <= #{radius}")
    end
  end

  # order and limit in controller!
  def self.find_by_location_and_radius(location,radius)
    latitude = location['latitude']
    longitude = location['longitude']
    distance = "6371 * acos( cos( radians( #{latitude} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{longitude} ) ) + sin( radians( #{latitude} ) ) * sin( radians( users.latitude ) ) )"
    self.joins(:user).select("messages.*, #{distance} AS distance").where("#{distance} <= #{radius}")
  end
end
