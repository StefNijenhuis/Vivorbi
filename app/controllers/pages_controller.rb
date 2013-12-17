class PagesController < ApplicationController
  def home
    amount = 3
    last = Message.all(:order => "created_at DESC", :limit => amount)
    location = {'latitude'=>@user.latitude,'longitude'=>@user.longitude}
    nearby = Message.find_by_location_and_radius(location,999)
    popular = Message.find_by_popularity(amount)
    @columns = [last, nearby, popular]
    @columnTitles = ["Recent", "In de buurt", "Populair"]
  end
end
