descriptors = [
  'Enormous',
  'Fixer-Upper',
  'Retro',
  'Immaculate',
  'Investor Opportunity',
  'Ranch Style'
]
styles = ['Bungalow', 'Condo', 'Semi-Detached', 'Hobby Farm', 'Two Story']

# atlanta
longitude = -84.386330
latitude = 33.753746

Home.transaction do
  100_000.times do |n|
    puts "Home #{n}"

    rand_lon = (longitude + (rand * [1, -1].sample)).round(6)
    rand_lat = (latitude + (rand * [1, -1].sample)).round(6)
    sold = [true, false].sample

    Home.create!(
      name: [descriptors.sample, styles.sample].join(' '),
      status: sold ? 'sold' : 'available',
      price: rand * 1_000_000,
      beds: [1, 2, 3, 4].sample,
      baths: [1, 2, 3].sample,
      coords: Geo.point(rand_lon, rand_lat),
      longitude: rand_lon,
      latitude: rand_lat
    )
  end
end

100.times do |n|
  puts "School #{n}"
  rand_lon = (longitude + (rand * [1, -1].sample)).round(6)
  rand_lat = (latitude + (rand * [1, -1].sample)).round(6)

  School.create!(coords: Geo.point(rand_lon, rand_lat))
end
