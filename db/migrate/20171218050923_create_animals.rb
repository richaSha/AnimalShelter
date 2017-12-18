class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :gender
      t.string :species
      t.datetime :dob
      t.datetime :arrival_date
      t.string :description
  
      t.timestamps
    end
  end
end
