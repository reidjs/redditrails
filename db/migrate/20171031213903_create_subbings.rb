class CreateSubbings < ActiveRecord::Migration[5.1]
  def change
    create_table :subbings do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.timestamps
    end
    remove_column :posts, :sub_ids
  end
end
