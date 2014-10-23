class AllergenWarning < ActiveRecord::Base

validates :warning_content, presence: true
validates :warning_title, presence: true


end
