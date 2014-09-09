class StocksController < ApplicationController

  def create
    @stock = current_user.stocks.build(note_id: params[:note_id], stocked: true)
    @stock.save unless Stock.exists?(note_id: params[:note_id], user_id: params[:user_id])
    redirect_to note_path(@stock.note)
  end

  def update
    if current_user.stocks.exists?(note_id: params[:note_id], stocked: false)
      stock = current_user.stocks.find_by(note_id: params[:note_id]).update(stocked: true)
    else
      stock = current_user.stocks.find_by(note_id: params[:note_id]).update(stocked: false)
    end

    redirect_to note_path(stock.note)
  end
end
