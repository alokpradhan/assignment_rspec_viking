require 'viking'
require_relative '../lib/weapons/axe.rb'
require_relative '../lib/weapons/weapon.rb'

describe Viking do

	let(:viking){Viking.new("Random", 75)}
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

	context "attack and receive attacks" do

		let(:victim){Viking.new("Victor")}

			describe '#receive_attack' do
				it 'reduces vikings health by specified amount' do
					viking.receive_attack(10)
					expect(viking.health).to eq(65)
				end

				it "causes health of attacked viking to drop" do
					old_health = viking.health
					viking.receive_attack(10)
					expect(viking.health).to be < old_health
				end

				it "causes attacked viking to call #take_damage" do
					expect(viking).to receive(:take_damage)
					viking.receive_attack(5)
				end
			end

			describe '#attack' do

				specify "attacking with no weapon to run #damage_with_fists" do
					allow(viking).to receive(:damage_with_fists).and_return(5)
					expect(viking).to receive(:damage_with_fists)
					viking.attack(victim)
				end

				specify "attacking with weapon to run #damage_with_weapon" do
					allow(viking).to receive(:damage_with_weapon).and_return(10)
					viking.pick_up_weapon(axe)
					expect(viking).to receive(:damage_with_weapon)
					viking.attack(victim)
				end

				specify "attacking with weapon deals damage equal to Viking's strength * Weapon's multiplier" do
					viking.pick_up_weapon(axe)
					init_health = victim.health
					viking.attack(victim)
					health_after = victim.health
					damage = viking.weapon.use * viking.strength
					expect(init_health - health_after).to eq(damage)
				end

				specify "attacking with Bow without arrows uses Fists instead" do
					bow = instance_double("Bow", :arrows => 0, :is_a? => true)
					viking.pick_up_weapon(bow)
					allow(viking).to receive(:damage_with_fists).and_return(1)
					expect(viking).to receive(:damage_with_fists)
					viking.attack(victim)
				end

				specify "killing a viking raises an error" do
					expect{viking.receive_attack(75)}.to raise_error
				end
			end
		end
	end
end