class AddSexToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :sex, :integer
  end
end
