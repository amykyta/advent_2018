class Day3
  attr_reader :claims, :fabric

  def self.parse_claims(claims_array)
    claims_array
      .map { |c| self.parse_claim(c) }
  end

  def self.process_claims(parsed_claims, size)
    parsed_claims
      .reduce(self.blank_fabric(size)) do |fabric, claim|
        id, claim_info = claim
        left, top = claim_info[:coordinates]
        wide, tall = claim_info[:size]

        (top...top + tall).to_a
          .product((left...left + wide).to_a)
          .each do |y, x|
            key, count = fabric[y][x]
            fabric[y][x] = [key || id, count +=1]
          end
        fabric
      end
  end

  def self.unique_claim(claims, size = 1000)
    uncontested_squares = self.process_claims(claims, size).flatten!(1)
      .keep_if { |square | square[1] == 1 }

    unique_id, _ = claims.find do |id, claim|
      wide, tall = claim[:size]
      size = wide * tall
      uncontested_squares.count { |x| x[0] == id } == size
    end
    unique_id
  end

  def self.parse_claim(text_claim)
    id, coordinates, size = /^#(?<id>\d+)\s+@\s+(?<coordinates>\d+,\d+):\s+(?<size>\d+x\d+)/.match(text_claim).captures

    [
      id.to_i,
      {
        coordinates: coordinates.split(',').map(&:to_i),
        size: size.split('x').map(&:to_i)
      }
    ]
  end

  def self.generate_claim_map(parsed_claims, size)
    self.process_claims(parsed_claims, size)
      .map { |row| row.map { |_, x| x } }
  end

  def self.part_one(input, size = 1000)
    self.generate_claim_map(input, size)
      .flatten
      .reject { |x| x < 2 }
      .count
  end

  private

  def self.blank_fabric(size = 1000)
    Array.new(size, [nil, 0]).map { |x|  Array.new(size, [nil, 0]) }
  end
end

if __FILE__ == $0
  File.open('input', 'r').each_line
    .yield_self { |input| Day3.parse_claims(input) }
    .tap { |input| puts "Part 1 - inches in more than 2 claims - #{Day3.part_one(input)}" }
    .tap { |input| puts "Part 2 - unique claim id - #{Day3.unique_claim(input)}" }
end
