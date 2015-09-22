 class UsersController < ApplicationController
  
  def index
    @users = User.all

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

    if params[:serach]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.order("created_at DESC")
    end

  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else 
      render 'new'
    end
  end


  def edit 
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @user_photos = @user.photos(params[:id])
  end

  def update
    @user = User.find(params[:id])
   
    if  @user.update_attributes(user_params)
    flash[:success] = "Location Updated"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy 
    user = User.find(params[:id])
    if user.destroy
      redirect_to root_path
    else 
      redirect_to user_path(current_user)
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :lat, :lng, :latitude, :longitude)
  end

end
  

