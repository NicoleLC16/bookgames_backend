class GamesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
    def index
        @games = Game.all 
        render :json => @games
    end

    def show
        @game = Game.find(params[:id])
        render :json => @game
    end

    def create 
        @user = User.find(params[:user_id])
        @game = Game.new(game_params)
        @game.save 
        render :json => @game
    end 

    def edit 
        @game = Game.find(params[:id])
    end 

    def update 
        @game = Game.find(params[:id])
        @game.update(game_params)
        render :json => @game
    end 

    def destroy
        @game = Game.find(params[:id])
        @temp = @game
        @game.delete
        render :json => @temp
    end

    private 
    def game_params
        params.require(:game).permit(:rules, :score, :tasks, :participants, :host, :user_id)
    end 
end
