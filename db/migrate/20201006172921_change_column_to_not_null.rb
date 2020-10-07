class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :profiles, :sex, :integer, null: false, default: 0
  end

  def def down 
    change_column :profiles, :sex, :integer
  end
end
