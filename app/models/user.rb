class User < ActiveRecord::Base 
	default_scope :order => 'name'
	
	has_one :portfolio, :dependent => :destroy
	has_one :contact_info, :dependent => :destroy
	attr_accessible :name, :gender, :photo_1, :photo_2, :photo_3
	after_create :create_portfolio, :create_contact_info
	
	has_friendly_id :name, :use_slug => true, :approximate_ascii => true,
					:reserved_words => ['new', 'users', 'contact', 'about', 'male', 'female', 'portfolios']
	
	
	path = Rails.root.to_s + '/config/s3.yml'
	
	has_attached_file :photo_1,
					  :styles => {
					  :thumb=> '100x100#',
				      :small  => '400x400>' },
					  :storage => :s3,
					  :bucket => 'puremodels',
					  :s3_credentials => path,
					  :path => '/:style/:id/:filename'
					  
					  
	def create_portfolio
		build_portfolio.save(:validate => false)
	end
	
	def create_contact_info
		build_contact_info.save(:validate => false)
	end
end