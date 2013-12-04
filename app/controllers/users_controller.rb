class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /users
  def index
    @users = User.all
  end
  
  # GET /users/1
  def show
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    pc_info = find_location_for_postal_code(@user.postal_code)
    @user.latitude = pc_info['latitude']
    @user.longitude = pc_info['longitude']
    if @user.save
      redirect_to @user, notice: t('users.create.success')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if(@user.postal_code != user_params[:postal_code]) {
      # update latitude and longitude
    }
    if @user.update(user_params)
      redirect_to @user, notice: t('users.update.success')
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:postal_code,:city)
    end
end
