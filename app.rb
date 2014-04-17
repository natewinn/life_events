require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///events_data.db"

# -------------------------------------->

## Homepage ##
get "/" do
	erb :"/index"
end

# -------------------------------------->

## List All Items // School ##
get "/schools" do
	@schools_attended = School.all
	erb :"/schools/index"
end

## List All Items // Life Event ##
get "/life_events" do
	@events_experienced = Event.all
	erb :"/life_events/index"
end

# -------------------------------------->

## View Individual Records // School ##
get "/schools/:id" do 
	@attended = School.find(params[:id])
	erb :"schools/show"
end

## View Individual Records // Life Event ##
get "/life_events/:id" do 
	@experienced = Event.find(params[:id])
	erb :"life_events/show"
end

# -------------------------------------->

## Add New Records // School ##
post "/schools" do
	puts params[:school]
	school = School.new(params[:school])
	if school.save
		redirect "/schools"
	end
end	

## Add New Records // Life Events ##
post "/life_events" do
	puts params[:event]
	event = Event.new(params[:event])
	if event.save
		redirect "/life_events"
	end
end	

# -------------------------------------->

## Delete Existing Record // School ##
delete '/schools/:id' do
	@attended = School.find(params[:id])
	@attended.destroy
	redirect '/schools'
end

## Delete Existing Record // Life Events ##
delete '/life_events/:id' do
	@experienced = Event.find(params[:id])
	@experienced.destroy
	redirect '/life_events'
end

# -------------------------------------->

## Update Exisiting Record // School ##
put "/schools/:id" do
	@attended = School.find(params[:id])
	@attended.update_attributes(params[:school])
		redirect "/schools/#{@attended.id}"
end

## Update Exisiting Record // Life Events ##
put "/life_events/:id" do
	@experienced = Event.find(params[:id])
	@experienced.update_attributes(params[:event])
		redirect "/life_events/#{@experienced.id}"
end

# -------------------------------------->

class School < ActiveRecord::Base
end

class Event < ActiveRecord::Base
end
