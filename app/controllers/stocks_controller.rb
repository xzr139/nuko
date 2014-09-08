class StocksController < ApplicationController

  def create
    @stock = current_user.stocks.where(note_id: params[:note_id], user_id: params[:user_id]).build
    @stock.save unless Stock.exists?(note_id: params[:note_id], user_id: params[:user_id])

    redirect_to note_path(@stock.note)
  end

  def update
  end
end
