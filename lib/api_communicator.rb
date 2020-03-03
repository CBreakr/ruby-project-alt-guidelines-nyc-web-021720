require 'rest-client'
require 'json'
require 'pry'

def get_monsters
    base_url = 'http://www.dnd5eapi.co'
    monster_array = get_api_hash("#{base_url}/api/monsters")
    count = 0
    monster_array["results"].first(5).map do |monster|
        count += 1
        puts count
        get_individual_monster("#{base_url}#{monster["url"]}")
        # puts "#{base_url}#{monster["url"]}"
    end
end

def get_individual_monster(url)
    monster_hash = get_api_hash(url)
    # monster = Monster.create(name: monster_hash["name"], hit_points: monster_hash["hit_points"], size: monster_hash["size"])
end

def get_api_hash(url)
    resp = RestClient.get(url)
    hash = JSON.parse(resp)
end
