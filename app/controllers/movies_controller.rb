class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
    @movies = @movies.order("#{sort_column} #{sort_direction}")
  end


  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created."
    else
      render :new
    end
  end


  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
  
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

    # Define methods for sorting column and direction
    def sort_column
      Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
