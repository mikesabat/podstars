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
    @episodes = @star.episodes
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
  end

  # GET /stars/new
  def new
    if params[:name]
      puts "OK we have the params. "
      star = params[:name].strip
      star_query = star.gsub(/\s+/, "+")
      puts "We are going to lookup #{star_query}"
      star_query_link = "https://listennotes.p.mashape.com/api/v1/search?len_min=10&offset=0&only_in=title&published_after=0&q=#{star_query}&sort_by_date=0&type=episode" 

      
      # These code snippets use an open-source library. http://unirest.io/ruby
      response = HTTParty.get star_query_link,
       headers:{
       'X-Mashape-Key' => '90BgMbsfzymshsEnheAXVDpN7Km8p10sjUTjsn5PfGX0tBc6K0',
       "Accept" => "application/json"
     }
     puts response
     num_of_results = response["count"]
     puts num_of_results

     @episodes_arr = response["results"]
     
    @episodes_arr.each do |ep|
      puts "here's another ep."
      puts ep["podcast_id"]
    end


      

      # response = HTTParty.get(pod_lookup_link, format: :plain)
      # json_response = JSON.parse response, symbolize_names: true

      # num_of_results = json_response[:resultCount]
      # results = json_response[:results]

      # @actual_data = results[0]

      # @podcast = {:name => @actual_data[:collectionName], :host => @actual_data[:artistName], :feed => @actual_data[:feedUrl], :image_url => @actual_data[:artworkUrl60], :big_image =>@actual_data[:artworkUrl600]}

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
        format.html { redirect_to @star, notice: 'Star was successfully updated.' }
        format.json { render :show, status: :ok, location: @star }
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