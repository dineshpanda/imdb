class CastingsController < ApplicationController
  before_action :set_casting, only: %i[show edit update destroy]

  def index
    @q = Casting.ransack(params[:q])
    @castings = @q.result(distinct: true).includes(:movie, :actor).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@castings.where.not(addr_latitude: nil)) do |casting, marker|
      marker.lat casting.addr_latitude
      marker.lng casting.addr_longitude
    end
  end

  def show; end

  def new
    @casting = Casting.new
  end

  def edit; end

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

  def update
    if @casting.update(casting_params)
      redirect_to @casting, notice: "Casting was successfully updated."
    else
      render :edit
    end
  end

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

  def set_casting
    @casting = Casting.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit(:movie_id, :actor_id, :character_name, :profile, :addr)
  end
end
