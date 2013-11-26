class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates_presence_of :body
end