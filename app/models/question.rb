class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def bad_results
    response_counts = Hash.new
    answer_choices.each do |answer|
      response_counts[answer.text] = answer.responses.count
    end
    response_counts
  end

  def good_results
    answer_choices = self.answer_choices.includes(:responses)
    response_counts = {}
    answer_choices.each do |answer|
      response_counts[answer.text] = answer.responses.length
    end
    response_counts
  end

  def better_results

    # answers = Question.find_by_sql([<<-SQL, self.id])
    #   SELECT
    #     answer_choices.text, COUNT(responses.id) AS num_of_responses
    #   FROM
    #     questions
    #   JOIN
    #     answer_choices ON questions.id = answer_choices.question_id
    #   LEFT OUTER JOIN
    #     responses ON answer_choices.id = responses.answer_id
    #   WHERE
    #     questions.id = ?
    #   GROUP BY
    #     answer_choices.text
    # SQL

    answer_choices
      .select("answer_choices.text")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_id")
      .count("responses.id")
      .group("answer_choices.text")

  end


# ---- AR ----
# code you type
# answer_choices
#
#
# ----- SQL -----
#
# Select COUNT(...)
# From answer_choices
# where ..
# Joins ...




end
