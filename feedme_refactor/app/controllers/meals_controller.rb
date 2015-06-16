class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :is_staff, except: [:get_future_meals_cust, :get_components_for_meal]

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all

    render json: @meals
  end


  # GET /meals/future.json
  def get_future_meals
    
    number_meals_to_get = 100

    if params[:number_of_meals].present?
      number_meals_to_get = params[:number_of_meals]
    end

    @future_meals = Meal.order(date_and_time: :asc).where('date_and_time > ?', DateTime.now).take(number_meals_to_get).to_a


    render json: {:future => @future_meals, :number_of_meals_returned => number_meals_to_get}

  end

  # GET /meals/future.json
  def get_future_meals_cust

    number_meals_to_get = 100

    if params[:number_of_meals].present?
      number_meals_to_get = params[:number_of_meals]
    end

    @future_meals = Meal.order(date_and_time: :asc).where('deadline > ?', DateTime.now).take(number_meals_to_get).to_a


    render json: {:future => @future_meals, :number_of_meals_returned => number_meals_to_get}

  end


  # GET /meals/past.json
  def get_past_meals


    @past_meals = Meal.order(date_and_time: :asc).where('date_and_time <= ?', DateTime.now).to_a

    render json: @past_meals

  end


  # GET /meals
  # GET /meals.json
  def show
    @meal = Meal.find(params[:id])

    render json: @meal
  end

  # POST /meals
  # POST /meals.json
  def create
	
	#possibly put components addition here
    @list_components = Component.find(params[:component_list])
	if !@list_components.empty?
	
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

	@new_meal = Meal.find(@meal.id)

    @list_components.each do | lc |
      @new_meal.components << lc
    end
	end
  end
  
  # PATCH/PUT /meals
  # PATCH/PUT /meals.json
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

  # DELETE /meals
  # DELETE /meals.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end

  # POST /meals/components
  # POST /meals/components.json
  def set_components_for_meal
    @meal = Meal.find(params[:meal])
    @list_components = Component.find(params[:component_list])

    @list_components.each do | lc |
      @meal.components << lc
    end

    @list_components = @meal.components

    render json: {:components => @list_components}

end

  # DELETE /meals/component
  def remove_component_from_meal
    @meal = Meal.find(params[:meal])
    @component = Component.find(params[:component])
    
    if(@meal.deadline > DateTime.now)
      @meal.components.delete(@component)
    end

    @list_components = @meal.components

    render json: {:components => @list_components}

  end

  # GET /meals/components.json
  def get_components_for_meal
    @meal = Meal.find(params[:id])

    @list_components = @meal.components

    render json: {:components => @list_components}
  end

  # GET /meals/date
  def get_meals_on_date
    @today = params[:date]
    @meals_today = Meal.order(date_and_time: :asc).where('date_and_time BETWEEN ? AND ?', @today.beginning_of_day, @today.end_of_day).to_a

    render json: @meals_today
  end

  # GET /meal/past_deadline
  def get_meals_past_deadline
    @meals = Meal.order(date_and_time: :desc).where('deadline <= ?', DateTime.now).to_a

    render json: {:meals => @meals}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
 @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:date_and_time, :deadline)
    end

end
