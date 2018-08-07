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
    puts "++++++++ star#show"
    @star = Star.find(params[:id])
    @episodes = @star.episodes
    #@episode = Episode.new
    #@podcasts = Podcast.all #we don't need all the podcasts.

    star_query = @star.name.strip.gsub(/\s+/, "+")

    #this works, but super innefficient. 
      def all_eps(query, offset)
        episodes_arr = []
        results = 10
        num = offset

        while results == 10

          response = HTTParty.get "https://listennotes.p.mashape.com/api/v1/search?len_min=10&offset=#{num}&only_in=title&published_after=0&q=#{query}&sort_by_date=0&type=episode",
          headers:{
          'X-Mashape-Key' => ENV['MASHAPE_KEY'],
          "Accept" => "application/json"
        }
          #episodes_arr << response["results"] #adds the current results to the array. Nope..
          response["results"].each { |r| episodes_arr << r}
          num += response["count"].to_i #increases the offset by the number of results that we just found
          
          count = episodes_arr.count
          puts "There are now #{count} in the array"
          results = response["count"]
          puts "The latest lookup has #{results} results in there. "

        end
        return episodes_arr
      end

      many_episodes = all_eps(star_query, 0)
      many_episodes.select! do |e| 
        limit = Date.today - 3.years
        def comparable_date(f)
          sec = (f["pub_date_ms"].to_f / 1000).to_s
          dform = Date.strptime(sec, '%s')
        end
        comparable_date(e) > limit
      end #holy shit this works! Needs cleanup

      #save each episode - works
      many_episodes.each do |ep|
        new_ep = Episode.new
        pod_name = ep["podcast_title_original"]
        pod = Podcast.find_or_create_by(name: pod_name)
        new_ep.star_id = @star.id
        new_ep.podcast_id = pod.id
        new_ep.title = ep["title_original"]
        new_ep.description = ep["description_original"]
        new_ep.api_id = ep["id"]
        sec = (ep["pub_date_ms"].to_f / 1000).to_s
        dform = Date.strptime(sec, '%s')
        new_ep.release_date = dform
        new_ep.save
      end

      @episodes_arr = many_episodes.sort_by { |e| e["pub_date_ms"]}.reverse
      @display_episodes = @episodes.where(display: true)
      puts @display_episodes[0]["title"] #works!

      #Need to save @episodes_arr

      puts "PPPPPPPPPPPPPPPPPPPP"
  end

  # GET /stars/new
  def new
    puts "++++++++ star#new"
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
     # puts @response
     num_of_results = @response["count"]


     @episodes_arr = @response["results"]

      @names = []
      Star.all.each do |star|
        @names.push(star.name.downcase)
      end

      unless @names.include?(@star.name.downcase)
        puts "YESSSSSS"
      end
      #server will print YESS if this star is a new name

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