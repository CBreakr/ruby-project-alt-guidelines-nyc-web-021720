require 'rest-client'
require 'json'
require 'pry'

#
# guarantee that we get the first 5 monsters in the DB
# then a random sample of 10 more monsters
#
def get_monsters
    base_url = 'http://www.dnd5eapi.co'
    monster_array = get_api_hash("#{base_url}/api/monsters")
    
    count = 0
    secondary_array = []
    monster_array["results"].first(100).map do |monster|
        count += 1
        if count <= 5
            get_individual_monster("#{base_url}#{monster["url"]}")
        else
            secondary_array << "#{base_url}#{monster["url"]}"
        end
    end

    secondary_array.sample(15).map do |monster_url|
        get_individual_monster(monster_url)
    end
end

def get_individual_monster(url)
    monster_hash = get_api_hash(url)
    monster = Monster.create(name: monster_hash["name"], hit_points: monster_hash["hit_points"], size: monster_hash["size"])
end

def get_api_hash(url)
    resp = RestClient.get(url)
    hash = JSON.parse(resp)
end
