class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # retrieve the all ratings of model
    @all_ratings = Movie.pluck(:rating).uniq

#debugger
    # retrieve checked ratings
    reflag=false
    param_ratings = Hash.new
    q1 = Movie.all
    if params[:ratings].nil? 
	if session[:ratings].nil?
	   chk = @all_ratings
        else
	   chk = session[:ratings].keys
	   reflag=true
	   param_ratings=session[:ratings]
	end 
    else 
	chk = params[:ratings].keys
	session[:ratings] = params[:ratings]
	param_ratings = params[:ratings]
    end

    @chkflag=Hash.new
    chk.each { |r| @chkflag[r]=true }
    q1 = Movie.where(:rating => chk)

    # retrieve the sorting header id: nil or title or release_date
    param_sort = Hash.new	
    
    if ['title','release_date'].include?(params[:sort_by])
	session[:sort_by] = params[:sort_by]
	@movies = q1.order(params[:sort_by])
	params[:sort_by] == 'title' ? @title_hilite = 'hilite' : @release_date_hilite = 'hilite'
	param_sort =params[:sort_by]
    else
	@movies = q1
	
	if !session[:sort_by].nil? 
	   reflag=true
	   param_sort = session[:sort_by]
	end
    end
	
    if reflag	   
	flash.keep
	redirect_to movies_path(:ratings=>param_ratings, :sort_by=>param_sort)
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end
