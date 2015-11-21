post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @errors = []

  params.each do |key, value|
    if key.match(/\d+/)
      answer = @question.answers.build(content: value, question: @question);
      if !answer.save
        @errors << answer.errors.full_messages
      end
    end
  end

  if request.xhr?
    erb :"surveys/answer_content_partial", layout: false
  else
    redirect "/surveys/#{@question.survey.id}/questions/new"
  end
end


get '/questions/new' do
  if request.xhr?
    erb :"surveys/question_answer_inbox_partial", layout: false
  end
end
