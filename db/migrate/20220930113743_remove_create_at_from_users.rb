class RemoveCreateAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :create_at, :string
  end
end
