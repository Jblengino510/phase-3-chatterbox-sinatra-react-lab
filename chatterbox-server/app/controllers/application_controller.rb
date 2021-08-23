class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    edited_message = Message.find(params[:id])
    edited_message.update(
      body: params[:body],
      username: params[:username]
    )
    edited_message.to_json
  end

  delete '/messages/:id' do
    deleted_message = Message.find(params[:id])
    deleted_message.destroy
    deleted_message.to_json
  end
end
