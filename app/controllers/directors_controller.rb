class DirectorsController < ApplicationController
  before_action :set_director, only: %i[show edit update destroy]

  def index
    @q = Director.ransack(params[:q])
    @directors = @q.result(distinct: true).includes(:movies).page(params[:page]).per(10)
  end

  def show
    @movie = Movie.new
  end

  def new
    @director = Director.new
  end

  def edit; end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to @director, notice: "Director was successfully created."
    else
      render :new
    end
  end

  def update
    if @director.update(director_params)
      redirect_to @director, notice: "Director was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_url, notice: "Director was successfully destroyed."
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def director_params
    params.require(:director).permit(:name, :bio, :image)
  end
end
