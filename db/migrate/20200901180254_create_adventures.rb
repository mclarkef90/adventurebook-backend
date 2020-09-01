class CreateAdventures < ActiveRecord::Migration[6.0]
  def change
    create_table :adventures do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :likes, default: 0
      t.integer :completions, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
