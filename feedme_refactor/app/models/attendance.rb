class Attendance < ActiveRecord::Base

has_many :indications
has_many :components, through: :indications

has_many :meals

has_many :people

end
