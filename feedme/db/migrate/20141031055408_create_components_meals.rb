class CreateComponentsMeals < ActiveRecord::Migration
  def change
    create_table :components_meals do |t|
      t.integer :component_id, index:true
      t.integer :meal_id, index:true

      t.timestamps
    end
  end
end
