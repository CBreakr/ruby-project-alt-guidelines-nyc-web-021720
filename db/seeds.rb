Monster.delete_all
Dungeon.delete_all
Encounter.delete_all
Level.delete_all
Campaign.delete_all
User.delete_all

get_monsters


aboleth = Monster.find_by(name: "Aboleth")
acolyte = Monster.find_by(name: "Acolyte")
black_dragon = Monster.find_by(name: "Adult Black Dragon")
blue_dragon = Monster.find_by(name: "Adult Blue Dragon")
brass_dragon = Monster.find_by(name: "Adult Brass Dragon")

e1 = Encounter.create(num_enemies: 3, monster: aboleth)
e2 = Encounter.create(num_enemies: 4, monster: acolyte)
black = Encounter.create(num_enemies: 1, monster: black_dragon)
blue = Encounter.create(num_enemies: 1, monster: blue_dragon)
brass = Encounter.create(num_enemies: 1, monster: brass_dragon)

d1 = Dungeon.create(name:"Adult Black Dragon Boss", difficulty: 16)
d2 = Dungeon.create(name:"Adult Blue Dragon Boss", difficulty: 15)
d3 = Dungeon.create(name:"Adult Brass Dragon Boss", difficulty: 15)

Level.create(dungeon: d1, encounter: e1)
Level.create(dungeon: d1, encounter: e2)
Level.create(dungeon: d1, encounter: black)
Level.create(dungeon: d2, encounter: e1)
Level.create(dungeon: d2, encounter: e2)
Level.create(dungeon: d2, encounter: blue)
Level.create(dungeon: d3, encounter: e1)
Level.create(dungeon: d3, encounter: e2)
Level.create(dungeon: d3, encounter: brass)