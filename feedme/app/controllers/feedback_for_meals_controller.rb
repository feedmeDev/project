class FeedbackForMealsController < ApplicationController
  before_action :set_feedback_for_meal, only: [:show, :edit, :update, :destroy]

  # GET /feedback_for_meals
  # GET /feedback_for_meals.json
  def index
    @feedback_for_meals = FeedbackForMeal.all

    render json: @feedback_for_meals
  end

  # GET /feedback_for_meals/1
  # GET /feedback_for_meals/1.json
  def show
    @feedback = FeedbackForMeal.find(params[:id])

    render json: @feedback
  end

  def get_all_for_meal
    @feedback_list = FeedbackForMeal.where("meal_id=?", params[:meal_id]);
  
    render json: @feedback_list
  end

#  # GET /feedback_for_meals/new
#  def new
#    @feedback_for_meal = FeedbackForMeal.new
#  end
#
#  # GET /feedback_for_meals/1/edit
#  def edit
#  end

  # POST /feedback_for_meals
  # POST /feedback_for_meals.json
  def create
    @feedback_for_meal = FeedbackForMeal.new(feedback_for_meal_params)

    respond_to do |format|
      if @feedback_for_meal.save
        format.html { redirect_to @feedback_for_meal, notice: 'Feedback for meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feedback_for_meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback_for_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_for_meal
      @feedback_for_meal = FeedbackForMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_for_meal_params
      params.require(:feedback_for_meal).permit(:meal_id, :person_belongs_to, :body, :date_of_meal)
    end
end
