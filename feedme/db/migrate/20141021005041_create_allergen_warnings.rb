class CreateAllergenWarnings < ActiveRecord::Migration
  def change
    create_table :allergen_warnings do |t|
      t.string :warning_content
      t.string :warning_title
      t.timestamps
    end
  end
end
