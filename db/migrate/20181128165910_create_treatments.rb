class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :dosis
      t.text :instructions
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
