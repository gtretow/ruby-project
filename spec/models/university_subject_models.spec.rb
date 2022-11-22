require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe UniversitySubject, type: :model do

    it "is valid with valid attributes" do
      sign_in(create(:professor))
      expect(UniversitySubject.new(coordinator: "teste", bimester: "1", grade:"2", comment:"show", professor_id: 1, student_code: "123123")).to be_valid
    end

    it "is not valid without a coordinator" do
      uniSubject = UniversitySubject.new(coordinator: nil)
      expect(uniSubject).to_not be_valid
    end

    it "is not valid without a bimester" do
      uniSubject = UniversitySubject.new(bimester: nil)
      expect(uniSubject).to_not be_valid
    end

    it "is not valid without a grade" do
      uniSubject = UniversitySubject.new(grade: nil)
      expect(uniSubject).to_not be_valid
    end

    it "is not valid without a comment" do
      uniSubject = UniversitySubject.new(comment: nil)
      expect(uniSubject).to_not be_valid
    end

    it "is not valid without a student_code" do
      uniSubject = UniversitySubject.new(student_code: nil)
      expect(uniSubject).to_not be_valid
    end

  end