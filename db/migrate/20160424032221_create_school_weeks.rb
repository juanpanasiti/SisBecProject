class CreateSchoolWeeks < ActiveRecord::Migration
  def change
    create_table :school_weeks do |t|
      t.belongs_to :school_situation, index: true, foreign_key: true
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday

      t.timestamps null: false
    end
  end
end
