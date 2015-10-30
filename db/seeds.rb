require 'csv'

users = [
  { uid: "1234", 
    username: "Grizzly",
    provider: "google_oauth2" },
  { uid: "2345", 
    username: "Slow Poke",
    provider: "google_oauth2" },
  { uid: "3456", 
    username: "Fluff Ball",
    provider: "google_oauth2" },
  { uid: "110531353886002811917",
    username: "Penguin GearList",
    provider: "google_oauth2" }
]

users.each do |user|
  User.create(user)
end

csv_directory = '/Users/arhx/projects/Ada/capstone/app/gearlist-api/db/seed_csvs'

Dir.foreach(csv_directory) do |product_file|
  next if product_file == '.' or product_file == '..'

  CSV.foreach(csv_directory + "/#{product_file}", encoding: "UTF-8", headers: true) do |row|
    row_hash = row.to_hash
    Item.create(row_hash)
  end
end

lists = [
  { name: "John Muir Trail 2013",
    description: "Gear for solo thru-hike of JMT in August 2013. Pretty happy with choices; would do warmer bag next time.", 
    user_id: 1,
    secret: false },
  { name: "JMT section 2012", 
    description: "Heavy gear used as half of couple on John Muir Trail section from Happy Valley to Reds Meadow on the JMT in 2012.", 
    user_id: 2,
    secret: false },
  { name: "Pacific Crest Trail 2014", 
    description: "Lightweight-ish gear used on successful solo thru-hike in 2014.", 
    user_id: 4,
    secret: false },
  { name: "Possible Continental Divide Trail 2020", 
    description: "Dream gear for future CDT trip. Embrace the brutality!", 
    user_id: 4,
    secret: true },
  { name: "Winter Backpacking", 
    description: "Some ideas for a kit for winter camping in the North Cascades.", 
    user_id: 3,
    secret: false }
]

lists.each do |list|
  List.create(list)
end

sections = [
  { name: 'packing' }, # 1
  { name: 'kitchen' }, # 2
  { name: 'shelter & sleeping' }, # 3
  { name: 'clothing - worn' }, # 4
  { name: 'clothing - packed' }, # 5
  { name: 'survival & tools' }, # 6
  { name: 'hygiene' }, # 7
  { name: 'luxury' }, # 8
  { name: 'desert' }, # 9
  { name: 'snow' }, # 10
  { name: 'other'} # 11
]

sections.each do |section|
  Section.create(section)
end

list_sections = [
  { list_id: 1,
    section_id: 1 }, # 1
  { list_id: 1,
    section_id: 2 }, # 2
  { list_id: 1,
    section_id: 3 }, # 3
  { list_id: 1,
    section_id: 5 }, # 4
  { list_id: 1,
    section_id: 6 }, # 5
  { list_id: 1,
    section_id: 4 }, # 6
  { list_id: 1,
    section_id: 8 }, # 7

  { list_id: 2,
    section_id: 1 }, # 8
  { list_id: 2,
    section_id: 2 }, # 9
  { list_id: 2,
    section_id: 3 }, # 10
  { list_id: 2,
    section_id: 5 }, # 11
  { list_id: 2,
    section_id: 6 }, # 12
  { list_id: 2,
    section_id: 4 }, # 13
  { list_id: 2,
    section_id: 8 }, # 14

  { list_id: 3,
    section_id: 1 }, # 15
  { list_id: 3,
    section_id: 2 }, # 16
  { list_id: 3,
    section_id: 3 }, # 17
  { list_id: 3,
    section_id: 5 }, # 18
  { list_id: 3,
    section_id: 6 }, # 19
  { list_id: 3,
    section_id: 4 }, # 20
  { list_id: 3,
    section_id: 8 }, # 21

  { list_id: 5,
    section_id: 1 }, # 22
  { list_id: 5,
    section_id: 2 }, # 23
  { list_id: 5,
    section_id: 3 } # 24
]

list_sections.each do |list_section|
  ListSection.create(list_section)
end

list_section_items = [
  # List 1 - JMT 2013
  { item_id: 2,
    quantity: 1,
    list_section_id: 1 },
  { item_id: 4,
    quantity: 1,
    list_section_id: 1 },
  { item_id: 67,
    quantity: 1,
    list_section_id: 1 },
  { item_id: 81,
    quantity: 1,
    list_section_id: 2 },
  { item_id: 82,
    quantity: 1,
    list_section_id: 2 },
  { item_id: 83,
    quantity: 1,
    list_section_id: 2 },
  { item_id: 10,
    quantity: 1,
    list_section_id: 3 },
  { item_id: 11,
    quantity: 1,
    list_section_id: 3 },
  { item_id: 98,
    quantity: 1,
    list_section_id: 3 },
  { item_id: 99,
    quantity: 1,
    list_section_id: 4 },
  { item_id: 13,
    quantity: 1,
    list_section_id: 4 },
  { item_id: 19,
    quantity: 1,
    list_section_id: 4 },
  { item_id: 18,
    quantity: 1,
    list_section_id: 4 },
  { item_id: 21,
    quantity: 1,
    list_section_id: 5 },
  { item_id: 101,
    quantity: 1,
    list_section_id: 5 },
  { item_id: 102,
    quantity: 1,
    list_section_id: 6 },
  { item_id: 103,
    quantity: 1,
    list_section_id: 6 },
  { item_id: 105,
    quantity: 1,
    list_section_id: 6 },
  { item_id: 40,
    quantity: 1,
    list_section_id: 7 },

  # List 2 - JMT 2012 Section
  { item_id: 2,
    quantity: 1,
    list_section_id: 8 },
  { item_id: 4,
    quantity: 1,
    list_section_id: 8 },
  { item_id: 67,
    quantity: 1,
    list_section_id: 8 },
  { item_id: 81,
    quantity: 1,
    list_section_id: 9 },
  { item_id: 82,
    quantity: 1,
    list_section_id: 9 },
  { item_id: 83,
    quantity: 1,
    list_section_id: 9 },
  { item_id: 10,
    quantity: 1,
    list_section_id: 10 },
  { item_id: 11,
    quantity: 1,
    list_section_id: 10 },
  { item_id: 98,
    quantity: 1,
    list_section_id: 10 },
  { item_id: 99,
    quantity: 1,
    list_section_id: 11 },
  { item_id: 13,
    quantity: 1,
    list_section_id: 11 },
  { item_id: 19,
    quantity: 1,
    list_section_id: 11 },
  { item_id: 18,
    quantity: 1,
    list_section_id: 11 },
  { item_id: 21,
    quantity: 1,
    list_section_id: 12 },
  { item_id: 101,
    quantity: 1,
    list_section_id: 12 },
  { item_id: 102,
    quantity: 1,
    list_section_id: 13 },
  { item_id: 103,
    quantity: 1,
    list_section_id: 13 },
  { item_id: 4699,
    quantity: 1,
    list_section_id: 13 },
  { item_id: 40,
    quantity: 1,
    list_section_id: 14 },

  # List 5 - Winter
  { item_id: 67,
    quantity: 1,
    list_section_id: 22 },
  { item_id: 2,
    quantity: 1,
    list_section_id: 22 },
  { item_id: 962,
    quantity: 1,
    list_section_id: 23 },
  { item_id: 84,
    quantity: 1,
    list_section_id: 23 },
  { item_id: 64,
    quantity: 1,
    list_section_id: 24 },
  { item_id: 3270,
    quantity: 1,
    list_section_id: 24 }
]

list_section_items.each do |list_section_item|
  ListSectionItem.create(list_section_item)
end
