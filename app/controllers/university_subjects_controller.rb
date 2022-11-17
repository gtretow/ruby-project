class UniversitySubjectsController < ApplicationController
  before_action :set_university_subject, only: %i[ show edit update destroy ]
  before_action :authenticate_professor!, except: [:index, :show]
  before_action :correct_professor, only: [:edit, :update, :destroy]
 
  # GET /university_subjects or /university_subjects.json
  def index
    #@university_subjects = UniversitySubject.select {|subject| subject.student_code.to_s.humanize == current_student.student_code.to_s.humanize}
    #@university_subject = UniversitySubject.find_by(student_code: current_student.student_code.build)
    @university_subjects = UniversitySubject.all
  end

  # GET /university_subjects/1 or /university_subjects/1.json
  def show
  end

  # GET /university_subjects/new
  def new
    #@university_subject = UniversitySubject.new
    @university_subject = current_professor.university_subjects.build
  end

  # GET /university_subjects/1/edit
  def edit
  end

  # POST /university_subjects or /university_subjects.json
  def create
    #@university_subject = UniversitySubject.new(university_subject_params)
    @university_subject = current_professor.university_subjects.build(university_subject_params)

    respond_to do |format|
      if @university_subject.save
        format.html { redirect_to university_subject_url(@university_subject), notice: "Nota criada com sucesso!" }
        format.json { render :show, status: :created, location: @university_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /university_subjects/1 or /university_subjects/1.json
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

  # DELETE /university_subjects/1 or /university_subjects/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_university_subject
      @university_subject = UniversitySubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def university_subject_params
      params.require(:university_subject).permit(:student_code, :coordinator, :bimester, :grade, :comment, :professor_id, :student_code)
    end
end
