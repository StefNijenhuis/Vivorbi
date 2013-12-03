class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :body

  def self.popularity(limit = 10, offset = 0, order_count = "DESC", order_create = "DESC")
    self.all(:joins => :comments,
             :group => 'messages.id',
             :order => "count(*) #{order_count}, created_at #{order_create}",
             :limit => limit,
             :offset => offset)
  end

  def distance
    read_attribute(:distance).to_f
  end

  def self.find_by_location_and_radius(s_lat,s_long,radius,limit = 999)
    self.joins(:user).select("messages.*, 6371 * acos( cos( radians( #{s_lat} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{s_long} ) ) + sin( radians( #{s_lat} ) ) * sin( radians( users.latitude ) ) ) AS distance").where("6371 * acos( cos( radians( #{s_lat} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{s_long} ) ) + sin( radians( #{s_lat} ) ) * sin( radians( users.latitude ) ) ) <= #{radius}").order("distance").limit(limit)
  end
end