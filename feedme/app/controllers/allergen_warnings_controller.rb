class AllergenWarningsController < ApplicationController
  before_action :set_allergen_warning, only: [:show, :edit, :update, :destroy]

  # GET /allergen_warnings
  # GET /allergen_warnings.json
  def index
    @allergen_warnings = AllergenWarning.all
  end

  # GET /allergen_warnings/1
  # GET /allergen_warnings/1.json
  def show
  end

  # GET /allergen_warnings/new
  def new
    @allergen_warning = AllergenWarning.new
  end

  # GET /allergen_warnings/1/edit
  def edit
  end

  # POST /allergen_warnings
  # POST /allergen_warnings.json
  def create
    @allergen_warning = AllergenWarning.new(allergen_warning_params)

    respond_to do |format|
      if @allergen_warning.save
        format.html { redirect_to @allergen_warning, notice: 'Allergen warning was successfully created.' }
        format.json { render action: 'show', status: :created, location: @allergen_warning }
      else
        format.html { render action: 'new' }
        format.json { render json: @allergen_warning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergen_warnings/1
  # PATCH/PUT /allergen_warnings/1.json
  def update
    respond_to do |format|
      if @allergen_warning.update(allergen_warning_params)
        format.html { redirect_to @allergen_warning, notice: 'Allergen warning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @allergen_warning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergen_warnings/1
  # DELETE /allergen_warnings/1.json
  def destroy
    @allergen_warning.destroy
    respond_to do |format|
      format.html { redirect_to allergen_warnings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergen_warning
      @allergen_warning = AllergenWarning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergen_warning_params
      params.require(:allergen_warning).permit(:warning_content)
    end
end
