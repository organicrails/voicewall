require 'rails_helper'

RSpec.describe Voice, type: :model do
	it "has a valid Voice factory" do
		expect(FactoryGirl.create(:voice)).to be_valid
	end

  it "is invalid without title" do
  	expect(FactoryGirl.build(:voice, title: nil)).not_to be_valid
  end

  it "is invalid without opinion" do
  	expect(FactoryGirl.build(:voice, opinion: nil)).not_to be_valid
  end
end
