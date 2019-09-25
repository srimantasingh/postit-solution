require "rails_helper"

RSpec.describe Post, :type => :model do

  context "with 2 or more comments" do

  	let(:user){
  	  User.new(:username => "test1", :password => "test1")
  	}

  	subject {described_class.new}
  	

    it "orders them in reverse chronologically" do
      subject.title = "first comment"
      subject.url = "first comment"
      subject.description = "first comment"
      subject.user = user
      expect(subject).to be_valid
      #comment1 = post.comments.create!(:body => "first comment")
      #comment2 = post.comments.create!(:body => "second comment")
      #expect(post.reload.comments).to eq([comment2, comment1])
    end
  end
end