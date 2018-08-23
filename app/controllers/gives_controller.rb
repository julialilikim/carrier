class GivesController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :show]
  
  def index
    @gives = Give.all.reverse
  end

  # GET /gives/1
  # GET /gives/1.json
  def show
    @give =Give.find(params[:id])
  end

  # GET /gives/new
  def new
    @give = Give.new
  end

  # GET /gives/1/edit
  def edit
    @give = Give.find(params[:id])
  end

  # give /gives
  # give /gives.json
  def create
    give = Give.new(give_params)
    give.user_id = current_user.id
    give.name = current_user.name
    give.save
  
    redirect_to gives_path
  end

  # PATCH/PUT /gives/1
  # PATCH/PUT /gives/1.json
  def update
    give = Give.find(params[:id])
    give.update(give_params)
    
    redirect_to gives_path
  end

  # DELETE /gives/1
  # DELETE /gives/1.json
  def destroy
    give = Give.find(params[:id])
    give.destroy
    
    redirect_to gives_path
  end
  
  def check
    give = Give.find(params[:id])
    give.check = params[:check]
    give.save
    
    redirect_to :back
  end
  
  def comment
    comment = Givecomment.new(comment_params)
    comment.give_id = params[:gife_id]
    comment.user_id = current_user.id
    comment.name = current_user.name
    comment.save
    
    redirect_to :back
  end
  
  def comment_edit
    # @comment = Tipcomment.find(params[:id])
  end
  
  def comment_update
    comment = Givecomment.find(params[:id])
    comment.update(comment_params)
    
    redirect_to :back
  end
  
  def comment_destroy
    comment = Givecomment.find(params[:id])
    comment.destroy
    
    redirect_to :back
  end
  
  private
  def comment_params
    params.require(:givecomment).permit(:content)
  end
  

  def give_params
    params.require(:give).permit(:title, :content, :image)
  end
end