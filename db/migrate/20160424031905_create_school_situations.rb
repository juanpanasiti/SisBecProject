class CreateSchoolSituations < ActiveRecord::Migration
  def change
    create_table :school_situations do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      t.string :career

      t.timestamps null: false
    end
  end
end
