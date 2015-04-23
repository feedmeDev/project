class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :person, index: true
      t.boolean :going

      t.timestamps
    end
  end
end
