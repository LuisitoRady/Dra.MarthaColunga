class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :pills
      t.text :description

      t.timestamps
    end
  end
end
