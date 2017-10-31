class PostsBelongToManySubs < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :sub_id
    add_column :posts, :sub_ids, :integer, array: true, default: []
  end
end
