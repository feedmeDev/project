class AllergenComponent < ActiveRecord::Base
  belongs_to :allergen_warning
  belongs_to :component
end
