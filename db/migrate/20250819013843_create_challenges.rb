class CreateChallenges < ActiveRecord::Migration[8.0]
  def change
    create_table :challenges, id: :uuid do |t|
      t.string :title, null: false
      t.text :description
      t.string :category, null: false
      t.string :difficulty, null: false
      t.string :music_key
      t.integer :tempo
      t.text :instructions
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end

    add_index :challenges, :category
    add_index :challenges, :difficulty
    add_index :challenges, :created_at
  end
end
