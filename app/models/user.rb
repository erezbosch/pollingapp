class User < ActiveRecord::Base
  has_many(
    :authored_polls,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :Poll
  )

  has_many(
    :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Response
  )

  def completed_polls
    Poll.all
      .joins(:questions)
      .joins("LEFT OUTER JOIN
         responses ON responses.user_id = #{id} AND responses.answer_choice_id IN (
           SELECT
             answer_choices.id
           FROM
             answer_choices
           WHERE
             answer_choices.question_id = questions.id
      )")
      .group("polls.id")
      .having("COUNT(responses.id) = COUNT(questions.id)")
      .select("polls.*")
  end

  def incomplete_polls
    Poll.all
      .joins(:questions)
      .joins("LEFT OUTER JOIN
         responses ON responses.user_id = #{id} AND responses.answer_choice_id IN (
           SELECT
             answer_choices.id
           FROM
             answer_choices
           WHERE
             answer_choices.question_id = questions.id
      )")
      .group("polls.id")
      .having("COUNT(responses.id) != COUNT(questions.id) AND COUNT(responses.id) != 0")
      .select("polls.*")
  end
end
