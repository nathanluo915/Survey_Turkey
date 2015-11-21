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
    redirect "/users/new?#{error}"
  end
end

get '/users/:user_id' do
  @user=User.find(params[:user_id])
  @surveys=@user.surveys
  erb :'users/surveys'
end
