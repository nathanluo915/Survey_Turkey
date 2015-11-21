class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions

  validates :title, presence: true
  validates :title, length:{in: 1..100}

  def already_answered?
    answer_id_arr=self.questions[0].answers.pluck(:id)
    user=User.find(session[:id])
    user.answers.exist?(answer_id: answer_id_arr)
  end

  def compile_survey_result
    survey_result={}
    self.questions.each{|question| survey_result[question.content]=compile_question_result(question)}
    survey_result
  end

  def compile_question_result(question)
    question_results={}
    question.answers.each{|answer| question_results[answer.content]=answer.voters.count}
    question_results
  end


  def generate_survey(questions, answers)
    errors = []

    questions.each do |index, content|

      q = Question.new(content: content, survey: self)
      answers_for_q = answers.select{|key,value| key.match("#{index}-")}

      answers_for_q.each do |answer_index, answer|

        a = Answer.new(content: answer, question: q)
        errors << a.errors.full_messages

      end

    end

  end

end
