class RecipesController < ApplicationController
    before_action :authorize

    def index 
        render json: Recipe.all
    end

    def create 
        recipe = Recipe.create(title: params[:title], 
            instructions: params[:instructions], 
            minutes_to_complete: params[:minutes_to_complete],
            user_id: session[:user_id])
        if recipe.valid?
            render json: recipe, status: :created
        else 
            render json: {errors: ["Invalid Fields"]}, status: 422
        end 
    end

    private 

    # def recipe_params
    #     params.permit(:title, :instructions, :minutes_to_complete)
    # end

    def authorize 
        render json: { errors: ['Not authorized']}, status: 401 unless session[:user_id]
    end
end
