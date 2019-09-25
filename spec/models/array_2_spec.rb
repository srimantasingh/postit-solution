require 'rails_helper'

RSpec.describe Array do
	subject :sally do
		["a","b"]
	end

	it 'subject has length of 2' do
		expect(subject.length).to eq(2)
		subject.pop
		expect(subject.length).to eq(1)
	end

	it 'sally is still of length 2' do
		expect(sally.length).to eq(2)
	end
end