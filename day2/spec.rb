require './day_2'

RSpec.describe Day2 do
  describe "#checksum" do
    let(:box_ids) do
      ['abcdef', 
       'bababc',
       'abbcde',
       'abcccd',
       'aabcdd',
       'abcdee',
       'ababab']
    end

    it 'returns 12' do
      expect(Day2.checksum(box_ids)).to eq(12)
    end
  end

  describe '#matching_boxes' do
    let(:box_ids) do
      ['abcde', 
       'fghij',
       'klmno',
       'pqrst',
       'fguij',
       'axcye',
       'wvxyz']
    end

    it 'returns fgij' do
      expect(Day2.matching_boxes(box_ids)).to eq('fgij')
    end
  end
end
