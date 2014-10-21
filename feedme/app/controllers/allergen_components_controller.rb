class AllergenComponentsController < ApplicationController
  before_action :set_allergen_component, only: [:show, :edit, :update, :destroy]

  # GET /allergen_components
  # GET /allergen_components.json
  def index
    @allergen_components = AllergenComponent.all
  end

  # GET /allergen_components/1
  # GET /allergen_components/1.json
  def show
  end

  # GET /allergen_components/new
  def new
    @allergen_component = AllergenComponent.new
  end

  # GET /allergen_components/1/edit
  def edit
  end

  # POST /allergen_components
  # POST /allergen_components.json
  def create
    @allergen_component = AllergenComponent.new(allergen_component_params)

    respond_to do |format|
      if @allergen_component.save
        format.html { redirect_to @allergen_component, notice: 'Allergen component was successfully created.' }
        format.json { render action: 'show', status: :created, location: @allergen_component }
      else
        format.html { render action: 'new' }
        format.json { render json: @allergen_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergen_components/1
  # PATCH/PUT /allergen_components/1.json
  def update
    respond_to do |format|
      if @allergen_component.update(allergen_component_params)
        format.html { redirect_to @allergen_component, notice: 'Allergen component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @allergen_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergen_components/1
  # DELETE /allergen_components/1.json
  def destroy
    @allergen_component.destroy
    respond_to do |format|
      format.html { redirect_to allergen_components_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergen_component
      @allergen_component = AllergenComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergen_component_params
      params.require(:allergen_component).permit(:allergen_warning_id, :component_id)
    end
end
