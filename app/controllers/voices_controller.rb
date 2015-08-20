class VoicesController < ApplicationController

	before_action :find_voice, only: [:show, :edit, :update, :destroy]

	def index
		@voices = Voice.all
	end

	def new
		@voice = Voice.new
	end

	def create
		@voice = Voice.new(voices_params)
		if @voice.save
			redirect_to @voice
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @voice.update(voices_params)
			redirect_to @voice
		else
			render "edit"
		end
	end

	def destroy
		@voice.destroy
		redirect_to root_path
	end

	private

	def voices_params
		params.require(:voice).permit(:title, :opinion)
	end

	def find_voice
		@voice = Voice.find(params[:id])
	end
end
