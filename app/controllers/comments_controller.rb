class CommentsController < ApplicationController
  

    def edit
      @comment = Comment.find(params[:id])
      @gossip = Gossip.find(params[:gossip_id])
    end

    def new
        @comment = Comment.create
    end

    def create
        @comment = Comment.new(content:params[:content], user_id: current_user.id, gossip_id: 2)

        if @comment.save
          flash[:notice] = "COMMENT SAVE"
          redirect_to gossip_path(@comment.gossip.id)
        else 
          flash.now[:alert] = "ERROR TRY AGAIN"
          render new_comment_path
        end
    end

    def update
      @comment = Comment.find(params[:id])
      if @comment.update(post_params)
        redirect_to gossip_path(@comment.gossip.id)
      else
        render :edit
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to gossip_path(@comment.gossip.id)
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    private
    
    def post_params
      post_params = params.require(:comment).permit(:content)
    end


  end