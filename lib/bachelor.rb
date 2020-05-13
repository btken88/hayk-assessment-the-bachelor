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
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split[0]
    end
  end
end

def get_contestant_name(data, occupation)
  # code here
  contestants = contestant_array(data)
  contestants.each do |contestant|
    if contestant["occupation"] == occupation
      return contestant["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  contestants = contestant_array(data)
  contestants.each do |contestant|
    if contestant["hometown"] == hometown
      count += 1
    end
  end
  count
end

def get_occupation(data, hometown)
  # code here
  data.each_pair do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  count = 0
  total_age = 0
  data[season].each do |contestant|
    count += 1
    total_age += contestant["age"].to_i
  end
  average = total_age/count.to_f
  average.round()
end
