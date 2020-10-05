class AddPlaceToProfile < ActiveRecord::Migration[6.0]
  def up
    change_column_null :profiles, :place, false, 0
    change_column :profiles, :place, :integer, default: 0
  end

  def down
    change_column_null :profiles, :place, true, nil
    change_column :profiles, :place, :integer, default: nil
  end
end
