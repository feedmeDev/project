class Attendance < ActiveRecord::Base
  has_many :indication_for_meals
  has_many :components, through: :indication_for_meals

  has_many :meals
   
end
