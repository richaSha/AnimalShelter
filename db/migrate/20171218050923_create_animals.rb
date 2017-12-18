class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.datetime :dob
      t.string :description
      t.datetime :arrival_date

      t.timestamps
    end
  end
end
