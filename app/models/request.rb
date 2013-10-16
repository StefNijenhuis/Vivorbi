class Request < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true, :length => { :minimum => 10 }
  validates :date, :presence => true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
	if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
