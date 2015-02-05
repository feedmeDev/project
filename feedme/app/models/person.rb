require 'bcrypt'

class Person < ActiveRecord::Base

#relationships
belongs_to :attendances


#unique username needed of min length
validates :username, presence: true
validates :username, uniqueness: { case_sensitive: false}
validates :username, length: {minimum: 5}

validates :password, length: {minimum: 8}

validates :still_active, :inclusion => {:in => [true, false]}
validates :staff, :inclusion => {:in => [true, false]}
validates :name, presence: true

##################### password stuff
has_secure_password

end
