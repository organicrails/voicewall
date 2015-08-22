require 'rails_helper'

describe "Voices" do
	context "Manage Voices" do

		it "Add new voice and displays the results" do
			visit root_path
			expect{
				click_link "New Voice"
				fill_in "Title", with: "A Random Fact"
				fill_in "Opinion", with: "Capybara is the largest rodent in the world."
				click_button "Create Voice"
			}.to change(Voice,:count).by(1)

			within 'h2' do
				expect(page).to have_content("A Random Fact")
			end

			expect(page).to have_content("Capybara is the largest rodent in the world.")
		end

		it "Edit Voice and Display the Result" do
			initial_voice = FactoryGirl.create(:voice, title: "Another Random Fact", opinion: "A flock of crows is known as a murder.")
			visit voice_path(initial_voice)


			expect(page).to have_content("Another Random Fact")
			expect(page).to have_content("A flock of crows is known as a murder.")

			click_link "Edit"
			fill_in "Title", with: "Yet Another Random Fact!"
			fill_in "Opinion", with: "You cannot snore and dream at the same time."
			click_button "Update Voice"

			within 'h2' do
				expect(page).to have_content("Yet Another Random Fact!")
			end

			expect(page).to have_content("You cannot snore and dream at the same time.")

		end

		it "Delete Voice " do
			initial_voice = FactoryGirl.create(:voice, title: "Another Random Fact", opinion: "A flock of crows is known as a murder.")
			visit voice_path(initial_voice)

			expect{
				click_link "Destroy"
			}.to change(Voice, :count).by(-1)

			expect(page).not_to have_content("Another Random Fact")
			expect(page).not_to have_content("A flock of crows is known as a murder.")
		end

	end
end