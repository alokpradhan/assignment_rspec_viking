require 'viking'
require_relative '../lib/weapons/axe.rb'
require_relative '../lib/weapons/weapon.rb'

describe Viking do

	let(:viking){Viking.new("Random", 75, 20)}

	describe '#initialize' do

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
			#viking.instance_variable_set(:@health, 100)

			expect{viking.health=100}.to raise_error
		end

	end

	describe '#pick_up_weapon' do

		it "should set weapon for viking" do
			knife = Axe.new
			#knife = double("Axe", :superclass => Weapon)
			viking.pick_up_weapon(knife)
			expect(viking.weapon).to eq(knife)

		end

		it "should raise exception when picking up non-weapon"

		it "should replace existing weapon with new weapon"

	end

end