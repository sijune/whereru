class AddHotToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :hot, :integer
  end
end
