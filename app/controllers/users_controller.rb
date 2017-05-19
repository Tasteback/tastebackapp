class UsersController < ApplicationController
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
    @allergies = Allergy.find(user_params[:allergies])
    @user.allergies = @allergies
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
end
