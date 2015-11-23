get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user=User.new(params)
  if user.save
    session[:user_id]=user.id
    redirect '/'
  else
    error=user.errors.full_messages
    redirect "/users/error?error=#{error}"
  end
end

get '/users/error' do
  @error=params[:error]
  erb :"users/error"
end

get '/users/:id' do
  @user=User.find(params[:id])
  @surveys=@user.surveys.order(created_at: :desc)
  erb :'users/surveys'
end
