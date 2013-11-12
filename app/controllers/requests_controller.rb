class RequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def index
    # load single new request for new request form
    @request = Request.new
    @form_path = '/requests/new/step_1'
    # Get all requests
    @requests = Request.all
  end

  def show
    # No view available (yet)
  end

  def new
    @request = Request.new(request_params)
    
    @base_form_path = '/requests/new/'
    @form_target = nil
    @submit_text = t('global.next')
    if params[:origin]=='overview'
      @form_target='overview'
      @submit_text = t('global.done')
    end

    case params[:step]  
    when 'step_1'
      @form_target = 'step_2' if @form_target==nil
      render :new_step_1
    when 'step_2'
      olddate = @request.date
      if @request.date == nil
        @request.date = Date.tomorrow
      end
      if @request.invalid?
        @form_target='step_2' if @form_target==nil
        render :new_step_1
      else
        @form_target = 'overview' if @form_target==nil
        @request.date = olddate
        render :new_step_2
      end
    when 'overview'
      @request.valid?
      if @request.errors[:title].any?
        @form_target='overview'
        render :new_step_1
      elsif @request.errors[:date].any?
        @form_target='overview'
        render :new_step_2
      else
        render :new_overview
      end
    else
      # do nothing
    end
  end

  def create
    # Store new request into the database
    @request = Request.new(request_params)
    @request.user = User.first # Change to user session when login system is implemented

    if @request.save
      # Redirect to index function on success
      redirect_to :action => 'index', notice: t('.success')
    else
      render action: 'new_overview'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :date)
    end
  end
