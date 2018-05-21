class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
  require 'unirest'

  # GET /stars
  # GET /stars.json
  def index
    @stars = Star.all
    @star = Star.new
  end

  # GET /stars/1
  # GET /stars/1.json
  def show
    @star = Star.find(params[:id])
    puts @star.name
    @episodes = @star.episodes
    puts "++++ episodes"
    puts @episodes
    @episode = Episode.new
    @podcasts = Podcast.all

    @choices = [] 
    @podcasts.each do |p| 
      pod = [] 
      pod.push(p.name, p.id) 
      @choices.push(pod) 
    end 
    
    @choices.push(["Create New Podcast", nil]) 

    #above this shows how to manually enter a podcast episode with this star. Below, we want to query itunes for this star and display the resutls. 
    #let's query and list all of the potential podcasts for this star. 
    star_query = @star.name.strip.gsub(/\s+/, "+")

     response = HTTParty.get "https://listennotes.p.mashape.com/api/v1/search?len_min=10&offset=0&only_in=title&published_after=0&q=#{star_query}&sort_by_date=0&type=episode",
        headers:{
        'X-Mashape-Key' => ENV['MASHAPE_KEY'],
        "Accept" => "application/json"
      }

      num_of_results = response["count"]
      @episodes_arr = response["results"]
      puts num_of_results
      puts @episodes_arr
    
                # The method and while loop are attempts to collect all possible episodes for the Star
                # def all_episodes(star, offset) 
                    
                #     @response = HTTParty.get "https://listennotes.p.mashape.com/api/v1/search?len_min=10&offset=#{offset}&only_in=title&published_after=0&q=#{star}&sort_by_date=0&type=episode",
                #    headers:{
                #    'X-Mashape-Key' => ENV['MASHAPE_KEY'],
                #    "Accept" => "application/json"
                #  }
                #     all_eps.push(@response["results"])
                #     offset += 10
                # end

                # offset = 0
                # all_eps = []

                # while num_of_results != 0 
                #   all_episodes(star_query, offset) 
                #   puts"--------"
                #   puts all_eps         
                # end
  end

  # GET /stars/new
  def new
    if params[:name]
      @star = Star.new 
      @star.name = params[:name]
      puts @star.name
      #creating a star name to use in the View
      
      star_n = params[:name].strip
      star_query = star_n.gsub(/\s+/, "+")
      puts "We are going to lookup #{star_query}"
      star_query_link = "https://listennotes.p.mashape.com/api/v1/search?len_min=10&offset=0&only_in=title&published_after=0&q=#{star_query}&sort_by_date=0&type=episode" 
      mashape_key = ENV['MASHAPE_KEY']
      #setting variables to use in the API search
      
      # These code snippets use an open-source library. http://unirest.io/ruby
      @response = HTTParty.get star_query_link,
       headers:{
       'X-Mashape-Key' => mashape_key,
       "Accept" => "application/json"
     }
     #searching the API for this star
     puts @response
     num_of_results = @response["count"]


     @episodes_arr = @response["results"]

      @names = []
      Star.all.each do |star|
        @names.push(star.name.downcase)
      end

      unless @names.include?(@star.name.downcase)
        puts "YESSSSSS"
      end
      #if the search name 

    else
      @star = Star.new
    end
  end

  # GET /stars/1/edit
  def edit
  end

  # POST /stars
  # POST /stars.json
  def create
    @star = Star.new(star_params)
    #(:name => params[:name]) 
    #I'm sidestepping the Strong parameters. My gut says that I'm not naming the parameters correctly coming from the link.

    respond_to do |format|
      if @star.save
        format.html { redirect_to @star, notice: 'Star was successfully created.' } 
        format.json { render :show, status: :created, location: @star }
      else
        format.html { render :new }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stars/1
  # PATCH/PUT /stars/1.json
  def update
    respond_to do |format|
      if @star.update(star_params)
        format.html { redirect_to @star, notice: 'Star was successfully updated.' } #maybe now is when we need to compile the episodes and show on @star page.
        format.json { render :show, status: :ok, location: @star }
        puts @star
      else
        format.html { render :edit }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1
  # DELETE /stars/1.json
  def destroy
    @star.destroy
    respond_to do |format|
      format.html { redirect_to stars_url, notice: 'Star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def star_params
       params.require(:star).permit(:name, :bio, :link, :image)
    end
end   