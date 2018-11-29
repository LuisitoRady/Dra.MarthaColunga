class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :title
      t.text :description
      t.datetime :appointment_date
      t.integer :responsable
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
