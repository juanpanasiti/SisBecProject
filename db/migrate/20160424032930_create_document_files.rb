class CreateDocumentFiles < ActiveRecord::Migration
  def change
    create_table :document_files do |t|
      t.belongs_to :personal_datum, index: true, foreign_key: true
      t.string :file_name
      t.string :extension
      t.string :document_type

      t.timestamps null: false
    end
  end
end
