class CreateAllergenComponents < ActiveRecord::Migration
  def change
    create_table :allergen_components do |t|
      t.belongs_to :allergen_warning, index: true
      t.belongs_to :component, index: true

      t.timestamps
    end
  end
end
