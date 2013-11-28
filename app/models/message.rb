class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :body

  def distance
    read_attribute(:distance).to_f
  end

  def self.find_by_location_and_radius(s_lat,s_long,radius)
    self.joins(:user).select("messages.*, 6371 * acos( cos( radians( #{s_lat} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{s_long} ) ) + sin( radians( #{s_lat} ) ) * sin( radians( users.latitude ) ) ) AS distance").where("6371 * acos( cos( radians( #{s_lat} ) ) * cos( radians( users.latitude ) ) * cos( radians( users.longitude ) - radians( #{s_long} ) ) + sin( radians( #{s_lat} ) ) * sin( radians( users.latitude ) ) ) <= #{radius}")
  end
end