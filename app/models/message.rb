class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates_presence_of :title, :body

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

  def self.find_by_location_and_radius(location,radius,limit = 999)
    latitude = location['latitude']
    longitude = location['longitude']
    distance = "6371 * acos( cos( radians( #{latitude} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{longitude} ) ) + sin( radians( #{latitude} ) ) * sin( radians( users.latitude ) ) )"
    self.joins(:user).select("messages.*, #{distance} AS distance").where("#{distance} <= #{radius}").order("distance").limit(limit)
  end

  def self.find_by_keyword_location_and_radius(keyword,location,radius,limit = 999)
    latitude = location['latitude']
    longitude = location['longitude']
    distance = "6371 * acos( cos( radians( #{latitude} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{longitude} ) ) + sin( radians( #{latitude} ) ) * sin( radians( users.latitude ) ) )"
    self.where('lower(title) LIKE ? OR (lower(messages.body) LIKE ? AND lower(comments.body) NOT LIKE ?) OR (lower(comments.body) LIKE ? AND lower(messages.body) NOT LIKE ?)',"%#{keyword.downcase}%","%#{keyword.downcase}%","%#{keyword.downcase}%","%#{keyword.downcase}%","%#{keyword.downcase}%").joins(:user).joins(:comments).select("DISTINCT messages.*, #{distance} AS distance").where("#{distance} <= #{radius}").order("distance").limit(limit)
  end
end
