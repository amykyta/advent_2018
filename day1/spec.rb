require './day_1'

RSpec.describe Day1 do
  describe "#sum" do
    context 'example 1' do
      let(:frequency_changes) { [+1, +1, +1] }

      it "returns 3" do
        expect(Day1.sum(frequency_changes)).to eq(3)
      end
    end

    context 'example 2' do
      let(:frequency_changes) { [+1, +1, -2] }

      it "returns 0" do
        expect(Day1.sum(frequency_changes)).to eq(0)
      end
    end

    context 'example 3' do
      let(:frequency_changes) { [-1, -2, -3] }

      it "returns -6" do
        expect(Day1.sum(frequency_changes)).to eq(-6)
      end
    end
  end

  describe '#repeated_frequency' do
    context 'example 1' do
      let(:frequency_changes) { [+1, -1] }
      it 'first reaches 0 twice.' do
        expect(Day1.repeated_frequency(frequency_changes)).to eq(0)
      end
    end
    
    context 'example 1' do
      let(:frequency_changes) { [+3, +3, +4, -2, -4] }
      it 'first reaches 10 twice.' do
        expect(Day1.repeated_frequency(frequency_changes)).to eq(10)
      end
    end

    context 'example 1' do
      let(:frequency_changes) { [-6, +3, +8, +5, -6] }
      it 'first reaches 5 twice.' do
        expect(Day1.repeated_frequency(frequency_changes)).to eq(5)
      end
    end

    context 'example 1' do
      let(:frequency_changes) { [+7, +7, -2, -7, -4] }
      it 'first reaches 14 twice.' do
        expect(Day1.repeated_frequency(frequency_changes)).to eq(14)
      end
    end
  end
end
