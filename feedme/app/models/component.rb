class Component < ActiveRecord::Base

has_many :components_meal
has_many :meals, through: :components_meal

validates :name, presence: true
validates :name, uniqueness: {case_sensitive: false}
validates :description, presence: true

end
