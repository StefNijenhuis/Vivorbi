class PagesController < ApplicationController
  def home
    amount = 3
    # TODO door Zohan
    @last = Message.last(amount)
    @nearby = Message.find_by_location_and_radius(@user,999,amount)
    @popular = Message.find_by_popularity(amount)

    @row = [@last,@nearby,@popular]
  end
end
