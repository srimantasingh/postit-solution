require 'rails_helper'

RSpec.describe Vote do
	context 'test instance initilization' do
		subject(:vote) {Vote.new}
		it 'instance should be created' do
			expect(vote).to be_a_new(Vote)
		end
	end
end