class MaltstersController < ApplicationController
  def index
    @maltsters = Maltster.all.analyzed
    render json: @maltsters
  end

  def show
    @maltster = Maltster.includes(:analyzed_malts).where(id: params[:id]).take
    render json: @maltster
  end
end
