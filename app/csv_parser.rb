require "csv"

class CSVParser
  attr_reader :col_sep, :format_type 

  def initialize(col_sep, format_type)
    @col_sep = col_sep
    @format_type = format_type
  end

  def parse(str)
    CSV.parse(str,
      col_sep: col_sep,
      headers: :first_row, header_converters: :symbol).map do |row|
        Person.new(row[:first_name], row[:city], row[:birthdate], format_type)
      end
  end
end