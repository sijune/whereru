class CreateRerelikes < ActiveRecord::Migration
  def change
    create_table :rerelikes do |t|
      t.references :rereply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
