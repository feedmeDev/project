require 'bcrypt'

class Person < ActiveRecord::Base

#relationships
has_many :attendances


#unique username needed of min length
validates :username, presence: true
validates :username, uniqueness: { case_sensitive: false}
validates :username, length: {minimum: 5}

validates :password, length: {minimum: 8}

validates :still_active, :inclusion => {:in => [true, false]}
validates :staff, :inclusion => {:in => [true, false]}
validates :name, presence: true

##################### password stuff
	attr_accessor :hash_new_password, :new_password_confirmation

	validates_confirmation_of :new_password, :if=>:password_changed?

	before_save :hash_new_password, :if=>:password_changed?

	def password_changed?
		!@new_password.blank?
	end

	private
	# This is where the real work is done, store the BCrypt has in the
	# database
	def hash_new_password
		self.hashed_password = BCrypt::Password.create(@new_password)
	end

	# As is the 'standard' with rails apps we'll return the user record if the
    # password is correct and nil if it isn't.
    def self.authenticate(username, password)
      # Because we use bcrypt we can't do this query in one part, first
      # we need to fetch the potential user
      if user = find_by_email(username)
        # Then compare the provided password against the hashed one in the db.
        if BCrypt::Password.new(user.hashed_password).is_password? password
          # If they match we return the user 
          return user
        end
      end
      # If we get here it means either there's no user with that email, or the wrong
      # password was provided.  But we don't want to let an attacker know which. 
      return nil
    end


end
