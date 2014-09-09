class StocksController < ApplicationController

  def create
    @stock = current_user.stocks.build(note_id: params[:note_id], stocked: true)
    @stock.save unless Stock.exists?(note_id: params[:note_id], user_id: params[:user_id])
  end

  def update
    @stock = current_user.stocks.find_by(note_id: params[:note_id])
    stocked = current_user.stocks.exists?(note_id: params[:note_id], stocked: false)
    @stock.update(stocked: stocked)
  end
end
