class AnimalsController < ApplicationController
  def index
      @animals = Animal.all
      json_response(@animals)
    end

    def show
      @animal = Animal.find(params[:id])
      json_response(@animal)
    end

    def random
      @animal = Animal.random
      json_response(@animal)
    end

    def search
      @search_results = Animal.search(params[:term])
      json_response(@search_results)
    end

    def create
      @animal = Animal.create!(animal_params)
      json_response(
        {
          "message": "Animal list created successfully",
          "animal": @animal
        },
        :created
      )
    end

    def update
      @animal = Animal.find(params[:id])
      if @animal.update(animal_params)
        json_response(
          {
            "message": "Animal list updated successfully",
            "animal": @animal
          }
        )
      else
        json_response(@animal.errors)
      end
    end

    def destroy
      @animal = Animal.find(params[:id])
      @animal.destroy
      json_response(
        { "message": "Animal list deleted successfully" }
      )
    end

    private

    def animal_params
      params.permit(:name, :species, :gender, :dob, :description, :arrival_date)
    end

end
