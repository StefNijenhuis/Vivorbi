class RequestsController < ApplicationController
  def index
  end

  def new
  end

  def create
    render text: "Title: " + params[:title] + "<br>Date: " + params[:date]
  end
end
