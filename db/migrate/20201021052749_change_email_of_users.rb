class ChangeEmailOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, :limit=>191, unique: true
  end
end
