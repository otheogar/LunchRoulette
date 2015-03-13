class AvailablitiesController < ApplicationController
  before_action :set_availablity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @availablities = Availablity.all
    respond_with(@availablities)
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
    def set_availablity
      @availablity = Availablity.find(params[:id])
    end

    def availablity_params
      params[:availablity]
    end
end
