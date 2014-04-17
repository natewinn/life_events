class DefineEvents < ActiveRecord::Migration
  def change
	  create_table :events do |t|
	    t.string   "life_event"
	    t.string   "event_location"
	    t.datetime "event_date"
	    t.timestamps
	  end

	  create_table :schools do |t|	  
	    t.string  "name_of_school"
	    t.string  "location_of_school"
	    t.integer "number_of_years"
	    t.timestamps
	  end  
	end
end
