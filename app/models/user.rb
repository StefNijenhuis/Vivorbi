class User < ActiveRecord::Base
  has_attached_file :avatar,
    :styles => {
      :large => {
          :geometry => '400x400#',
          :quality => 80,
          :format => 'JPG',
          :less_than => 20.megabytes
      },
      :medium => {
          :geometry => '300x300#',
          :quality => 80,
          :format => 'JPG',
          :less_than => 20.megabytes
      },
      :small => {
          :geometry => '200x200#',
          :quality => 80,
          :format => 'JPG',
          :less_than => 20.megabytes
      },
      :thumbnail => {
          :geometry => '100x100#',
          :quality => 80,
          :format => 'JPG',
          :less_than => 20.megabytes
      }
    },
    :path => ":rails_root/public/avatars/:style/:id.:extension",
    :default_url => ":rails_root/public/avatars/missing.jpg"

  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/bmp", "image/png"] }
end
