class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :check_ok

      t.timestamps null: false
    end
  end
end
