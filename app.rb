require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///events_data.db"

# Landing Page Route ------------------------->

get "/" do
	erb :"/index"
end

# List All Records Route --------------------->

get "/schools" do
	@schools = School.all
	erb :"/schools/index"
end

get "/life_events" do
	@events = Event.all
	erb :"/life_events/index"
end

# New Record Form Route ---------------------->

get "/schools/new" do
   erb :"schools/new"
end

get "/life_events/new" do
   erb :"life_events/new"
end

# Add New Records Route ---------------------->

post "/schools" do
	school = School.new(params[:school])
	if school.save
		redirect "/schools"
	end
end

post "/life_events" do
	event = Event.new(params[:event])
	if event.save
		redirect "/life_events"
	end
end	

# View Individual Record Route -------------->

get "/schools/:id" do 
	@school = School.find(params[:id])
	erb :"schools/show"
end

get "/life_events/:id" do 
	@event = Event.find(params[:id])
	erb :"life_events/show"
end

# Edit Individual Record Form Route --------->

get "/schools/:id/edit" do
	@school = School.find(params[:id])
	erb :"schools/edit"
end	

get "/life_events/:id/edit" do
	@event = Event.find(params[:id])
	erb :"life_events/edit"
end	

# Update Individual Record Route ------------->

put "/schools/:id" do
	@school = School.find(params[:id])
	if @school.update_attributes(params[:school])
		redirect "/schools/#{@school.id}"
	end
end

put "/life_events/:id" do
	@event = Event.find(params[:id])
	if @event.update_attributes(params[:event])
		redirect "/life_events/#{@event.id}"
	end
end

# Delete Individual Records Route ------------>

delete '/schools/:id' do
	@school = School.find(params[:id])
	@school.destroy
	redirect '/schools'
end

delete '/life_events/:id' do
	@event = Event.find(params[:id])
	@event.destroy
	redirect '/life_events'
end

# -------------------------------------------->

class School < ActiveRecord::Base
end

class Event < ActiveRecord::Base
end
