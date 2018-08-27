class AddHotToRereplies < ActiveRecord::Migration
  def change
    add_column :rereplies, :hot, :integer
  end
end
