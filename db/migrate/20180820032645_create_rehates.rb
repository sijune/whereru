class CreateRehates < ActiveRecord::Migration
  def change
    create_table :rehates do |t|
      t.references :reply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
