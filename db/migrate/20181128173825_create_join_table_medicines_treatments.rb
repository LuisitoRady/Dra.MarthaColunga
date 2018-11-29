class CreateJoinTableMedicinesTreatments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :treatments, :medicines do |t|
      # t.index [:treatment_id, :medicine_id]
      # t.index [:medicine_id, :treatment_id]
    end
  end
end
