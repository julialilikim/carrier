class SellsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :show]
  
  def index
    @sells = Sell.all.reverse
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
    @sell =Sell.find(params[:id])
  end

  # GET /sells/new
  def new
    @sell = Sell.new
  end

  # GET /sells/1/edit
  def edit
    @sell = Sell.find(params[:id])
  end

  # sell /sells
  # sell /sells.json
  def create
    sell = Sell.new(sell_params)
    sell.user_id = current_user.id
    sell.name = current_user.name
    sell.save
  
    redirect_to sells_path
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    sell = Sell.find(params[:id])
    sell.update(sell_params)
    
    redirect_to sells_path
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    sell = Sell.find(params[:id])
    sell.destroy
    
    redirect_to sells_path
  end
  
   def comment
    comment = Sellcomment.new(comment_params)
    comment.sell_id = params[:sell_id]
    comment.user_id = current_user.id
    comment.name = current_user.name
    comment.save
    
    redirect_to :back
  end
  
  def comment_edit
    # @comment = Tipcomment.find(params[:id])
  end
  
  def comment_update
    comment = Sellcomment.find(params[:id])
    comment.update(comment_params)
    
    redirect_to :back
  end
  
  def comment_destroy
    comment = Sellcomment.find(params[:id])
    comment.destroy
    
    redirect_to :back
  end
  
  
  private
  def comment_params
    params.require(:sellcomment).permit(:content)
  end

  def sell_params
    params.require(:sell).permit(:title, :content, :image)
  end
end