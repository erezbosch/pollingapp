class Response < ActiveRecord::Base

  validate :respondent_has_not_already_answered_question

  validate :cannot_answer_own_poll

  belongs_to(
    :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice
  )

  belongs_to(
    :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  has_one(
    :poll,
    through: :question,
    source: :poll
  )

  def sibling_responses
    self.question.responses.where("responses.id != ? OR ? IS NULL", id, id)
  end

  def respondent_has_not_already_answered_question
    if sibling_responses.pluck(:user_id).include?(user_id)
      errors[:respondent] << "You have already answered this question!"
    end
  end

  def cannot_answer_own_poll
    result = Poll
      .joins(questions: {answer_choices: :responses})
      .where("polls.author_id = ?", self.user_id)
      .where("responses.answer_choice_id = ?", self.answer_choice_id)
      .count
    if result != 0
      errors[:respondent] << "You can't answer your own poll's question!"
    end
  end
end
