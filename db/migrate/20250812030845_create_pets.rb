class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :birth_date
      t.string :species

      t.timestamps
    end
  end
end
