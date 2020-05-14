require 'pry'

def contestant_array(seasons)
  contestant_array = []
  seasons.each_pair do |season, contestants|
    contestants.each do |contestant|
      contestant['season'] = season
      contestant_array << contestant
    end
  end
  contestant_array
end

def get_first_name_of_season_winner(seasons, season_label)
  winner_full_name = seasons[season_label].find { |contestant| contestant['status'] == 'Winner' }
  winner_full_name['name'].split.first
end

def get_contestant_name(seasons, occupation)
  correct_contestant = contestant_array(seasons).find { |contestant| contestant["occupation"] == occupation} 
  correct_contestant["name"]
end

def count_contestants_by_hometown(seasons, hometown)
  contestant_array(seasons).select { |contestant| contestant["hometown"] == hometown }.length
end

def get_occupation(seasons, hometown)
  correct_contestant = contestant_array(seasons).find { |contestant| contestant["hometown"] == hometown}
  correct_contestant["occupation"]
  # seasons.each_pair do |season, contestants|
  #   contestants.each do |contestant|
  #     if contestant["hometown"] == hometown
  #       return contestant["occupation"]
  #     end
  #   end
  # end
end

def get_average_age_for_season(seasons, season)
  total_age = seasons[season].reduce(0) { |age, contestant| age += contestant["age"].to_i }
  (total_age.to_f/seasons[season].length).round()
  # count = 0
  # total_age = 0
  # data[season].each do |contestant|
  #   count += 1
  #   total_age += contestant["age"].to_i
  # end
  # average = total_age/count.to_f
  # average.round()
end
