class Submission < ActiveRecord::Base
  has_many :responses

  accepts_nested_attributes_for :responses,
      :allow_destroy => true,
      :reject_if     => :all_blank

  def self.new_for_survey(survey_id)
    submission = self.new
    survey = Survey.find(survey_id)
    survey.questions.each do |q|
      submission.responses.build(question: q)
    end
    submission
  end
end
