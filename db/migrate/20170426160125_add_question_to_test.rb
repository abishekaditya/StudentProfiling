class AddQuestionToTest < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :course, foreign_key: true
  end
end
