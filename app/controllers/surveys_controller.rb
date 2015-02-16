class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  # GET /surveys
  # GET /surveys.json
  def index
    @author = Author.find_by_id(session[:author_id])
    @surveys = @author.surveys.order("created_at desc")
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    build_questions
  end

  # GET /surveys/1/edit
  def edit
    build_questions
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html {
          flash[:new]= true
          redirect_to @survey

        }
        format.json { render :show, status: :created, location: @survey }
      else
        format.js { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    redirect_to surveys_path notice: 'Survey was successfully deleted.'
    # respond_to do |format|
    #   format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title, :description, :author_id,
          questions_attributes: [:id, :question_text, :is_required, :description, :question_type, :_destroy,
            options_attributes: [:id, :option_text, :question_id, :_destroy]])
    end

    def build_questions
      if @survey.questions.count < 2
        2.times {@survey.questions.build}
      else
        @survey.questions.build
      end
      2.times {@survey.questions.each { |q| q.options.build }}
    end
end
