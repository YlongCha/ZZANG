class CreateWowchas < ActiveRecord::Migration
  def change
    create_table :wowchas do |t|
      t.string :username
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end
end
