class AddStudentCodeToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :student_code, :string
  end
end
