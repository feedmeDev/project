class Meal < ActiveRecord::Base

#relations 
has_many :component_meal
has_many :components, through: :component_meal

belongs_to :attendance

#validations
validate :check_dates

  def check_dates
    errors.add(:base, "end date should be greater than start") if deadline > date_and_time
    errors.add(:base, "date and time should be after today") unless date_and_time.to_date.future?
	errors.add(:base, "deadline must be after today") unless deadline.to_date.future?
  end
end
