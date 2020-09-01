class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.boolean :liked, default: false
      t.boolean :completed, default: false
      t.references :user, null: false, foreign_key: true
      t.references :adventure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
