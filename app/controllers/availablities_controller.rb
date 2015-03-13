class AvailablitiesController < ApplicationController
  before_action :set_availablity, only: [:show, :edit, :update, :destroy]

  before_filter :get_user_profile

  respond_to :html

  def index
    @availablities = Availablity.where(user_profile_id: @user_profile.id).all.map { |av| av.day.wday - 1 }
    respond_with(@availablities)
  end

  def update_selected_days
    selected_days = params['date_selection']['days_selected'].reject {|day| day.blank?}

    selected_dates = selected_days.map {|day| (Date.today.at_beginning_of_week + Integer(day)).strftime }
    week_dates = (Date.today.at_beginning_of_week..Date.today.at_end_of_week).map(&:strftime)

    week_dates.each do |date|
      if selected_dates.include?(date)
        if Availablity.where(user_profile_id: @user_profile.id, day: date).blank?
          new_av = Availablity.new(user_profile_id: @user_profile.id, day: date)
          new_av.save!
        end
      else
        if avv = Availablity.where(user_profile_id: @user_profile.id, day: date).first
         Availablity.destroy(avv)
        end
      end
    end
    redirect_to availablities_path
  end

  def show
    respond_with(@availablity)
  end

  def new
    @availablity = Availablity.new
    respond_with(@availablity)
  end

  def edit
  end

  def create
    @availablity = Availablity.new(availablity_params)
    @availablity.save
    respond_with(@availablity)
  end

  def update
    @availablity.update(availablity_params)
    respond_with(@availablity)
  end

  def destroy
    @availablity.destroy
    respond_with(@availablity)
  end

  private
    def get_user_profile
      @user_profile = UserProfile.find_by(user_id: current_user.id)
    end

    def set_availablity
      @availablity = Availablity.find(params[:id])
    end

    def availablity_params
      params[:availablity]
    end
end
