class User < ActiveRecord::Base
  has_many :messages
  has_many :comments

  validates_presence_of :name, :postal_code, :city
end