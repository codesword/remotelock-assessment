class Person
  attr_reader :first_name, :city, :birthdate
  
  def initialize(first_name, city, birthdate, format_type)
    @first_name = first_name
    @city = correct_city_name city
    @birthdate = correct_birthdate birthdate, format_type
  end

  def city_mappings
    {
      'LA' => 'Los Angeles',
      'NYC' => 'New York City'
    }
  end

  def date_format_mappings
    {
      dollar_format: '%d-%m-%Y',
      percent_format: '%Y-%m-%d'
    }
  end

  def correct_city_name(city)
    if city_mappings.has_key? city
      city_mappings[city]
    else
      city
    end
  end

  def correct_birthdate(birthdate, format_type)
    if date_format_mappings.has_key? format_type
      birthdate_obj = Date.strptime(birthdate, date_format_mappings[format_type])
      birthdate_obj.strftime('%-m/%-d/%Y')
    else
      birthdate
    end
  end

  def to_s
    "#{first_name}, #{city}, #{birthdate}"
  end
end