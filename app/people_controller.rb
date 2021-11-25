class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_people = CSVParser.new(' $ ', :dollar_format).parse(@params[:dollar_format])
    percent_people = CSVParser.new(' % ', :percent_format).parse(@params[:percent_format])
    people = dollar_people + percent_people
    people.sort_by(&params[:order]).map(&:to_s)
  end

  private

  attr_reader :params
end
