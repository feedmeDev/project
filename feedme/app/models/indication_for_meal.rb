class IndicationForMeal < ActiveRecord::Base
  belongs_to :component
  belongs_to :attendance
end
