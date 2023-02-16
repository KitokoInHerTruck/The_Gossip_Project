class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :index] 
    
    def index
        @gossips = Gossip.all
        @comment = Comment.create
    end
    def show
        @gossip = Gossip.find(params[:id])
        # @comments = Comment.where(gossip: Gossip.where(gossip_id: params[:id]))
        @comments = @gossip.comments
      end
  
      def new
        @gossip= Gossip.find(params[:id])
      end
      def create
        @gossip = Gossip.new(title:params[:title], content:params[:content],user_id: current_user.id)
        if @gossip.save
          flash[:success] = "Enregisté"
          redirect_to gossips_path
        else 
          flash.now[:alert] = "Echec"
          render new_gossip_path
        end
      end
  
      def edit
        @gossip = Gossip.find(params[:id])
      end
  
  
      def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(post_params)
          redirect_to gossips_path
        else
          render :edit
        end
      end
  
      def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path
      end
  
      private
      
      def post_params
        post_params = params.require(:gossip).permit(:title, :content)
      end
end
