class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_user
  
  def find_location_for_postal_code(postal_code)
    require 'net/http'
    require 'json'

    postal_code.delete!(' ')
    
    if postal_code.try(:match, /^[1-9][0-9]{3}[A-Za-z]{2}$/)
      
      url = "http://api.postcodeapi.nu/#{postal_code}"
      uri = URI(url)
      
      req = Net::HTTP::Get.new(uri)
      req['Api-Key'] = '6451884210699c31101d4309a92ba3253095b9e9'
      
      res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        http.request(req)
      }
      
      parsed = JSON.parse res.body
      parsed['resource']
    else
      false
    end
  end

  private
  def load_user
    @user = User.first
  end
end