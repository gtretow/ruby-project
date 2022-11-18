require 'rails_helper'

RSpec.describe UniversitySubject, type: :model do

    before do
        @professor = create :professor
      end
    
    context 'validation tests' do
        it 'ensures RA presence' do
            note = UniversitySubject.new(bimester: "1", grade: '10', coordinator: 'José', comment: 'show')
            expect(note).to_not be_valid
        end

        it 'ensures Grade presence' do
            note = UniversitySubject.new(student_code: '1313123', bimester: "1", coordinator: 'José', comment: 'show')
            expect(note).to_not be_valid
        end

        it 'should Bimester successfully' do
            note = UniversitySubject.new(id: 10, student_code: '1313123', bimester: "1", grade: '10', coordinator: 'José', comment: 'show', professor_id: 1)
            expect(note).to be_valid
        end

        
    end

    context 'scope tests' do

    end

end