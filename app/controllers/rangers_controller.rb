class RangersController < ApplicationController
  before_action :set_ranger, only: [:edit, :show, :update, :destroy]
  before_action :set_all_parks, only: [:edit, :new]

  def index
    @rangers = Ranger.all
  end

  def new
    @ranger = Ranger.new
  end

  def edit
  end

  def show
  end

  def create
    @ranger = Ranger.new(ranger_params)
    if @ranger.save!
      redirect_to @ranger, notice: 'Ranger was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ranger.update(ranger_params)
       redirect_to @ranger, notice: 'Ranger was successfully updated.'
     else
       render :edit
    end
  end

  def destroy
    @ranger.parks.clear
    @ranger.delete
    redirect_to root_path
  end

  private

  def set_ranger
    @ranger = Ranger.find_by_id(params[:id])
  end

  def set_all_parks
    @parks = Park.all
  end

  def ranger_params
    params.require(:ranger).permit(:name, :park_ids => [])
  end
end
