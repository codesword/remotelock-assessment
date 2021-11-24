require 'spec_helper'

RSpec.describe CSVParser do
  describe '#parse' do
    it 'can parse dollar_format fixture' do
      parser = CSVParser.new(' $ ', :dollar_format)
      parsed_people = parser.parse(File.read('spec/fixtures/people_by_dollar.txt'))
      expect(parsed_people.count).to eq(2)
    end 

    it 'can parses percent_format fixture' do
      parser = CSVParser.new(' % ', :percent_format)
      parsed_people = parser.parse(File.read('spec/fixtures/people_by_percent.txt'))
      expect(parsed_people.count).to eq(2)
    end 
  end
end