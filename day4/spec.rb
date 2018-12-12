require './day_4'

RSpec.describe Day4 do
  subject { described_class.new(claims, 8) }

  let(:sample_schedule) {
    <<-SCHEDULE
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
    SCHEDULE
  }

  let(:parsed_schedule) { Day4.parse_schedule(sample_schedule.split("\n")) }

  describe '.parse_schedule' do
    it 'creates a map of guards to their sleep schedules' do
      expect(parsed_schedule).to include('10', '99') 
      expect(parsed_schedule['10']).to eq '000001111111111111111111211110111111111111111111111111100000'.split('').map(&:to_i)
    end
  end

  describe 'sleepiest_guard' do
    it 'returns the sleepiest guard and the minute he sleeps most often' do
      expect(Day4.sleepiest_guard(parsed_schedule)).to eq [10, 24]
    end
  end

  describe 'sleepiest_minute' do
    it 'returns the guard and the most consistently sleepy minute' do 
      expect(Day4.most_sleepy_minute(parsed_schedule)).to eq [99, 45]
    end
  end
end

