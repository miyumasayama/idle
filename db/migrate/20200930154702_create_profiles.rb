class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.integer :age
      t.string :favorite
      t.text :introduce

      t.timestamps
    end
  end
end
