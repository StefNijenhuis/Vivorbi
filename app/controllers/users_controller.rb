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

  # GET /users/1/profile_1
  def profile_1
    @user = User.find(params[:id])
  end

  # PATXH /users/1/edit_profile
  def edit_profile
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
    render :profile_1
  end

  # PATCH /users/1/profile_2
  def profile_2
    @user = User.find(params[:id])
    # avatar hier opslaan
    @months = ["Kies een maand","Januari","Februari","Maart","April","Mei","Juni","Juli","Augustus","September","Oktober","November","December"]
    user_params.each { |key,value| @user[key] = value }
  end

  # PATCH /users/1/profile_3
  def profile_3
    @user = User.find(params[:id])
    user_params.each { |key,value| @user[key] = value }
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
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
