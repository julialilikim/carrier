class TipsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :show]
  
  def index
    @tips = Tip.all.reverse
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
    @tip = Tip.find(params[:id])
    @likes = Like.first
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
    @tip = Tip.find(params[:id])
  end

  # tip /tips
  # tip /tips.json
  def create
    tip = Tip.new(tip_params)
    tip.user_id = current_user.id
    tip.name = current_user.name
    tip.save
  
    redirect_to tips_path
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    tip = Tip.find(params[:id])
    tip.update(tip_params)
    
    redirect_to tips_path
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    tip = Tip.find(params[:id])
    tip.destroy
    
    redirect_to tips_path
  end
  
  def comment
    comment = Tipcomment.new(comment_params)
    comment.tip_id = params[:tip_id]
    comment.user_id = current_user.id
    comment.name = current_user.name
    #comment.content = params[:content]
    comment.save
    
    redirect_to :back
  end
  
  def comment_edit
    @comment = Tipcomment.find(params[:id])
  end
  
  def comment_update
    comment = Tipcomment.find(params[:id])
    comment.update(comment_params)
    
    redirect_to :back
    
  end
  
  def comment_destroy
    comment = Tipcomment.find(params[:id])
    comment.destroy
    
    redirect_to :back
  end
  
  private
  def comment_params
    params.require(:tipcomment).permit(:content)
  end
  

  def tip_params
    params.require(:tip).permit(:title, :content, :image)
  end
end
