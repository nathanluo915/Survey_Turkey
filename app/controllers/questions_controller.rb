get '/questions/new' do
  if request.xhr?
    erb :"surveys/question_answer_inbox_partial", layout: false
  end
end
