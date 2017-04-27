class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.timestamps
    end

    add_index :tests, :title, unique: true
  end
end
