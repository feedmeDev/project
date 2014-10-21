class CreateFeedbackForMeals < ActiveRecord::Migration
  def change
    create_table :feedback_for_meals do |t|
      t.int :meal_id
      t.int :person_id
      t.text :body
      t.datetime :date_of_meal

      t.timestamps
    end
  end
end
