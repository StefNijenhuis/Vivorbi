class RequestsController < ApplicationController
  def index
  end

  def new
    @request = Request.new
  end

  def create
    #render text: "Title: " + params[:title] + "<br>Date: " + params[:date]
    request = Request.new
    request.title = params[:title]
    request.date = params[:date]
    request.save

  end
end
