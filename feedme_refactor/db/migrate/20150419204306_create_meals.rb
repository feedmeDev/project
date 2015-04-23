class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.datetime :date_and_time
      t.datetime :deadline

      t.timestamps
    end
  end
end
