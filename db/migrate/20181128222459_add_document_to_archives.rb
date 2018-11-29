class AddDocumentToArchives < ActiveRecord::Migration[5.2]
  def change
    add_column :archives, :document, :string
  end
end
