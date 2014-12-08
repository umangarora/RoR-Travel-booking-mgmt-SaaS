cab_list = [
    [ 8679, 5678, "Ajmer","Madurai", "1:00" ],
<<<<<<< HEAD
    [ 7894, 4578, "New Delhi", "Kochi", "5:00"],
	[ 7856, 2365, "Mangalore", "patna", "8/5/2013"],
	[ 1452, 2458, "patna", "hjgjsd", "7/8/2011"],
	[ 7856, 1478, "delhi", "highway", "4/8/2011"],
	[ 1234, 1456, "mumbai", "qualis", "30/2/14"],
	[ 14788, 1236, "ram", "shyam", "14/7/2013"],
	[ 12658, 4568, "sohna", "gurgaon", "28/7/2013"],
	[ 7456, 7896, "chennai", "patna", "14/7/2009"],
	[ 4586, 14785, "orissa", "guwahati", "2/12/2008"]
=======
    [ 7894, 4578, "New Delhi", "Kochi", "5:00"]
>>>>>>> origin/17-PaymentOptions-AccountTransfer
]

cab_list.each do |custId, bookingId, source, destination, pickup|
  Cabbookings.create( Cust_ID: custId, booking_ID: bookingId, Source: source, Destination: destination, pickup: pickup)
end