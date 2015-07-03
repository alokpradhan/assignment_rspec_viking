# Your code here
=begin
test weapon class first
subclasses of weapon: bow, axe
viking
=end

require_relative '../lib/weapons/bow.rb'

describe Bow do

  let(:bow){Bow.new}

  describe "#initialize" do
    specify "arrow count default as 10" do
      expect(bow.arrows).to eq(10)
    end

    specify "arrows as readable" do
      expect(bow.arrows).to be_a(Integer)
    end

    it "starts with the number of arrows as specified" do
      expect(Bow.new(5).arrows).to eq(5)
    end
  end

  describe "#use" do
    it 'reduces arrow count by 1' do
      # expectations = bow.arrows
      # result = bow.arrows - 1
      bow.use
      expect(bow.arrows).to eq(9)
    end

    it 'raises error when out_of_arrows' do
      bow2 = Bow.new(0)
      expect{bow2.use}.to raise_error("Out of arrows")
    end
  end
end