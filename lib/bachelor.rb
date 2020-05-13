require 'pry'

test_data = {
  "season 30": [
    {
      "name":      "Beth Smalls",
      "age":       "26",
      "hometown":  "Great Falls, Virginia",
      "occupation":"Nanny/Freelance Journalist",
      "status":    "Winner"
    },
    {
      "name":       "Becca Tilley",
      "age":        "27",
      "hometown":   "Shreveport, Louisiana",
      "occupation": "Chiropractic Assistant",
      "status":     "Eliminated Week 8"
    }
  ],
  "season 29": [
    {
      "name":      "Ashley Yeats",
      "age":       "24",
      "hometown":  "Denver, Colorado",
      "occupation": "Dental Assitant",
      "status":    "Winner"
    },
    {
      "name":       "Sam Grover",
      "age":        "29",
      "hometown":   "New York, New York",
      "occupation": "Entertainer",
      "status":     "Eliminated Week 6"
    }
  ]
}

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
