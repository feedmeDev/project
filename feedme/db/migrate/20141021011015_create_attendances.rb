class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.int :meal_id
      t.int :person_id
      t.boolean :going

      t.timestamps
    end
  end
end
