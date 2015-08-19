class Voice < ActiveRecord::Base
	validates_presence_of :title, :opinion
end
