require 'pry'

def contestant_array(data)
  contestant_array = []
  data.each_pair do |season, contestants|
    contestants.each do |contestant|
      contestant["season"] = season
      contestant_array << contestant
    end
  end
  contestant_array
end

def get_first_name_of_season_winner(data, season)
  winner = data[season].select { |contestant| contestant["status"] == "Winner" } 
  winner[0]["name"].split.first
end

def get_contestant_name(data, occupation)
  contestant = contestant_array(data).select { |contestant| contestant["occupation"] == occupation} 
  contestant[0]["name"]
end

def count_contestants_by_hometown(data, hometown)
  contestant_array(data).select { |contestant| contestant["hometown"] == hometown }.length
end

def get_occupation(data, hometown)
  contestant = contestant_array(data).select { |contestant| contestant["hometown"] == hometown}
  contestant[0]["occupation"]
  # data.each_pair do |season, contestants|
  #   contestants.each do |contestant|
  #     if contestant["hometown"] == hometown
  #       return contestant["occupation"]
  #     end
  #   end
  # end
end

def get_average_age_for_season(data, season)
  total_age = data[season].reduce(0) { |age, contestant| age += contestant["age"].to_i }
  (total_age.to_f/data[season].length).round()
  # count = 0
  # total_age = 0
  # data[season].each do |contestant|
  #   count += 1
  #   total_age += contestant["age"].to_i
  # end
  # average = total_age/count.to_f
  # average.round()
end
