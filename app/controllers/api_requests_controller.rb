class ApiRequestsController < ApplicationController
  def postal_code
  	require 'net/http'
	
	pc = params[:pc]
	nr = params[:nr]
	
	if nr != nil
		uri = URI("http://api.postcodeapi.nu/#{pc}/#{nr}")
	else
		uri = URI("http://api.postcodeapi.nu/#{pc}")
	end
	
	req = Net::HTTP::Get.new(uri)
	req['Api-Key'] = '6451884210699c31101d4309a92ba3253095b9e9'
	
	res = Net::HTTP.start(uri.hostname, uri.port) {|http|
	  http.request(req)
	}
	
	render :json => res.body
  end
end
