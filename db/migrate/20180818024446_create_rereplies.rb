class CreateRereplies < ActiveRecord::Migration
  def change
    create_table :rereplies do |t|
      t.string :to_user
      t.string :content
      t.integer :post_jd
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
