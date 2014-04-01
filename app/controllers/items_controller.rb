class ItemsController < ApplicationController
 before_action :set_list
 before_action :set_item, only: [:show, :edit, :update, :destroy]

def index
  @items = @list.items.all
end


def show
end

def new
  @item = @list.items.new
end


def edit
end


  def create
    @item = @list.items.create(item_params)
    redirect_to list_path(@list)
  end

def update
    @item.update(item_params)
end

  def destroy
    @list = List.find(params[:list_id])
     @items = @list.items.find(params[:id])
     @items.destroy
      redirect_to list_path(@list)
  end



  private

  def set_item
    @item = @list.items.find(params[:id])

  end

  def set_list
          @list = List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:item)
  end

end
