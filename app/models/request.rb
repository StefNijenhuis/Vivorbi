class Request < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  validates :date, :presence => true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
	if date.present? && date < Date.today
      errors.add(:date, "kan niet in het verleden zijn")
    end
  end
end
