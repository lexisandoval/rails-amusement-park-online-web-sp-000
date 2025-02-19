class AttractionsController < ApplicationController
    
    def index 
        @attractions = Attraction.all
    end 

    def edit 
        @attraction = Attraction.find(params[:id])
    end 

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(attractions_params)
        redirect_to attraction_path(@attraction)
    end 

    def new 
        @attraction = Attraction.new
    end 

    def create 
        @attraction = Attraction.new(attractions_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else 
            redirect_to attractions_path
        end 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
    end 

    private 
    
    def attractions_params 
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end 

end
