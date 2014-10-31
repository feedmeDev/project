class ComponentsMealsController < ApplicationController
  before_action :set_components_meal, only: [:show, :edit, :update, :destroy]

  # GET /components_meals
  # GET /components_meals.json
  def index
    @components_meals = ComponentsMeal.all
  end

  # GET /components_meals/1
  # GET /components_meals/1.json
  def show
  end

  # GET /components_meals/new
  def new
    @components_meal = ComponentsMeal.new
  end

  # GET /components_meals/1/edit
  def edit
  end

  # POST /components_meals
  # POST /components_meals.json
  def create
    @components_meal = ComponentsMeal.new(components_meal_params)

    respond_to do |format|
      if @components_meal.save
        format.html { redirect_to @components_meal, notice: 'Components meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @components_meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @components_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components_meals/1
  # PATCH/PUT /components_meals/1.json
  def update
    respond_to do |format|
      if @components_meal.update(components_meal_params)
        format.html { redirect_to @components_meal, notice: 'Components meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @components_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components_meals/1
  # DELETE /components_meals/1.json
  def destroy
    @components_meal.destroy
    respond_to do |format|
      format.html { redirect_to components_meals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_components_meal
      @components_meal = ComponentsMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def components_meal_params
      params.require(:components_meal).permit(:meal, :component)
    end
end
