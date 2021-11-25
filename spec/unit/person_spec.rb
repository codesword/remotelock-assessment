require 'spec_helper'

RSpec.describe Person do
  describe '#to_s' do
    it 'format a person object to a string' do
      first_person = Person.new('Ikem', 'LA', '30-4-1974', :dollar_format)
      second_person = Person.new('Ikem', 'LA', '1986-05-29', :percent_format)
      third_person = Person.new('Ikem', 'Atlanta', '30-4-1974', :dollar_format)

      expect(first_person.to_s).to eq 'Ikem, Los Angeles, 4/30/1974'
      expect(second_person.to_s).to eq 'Ikem, Los Angeles, 5/29/1986'
      expect(third_person.to_s).to eq 'Ikem, Atlanta, 4/30/1974'
    end

    it 'uses provided birthdate if incorrect format is provided' do
      first_person = Person.new('Ikem', 'LA', '30-4-1974', :incorrect_format)
      second_person = Person.new('Ikem', 'LA', '1986-05-29', :incorrect_format)
      third_person = Person.new('Ikem', 'Atlanta', '30-4-1974', :incorrect_format)

      expect(first_person.to_s).to eq 'Ikem, Los Angeles, 30-4-1974'
      expect(second_person.to_s).to eq 'Ikem, Los Angeles, 1986-05-29'
      expect(third_person.to_s).to eq 'Ikem, Atlanta, 30-4-1974'
    end
  end
end
