class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # PATCH /users/1/profile/step_x
  def profile
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
    @user.valid?
    
    case params[:step]
    when "step_1"
      render :profile_1
    when "step_2"
      if @user.errors[:first_name].empty? && @user.errors[:last_name].empty?
        @months = ["Kies een maand","Januari","Februari","Maart","April","Mei","Juni","Juli","Augustus","September","Oktober","November","December"]
        render :profile_2
      else
        render :profile_1
      end
    when "step_3"
      if @user.errors[:date_of_birth].empty?
        render :profile_3
      else
        render :profile_2
      end
    when "step_4"
      if @user.errors[:street].empty? && @user.errors[:house_number].empty? && @user.errors[:postal_code].empty? && @user.errors[:place].empty?
        render :profile_4
      else
        render :profile_3
      end
    end
  end

  # PATCH /users/1/profile_4
  def profile_4
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
  end

  # PATCH /users/1/profile_5
  def profile_5
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
  end

  # PATCH /users/1/profile_overview
  def profile_overview
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.phone.gsub!(/[^0-9 ]/i, '')
    @user.cellphone.gsub!(/[^0-9 ]/i, '')

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        @user = User.new(user_params)
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
