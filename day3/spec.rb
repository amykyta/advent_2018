require './day_3'

RSpec.describe Day3 do
  let(:claims) { ['#1 @ 1,3: 4x4', '#2 @ 3,1: 4x4', '#3 @ 5,5: 2x2' ] }

  describe '.parse_claim' do
    it 'creates a claim instance' do
      described_class.parse_claim(claims[1]).tap do |id, parsed_claim|
        expect(parsed_claim[:coordinates]).to eq [3, 1]
        expect(parsed_claim[:size]).to eq [4, 4]
      end
    end
  end

  describe '.generate_claim_map' do
    it 'correctly tags squares from claims' do
      parsed_claims = described_class.parse_claims(claims)
      expect(described_class.generate_claim_map(parsed_claims, 8)).to eq(
        [[0,0,0,0,0,0,0,0],
         [0,0,0,1,1,1,1,0],
         [0,0,0,1,1,1,1,0],
         [0,1,1,2,2,1,1,0],
         [0,1,1,2,2,1,1,0],
         [0,1,1,1,1,1,1,0],
         [0,1,1,1,1,1,1,0],
         [0,0,0,0,0,0,0,0]])
    end
  end

  describe '.unique_claim' do
    it 'returns the id of the claim that doesnt overlap' do
      parsed_claims = described_class.parse_claims(claims)
      expect(described_class.unique_claim(parsed_claims)).to eq 3
    end
  end
end
