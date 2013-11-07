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

  validates :avatar, :attachment_presence => true, :allow_blank => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar, :allow_blank => true
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/bmp", "image/png"] }

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :street, :presence => true
  validates :house_number, :presence => true
  validates_format_of :postal_code, with: /\A[1-9][0-9]{3}[\s]?[A-Za-z]{2}\z/i, on: :create
  validates :place, :presence => true
  validate :date_cannot_be_in_the_future
  validates_format_of :cellphone, with: /\A((0(6|7)){1}[1-9]{1}[0-9]{7})\z/i, on: :create
  validates_format_of :phone, with: /\A((0)[1-9]{2}[0-9][1-9][0-9]{5})\z/, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  
  def remove_file(temp_file)
    require 'fileutils'
    File.delete(temp_file)
  end

  def remove_old_temps
    require 'fileutils'
    Dir.glob("#{Rails.root}/public/avatars/tmp/*.tmp") do |file|
      if File.open(file).ctime < 1.day.ago
        File.delete file
      end
    end
  end

  def date_cannot_be_in_the_future
    if date_of_birth.blank?
      errors.add(:date_of_birth, 'mag niet leeg zijn')
    else
      if date_of_birth > Date.today
        errors.add(:date_of_birth, 'mag niet in de toekomst zijn')
      end
    end
  end

  def validates_step_1?
    if self.errors[:first_name].empty? && self.errors[:last_name].empty?
      true
    else
      false
    end
  end

  def validates_step_2?
    if self.errors[:date_of_birth].empty?
      true
    else
      false
    end
  end

  def validates_step_3?
    if self.errors[:street].empty? && self.errors[:house_number].empty? && self.errors[:postal_code].empty? && self.errors[:place].empty?
      true
    else
      false
    end
  end

  def validates_step_4?
    if self.errors[:email].empty? && self.errors[:phone].empty? && self.errors[:cellphone].empty?
      true
    else
      false
    end
  end
end