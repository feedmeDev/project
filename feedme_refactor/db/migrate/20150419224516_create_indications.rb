class CreateIndications < ActiveRecord::Migration
  def change
    create_table :indications do |t|
      t.belongs_to :component, index: true
      t.belongs_to :attendance, index: true

      t.timestamps
    end
  end
end
