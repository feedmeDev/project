class CreateAllergenWarnings < ActiveRecord::Migration
  def change
    create_table :allergen_warnings do |t|
      t.string :warning_content

      t.timestamps
    end
  end
end
