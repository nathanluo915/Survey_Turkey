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

post '/surveys' do
  if logged_in?
    survey = current_user.surveys.build(title: params[:title], description: params[:description], user: current_user)
    questions = params.select{|key,value| key.match(/q\d+\z/)}
    answers = params.select{|key,value| key.match(/q\d+-/)}
    if survey.save
      survey.generate_survey(questions, answers)
      redirect "/users/#{current_user.id}"
    else

    end
  else
    redirect '/'
  end
end

get '/surveys/:survey_id/result' do
  survey=Survey.find(params[:survey_id])
  @survey_results=survey.compile_survey_result
  erb :"surveys/detail", layout:false
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/take'
end
