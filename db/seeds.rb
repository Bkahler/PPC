# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Owner.create!(name:"Tom Jones",doc:"link to a pdf",street:"123 Heresville",city:"Oakland",country:"United State",phone:"555-555-5566",alternate_phone:"555-444-5566",email:"tom@jones.com",notes:"Recently called and left a message, but did not hear back")
  Owner.create!(name:"Bryan Kahler",doc:"link to a pdf",street:"234 Main Street",city:"Los Angeles",country:"United State",phone:"555-222-2266",alternate_phone:"555-555-5599",email:"Bryan@Kahler.com",notes:"")
  Owner.create!(name:"Blair Adams",doc:"link to a pdf",street:"567 End Lane",city:"Albany",country:"United State",phone:"555-555-5566",alternate_phone:"555-444-5566",email:"Blair@Adams.com",notes:"Sounded like he was on a boat")
  Owner.create!(name:"Neil Story",doc:"link to a pdf",street:"889 Mapview Terrace",city:"Walnut Creek",country:"United State",phone:"555-555-5566",alternate_phone:"555-444-5566",email:"Neil@Storey.com",notes:"Will call back with more information ")
  Owner.create!(name:"Freddrick Kruger",doc:"link to a pdf",street:"1 Elm Street",city:"Oakland",country:"United State",phone:"555-555-5566",alternate_phone:"555-444-5566",email:"cut@up.com",notes:"Not interested in sale")

  Property.create!(apn:"222333444", acres:45.0, GIS_acres:45.3, build_acres:45.1, year_sold:1988, sale_price:80000,assesment:284000)
  Property.create!(apn:"555666777", acres:48.0, GIS_acres:48.3, build_acres:49.1, year_sold:1999, sale_price:90000,assesment:2384000)
  Property.create!(apn:"888999000", acres:90.0, GIS_acres:92.3, build_acres:91.1, year_sold:1900, sale_price:10000,assesment:238000)
  Property.create!(apn:"000111222", acres:4100.0, GIS_acres:4142.3, build_acres:4100.1, year_sold:2001,sale_price:2940000,assesment:1428000)
  Property.create!(apn:"222333444", acres:10.0, GIS_acres:12.3, build_acres:10.1, year_sold:1966, sale_price:210000,assesment:128000)

  OwnerProperty.create!(property_id:1,owner_id:5)
  OwnerProperty.create!(property_id:2,owner_id:4)
  OwnerProperty.create!(property_id:3,owner_id:3)
  OwnerProperty.create!(property_id:4,owner_id:2)
  OwnerProperty.create!(property_id:5,owner_id:1)


