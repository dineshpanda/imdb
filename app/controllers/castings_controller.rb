class CastingsController < ApplicationController
  before_action :set_casting, only: %i[show edit update destroy]

  # GET /castings
  def index
    @q = Casting.ransack(params[:q])
    @castings = @q.result(distinct: true).includes(:movie, :actor).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@castings.where.not(addr_latitude: nil)) do |casting, marker|
      marker.lat casting.addr_latitude
      marker.lng casting.addr_longitude
      marker.infowindow "<h5><a href='/castings/#{casting.id}'>#{casting.character_name}</a></h5><small>#{casting.addr_formatted_address}</small>"
    end
  end

  # GET /castings/1
  def show; end

  # GET /castings/new
  def new
    @casting = Casting.new
  end

  # GET /castings/1/edit
  def edit; end

  # POST /castings
  def create
    @casting = Casting.new(casting_params)

    if @casting.save
      message = "Casting was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @casting, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /castings/1
  def update
    if @casting.update(casting_params)
      redirect_to @casting, notice: "Casting was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /castings/1
  def destroy
    @casting.destroy
    message = "Casting was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to castings_url, notice: message
    end
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
