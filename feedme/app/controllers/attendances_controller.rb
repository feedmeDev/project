class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token


  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show

    @attendance = Attendance.find(params[:id])

    render json: @attendance

  end

  # GET /attendance/person/1.json
  def get_attendance_for_person
    @attendances = Attendance.where(['person_id = ?', params[:id]])

    render json: @attendances
  end


  # GET /get_report/:id
  def get_report
=begin
    meal = Meal.find(params[:id])

    @attendances = Attendance.where(['meal_id = ?', meal])

    @comps = []

    @attendances.each do | a |
      a.components.each do | c |
        @comps << c.id
      end
    end

    render json: @comps
=end


    meal = Meal.find(params[:id])

    attendances = Attendance.where(['meal_id = ?', meal])

    #================= numbers start ==========================
    
    #how many have indicated
    @indicated = attendances.where(['meal_id = ?', meal]).count

    #how many active students are there
    @total_students = Person.where(['staff = ? AND still_active = ?', false, true]).count

    #how many have indicated going
    @going = attendances.where(['going = ?', true]).count
    
    #================= numbers end ============================


    #summarise components

    #end summarise components

    render json: {:total_students => @total_students, :indicated => @indicated, :going => @going}
  end
  

  # GET /attendances/new
#  def new
#    @attendance = Attendance.new
#  end

  # GET /attendances/1/edit
#  def edit
#  end

  # POST /attendances
  # POST /attendances.json
  def create
    person = Person.find(params[:person_id])
    meal = Meal.find(params[:meal_id])

    @attendance = Attendance.where(['meal_id = ? and person_id = ?', meal, person]).first
    

    
    if @attendance.present?
      @attendance.components.destroy_all
      @attendance.delete
    end

    #render json: @attendance

    #^^^^ works

    #deleting historic data does not work


    #vvvv works

    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendance }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end

    

    list_components = params[:list]

    #delete all components for an attendance

    if @attendance.going

      list_components.each do | lc |

        comp = Component.find(lc)

        #create all component relationships for 
        @attendance.components << comp

      end
    end

  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
#  def update
#    respond_to do |format|
#      if @attendance.update(attendance_params)
#        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: 'edit' }
#        format.json { render json: @attendance.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
#  def destroy
#    @attendance.destroy
#    respond_to do |format|
#      format.html { redirect_to attendances_url }
#      format.json { head :no_content }
#    end
#  end

  # POST /indication/going
#  def indicate_going
#    meal = Meal.find(params[:meal_id])
#    person = Person.find(params[:person_id])
#
#    attendance = Attendance.where(['meal_id = ? and person_id = ?', meal, person])
#
#    attendance.going = params[:going]
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:meal_id, :person_id, :going)
    end
end
