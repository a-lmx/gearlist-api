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

if Rails.env.production?
  csv_directory = '/var/app/current/db/seed_csvs'
else
  csv_directory = '/Users/arhx/projects/Ada/capstone/app/gearlist-api/db/seed_csvs'
end

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
  { item_id: Item.find_by(name: "Hefty trash compactor bag").id,
    quantity: 1,
    list_section_id: 1 },
  { item_id: Item.find_by(name: "katabatic stuff sack").id,
    quantity: 1,
    list_section_id: 1 },
  { item_id: Item.find_by(name: "ULA Circuit").id,
    quantity: 1,
    list_section_id: 1 },
  { item_id: Item.find_by(name: "MSR micro-rocket, firestarter, case").id,
    quantity: 1,
    list_section_id: 2 },
  { item_id: Item.find_by(name: "MSR iso-pro 4oz").id,
    quantity: 1,
    list_section_id: 2 },
  { item_id: Item.find_by(name: "MSR Titan Kettle .85L").id,
    quantity: 1,
    list_section_id: 2 },
  { item_id: Item.find_by(name: "Katabatic palisade quilt 30°").id,
    quantity: 1,
    list_section_id: 3 },
  { item_id: Item.find_by(name: "therm-a-rest z-lite small, minus 2 sections").id,
    quantity: 1,
    list_section_id: 3 },
  { item_id: Item.find_by(name: "tarptent double rainbow & liner").id,
    quantity: 1,
    list_section_id: 3 },
  { item_id: Item.find_by(name: "Marmot crystalline").id,
    quantity: 1,
    list_section_id: 4 },
  { item_id: Item.find_by(name: "Mountain Hardware power-stretch gloves").id,
    quantity: 1,
    list_section_id: 4 },
  { item_id: Item.find_by(name: "EMS Techwick").id,
    quantity: 1,
    list_section_id: 4 },
  { item_id: Item.find_by(name: "Smartwool microweight").id,
    quantity: 1,
    list_section_id: 4 },
  { item_id: Item.find_by(name: "Victorinox Swiss Army Climber knife").id,
    quantity: 1,
    list_section_id: 5 },
  { item_id: Item.find_by(name: "Sawyer Squeeze plus 32oz bag").id,
    quantity: 1,
    list_section_id: 5 },
  { item_id: Item.find_by(name: "REI Aldervale Roll-up pants").id,
    quantity: 1,
    list_section_id: 6 },
  { item_id: Item.find_by(name: "Smartwool Microweight V-Neck Longsleeve").id,
    quantity: 1,
    list_section_id: 6 },
  { item_id: Item.find_by(name: "Keen Targee mid-height").id,
    quantity: 1,
    list_section_id: 6 },
  { item_id: Item.find_by(name: "Canon Powershot S100, sock sleeve").id,
    quantity: 1,
    list_section_id: 7 },

  # List 2 - JMT 2012 Section
  { item_id: Item.find_by(name: "Hefty trash compactor bag").id,
    quantity: 1,
    list_section_id: 8 },
  { item_id: Item.find_by(name: "katabatic stuff sack").id,
    quantity: 1,
    list_section_id: 8 },
  { item_id: Item.find_by(name: "ULA Circuit").id,
    quantity: 1,
    list_section_id: 8 },
  { item_id: Item.find_by(name: "MSR micro-rocket, firestarter, case").id,
    quantity: 1,
    list_section_id: 9 },
  { item_id: Item.find_by(name: "MSR iso-pro 4oz").id,
    quantity: 1,
    list_section_id: 9 },
  { item_id: Item.find_by(name: "MSR Titan Kettle .85L").id,
    quantity: 1,
    list_section_id: 9 },
  { item_id: Item.find_by(name: "Katabatic palisade quilt 30°").id,
    quantity: 1,
    list_section_id: 10 },
  { item_id: Item.find_by(name: "therm-a-rest z-lite small, minus 2 sections").id,
    quantity: 1,
    list_section_id: 10 },
  { item_id: Item.find_by(name: "tarptent double rainbow & liner").id,
    quantity: 1,
    list_section_id: 10 },
  { item_id: Item.find_by(name: "Marmot crystalline").id,
    quantity: 1,
    list_section_id: 11 },
  { item_id: Item.find_by(name: "Mountain Hardware power-stretch gloves").id,
    quantity: 1,
    list_section_id: 11 },
  { item_id: Item.find_by(name: "EMS Techwick").id,
    quantity: 1,
    list_section_id: 11 },
  { item_id: Item.find_by(name: "Smartwool microweight").id,
    quantity: 1,
    list_section_id: 11 },
  { item_id: Item.find_by(name: "Victorinox Swiss Army Climber knife").id,
    quantity: 1,
    list_section_id: 12 },
  { item_id: Item.find_by(name: "Sawyer Squeeze plus 32oz bag").id,
    quantity: 1,
    list_section_id: 12 },
  { item_id: Item.find_by(name: "REI Aldervale Roll-up pants").id,
    quantity: 1,
    list_section_id: 13 },
  { item_id: Item.find_by(name: "Smartwool Microweight V-Neck Longsleeve").id,
    quantity: 1,
    list_section_id: 13 },
  { item_id: Item.find_by(name: "Brooks PureGrit 3 Trail-Running Shoes - Women's").id,
    quantity: 1,
    list_section_id: 13 },
  { item_id: Item.find_by(name: "Canon Powershot S100, sock sleeve").id,
    quantity: 1,
    list_section_id: 14 },

  # List 5 - Winter
  { item_id: Item.find_by(name: "ULA Circuit").id,
    quantity: 1,
    list_section_id: 22 },
  { item_id: Item.find_by(name: "Hefty trash compactor bag").id,
    quantity: 1,
    list_section_id: 22 },
  { item_id: Item.find_by(name: "Jetboil Zip Cooking System").id,
    quantity: 1,
    list_section_id: 23 },
  { item_id: Item.find_by(name: "Vargo Eagle Titanium spork").id,
    quantity: 1,
    list_section_id: 23 },
  { item_id: Item.find_by(name: "western mountaineering versalite 10° - 5'6\"").id,
    quantity: 1,
    list_section_id: 24 },
  { item_id: Item.find_by(name: "Therm-a-Rest NeoAir XTherm Sleeping Pad - Regular").id,
    quantity: 1,
    list_section_id: 24 }
]

list_section_items.each do |list_section_item|
  ListSectionItem.create(list_section_item)
end
