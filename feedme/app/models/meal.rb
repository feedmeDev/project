class Meal < ActiveRecord::Base

date :check_dates

  def check_dates
    errors.add(:base, "end date should be greater than start") if deadline < Date.yesterday
  end

end
