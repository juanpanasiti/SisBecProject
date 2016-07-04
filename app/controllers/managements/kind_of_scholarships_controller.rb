class Managements::KindOfScholarshipsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :set_kind_of_scholarship, only: [:show, :edit, :update, :destroy]
  before_action :set_kind_of_scholarships
  layout "management"
  # GET /kind_of_scholarships
  # GET /kind_of_scholarships.json
  def index
    @kind_of_scholarships = KindOfScholarship.all
  end

  # GET /kind_of_scholarships/1
  # GET /kind_of_scholarships/1.json
  def show
  end

  # GET /kind_of_scholarships/new
  def new
    @kind_of_scholarship = KindOfScholarship.new
    @s_btn = 'Crear'
  end

  # GET /kind_of_scholarships/1/edit
  def edit
  end

  # POST /kind_of_scholarships
  # POST /kind_of_scholarships.json
  def create
    @kind_of_scholarship = KindOfScholarship.new(kind_of_scholarship_params)
    @s_btn = 'Crear'

    respond_to do |format|
      if @kind_of_scholarship.save
        format.html { redirect_to managements_path, notice: 'Kind of scholarship was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /kind_of_scholarships/1
  # PATCH/PUT /kind_of_scholarships/1.json
  def update
    respond_to do |format|
      if @kind_of_scholarship.update(kind_of_scholarship_params)
        format.html { redirect_to managements_path, notice: 'Kind of scholarship was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind_of_scholarship }
      else
        format.html { render :edit }
        format.json { render json: @kind_of_scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kind_of_scholarships/1
  # DELETE /kind_of_scholarships/1.json
  def destroy
    @kind_of_scholarship.destroy
    respond_to do |format|
      format.html { redirect_to managements_path, notice: 'Kind of scholarship was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind_of_scholarship
      @kind_of_scholarship = KindOfScholarship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kind_of_scholarship_params
      params.require(:kind_of_scholarship).permit(:name, :description, :short_description, :state, :starting_date, :ending_date, :cover)
    end
end
