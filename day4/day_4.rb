class Day4
  def self.parse_schedule(schedule_input)
    guard_on_duty = nil
    guard_started_sleeping = nil
    schedule_input.reduce(blank_schedule) do |schedule, line| 
      if /.*#(?<id>\d+)\s+.*/ =~ line
        guard_on_duty = id
      elsif /.*00:(?<fell_asleep_at>\d+)\].*sleep/ =~ line
        guard_started_sleeping = fell_asleep_at.to_i
      elsif /.*00:(?<woke_up_at>\d+)\].*wakes/ =~ line
        (guard_started_sleeping...woke_up_at.to_i).each { |i| schedule[guard_on_duty][i] += 1 }
      else
        raise "what? - #{line}"
      end
      schedule
    end
  end

  def self.sleepiest_guard(parsed_schedule)
    parsed_schedule
      .to_a
      .map { |id, sleep_log| [id, sleep_log, sleep_log.sum] }
      .max { |a, b| a[2] <=> b[2]}
      .yield_self do |id, sleep_log, _|
        [id.to_i, sleep_log.find_index(sleep_log.max)]
      end
  end

  def self.most_sleepy_minute(parsed_schedule)
    parsed_schedule
      .to_a
      .map { |id, sleep_log| [id, sleep_log, sleep_log.max] }
      .max { |a, b| a[2] <=> b[2]}
      .yield_self do |id, sleep_log, sleepiest_minute|
        [id.to_i, sleep_log.find_index(sleepiest_minute)]
      end
  end

  private

  def self.blank_schedule
    Hash.new { |hash, key| hash[key] = Array.new(60, 0) }
  end
end

if __FILE__ == $0
  parsed_schedule = File.open('input', 'r') { |f| Day4.parse_schedule(f.each_line) }

  id, minute = Day4.sleepiest_guard(parsed_schedule)
  puts "Part 1 - Sleepiest guard #{id} at minute #{minute} - result #{id * minute }"


  id, minute = Day4.most_sleepy_minute(parsed_schedule)
  puts "Part 2 - Sleepiest minute is #{minute} for guard ##{id} - result #{id * minute }"
end
