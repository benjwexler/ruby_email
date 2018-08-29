class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @cohorts = Cohort.all

    p @cohorts[0].name
  end

  # GET /students/1
  # GET /students/1.json
  def show

    @enrollment = Enrollment.new

    @names=[]
    @values = []
    @enrollment_ids = []
    Cohort.all.each do |cohort|
      if cohort.enrollments.exists?(student_id: params[:id]) == false
        @names.push(cohort.name)
        @values.push(cohort.id)
      # else 
      #   cohort.enrollments.each do |enrollment|
      #     # puts enrollment.id
      #     @enrollment_ids.push(enrollment.id)
      #     # puts "_________________fe ufb ueruh______"
      #   end 

        
      end
    end 

    puts @enrollment_ids

    @remove_names = []
    @remove_values = []

    Cohort.all.each do |cohort|
      if cohort.enrollments.exists?(student_id: params[:id])
        @remove_names.push(cohort.name)
        @remove_values.push(cohort.id)

        

       
      
      end
    end

    puts @remove_names
    puts @remove_values


    
    
    
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    # respond_to do |format|
    #   format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :age)
    end

    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end 
end
