users = [
  { uid: "1234", 
    username: "Grizzly" },
  { uid: "2345", 
    username: "Slow Poke" },
  { uid: "3456", 
    username: "Fluff Ball" }
]

users.each do |user|
  User.create(user)
end

items = [
  { name: "MLD Burn pack - custom w/ two hip pockets", 
    category: "backpack", 
    weight: 525 },
  { name: "Hefty trash compactor bag", 
    category: "pack liner", 
    weight: 62 },
  { name: "Sea to Summit ultra-sil nano dry sack - 8L", 
    category: "clothing bag", 
    weight: 27 },
  { name: "Western Mountaineering Versalite 10° - 5'6\"", 
    category: "sleeping bag", 
    weight: 904 },
  { name: "Katabatic Palisade quilt 30°", 
    category: "sleeping bag", 
    weight: 486 },
  { name: "Therm-a-rest Z-lite small, minus 2 sections", 
    category: "sleeping pad", 
    weight: 241 },
  { name: "Patagonia Houdini pants - S", 
    category: "wind pants", 
    weight: 88 },
  { name: "MSR micro-rocket, firestarter, case", 
    category: "stove", 
    weight: 122 },
  { name: "Oiselle distance short, liner cut out - M", 
    category: "bottoms", 
    weight: 91 },
  { name: "Rab Aeon Tee (short sleeve) - women's 12", 
    category: "top", 
    weight: 62 },
]

items.each do |item|
  Item.create(item)
end

lists = [
  { name: "John Muir Trail 2013", 
    user_id: 1 },
  { name: "JMT section 2012", 
    user_id: 2 },
  { name: "Pacific Crest Trail 2014", 
    user_id: 1 },
  { name: "Appalachian Trail 2010", 
    user_id: 3 },
  { name: "Winter Backpacking", 
    user_id: 2 },
]

lists.each do |list|
  List.create(list)
end

list_items = [
  { item_id: 1,
    list_id: 1,
    quantity: 1,
    section: "packing" },
  { item_id: 3,
    list_id: 1,
    quantity: 1,
    section: "packing" },
  { item_id: 5,
    list_id: 1,
    quantity: 1,
    section: "shelter \& sleeping" },
  { item_id: 8,
    list_id: 1,
    quantity: 1,
    section: "kitchen" },
  { item_id: 6,
    list_id: 1,
    quantity: 1,
    section: "shelter \& sleeping" },
  { item_id: 7,
    list_id: 3,
    quantity: 1,
    section: "clothing packed" },
  { item_id: 1,
    list_id: 3,
    quantity: 1,
    section: "packing" },
  { item_id: 2,
    list_id: 3,
    quantity: 1,
    section: "packing" },
  { item_id: 3,
    list_id: 3,
    quantity: 1,
    section: "packing" },
  { item_id: 4,
    list_id: 3,
    quantity: 1,
    section: "shelter \& sleeping" },
  { item_id: 10,
    list_id: 3,
    quantity: 1,
    section: "clothing - worn" },
  { item_id: 9,
    list_id: 3,
    quantity: 1,
    section: "clothing - worn " },
  { item_id: 8,
    list_id: 3,
    quantity: 1,
    section: "kitchen" },
  { item_id: 6,
    list_id: 3,
    quantity: 1,
    section: "shelter \& sleeping" }
]

list_items.each do |list_item|
  ListItem.create(list_item)
end
