# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
air_list = [
    [ 8679, 5678, "Ajmer", "Madurai", "22/7/2014" ],
    [ 7894, 4875, "Bangalore", "Jaipur", "5/2/2014"],
	[ 7856, 2365, "Mangalore", "patna", "8/5/2013"],
	[ 1452, 2458, "patna", "hjgjsd", "7/8/2011"],
	[ 7856, 1478, "delhi", "highway", "4/8/2011"],
	[ 1234, 1456, "mumbai", "qualis", "30/2/14"],
	[ 14788, 1236, "ram", "shyam", "14/7/2013"],
	[ 12658, 4568, "sohna", "gurgaon", "28/7/2013"],
	[ 7456, 7896, "chennai", "patna", "14/7/2009"],
	[ 4586, 14785, "orissa", "guwahati", "2/12/2008"]
	
	
	
	
	
]

air_list.each do |custId, bookingId, source, destination, date|
  Airlinebookings.create( Cust_ID: custId, booking_ID: bookingId, Source: source, Destination: destination, date: date)
end