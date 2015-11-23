get '/questions/new' do
  if request.xhr?
    erb :"surveys/_question_answer_box", layout: false
  end
end
