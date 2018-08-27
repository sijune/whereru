class AddReplyIdToRereplies < ActiveRecord::Migration
  def change
    add_column :rereplies, :reply_id, :integer
  end
end
