class Response < ActiveRecord::Base
  validates :answer_id, :user_id, presence: true
  validate :not_duplicate_response

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(answer_id: id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:response] << "Already responded!"
    end
  end
end
