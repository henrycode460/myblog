class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, index: true
      t.references :post, null: false, index: true, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
