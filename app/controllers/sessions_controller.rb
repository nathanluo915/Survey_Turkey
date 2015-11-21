get '/sessions/new' do
  erb :'sessions/new', layout: !request.xhr?
end

post '/sessions' do
  user=User.find_by(username:params[:username])
  if user && user.password==params[:password]
    session[:user_id] = user.id
    redirect "/surveys"
  else
    error="Wrong_username_password_combination"
    redirect "/sessions/new?#{error}"
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/surveys'
end

