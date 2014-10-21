class ComponentMealsController < ApplicationController
  before_action :set_component_meal, only: [:show, :edit, :update, :destroy]

  # GET /component_meals
  # GET /component_meals.json
  def index
    @component_meals = ComponentMeal.all
  end

  # GET /component_meals/1
  # GET /component_meals/1.json
  def show
  end

  # GET /component_meals/new
  def new
    @component_meal = ComponentMeal.new
  end

  # GET /component_meals/1/edit
  def edit
  end

  # POST /component_meals
  # POST /component_meals.json
  def create
    @component_meal = ComponentMeal.new(component_meal_params)

    respond_to do |format|
      if @component_meal.save
        format.html { redirect_to @component_meal, notice: 'Component meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @component_meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @component_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_meals/1
  # PATCH/PUT /component_meals/1.json
  def update
    respond_to do |format|
      if @component_meal.update(component_meal_params)
        format.html { redirect_to @component_meal, notice: 'Component meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @component_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_meals/1
  # DELETE /component_meals/1.json
  def destroy
    @component_meal.destroy
    respond_to do |format|
      format.html { redirect_to component_meals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_meal
      @component_meal = ComponentMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_meal_params
      params.require(:component_meal).permit(:meal_id, :component_belongs_to)
    end
end
