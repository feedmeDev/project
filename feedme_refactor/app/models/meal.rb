class Meal < ActiveRecord::Base

#relations 
has_many :component_meal
has_many :components, through: :component_meal

belongs_to :attendance

#validations
validate :check_dates

  def check_dates
    errors.add(:base, "end date should be greater than start") if deadline > date_and_time
  end
end
