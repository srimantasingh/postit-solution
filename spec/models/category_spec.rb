RSpec.describe Category, :type => :model do
	context 'test example setters' do
		it 'test simple creation' do
			category = Category.create!(:name => "Testing")
			binding.pry
			expect(category.reload).not_to eq(nil)
		end
	end

	it 'only allows defined methods to be invoked' do
		post = double("post", setTitle: "title set", getTitle: "tigle get")
		allow(post).to receive(:description).and_return("Got Description")
		expect(post.setTitle).to eq('title set')
	end


end

=begin
db = double("Database Connection", connect: true, disconnect: "Goodbye")

fs = double("File System")
allow(fs).to receive_messages(read: "Romeo and Juliet", write: false)

=end