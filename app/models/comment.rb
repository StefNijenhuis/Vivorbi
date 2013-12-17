class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates_presence_of :body

  include PgSearch
  pg_search_scope :search_by_keyword,
    :against => [:body],
    :using => {
      :tsearch => {
        :dictionary => "dutch",
        :any_word => true
      }
    }
  # finders
  def self.find_by_keyword(keyword)
    self.search_by_keyword(keyword)
  end 
end