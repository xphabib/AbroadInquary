class StudentApplicationsController < ApplicationController
  before_action :set_student_application, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /student_applications
  # GET /student_applications.json
  def index
    authorize! :read, StudentApplication
    if current_user.mentor?
      @student_applications = current_user.mentor_applications
    elsif current_user.student?
      @student_applications = current_user.student_applications
    else
      @student_applications = StudentApplication.all
    end
  end

  # GET /student_applications/1
  # GET /student_applications/1.json
  def show
    authorize! :read, StudentApplication
  end

  # GET /student_applications/new
  def new
    authorize! :create, StudentApplication
    @student_application = StudentApplication.new
  end

  # GET /student_applications/1/edit
  def edit
    authorize! :update, StudentApplication
  end

  # POST /student_applications
  # POST /student_applications.json
  def create
    authorize! :create, StudentApplication
    @student_application = StudentApplication.new(student_application_params)
    @student_application.student_id = current_user.id if current_user.student?
    @student_application.mentor_id = current_user.id if current_user.mentor?

    respond_to do |format|
      if @student_application.save!
        format.html { redirect_to @student_application, notice: 'Student application was successfully created.' }
        format.json { render :show, status: :created, location: @student_application }
      else
        format.html { render :new }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_applications/1
  # PATCH/PUT /student_applications/1.json
  def update
    authorize! :update, StudentApplication
    respond_to do |format|
      if @student_application.update(student_application_params)
        format.html { redirect_to @student_application, notice: 'Student application was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_application }
      else
        format.html { render :edit }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_applications/1
  # DELETE /student_applications/1.json
  def destroy
    authorize! :destroy, StudentApplication
    @student_application.destroy
    respond_to do |format|
      format.html { redirect_to student_applications_url, notice: 'Student application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_application
      @student_application = StudentApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_application_params
      params.require(:student_application).permit(:country_id, :desire_program, :passport_file, :motivation_letter, :recommendation_letter, :cv, :police_clearance_certificate, :birth_certificate, :bank_statement, :bank_solvency_certificate, :student_id, :mentor_id, :university_name, :application_status)
    end
end
