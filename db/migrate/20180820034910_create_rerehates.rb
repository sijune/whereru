class CreateRerehates < ActiveRecord::Migration
  def change
    create_table :rerehates do |t|
      t.references :rereply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
