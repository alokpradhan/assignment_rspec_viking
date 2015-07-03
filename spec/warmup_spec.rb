require 'warmup'
#require 'pry'

describe Warmup do
	let(:a){Warmup.new}
	describe '#gets_shout' do

		it 'accepts an input through gets' do

			#stub gets with lowercase
			#expect an upcase return
			allow(a).to receive(:gets).and_return("hello")
			expect(a.gets_shout).to eq("HELLO")

		end

	end

	describe '#double_size' do

		it 'calls size method on argument' do
			array2 = double("d", :size => 2)
			expect(array2).to receive(:size).and_return(2)
#			binding.pry
			a.double_size(array2)
		end

		it 'returns double the size of the array given' do
			array2 = double("d", :size => 2)
			expect(a.double_size(array2)).to eq(array2.size*2)
		end

	end

	describe '#calls_some_methods' do
		let(:string2){double("a", :upcase! => "Hi", :reverse! => "Hello")}

		it "receives upcase call" do
			expect(string2).to receive(:upcase!)
			a.calls_some_methods(string2)
		end

		it 'receives reverse call' do
			expect(string2).to receive(:reverse!)
			a.calls_some_methods(string2)
		end

		it 'returns a different string altogether for reverse!' do
			expect(string2).to receive(:reverse!).and_return("hahahaha this is a terrible method")
			a.calls_some_methods(string2)
			expect(string2).to receive(:upcase!).and_return("hahahaha this is a terrible method")
			a.calls_some_methods(string2)
			#how do we combine lines 51 and 49?
		end

	end
end