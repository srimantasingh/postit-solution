require 'rails_helper'

RSpec.describe User  do

=begin
	# always executed irresptive of the usage
	before do
		@user = User.new
		@user.username = "alice"
	end
=end

	# will have mutation issue and test user is created will fail
=begin
	def user 
		User.new
	end
=end
	before(:example) do
		puts "before example"
	end

	after(:example) do
		puts "after example"
	end

	before(:context) do
		puts "before context"
	end

	after(:context) do
		puts "after context"
	end

	#lazy loading and resolves mutation issue
	let(:user) {User.new}

	it 'user is created' do
		#user = User.new
		user.username = "alice"
		expect(user.username).to eq("alice")
		user.username = "john"
		expect(user.username).to eq("john")
	end	
	
end