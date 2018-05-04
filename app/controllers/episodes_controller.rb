class EpisodesController < ApplicationController
	before_action :set_episode, only: [:show, :edit, :update, :destroy]
	def index
		@episodes = Episode.all
	end

	def edit
		@episode = Episode.find(params[:id])
	end
end
