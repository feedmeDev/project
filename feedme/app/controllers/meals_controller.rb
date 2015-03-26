class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all

    render json: @meals
  end


  # GET /meals/future.json
  def get_future_meals
#    @future_meals = Meal.find(date_and_time_of_meal > DateTime.now)

    @future_meals = Meal.where('date_and_time_of_meal > ?', DateTime.now).all

    render json: {:future => @future_meals}
  end

  def get_past_meals
#    @past_meals = Meal.find(date_and_time_of_meal < DateTime.now)


    @past_meals = Meal.where(:conditions=>['date_and_time_of_meal < ?', DateTime.now]).load

    render json: @past_meals

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

    #possibly put components addition here

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

  # POST /meal/add_component
  def add_items_to_meal
    @meal = Meal.find(params[:meal])
    @list_components = Component.find(params[:component_list])

    @meal.components.destroy_all

    @list_components.each do | lc |
      @meal.components << lc
    end

    head :no_content
    
  end

  # DELETE /meal/delete_component
  def remove_items_from_meal
    @meal = Meal.find(params[:meal])
    @component = Component.find(params[:component])

    @meal.components.delete(@component)

    head :no_content

  end

  # GET /meal/components.json
  def get_components_for_meal
    @meal = Meal.find(params[:id])

    @list_components = @meal.components

    render json: {:components => @list_components}
  end

  # GET /meal/by_date -d date
  def get_meals_on_date
    @today = params[:date]
    @meals_today = Meal.where('date_and_time_of_meal BETWEEN ? AND ?', @today.beginning_of_day, @today.end_of_day).all

    render json: @meals_today
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
