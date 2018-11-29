class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :names
      t.string :lastnames
      t.string :type
      t.integer :age
      t.string :cellphone
      t.string :email
      t.integer :init_preg_week
      t.decimal :salary
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
