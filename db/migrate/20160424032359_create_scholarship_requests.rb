class CreateScholarshipRequests < ActiveRecord::Migration
  def change
    create_table :scholarship_requests do |t|
      t.belongs_to :school_situation, index: true, foreign_key: true
      t.references :kind_of_scholarship, index: true, foreign_key: true
      t.string :state
      t.string :message

      t.timestamps null: false
    end
  end
end
