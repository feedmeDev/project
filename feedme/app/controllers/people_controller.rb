class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  #needs username and password
  #retuerns a user
  # POST /staff/login
  # POST /staff/login.json
  def login_staff

    @person = Person.find_by(username: params[:username], staff: true, still_active: true).try(:authenticate, params[:password])

    if(@person != false)
      render json: @person
    else
      render :text => "not_found", :status => 401
    end

end

  #needs username and password
  #returns a user
  # POST /student/login
  # POST /student/login.json
  def login_student

    @person = Person.find_by(username: params[:username], staff: false, still_active: true).try(:authenticate, params[:password])


    render json: @person
=begin
    if @person.still_active
      render json: @person
    else
      render json: nil
    end
=end

  end


  # GET people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /staff
  # GET /staff.json
  def index_staff

    @staff = Person.where(staff: true)
        
    render json: @staff

  end

  # GET /students
  # GET /students.json
  def index_students

    @students = Person.where(staff: false)

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

  def create_staff
    @person = Person.new(person_params)
    @person.staff = true
    @person.still_active = true

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

  # POST /student
  # POST /student.json
  def create_student
    @person = Person.new(person_params)
    @person.staff = false
    @person.still_active = true

    respond_to do |format|
      if @person.save
        format.json { render action: 'show', status: :created, location: @person }
      else
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
    @person = Person.find(params[:id])

    @person.update_attribute(:still_active , false)

    render json: @person
=begin
    @person.still_active = false

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully deactivated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

=end

  end

  #  /people/1
  # PUT /people/1.json
  def reactivate

    @person = Person.find(params[:id])

    @person.update_attribute(:still_active , true)

    render json: @person

=begin
    @person = Person.find(params[:id])

    @person.still_active = true

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully deactivated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
=end
  end
   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :username, :password, :password_confirmation)
    end
end
