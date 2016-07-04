class CreateKindOfScholarships < ActiveRecord::Migration
  def change
    create_table :kind_of_scholarships do |t|
      t.string :name
      t.text :description
      t.text :short_description
      t.string :state
      t.timestamp :starting_date
      t.timestamp :ending_date

      t.timestamps null: false
    end
  end
end
