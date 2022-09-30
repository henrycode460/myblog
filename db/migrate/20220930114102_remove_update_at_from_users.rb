class RemoveUpdateAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :update_at, :string
  end
end
