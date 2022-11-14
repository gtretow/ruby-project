class AddStudentCodeToUniversitySubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :university_subjects, :student_code, :string
  end
end
