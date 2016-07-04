class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update]
  def show
  end

  def new
    @student = Profile.new
    @student.personal_datum = PersonalDatum.new
    @student.personal_datum.family_situation = FamilySituation.new
    @relatives = Relative.new
    @student.economic_situation = EconomicSituation.new
    @student.school_situation = SchoolSituation.new
    @student.school_situation.school_week = SchoolWeek.new
  end
  def create
    @student = Profile.new(profile_params)
    @student.user_id = current_user.id
    respond_to do |format|
      if @student.save
        current_user.is_student!
        format.html { redirect_to @student, notice: 'Perfil cargado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @relatives = Relative.new
  end
  def update
    respond_to do |format|
      if @student.update(profile_params)
        format.html { redirect_to @student, notice: 'Perfil actualizado.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(
          economic_situation_attributes:
              [:id, :profile_id, :dwelling, :rent, :situation, :incomes, :vehicles, :_destroy],
          personal_datum_attributes:
              [:id,:profile_id, :name, :lastname, :document, :birthdate, :address, :city, :phone, :cellphone, :_destroy,
                  family_situation_attributes:
                      [:id,:personal_datum_id,:children,:dependents,:minors,:disability,
                        relatives_attributes:
                            [:id,:family_situation_id,:name, :lastname, :document, :relationship, :_destroy]],
                  document_files_attributes:
                      [:id,:personal_datum_id,:file_name,:extension,:document_type]],
          school_situation_attributes:
              [:id, :profile_id, :career, :_destroy,
                  school_week_attributes:
                      [:id,:school_situation_id,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday]])
  end
end
