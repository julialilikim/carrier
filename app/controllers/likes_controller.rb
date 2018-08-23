class LikesController < ApplicationController
    def like_create
        like = Tip.find(params[:t_id]).likes.create(likeCount: params[:likeCount])
        like.save
        redirect_to :back
    end
end
