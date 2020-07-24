class Api::V1::MoviesController < Api::V1::GraphitiController
  def index
    movies = MovieResource.all(params)
    respond_with(movies)
  end

  def show
    movie = MovieResource.find(params)
    respond_with(movie)
  end

  def create
    movie = MovieResource.build(params)

    if movie.save
      render jsonapi: movie, status: :created
    else
      render jsonapi_errors: movie
    end
  end

  def update
    movie = MovieResource.find(params)

    if movie.update_attributes
      render jsonapi: movie
    else
      render jsonapi_errors: movie
    end
  end

  def destroy
    movie = MovieResource.find(params)

    if movie.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: movie
    end
  end
end
