class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.text :metadata

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
