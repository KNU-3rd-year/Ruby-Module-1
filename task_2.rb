class Airline
  @@numbers = 1
  @@destinations = %w[Ukraine USA Korea China Finland]
  @@week_days = %w[1_Mo 2_Tu 3_We 4_Th 5_Fr 6_Sa 7_Su]
  attr_accessor :destination,
                :flight_number,
                :plane_type,
                :departure_time,
                :days

  def initialize(destination, flight_number, plane_type, departure_time, days)
    @@numbers += 1

    @destination = destination
    @flight_number = if flight_number > @@numbers
                       @@numbers = flight_number + 1
                       flight_number
                     else
                       @@numbers - 1
                     end
    @plane_type = plane_type
    @departure_time = departure_time
    @days = days
  end

  def self.create_random_airline
    destination = @@destinations.sample
    flight_number = Airline.last_flight_number
    plane_type = %W[AN-152 AN-256 F-16 F-32 MIG-29].sample
    departure_time = time(rand(24), rand(60))
    days = @@week_days.sample(1 + rand(7)).sort!

    Airline.new(destination, flight_number, plane_type, departure_time, days)
  end

  def self.last_flight_number
    @@numbers
  end

  def self.destinations
    @@destinations
  end

  def self.week_days
    @@week_days
  end

  def to_s
    s = "Airline object:\n" +
    "\tdestination = #{destination}\n" +
    "\tflight_number = #{flight_number}\n"+
    "\tplane_type = #{plane_type}\n"+
    "\tdeparture_time = #{departure_time}\n"+
    "\tdays:\n"
    days.each { |day| s += "\t\t#{day}\n" }
    s
  end
end

def time(h, m)
  Time.new(0, nil, nil, h, m)
end

n = 50
airlines = Array.new(n).map! { Airline.create_random_airline }
airlines.each { |airline| puts airline.to_s }

puts "\n\nEnter index of destination:"
Airline.destinations.each_index { |i| puts "#{i + 1}:\t#{Airline.destinations[i]}" }
print "index:"
dest_index = gets.chomp.to_f - 1
if dest_index < 0 || dest_index > Airline.destinations.length
  p 'Error: wrong index!'
  return
end
airlines.find_all { |airline| airline.destination == Airline.destinations[dest_index] }.each { |airline| puts airline.to_s }

puts "\n\nEnter index of day in a week:"
Airline.week_days.each_index { |i| puts "\t#{i + 1}: #{Airline.week_days[i]}" }
print "index:"
day_index = gets.chomp.to_f - 1
if dest_index < 0 || dest_index > Airline.week_days.length
  p 'Error: wrong index!'
  return
end
airlines.find_all { |airline| airline.days.include?(Airline.week_days[day_index]) }.each { |airline| puts airline.to_s }

puts "\n\nEnter time:"
print "hours:"
hours = gets.chomp.to_f
unless (1...24) === hours
  p 'Error: wrong hours!'
  return
end
print "minutes:"
minutes = gets.chomp.to_f
unless (1...60) === minutes
  p 'Error: wrong minutes!'
  return
end
airlines.find_all { |airline| airline.days.include?(Airline.week_days[day_index]) && airline.departure_time > time(hours, minutes) }.each { |airline| puts airline.to_s }