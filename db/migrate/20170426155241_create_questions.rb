class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.float :toughness, null: false, default: 3.0
      t.string :question, null: false
      t.string :a, null: false
      t.string :b, null: false
      t.string :c, null: false
      t.string :d, null: false
      t.string :answer, null: false
      t.timestamps
    end
  end
end
