class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    @user = User.first
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.id = 0
    @base_form_path = '/users/'+@user.id.to_s+'/profile/'
    @form_target = 'step_2'
    render :profile_1
  end

  # PATCH /users/1/profile/step_x
  def profile
    @user = User.new
    @user.id = 0
    if params[:id].to_i!=0
      @user = User.find(params[:id])
    end
    user_params.each do |key, value|
      @user[key] = value unless key=='avatar'
    end
    @user.valid?

    @base_form_path = '/users/'+@user.id.to_s+'/profile/'
    @form_target = nil

    if params[:origin]=='overview'
      @form_target = 'overview'
    end
    
    @months = t('date.month_names')
    @months[0]=t('.months.choose')
    case params[:step]
    when 'step_1'
      @form_target = 'step_2' if @form_target==nil
      render :profile_1
    when 'step_2'
      if @user.validates_step_1?
        # file upload
        require 'fileutils'
        Dir.mkdir("#{Rails.root}/public/avatars") unless File.exists?("#{Rails.root}/public/avatars")
        Dir.mkdir("#{Rails.root}/public/avatars/tmp") unless File.exists?("#{Rails.root}/public/avatars/tmp")

        if user_params[:avatar]!=nil
          # if temp avatar exists, remove old temp avatar
          if params[:avatar_temp_name]!=nil
            FileUtils.rm "#{Rails.root}/public/avatars/tmp/#{params[:avatar_temp_name]}.tmp"
          end
          # create temp avatar
          @avatar_temp_name = (0...25).map { (65 + rand(26)).chr }.join
          tempfile = user_params[:avatar].tempfile

          FileUtils.mv(tempfile, "#{Rails.root}/public/avatars/tmp/#{@avatar_temp_name}.tmp")
        else
          @avatar_temp_name = params[:avatar_temp_name]
        end

        @form_target = 'step_3' if @form_target==nil
        render :profile_2
      else
        @form_target = 'step_2' if @form_target==nil
        render :profile_1
      end
    when 'step_3'
      if @user.validates_step_2?
        @form_target = 'step_4' if @form_target==nil
        render :profile_3
      else
        @form_target = 'step_3' if @form_target==nil
        render :profile_2
      end
    when 'step_4'
      if @user.validates_step_3?
        @form_target = 'step_5' if @form_target==nil
        render :profile_4
      else
        @form_target = 'step_4' if @form_target==nil
        render :profile_3
      end
    when 'step_5'
      if @user.validates_step_4?
        @form_target = 'overview'
        render :profile_5
      else
        @form_target = 'step_5' if @form_target==nil
        render :profile_4
      end
    when 'overview'
      @form_target='overview'
      if !@user.validates_step_1?
        render :profile_1
      elsif !@user.validates_step_2?
        render :profile_2
      elsif !@user.validates_step_3?
        render :profile_3
      elsif !@user.validates_step_4?
        render :profile_4
      else
        render :profile_overview
      end
    else
      # do nothing
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(:id)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    temp_file = "#{Rails.root}/public/avatars/tmp/#{params[:avatar_temp_name]}.tmp"
    @user.avatar = File.open(temp_file)
    respond_to do |format|
      if @user.save
        @user.remove_file temp_file
        @user.remove_old_temps
        format.html { redirect_to @user, notice: t('users.create.success') }
        format.json { render action: 'show', status: :created, location: @user }
      else
        @errors = @user.errors
        @user = User.new(user_params)
        # TODO render profile overview page, not new page
        format.html { render action: 'new' }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('users.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :first_name, :in_between, :last_name, :street, :house_number, :postal_code, :place, :date_of_birth, :cellphone, :phone, :email, :hobbies)
    end
end
