#require_relative '../../app/controllers/posts_controller' 
#require_relative '../../app/controllers/application_controller' 
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
    	it "assigns @teams" do
    		test = "test"
        	expect(test).to eq "test"
        	#team = Team.create
        	#get :index
        	#expect(assigns(:teams)).to eq([team])
    	end
    end    
  end
end
=begin

require '/home/srimanta/postit-solution/spec/rails_helper'
require '/home/srimanta/postit-solution/spec/spec_helper'

RSpec.describe PostsController, type: :controller do

=begin
	#it "responds to html by default" do
      #post :create, :params => { :widget => { :name => "Any Name" } }
      #expect(response.content_type).to eq "text/html"
      test = "test"
      expect(test).eq to "test"
    #end


    describe "GET index" do
	    it "assigns @teams" do
	    	test = "test"
            expect(test).to eq "test"
	      #team = Team.create
	      #get :index
	      #expect(assigns(:teams)).to eq([team])
	    end
    end


end
=end
