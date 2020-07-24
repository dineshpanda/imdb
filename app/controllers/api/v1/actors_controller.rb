class Api::V1::ActorsController < Api::V1::GraphitiController
  def index
    actors = ActorResource.all(params)
    respond_with(actors)
  end

  def show
    actor = ActorResource.find(params)
    respond_with(actor)
  end

  def create
    actor = ActorResource.build(params)

    if actor.save
      render jsonapi: actor, status: :created
    else
      render jsonapi_errors: actor
    end
  end

  def update
    actor = ActorResource.find(params)

    if actor.update_attributes
      render jsonapi: actor
    else
      render jsonapi_errors: actor
    end
  end

  def destroy
    actor = ActorResource.find(params)

    if actor.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: actor
    end
  end
end
