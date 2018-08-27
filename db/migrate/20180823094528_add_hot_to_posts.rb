class AddHotToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hot, :integer
  end
end
