class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /staff
  # GET /staff.json
  def index_staff
    people = Person.all

    @staff = []

    people.each do | p |
      if p.staff
        @staff.push(p)
      end
    end
    
    render json: @staff
  end

  # GET /students
  # GET /students.json
  def index_students
    people = Person.all

    @students = []

    people.each do | p |
      if !p.staff
        @students.push(p)
      end
    end

    render json: @students
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
  end

  # GET /people/new
#  def new
#    @person = Person.new
#  end

  # GET /people/1/edit
#  def edit
#  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = People.find(params[:id])

    @person.still_active = false

    if @person.save
      format.json { head :no_content }
    else
      format.json { render json: @person.errors, status: :unprocessable_entity }
    end
  end

    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :username, :password, :staff)
    end
end
