class CreateComponentMeals < ActiveRecord::Migration
  def change
    create_table :component_meals do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :component, index: true
end
  end
end
