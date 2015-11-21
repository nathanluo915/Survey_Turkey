get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"

end

get '/surveys/new' do
  erb :"surveys/new"
end

post '/surveys' do
  if logged_in?
    survey = current_user.surveys.build(title: params[:title], description: params[:description], user: current_user)
    questions = params.select{|key,value| key.match(/q\d+\z/)}
    if survey.save
      questions.each do |index, content|
        q = Question.new(content: content, survey: survey);

        if q.save
          answers = params.select{|key,value| key.match("#{index}-")}
          binding.pry
          answers.each do |answer_index, answer|
            a = Answer.new(content: answer, question: q)
            if !a.save
              @errors << a.errors.full_messages
            end
          end
        else
          @errors <<q.errors.full_messages

        end
      end

      redirect "/surveys/#{survey.id}"
    else
      @errors = survey.errors.full_messages
      erb :"surveys/new"
    end
  else
    redirect '/'
  end
end

get '/surveys/:survey_id' do
  survey=Survey.find(params[:survey_id])
  @survey_results=survey.compile_survey_result
  erb :"surveys/detail", layout:false
end
