class LotsController < ApplicationController
  def show
    @lot = Lot.includes(:analysis).where(id: params[:id]).take
    render json: @lot
  end
end
