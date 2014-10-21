class CreateFeedbackForMeals < ActiveRecord::Migration
  def change
    create_table :feedback_for_meals do |t|
      t.belongs_to :meal, index: true
      t.string :person_belongs_to
      t.text :body
      t.datetime :date_of_meal

      t.timestamps
    end
  end
end
