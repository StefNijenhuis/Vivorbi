class PagesController < ApplicationController
  def home
    @user = User.first
    @last = Message.last(3)
    @closest = Message.find_by_location_and_radius(@user.latitude,@user.longitude,999,3)
    @popularity = Message.popularity(3)

    @row = [
      [@last[0], @closest[0], @popularity[0]],
      [@last[1], @closest[1], @popularity[1]],
      [@last[2], @closest[2], @popularity[2]]
    ]

  end
end
