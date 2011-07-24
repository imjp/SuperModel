class User < ActiveRecord::Base 
	default_scope :order => 'name'
	
	has_one :portfolio, :dependent => :destroy
	attr_accessible :name, :gender, :photo_1, :photo_2, :photo_3
	after_create :create_portfolio
	
	has_friendly_id :name, :use_slug => true, :approximate_ascii => true,
							:reserved_words => ['new', 'users', 'contact', 'about', 'male', 'female', 'portfolios']
			
	has_attached_file :photo_1, :styles => { :medium => "300x300>", :thumb => "175x131>" }		
			
			
	def create_portfolio
		build_portfolio.save(:validate => false)
	end
end
