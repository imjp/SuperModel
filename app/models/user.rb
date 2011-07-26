class User < ActiveRecord::Base 
	before_save :encrypt_password
	before_create { generate_token(:auth_token) }
	after_create :create_portfolio, :create_contact_info
	
	attr_accessible :name, :email, :password, :gender, :photo_1, :photo_2, :photo_3
	attr_accessor :password
	
	default_scope :order => 'name'
	
	has_one :portfolio, :dependent => :destroy
	has_one :contact_info, :dependent => :destroy	
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email, :name
	validates_uniqueness_of :email
	
	has_friendly_id :name, :use_slug => true, :approximate_ascii => true,
					:reserved_words => ['new', 'users', 'contact', 'about', 'male', 'female', 'portfolios']
	
	  
	def create_portfolio
		build_portfolio.save(:validate => false)
	end
	
	def create_contact_info
		build_contact_info.save(:validate => false)
	end
	
	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
	
	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end