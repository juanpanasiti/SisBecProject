class CreatePersonalData < ActiveRecord::Migration
  def change
    create_table :personal_data do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      t.string :name
      t.string :lastname
      t.string :document
      t.timestamp :birthdate
      t.string :address
      t.string :city
      t.string :phone
      t.string :cellphone

      t.timestamps null: false
    end
  end
end
