# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end

    def new
        @movie = Movie.new
    end
    
    def create
        params.require(:movie)
        permitted = params[:movie].permit(:title,:rating,:release_date)
        @movie = Movie.create!(permitted)
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
      end

  end