class ChallengesController < ApplicationController
  before_action :set_challenge, only: [ :show, :edit, :update, :destroy ]

  def index
    @challenges = Challenge.includes(:user)
    @challenges = @challenges.by_category(params[:category]) if params[:category].present?
    @challenges = @challenges.by_difficulty(params[:difficulty]) if params[:difficulty].present?

    if params[:search].present?
      @challenges = @challenges.where("title ILIKE ?", "%#{params[:search]}%")
    end

    @challenges = @challenges.recent.page(params[:page] || 1).per(20)

    if request.xhr?
      render partial: "table", locals: { challenges: @challenges }
    end
  end

  def show
    # Challenge detail view with PDF viewer
  end

  def new
    @challenge = current_user.challenges.build
  end

  def create
    @challenge = current_user.challenges.build(challenge_params)

    if @challenge.save
      redirect_to @challenge, notice: "Desafio criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Edit form
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: "Desafio atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path, notice: "Desafio excluído com sucesso!"
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(
      :title, :description, :category, :difficulty,
      :music_key, :tempo, :instructions,
      :musicxml_file, :pdf_file
    )
  end
end
