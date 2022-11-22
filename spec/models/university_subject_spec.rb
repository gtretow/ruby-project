=begin require 'rails_helper'

RSpec.describe UniversitySubject, type: :model do

    before do
        @professor = create :professor
      end
    
    context 'validation tests' do
        it 'ensures RA presence' do
            notation = UniversitySubject.new(bimester: "1", grade: '10', coordinator: 'José', comment: 'show', professor_id: 1)
            expect(notation).to eq(false)
        end

        it 'ensures Grade presence' do
            notation = UniversitySubject.new(student_code: '1313123', bimester: "1", coordinator: 'José', comment: 'show', professor_id: 1)
            expect(notation).to be_valid
        end

        it 'ensure notation is created' do
            notation = UniversitySubject.new(id: 10, student_code: '1313123', bimester: "1", grade: '10', coordinator: 'José', comment: 'show', professor_id: 1)
            expect(notation).to be_valid
        end    
    end
end =end