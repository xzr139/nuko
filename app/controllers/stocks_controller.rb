class StocksController < ApplicationController
  def update
    @stock = current_user.stocks.find_by(note_id: params[:note_id])

    if current_user.stocks.exists?(note_id: params[:note_id])
      @stock.update(stocked: current_user.stocks.exists?(note_id: params[:note_id], stocked: false))
    else
      @stock = current_user.stocks.build(note_id: params[:note_id], stocked: true)
      @stock.save
      @stock.create_activity :create, owner: current_user, recipient: @stock.note.owner
    end

    render nothing: true
  end
end
