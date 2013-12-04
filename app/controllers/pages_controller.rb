class PagesController < ApplicationController
  def home
    amount = 3
    @last = Message.last(amount)
    @nearby = Message.find_by_location_and_radius(@user.latitude,@user.longitude,999,amount)
    @popular = Message.find_by_popularity(amount)

    @row = [@last,@nearby,@popular]
  end
end
