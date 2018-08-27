class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :content
      t.integer :value

      t.timestamps null: false
    end
  end
end
