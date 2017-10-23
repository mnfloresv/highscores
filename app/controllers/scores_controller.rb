class ScoresController < ApplicationController
  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to scores_new_path, notice: 'Score was successfully added.' }
        format.json { render json: @score, status: :created}

      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def score_params
      params.require(:score).permit(:player_email, :game_id, :score)
    end
end
