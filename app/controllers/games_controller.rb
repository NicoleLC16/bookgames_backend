require 'json'
class GamesController < ApplicationController
    # skip_before_action :authorized, only: [:index, :create, :show, :edit, :update, :destory]
    def index
        @games = Game.all 
        render :json => @games
    end

    def show
        @game = Game.find(params[:id])
        # unjsonify the tasks before rendering
        #  byebug
        # response = {id: @game.id, title: @game.title, rules: @game.rules, score: @game.score, tasks: JSON.parse(@game.tasks), host: @game.host}
        # sendgame[:tasks] = taskGames
        render :json => @game
    end

    def create 
        # need to_json before creating for tasks
        # @user = User.find(params[:user_id])
        @game = Game.new(game_params)
        @game.save 
        render :json => @game
    end 

    def edit 
        @game = Game.find(params[:id])
        @user = User.find(params[:user_id])
    end 

    def update 
        # byebug
        # @user = User.find(params[:user_id])
        @game = Game.find(params[:id])
        # if current user exists 
        # check current user == game.host.id?
        # if not then do not allow update
        @game.update(game_params)
        render :json => @game
    end
    
    def join_game
        @user = User.find_by(id: params[:user_id])
        @game = Game.find_by(id: params[:game_id])
        @game.users << @user
        render json: @game
    end

    def destroy
        @game = Game.find(params[:id])
        @temp = @game
        @game.delete
        render :json => @temp
    end

    private 
    def game_params
        params.require(:game).permit(:title, :rules, :score, :tasks, :host)
    end 
end
