class Question < ActiveRecord::Base
  has_many(
    :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice
  )

  belongs_to(
    :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    choices = answer_choices
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.id")
      .select("answer_choices.text, COUNT(responses.id) AS num")
      .each_with_object({}) { |choice, obj| obj[choice.text] = choice.num }
  end
end
