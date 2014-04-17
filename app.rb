require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///events_data.db"

## LIST ##
get "/schools" do
	@schools_attended = School.all
	erb :"/schools/index"
end

## VIEW ##
get "/schools/:id" do 
	@attended = School.find(params[:id])
	erb :"schools/show"
end

## ADD ##
post "/schools" do
	puts params[:school]
	school = School.new(params[:school])
	if school.save
		redirect "/schools"
	end
end	

## EDIT ##
delete '/schools/:id' do
	@attended = School.find(params[:id])
	@attended.destroy
	redirect '/schools'
end

class School < ActiveRecord::Base
end






# get "/schools/:id/edit" do
# 	@attended = School.find(params[:id])
# 	school/edit
# end