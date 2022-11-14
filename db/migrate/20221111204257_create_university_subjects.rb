class CreateUniversitySubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :university_subjects do |t|
      t.string :name
      t.string :coordinator
      t.string :bimester
      t.string :grade
      t.string :comment

      t.timestamps
    end
  end
end
