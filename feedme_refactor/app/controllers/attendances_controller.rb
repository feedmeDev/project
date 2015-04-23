class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances/person
  # GET /attendances/person.json
  def get_attendances_for_person

    @attendances = Attendance.where(['person_id = ?', params[:id]])

    render json: @attendances

  end

  def report
    meal = Meal.find(params[:id])

    attendances = Attendance.where(['meal_id = ?', meal])

    #how many have indicated
    @indicated = attendances.where(['meal_id = ?', meal]).count

    #how many active students are there
    @total_students = Person.where(['staff = ? AND still_active = ?', false, true]).count

    #how many have indicated going
    @going = attendances.where(['going = ?', true]).count

    #summarise components

    comps = []
    #foreach person that has indicated on the meal_id
    attendances.each do | a |
      #get each component
      a.components.each do | c |
        #add the component id to a list of component ids
        comps << c.id
      end
    end

    @summary = []

    meal.components.each do | c |
      @summary << {:component_request_count =>{:component => c, :count => comps.count(c.id)}}

    end

    #end summarise components

    render json: {:report =>{:total_students => @total_students, :indicated => @indicated, :going => @going, :summary => @summary}}
  end


  # POST /attendances
  # POST /attendances.json
  def create

    #delete the old attendance if it exists

    person = Person.find(params[:person_id])
    meal = Meal.find(params[:meal_id])

    @attendance = Attendance.where(['meal_id = ? and person_id = ?', meal, person]).first

    if @attendance.present?
      @attendance.components.destroy_all
      @attendance.delete
    end
    
    
    # create the new attendance

    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end
  

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
