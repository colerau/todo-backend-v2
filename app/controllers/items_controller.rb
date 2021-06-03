class ItemsController < ApplicationController

  def index 
    count = Item.all.count
    items = Item.all
    render json: items
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: {status: "success", item: item}
    else 
      render json: {status: "error", messages: item.errors.full_messages}
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :deadline)
  end

end
