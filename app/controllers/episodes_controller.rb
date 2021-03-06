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
    puts "++++++++ Episodes#Create"
    pod_param = params[:podcast]
    pod_name = pod_param["name"]

    pod = Podcast.find_or_create_by(name: pod_name)  

    @episode = Episode.new(episode_params)
    @star = Star.find(@episode.star_id)
    @episode.podcast_id = pod.id

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @star, notice: 'Episode was successfully created for ' + @star.name }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { redirect_to @star, notice: "We couldn't create that episode for " + @star.name}
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Episode was successfully updated.' }
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
      params.permit(:title, :description, :star_id, :podcast_id, :api_id, :release_date, :display)
    end
    # require(:episode)
end
