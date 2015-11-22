get '/search' do
  if params[:username].length >= 4
    @users = User.search(params[:username])
  elsif params[:survey].length >= 4
    @surveys = Survey.search(params[:survey])
  end
  erb :"search/result"
end

