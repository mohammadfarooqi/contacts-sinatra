require 'sinatra'
require_relative 'contact'

get '/' do
	redirect "/contacts"
end

get '/contacts' do
	@contacts = Contact.all
	erb :index
end

get '/contacts/new' do
	erb :new
end

post '/contacts' do
	@contact = Contact.new(params["first_name"], params["last_name"])
	@contact.save
	redirect "/contacts"
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id].to_i)
	erb :show
end

get 'contacts/:id/edit' do
	@contact = Contact.find(params[:id].to_i)
	erb :edit
end

patch '/contacts/:id' do
	@contact = Contact.find(param[:id].to_i)
	@contact.first_name = params["first_name"]
	@contact.last_name = params["last_name"]
	redirect "/contacts"
end

delete '/contacts/:id' do
	@contact = Contact.find(params[:id].to_i)
	@contact.destroy
	redirect "/contacts"
end
