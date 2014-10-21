class IndicationForMealsController < ApplicationController
  before_action :set_indication_for_meal, only: [:show, :edit, :update, :destroy]

  # GET /indication_for_meals
  # GET /indication_for_meals.json
  def index
    @indication_for_meals = IndicationForMeal.all
  end

  # GET /indication_for_meals/1
  # GET /indication_for_meals/1.json
  def show
  end

  # GET /indication_for_meals/new
  def new
    @indication_for_meal = IndicationForMeal.new
  end

  # GET /indication_for_meals/1/edit
  def edit
  end

  # POST /indication_for_meals
  # POST /indication_for_meals.json
  def create
    @indication_for_meal = IndicationForMeal.new(indication_for_meal_params)

    respond_to do |format|
      if @indication_for_meal.save
        format.html { redirect_to @indication_for_meal, notice: 'Indication for meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @indication_for_meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @indication_for_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indication_for_meals/1
  # PATCH/PUT /indication_for_meals/1.json
  def update
    respond_to do |format|
      if @indication_for_meal.update(indication_for_meal_params)
        format.html { redirect_to @indication_for_meal, notice: 'Indication for meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @indication_for_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indication_for_meals/1
  # DELETE /indication_for_meals/1.json
  def destroy
    @indication_for_meal.destroy
    respond_to do |format|
      format.html { redirect_to indication_for_meals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indication_for_meal
      @indication_for_meal = IndicationForMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indication_for_meal_params
      params.require(:indication_for_meal).permit(:component_id, :attendance_id)
    end
end
