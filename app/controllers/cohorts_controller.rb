class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]
  after_action :set_name, only: [:create]
  before_action :authenticate_user!

  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = Cohort.all.paginate(:per_page => 20, :page => params[:page])

    

  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show

    @student = Student.new 

    @enrollment = Enrollment.new

    @students = @cohort.enrollments.map do |enrollment|
  
        [Student.find(enrollment.student_id).full_name, Student.find(enrollment.student_id).id]
        
      end

      @student_names = []
      @student_ids = []

      Student.all.each do |student|
        if student.enrollments.exists?(cohort_id: params[:id]) == false
          # puts "df jkfen kefn erknero"
          @student_names.push(student.full_name)
          @student_ids.push(student.id)
        
      else 
        # puts params[:id]
        # puts "YBRUBUHRBOIOUHRBNIHRNIJR"
        # puts student.first_name 
      end 
    end

    puts @student_names
    puts @student_ids

  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create


    # p params[:instructor_id]
    @cohort = Cohort.new(cohort_params)

    
   

    # redirect_to @cohort

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_and_enroll

  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params

        
      
      
      params.require(:cohort).permit(:name, :start_date, :end_date, :course_id, :instructor_id)
    end

    def set_name
      @course = Course.find(@cohort.course_id)
      p @course.name 
      Cohort.where(id: @cohort.id).update_all(name: "#{@course.name} - #{@cohort.start_date.strftime("%B, %d, %Y")}")
    end 
end
