class AddProfessorIdToUniversitySubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :university_subjects, :professor_id, :integer
    add_index :university_subjects, :professor_id
  end
end
