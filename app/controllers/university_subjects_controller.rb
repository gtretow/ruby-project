class UniversitySubjectsController < ApplicationController
  before_action :set_university_subject, only: %i[ show edit update destroy ]
  before_action :authenticate_professor!, except: [:index, :show]
  before_action :correct_professor, only: [:edit, :update, :destroy]

  def index
    begin
      if student_signed_in?
        @university_subjects = UniversitySubject.where(
          student_code: current_student.student_code.to_s
        )
      if professor_signed_in?
        @university_subjects = UniversitySubject.where(
          professor_id: current_professor.id 
        )
      end
      else 
        @university_subjects = UniversitySubject.where(
          professor_id: 1
        )
      end
    rescue Exception => e
      puts e
    end
  
  end

  def show
  end

  def new
    begin
      @university_subject = current_professor.university_subjects.build
    rescue Exception => e
      puts e
    end
  end

  def create
    @university_subject = current_professor.university_subjects.build(university_subject_params)

    respond_to do |format|
      if @university_subject.save
        ApplicationJob.perform_later()
        format.html { redirect_to university_subject_url(@university_subject), notice: "Nota criada com sucesso!" }
        format.json { render :show, status: :created, location: @university_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @university_subject.update(university_subject_params)
        format.html { redirect_to university_subject_url(@university_subject), notice: "A nota foi atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @university_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @university_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @university_subject.destroy

    respond_to do |format|
      format.html { redirect_to university_subjects_url, notice: "Nota deletada com sucesso!" }
      format.json { head :no_content }
    end
  end

  def correct_professor
    @universitySubject = current_professor.university_subjects.find_by(id: params[:id])
    redirect_to university_subjecs, notice: "Não autorizado a editar esta nota" if @universitySubject.nil?
  end

  private
    def set_university_subject
      @university_subject = UniversitySubject.find(params[:id])
    end

    def university_subject_params
      params.require(:university_subject).permit(:student_code, :coordinator, :bimester, :grade, :comment, :professor_id, :student_code)
    end
end
