class CreateIndicationForMeals < ActiveRecord::Migration
  def change
    create_table :indication_for_meals do |t|
      t.int :component_id
      t.int :attendance_id

      t.timestamps
    end
  end
end
