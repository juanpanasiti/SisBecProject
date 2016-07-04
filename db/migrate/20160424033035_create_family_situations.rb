class CreateFamilySituations < ActiveRecord::Migration
  def change
    create_table :family_situations do |t|
      t.belongs_to :personal_datum, index: true, foreign_key: true
      t.integer :children
      t.integer :dependents
      t.integer :minors
      t.string :disability

      t.timestamps null: false
    end
  end
end
