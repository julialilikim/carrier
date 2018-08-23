class NeedsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :show]
  
  def index
    @needs = Need.all.reverse
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
    @need =Need.find(params[:id])
  end

  # GET /needs/new
  def new
    @need = Need.new
  end

  # GET /needs/1/edit
  def edit
    @need = Need.find(params[:id])
  end

  # need /needs
  # need /needs.json
  def create
    need = Need.new(need_params)
    need.user_id = current_user.id
    need.name = current_user.name
    need.save
  
    redirect_to needs_path
  end

  # PATCH/PUT /needs/1
  # PATCH/PUT /needs/1.json
  def update
    need = Need.find(params[:id])
    need.update(need_params)
    
    redirect_to needs_path
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    need = Need.find(params[:id])
    need.destroy
    
    redirect_to needs_path
  end
  
  def check
    need = Need.find(params[:id])
    need.check = params[:check]
    need.save
    
    redirect_to :back
  end
  
   def comment
    comment = Needcomment.new(comment_params)
    comment.need_id = params[:need_id]
    comment.user_id = current_user.id
    comment.name = current_user.name
    comment.save
    
    redirect_to :back
  end
  
  def comment_edit
    # @comment = Tipcomment.find(params[:id])
  end
  
  def comment_update
    comment = Needcomment.find(params[:id])
    comment.update(comment_params)
    
    redirect_to :back
  end
  
  def comment_destroy
    comment = Needcomment.find(params[:id])
    comment.destroy
    
    redirect_to :back
  end
  
  private
  def comment_params
    params.require(:needcomment).permit(:content)
  end
  

  def need_params
    params.require(:need).permit(:title, :content, :image)
  end
end