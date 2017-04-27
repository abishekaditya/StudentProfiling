class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|

      t.timestamps
      t.string :code
    end
    add_index :courses, :code, unique: true

  end
end
