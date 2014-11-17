class Meal < ActiveRecord::Base

#relations 
has_many :components_meal
has_many :components, through: :components_meal

belongs_to :attendance

#validations
validate :check_dates

  def check_dates
    errors.add(:base, "end date should be greater than start") if deadline > Date.yesterday
  end

end
