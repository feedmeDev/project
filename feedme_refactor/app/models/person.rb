require 'bcrypt'

class Person < ActiveRecord::Base

#relationships
belongs_to :attendances


#unique username needed of min length
validates :username, presence: true
validates :username, uniqueness: { case_sensitive: false}
validates :username, length: {minimum: 5}

validates :password, length: {minimum: 8}, on: :create

validates :staff, :inclusion => {:in => [true, false]}
validates :name, presence: true

##################### password stuff
has_secure_password

end
