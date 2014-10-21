class CreateComponentMeals < ActiveRecord::Migration
  def change
    create_table :component_meals do |t|
      t.int :meal_id
      t.int :component_id

      t.timestamps
    end
  end
end
