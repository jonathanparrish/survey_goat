class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions, dependent: :destroy
  has_many :responses, through: :questions
  has_many :options, through: :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions,
       :allow_destroy => true,
       :reject_if     => proc { |a| a['question_text'].blank? &&
         a['question_type'].blank? && a['description'].blank? }

  def complete?
    return false if questions.blank?
    return questions.all? do |q|
      q.question_type != "Choice" || q.options.length > 0
    end
  end
end
