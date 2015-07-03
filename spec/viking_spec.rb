require 'viking'

describe Viking do

	describe '#initialize' do

		let(:viking){Viking.new("Random", 75, 20)}

		it 'should create viking with given name' do
			expect(Viking.new("Olaf").name).to eq("Olaf")
		end

		it 'should pass health attribute' do
			expect(viking.health).to eq(75)
		end

		it 'weapons should be nil' do
			expect(viking.weapon).to be_nil
		end

		it 'health cannot be overwritten after it has been set' do
			viking.instance_variable_set(:@health, 100)
			expect(viking.health).to be <= 75
		end

	end

end