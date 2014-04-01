class ListController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @list = List.all
  end

   def show
    @list = List.new
   end

  def new
    @list = List.new
  end

  def create
    @list = List.new (list_params)

   if  @list.save
    redirect_to @list
  else
    render action: 'new'
  end
   end




def update
    @list = List.find(params[:id])
    if @list.update(params[:list].permit(:title))
      redirect_to @list
    else
      render 'edit'
    end
  end



  def destroy
    @list = List.find(params[:id])
      @list.destroy

  redirect_to list_index_path
end


  private

    def set_list
    @list = List.find(params[:id])
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
