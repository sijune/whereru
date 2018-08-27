class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.date :birth
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
