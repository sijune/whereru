class CreateRelikes < ActiveRecord::Migration
  def change
    create_table :relikes do |t|
      t.references :reply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
