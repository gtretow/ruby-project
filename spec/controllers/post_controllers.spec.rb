require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe UniversitySubjectsController, type: :controller do
    let(:notation) {create(:university_subject)}
    
    context 'GET #index' do
        it 'should return success and render the index page' do
            get :index
            expect(response).to have_http_status(200)
           expect(response).to render_template(:index)
        end

        it 'expect no grades' do
            get :index
            expect(assigns(:university_subjects)).to be_empty
        end

        it 'expect grades' do
            create(:professor)
            create(:university_subject)
            get :index
            expect(assigns(:university_subjects)).to_not be_empty
        end
    end

    context 'Get #show' do
        it 'should render the show page' do
            sign_in(create(:professor))
            get:show, params: {id: notation.id}
            expect(response).to have_http_status(200) 
        end
    end

    context "Get #new" do
       it 'should render the creation page' do
        sign_in(create(:professor))
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end 
    end

    context "post #create" do
        let!(:params){
            {coordinator: 'Teste José', bimester: '1', grade: '10', comment: 'show', student_code: '123123', professor_id: 1}
        }

        it "creates a new post" do
            sign_in(create(:professor))
            post :create, params: {university_subject: params}
            expect(response).to redirect_to(action: :show, id: 1)
        end

        it "error when creating a new post" do
            paramsError = {student_id: nil}
            sign_in(create(:professor))
            post :create, params: {university_subject: paramsError}
            expect(response).to render_template("new")
        end

    end

    context "post #update" do
        let!(:newProfessor) {create(:professor)}
        let!(:editNotation) { create(:university_subject)}
        it 'should update post info' do
            sign_in(newProfessor)
            editParams = {comment: 'Titulo Atualizado'}
            put :update, params: {id: editNotation.id, university_subject: editParams}
            editNotation.reload
            expect(editNotation.comment).to eq(editParams[:comment])
        end

        it 'should not update post info' do
            sign_in(newProfessor)
            editParams = {comment: nil}
            put :update, params: {id: editNotation.id, university_subject: editParams}
            editNotation.reload
            expect(editNotation.comment).to_not eq(editParams[:comment])
        end
    end

    context "post #delete" do
        let!(:newProfessor) {create(:professor)}
        let!(:deleteNotation) { create(:university_subject)}

        it 'should delete post ' do
            sign_in(newProfessor)
            delete :destroy, params: {id: deleteNotation.id}
            expect(response.status).to eq 200
        end
    end
    
end
