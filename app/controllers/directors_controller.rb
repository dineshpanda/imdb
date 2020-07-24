class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]

  # GET /directors
  def index
    @directors = Director.page(params[:page]).per(10)
  end

  # GET /directors/1
  def show
    @movie = Movie.new
  end

  # GET /directors/new
  def new
    @director = Director.new
  end

  # GET /directors/1/edit
  def edit
  end

  # POST /directors
  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to @director, notice: 'Director was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /directors/1
  def update
    if @director.update(director_params)
      redirect_to @director, notice: 'Director was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /directors/1
  def destroy
    @director.destroy
    redirect_to directors_url, notice: 'Director was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director
      @director = Director.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def director_params
      params.require(:director).permit(:name, :bio, :image)
    end
end
