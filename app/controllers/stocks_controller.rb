class StocksController < ApplicationController

  def create
    stock = current_user.stocks.build( note_id: params[:note_id], stocked: true)
    stock.save unless Stock.exists?(note_id: params[:note_id], user_id: params[:user_id], stocked: true)
    redirect_to note_path(stock.note)
  end

  def update
  end
end
