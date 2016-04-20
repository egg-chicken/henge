class ImpressionsController < ApplicationController
  before_action :set_impression, only: [:show, :edit, :update, :destroy]

  def index
    @impressions = Impression.all
  end

  def show
  end

  def new
    @impression = Impression.new
  end

  def edit
  end

  def create
    @impression = Impression.new(impression_params)
    if @impression.save
      redirect_to(@impression, notice: 'Impression was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @impression.update(impression_params)
      redirect_to(@impression, notice: 'Impression was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @impression.destroy
    redirect_to(impressions_url, notice: 'Impression was successfully destroyed.')
  end

  private

  def set_impression
    @impression = Impression.find(params[:id])
  end

  def impression_params
    params.require(:impression).permit(:title, :user_id, :product_id)
  end
end
