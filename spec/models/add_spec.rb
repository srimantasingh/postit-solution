require 'rails_helper'

RSpec.describe Addition do
	context 'test addition' do
		it 'test addition should pass' do
			addition = described_class.new(2,3)
			expect(addition.sum).to eq(5)
		end
	
		it 'test addition with double' do
			addition = double(described_class, sum: 0)
			#expect(addition.num1).to eq(0)
			expect(addition.sum).to eq(5)
		end
	end

end