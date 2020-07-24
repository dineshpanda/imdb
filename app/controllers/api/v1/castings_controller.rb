class Api::V1::CastingsController < Api::V1::GraphitiController
  def index
    castings = CastingResource.all(params)
    respond_with(castings)
  end

  def show
    casting = CastingResource.find(params)
    respond_with(casting)
  end

  def create
    casting = CastingResource.build(params)

    if casting.save
      render jsonapi: casting, status: :created
    else
      render jsonapi_errors: casting
    end
  end

  def update
    casting = CastingResource.find(params)

    if casting.update_attributes
      render jsonapi: casting
    else
      render jsonapi_errors: casting
    end
  end

  def destroy
    casting = CastingResource.find(params)

    if casting.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: casting
    end
  end
end
