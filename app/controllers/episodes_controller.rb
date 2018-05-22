class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    #bring in the params in from the list of potential podcasts. Zach: how to do this in a single line?
    pod_param = params[:podcast]
    pod_name = pod_param["name"]

    pod = Podcast.find_or_create_by(name: pod_name)
    puts "#{pod.id} + #{pod.name}" #got it
  

    @episode = Episode.new(episode_params)
    @star = Star.find(@episode.star_id)
    @episode.podcast_id = pod.id

    puts @star.name #got it
    puts @episode.title #got it
    puts @episode.star_id #got it
    puts @episode.podcast_id #set above
    puts @episode.description
    puts @episode.api_id
    puts "!!!!!!!!!!!!!!!!!!"


    #when we create an episode, we create an instance variable for the star of that episode. We are using this @star for the redirect.
    #might need to add this to edit method if we decide to open that up.
    # ppp = params[:podcast]
    # puts ppp["name"] #this works

    #This is for the dropdown menu
    if @episode.podcast_id == nil
      redirect_to lookup_path, :alert => "Sorry, please create the podcast first"
      #notice doesn't show when arriving on"/podcasts/new" Is it possible to move this logic to a berfore_save callback?
      return
    end

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @star, notice: 'Episode was successfully created for ' + @star.name }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:title, :description, :star_id, :podcast_id, :api_id)
    end
end
