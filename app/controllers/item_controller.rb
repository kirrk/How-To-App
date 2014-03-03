class ItemController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.item.create(params[:item].permit(:item))
    redirect_to list_path(@list)
  end
end
