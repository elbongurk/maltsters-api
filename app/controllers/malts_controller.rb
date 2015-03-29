class MaltsController < ApplicationController
  def show
    @malt = Malt.includes(:analysis, :analyzed_lots).where(id: params[:id]).take
    render json: @malt
  end
end
