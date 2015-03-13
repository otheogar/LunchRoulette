class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_profiles = UserProfile.all
    respond_with(@user_profiles)
  end

  def show
    redirect_to availablities_path
  end

  def new
    @user_profile = UserProfile.where(user_id: current_user_id).first
    if @user_profile
      redirect_to availablities_path
    else
      @user_profile = UserProfile.new
      respond_with(@user_profile)
    end
  end

  def edit
  end

  def create
    @user_profile = UserProfile.where(user_id: current_user_id).first
    if @user_profile
      redirect_to availablities_path
    else
      @user_profile = UserProfile.new(user_profile_params)
      @user_profile.save
      respond_with(@user_profile)
    end
  end

  def update
    @user_profile.update(user_profile_params)
    respond_with(@user_profile)
  end

  def destroy
    @user_profile.destroy
    respond_with(@user_profile)
  end

  private
    def current_user_id
      current_user.id
    end

    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    def user_profile_params
      params.require(:user_profile).permit(:start_date, :floor, :department, :last_name, :first_name).merge(user_id: current_user_id)
    end
end
