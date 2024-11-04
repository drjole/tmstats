class GamesController < ApplicationController
  def index
    authorize Game
    @games = Game.all.reverse_order
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
  end

  def new
    authorize Game
    @game = Game.new
    5.times { @game.players.build }
  end

  def edit
    @game = Game.find(params[:id])
    (5 - @game.players.count).times { @game.players.build }
    authorize @game
  end

  def create
    authorize Game
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: t(".notice")
    else
      (5 - @game.players.count).times { @game.players.build }
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    authorize @game
    if @game.update(game_params)
      redirect_to @game, notice: t(".notice")
    else
      (5 - @game.players.count).times { @game.players.build }
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    authorize @game
    @game.destroy!
    redirect_to root_path, notice: t(".notice")
  end

  private

  def game_params
    params.require(:game).permit(:time, :num_generations, :board_id, extension_ids: [], players_attributes: [:id, :user_id, :corporation_id, :victory_points, :rank])
  end
end
