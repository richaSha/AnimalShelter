class AnimalsController < ApplicationController
  def index
      @animals = Animal.all
      json_response(@animals)
    end

    def show
      @animals = Animal.find(params[:id])
      json_response(@animals)
    end

    def create
      @animals = Animal.create(quote_params)
      json_response(@animals)
    end

    def update
      @animals = Animal.find(params[:id])
      @animals.update(animal_params)
    end

    def destroy
      @animals = Animal.find(params[:id])
      @animals.destroy
    end

    private
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def animal_params
      params.permit(:author, :content)
    end
end
