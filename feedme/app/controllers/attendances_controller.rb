class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

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
    attendance = Attendance.delete_all(['meal_id = ? and person_id = ?', params[:meal_id], params[:person_id]])

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

    Indication_for_meals.delete_all(['attendance_id = ?', @attendance.id])

    list_componenets.each do | lc |

      i = Indications_for_meals.create(attendance_id: @attendance.id, component_id: lc)

    end

  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

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
  def indicate_going
    meal = Meal.find(params[:meal_id])
    person = Person.find(params[:person_id])

    attendance = Attendance.where(['meal_id = ? and person_id = ?', meal, person])

    attendance.going = params[:going]
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
