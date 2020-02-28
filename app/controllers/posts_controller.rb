class PostsController < ApplicationController
#   skip_before_action :authorized, only: [:index, :create, :show, :create, :edit]
    def index
        @posts = Post.all 
        render :json => @posts
    end

    def show
        @post = Post.find(params[:id])
        render :json => @post
    end

    def create 
        @user = User.find(params[:user_id])
        @game = Game.find(params[:game_id])
        @post = Post.new(post_params)
        @post.save 
        render :json => @post
    end 

    def edit 
        @post = Post.find(params[:id])
    end 

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        render :json => @post
    end 

    def destroy
        @post = Item.find(params[:id])
        @temp = @post
        @post.delete
        render :json => @temp
    end

    private 
    def post_params
        params.require(:post).permit(:content, :ctype, :user_id, :game_id)
    end 
end
