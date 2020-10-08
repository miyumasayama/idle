class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.integer :age
      t.string :favorite
      t.text :introduce
      t.integer :place, null: false, default: 0

      t.timestamps
    end
  end
end
