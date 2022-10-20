require 'rspec'

require_relative '../lib/task_2'

describe 'TEST task 2' do
  context 'airline creation' do
    it 'should succeed' do
      airline = Airline.next("Uganda", "Ghost", time(1, 1), %w[1_Mo 2_Tu])
      expexted_answer = "Airline object:\n\tdestination = Uganda\n\tflight_number = #{Airline.last_flight_number}\n\tplane_type = Ghost\n\tdeparture_time = 0000-01-01 01:01:00 +0200\n\tdays:\n\t\t1_Mo\n\t\t2_Tu\n"
      expect(airline.to_s).to eq(expexted_answer)
    end
  end

  context 'autoincrement' do
    (2..10).each { |i|
      airline = Airline.next("Uganda", "Ghost", time(1, 1), %w[1_Mo 2_Tu])
      expexted_answer = "Airline object:\n\tdestination = Uganda\n\tflight_number = #{Airline.last_flight_number}\n\tplane_type = Ghost\n\tdeparture_time = 0000-01-01 01:01:00 +0200\n\tdays:\n\t\t1_Mo\n\t\t2_Tu\n"
      it "should create new Airline object with flight_number = #{Airline.last_flight_number}" do
        expect(airline.to_s).to eq(expexted_answer)
      end
    }
  end

  context 'to_s' do
    it "should return correct string for airline1" do
      airline = Airline.next("Uganda", "Ghost", time(1, 1), %w[1_Mo 2_Tu])
      expexted_answer = "Airline object:\n\tdestination = Uganda\n\tflight_number = #{Airline.last_flight_number}\n\tplane_type = Ghost\n\tdeparture_time = 0000-01-01 01:01:00 +0200\n\tdays:\n\t\t1_Mo\n\t\t2_Tu\n"
      expect(airline.to_s).to eq(expexted_answer)
    end

    it "should return correct string for airline2" do
      airline = Airline.next("USA", "Shipper", time(13, 46), %w[3_We 4_Th])
      expexted_answer = "Airline object:\n\tdestination = USA\n\tflight_number = #{Airline.last_flight_number}\n\tplane_type = Shipper\n\tdeparture_time = 0000-01-01 13:46:00 +0200\n\tdays:\n\t\t3_We\n\t\t4_Th\n"
      expect(airline.to_s).to eq(expexted_answer)
    end

    it "should return correct string for airline3" do
      airline = Airline.next("Canada", "Spider", time(22, 22), %w[5_Fr 6_Sa])
      expexted_answer = "Airline object:\n\tdestination = Canada\n\tflight_number = #{Airline.last_flight_number}\n\tplane_type = Spider\n\tdeparture_time = 0000-01-01 22:22:00 +0200\n\tdays:\n\t\t5_Fr\n\t\t6_Sa\n"
      expect(airline.to_s).to eq(expexted_answer)
    end
  end
end