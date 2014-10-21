class CreateComponentMeals < ActiveRecord::Migration
  def change
    create_table :component_meals do |t|
      t.belongs_to :meal, index: true
      t.string :component_belongs_to

      t.timestamps
    end
  end
end
