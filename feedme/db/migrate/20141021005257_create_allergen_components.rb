class CreateAllergenComponents < ActiveRecord::Migration
  def change
    create_table :allergen_components do |t|
      t.int :allergen_warning_id
      t.int :component_id

      t.timestamps
    end
  end
end
