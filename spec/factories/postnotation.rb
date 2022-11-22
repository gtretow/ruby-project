FactoryBot.define do
    factory(:university_subject) do
        name {'Teste Post'}
        coordinator {'Teste José'}
        bimester {'1'}
        grade {'10'}
        comment {"show de teste"}
        student_code {"123123"}
        professor_id {1}
    end
end
