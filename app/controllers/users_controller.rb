class UsersController < ApplicationController
  before_action :check_admin, only: [:index, :role_form, :set_role]
  def index
    @users = User.all
    
  end
  def role_form
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
  end
  def set_role
    @user = User.find(params[:user_id])
    @user.remove_role :owner if @user.has_role? :owner
    @user.remove_role :admin if @user.has_role? :admin
    if params[:role] == "owner"
      params[:restaurants].each do |r|
        @user.add_role :owner, Restaurant.find(r)
      end
    elsif params[:role] == "admin"
      @user.add_role :admin
    end
    flash[:success] = "User role updated!"
    redirect_to admin_path
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
    @allergies = Allergy.all
  end
  def update
    @user = User.find(params[:id])
    if user_params[:avatar]
      @user.update_attributes(avatar: user_params[:avatar])
    end
    if user_params[:allergies]
      @allergies = Allergy.find(user_params[:allergies])
      @user.allergies = @allergies
    else 
      @user.allergies = []
    end
    if @user.save
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.permit(:avatar, :allergies => [])
  end
  def check_admin
    if !user_signed_in? || !current_user.has_role?(:admin)
      redirect_to :root
    end
  end
end
