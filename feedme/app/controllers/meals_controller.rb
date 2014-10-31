class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all

    render json: @meals
  end

  #return meal_ids for meals that have not expired yet
  # GET /meals/current
  def get_current_meals
    @list = []
    
    
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])

    render json: @meal
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end

  #
  def add_items_to_meal
    @meal = Meal.find(params[:id])
    @list_components = params[:list_items]
    
    @list_component.each do | c |
      @meal.components_meals << c
    end
  end


  def remove_items_from_meal
    @meal = Meal.find(params[:id])
    @list_components = params[:list_items]

    @list_component.each do | c |
      @meal.components_meals >> c
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:date_and_time_of_meal, :deadline)
    end
end
