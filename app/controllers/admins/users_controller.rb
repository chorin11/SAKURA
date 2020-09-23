class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def index
    @users = User.all.order(created_at: :desc)
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: 'ユーザ情報を変更しました'
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = current_admin
  end

  def user_params
    params.require(:user).permit(:email, :name, :profile_image_id, :introduction, :favorite_sweets, :is_deleted)
  end

end
