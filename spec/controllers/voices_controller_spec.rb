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

	describe "#edit" do
		it "render the edit template" do
			get :edit, id: FactoryGirl.create(:voice)
			expect(response).to render_template :edit
		end
	end

	describe "#update" do

		before :each do
			@initial_voice = FactoryGirl.create(:voice, title: "Chipotle", opinion: "It is awesome.")
		end

		context "with valid inputs" do

			it "located the requested @voice" do
				put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:voice)
				expect(assigns(:voice)).to eq(@initial_voice)
			end

			it "changes the @voice attributes" do
				put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:voice, title: "McDonalds", opinion: "It is only okay...")
				@initial_voice.reload
				expect(@initial_voice.title).to eq("McDonalds")
				expect(@initial_voice.opinion).to eq("It is only okay...")
			end

			it "redirects to the updated contact" do
        put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:voice)
        expect(response).to redirect_to @initial_voice
      end


		end

		context "with invalid inputs" do

			it "located the requested @voice" do
				put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:invalid_voice)
				expect(assigns(:voice)).to eq(@initial_voice)
			end

			it "changes the @voice attributes" do
				put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:voice, title: nil, opinion: "It is only okay...")
				@initial_voice.reload
				expect(@initial_voice.title).not_to eq("McDonalds")
				expect(@initial_voice.opinion).not_to eq("It is only okay...")
			end

			it "renders the edit template again" do
        put :update, id: @initial_voice, voice: FactoryGirl.attributes_for(:invalid_voice)
        expect(response).to render_template :edit
      end

		end
	end
	
end
