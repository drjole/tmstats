class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    5.times { @game.players.build }
  end

  def edit
    @game = Game.find(params[:id])
    (5 - @game.players.count).times { @game.players.build }
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Game created."
    else
      (5 - @game.players.count).times { @game.players.build }
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: "Game edited."
    else
      (5 - @game.players.count).times { @game.players.build }
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy!
    redirect_to root_path, notice: "Game deleted."
  end

  private

  def game_params
    params.require(:game).permit(:date, :num_generations, :board_id, extension_ids: [], players_attributes: [:id, :user_id, :corporation_id, :victory_points])
  end
end
