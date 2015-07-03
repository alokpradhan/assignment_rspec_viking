require 'viking'
require_relative '../lib/weapons/axe.rb'
require_relative '../lib/weapons/weapon.rb'

describe Viking do

	let(:viking){Viking.new("Random", 75, 20)}
	let(:axe){Axe.new}
	let(:bow){Bow.new}

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
			#knife = double("Axe", :superclass => Weapon)
			viking.pick_up_weapon(axe)
			expect(viking.weapon).to eq(axe)
		end

		it "should raise exception when picking up non-weapon" do
			knife = instance_double("Axe", :=== => Weapon)   #double doesn't mimic the actual class
			expect{viking.pick_up_weapon(knife)}.to raise_error("Can't pick up that thing")
		end

		it "should replace existing weapon with new weapon" do
			viking.pick_up_weapon(axe)
			expect(viking.weapon.name).to eq("Axe")
			viking.pick_up_weapon(bow)
			expect(viking.weapon).to be_a(Bow)
		end

		describe '#drop_weapon' do
			specify 'weapon should be nil' do
				viking.pick_up_weapon(axe)
				viking.drop_weapon
				expect(viking.weapon).to be_nil
			end
		end

		describe '#receive_attack' do
			it 'reduces vikings health by specified amount' do
			end

			it "causes health of attacked viking to drop"
			it "causes attacked viking to call #take_damage"
			specify "attacking with no weapon to run #damage_with_fists"
			specify "attacking with weapon to run #damage_with_weapon"
			specify "attacking with weapon deals damage equal to Viking's strength * Weapon's multiplier"
			specify "attacking with Bow without arrows uses Fists instead"

		end
	end

end