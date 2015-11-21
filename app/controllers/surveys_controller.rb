get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"

end

get '/surveys/new' do
  if logged_in?
    erb :"surveys/new"
  else
    erb :"sessions/new"
  end
end

put '/surveys/:id' do
  question_answers = params.select{|key,value| key.match(/question/)}
  question_answers.each do |question_index, answer_id|
    answer = Answer.find(answer_id)
    current_user.answers << answer
  end
  redirect "/surveys/#{params[:id]}/result"
end


post '/surveys' do
  if logged_in?
    @survey = current_user.surveys.build(title: params[:title], description: params[:description], user: current_user)
    @questions = params.select{|key,value| key.match(/q\d+\z/)}
    @answers = params.select{|key,value| key.match(/q\d+-/)}

    if @survey.save && !any_empty_value?(@questions) && !any_empty_value?(@answers)
      @survey.generate_survey(@questions, @answers)
      redirect "/users/#{current_user.id}"
    elsif Survey.exists?(@survey)
      @survey.destroy
      erb :"surveys/repopulate"
    end

  else
    redirect '/'
  end
end

get '/surveys/:survey_id/result' do
  survey=Survey.find(params[:survey_id])
  @survey_results=survey.compile_survey_result

  if request.xhr?
    erb :"surveys/detail", layout:false
  else
    erb :"surveys/detail"
  end
end

get '/surveys/:id' do
  if logged_in?
    @survey = Survey.find(params[:id])
    if !@survey.already_answered?(current_user.id)
      erb :"surveys/take"
    else
      redirect "/surveys/#{params[:id]}/result"
    end
  else
    erb :"sessions/new"
  end
end

