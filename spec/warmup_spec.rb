require 'warmup'

describe Warmup do
	let(:a){Warmup.new}
	describe '#gets_shout' do

		it 'accepts an input through gets' do
			expect(a).to receive(:gets).and_return("HELLO")
			a.gets_shout
		end

	end

	describe '#double_size' do

	end

	describe '#calls_some_methods' do

	end
end