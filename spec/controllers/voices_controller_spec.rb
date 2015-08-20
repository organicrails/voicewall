require 'rails_helper'

RSpec.describe VoicesController, type: :controller do

	
	describe "#index" do

		it "creates an array of voices" do
			voice = FactoryGirl.create(:voice)
			get :index
			expect(assigns(:voices)).to eq([voice])
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template :index
		end
	end


end
