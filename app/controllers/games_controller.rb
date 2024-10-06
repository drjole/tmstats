class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Game created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: "Game edited."
    else
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
    params.require(:game).permit(:num_generations, :board_id)
  end
end
