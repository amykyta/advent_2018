require './day_5'

RSpec.describe Day5 do
  subject { described_class.new(claims, 8) }

  describe ".annihilate" do
    it 'example 1' do
      expect(described_class.annihilate('dabAcCaCBAcCcaDA'))
        .to eq 'dabCBAcaDA'
    end
  end
end
