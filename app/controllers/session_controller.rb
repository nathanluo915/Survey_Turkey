get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user=User.find_by(username:params[:username])
  if user && user.password==params[:password]
    session[:id]=user.id
    redirect "/"
  else
    error="Wrong_username_password_combination"
    redirect "/sessions/new?#{error}"
  end
end
