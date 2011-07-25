class ContactInfo < ActiveRecord::Base
	belongs_to :user
	attr_accessible :phone, :facebook
end
