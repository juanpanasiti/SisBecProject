class CreateEconomicSituations < ActiveRecord::Migration
  def change
    create_table :economic_situations do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      t.string :dwelling
      t.integer :rent
      t.string :situation
      t.decimal :incomes
      t.integer :vehicles

      t.timestamps null: false
    end
  end
end
