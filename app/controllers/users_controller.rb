class UsersController < ApplicationController

  before_action :find_user, only: [:show, :destroy, :edit, :update]
  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Demo App"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def show
    @comment = Comment.new
    @entries = @user.entries.paginate page: params[:page]
    @relationship = if current_user.following? @user
      current_user.active_relationships.find_by followed_id: @user.id
    else
      current_user.active_relationships.build
    end
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, :password_confirmation
  end

  def correct_user
    redirect_to root_url unless @user.current_user? current_user
  end

  def find_user
    @user = User.find_by id: params[:id]
  end
end
