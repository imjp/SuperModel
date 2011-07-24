class Portfolio < ActiveRecord::Base
	belongs_to :user
	
	attr_accessible :height, :bust, :waist, :hips, :shoes, :eyes, :hair, 
					:image_1, :image_2, :image_3, :suit, :inseam
end