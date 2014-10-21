class CreateIndicationForMeals < ActiveRecord::Migration
  def change
    create_table :indication_for_meals do |t|
      t.belongs_to :component, index: true
      t.belongs_to :attendance, index: true

      t.timestamps
    end
  end
end
