class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.belongs_to :family_situation, index: true, foreign_key: true
      t.string :name
      t.string :lastname
      t.string :document
      t.string :relationship

      t.timestamps null: false
    end
  end
end
