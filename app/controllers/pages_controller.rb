class PagesController < ApplicationController
  def home
    amount = 3
    @user = User.first
    last = Message.last(amount)
    nearby = Message.find_by_location_and_radius(@user.latitude,@user.longitude,999,amount)
    popular = Message.find_by_popularity(amount)
    @row = []

    # loop amount of times
    amount.times do |i|
      @row << [last[i],nearby[i],popular[i]]
    end
  end
end
