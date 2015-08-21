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

	describe "#new" do
		it "renders the new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe '#create' do

		context "with valid inputs" do
			it "creates and increase Voice count by 1" do
				expect{
					post :create, voice: FactoryGirl.attributes_for(:voice)
				}.to change(Voice, :count).by(1)
			end

			it "redirects to show page" do
				post :create, voice: FactoryGirl.attributes_for(:voice)
				expect(response).to redirect_to Voice.last
			end
		end

		context "with invalid inputs" do
			it "does not increase Voice count" do
				expect{
					post :create, voice: FactoryGirl.attributes_for(:invalid_voice)
				}.not_to change(Voice, :count)
			end

			it 'renders #new again' do
				post :create, voice: FactoryGirl.attributes_for(:invalid_voice)
				expect(response).to render_template :new
			end
		end
	end

	describe "#show" do
		it "render the show template" do
			get :show, id: FactoryGirl.create(:voice)
			expect(response).to render_template :show
		end
	end

	


end
