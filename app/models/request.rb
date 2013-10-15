class Request < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true, :length => { :minimum => 10 }
  validates :date, :presence => true
end
