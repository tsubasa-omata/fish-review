class RemoveUserIdNameFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :user_id_name, :string
  end
end
