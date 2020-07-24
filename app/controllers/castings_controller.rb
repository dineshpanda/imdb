class CastingsController < ApplicationController
  before_action :set_casting, only: [:show, :edit, :update, :destroy]

  # GET /castings
  def index
    @castings = Casting.all
  end

  # GET /castings/1
  def show
  end

  # GET /castings/new
  def new
    @casting = Casting.new
  end

  # GET /castings/1/edit
  def edit
  end

  # POST /castings
  def create
    @casting = Casting.new(casting_params)

    if @casting.save
      redirect_to @casting, notice: 'Casting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /castings/1
  def update
    if @casting.update(casting_params)
      redirect_to @casting, notice: 'Casting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /castings/1
  def destroy
    @casting.destroy
    redirect_to castings_url, notice: 'Casting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casting
      @casting = Casting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def casting_params
      params.require(:casting).permit(:movie_id, :actor_id, :character_name, :profile, :addr)
    end
end