FactoryGirl.define do
  factory :voice do
    title "MyString"
	opinion "MyText"
  end

  factory :invalid_voice, parent: :voice do
  	title nil
  end

end
 