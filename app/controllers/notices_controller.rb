class NoticesController < ApplicationController
    before_action :authenticate_user! ,only: [:new, :show]
    
  def index
    @notices = Notice.all.reverse
  end
  
  def show
     @notice =Notice.find(params[:id])
  end
  
  def new
    @notice = Notice.new
  end
  
  def create
    notice = Notice.new(notice_params)
    notice.user_id = current_user.id
    notice.name = current_user.name
    notice.save
  
    redirect_to notices_path
  end
  
  def edit
    @notice = Notice.find(params[:id])
  end
  
  def update
    notice = Notice.find(params[:id])
    notice.update(notice_params)
    
    redirect_to notices_path
  end
  
  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    
    redirect_to notices_path
  end
  
  def comment
    comment = Noticecomment.new(comment_params)
    comment.notice_id = params[:notice_id]
    comment.user_id = current_user.id
    comment.name = current_user.name
    comment.save
    
    redirect_to :back
  end
  
  def comment_edit
    # @comment = Tipcomment.find(params[:id])
  end
  
  def comment_update
    comment = Noticecomment.find(params[:id])
    comment.update(comment_params)
    
    redirect_to :back
  end
  
  def comment_destroy
    comment = Noticecomment.find(params[:id])
    comment.destroy
    
    redirect_to :back
  end
  
  private
  def comment_params
    params.require(:noticecomment).permit(:content)
  end
  
  def notice_params
    params.require(:notice).permit(:title, :content, :image)
  end
end
