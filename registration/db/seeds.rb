# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

agents_list = [
    [ 8679, "Ashwin", "123", "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3", "ashwinmathew94@hotmail.com","9968837356", false, true, false ],
    [ 8571, "Kundan", "123", "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3","kk94@hotmail.com","9968845356", true, true, true ],
    [ 6485, "Umang", "123", "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3", "umang94@hotmail.com","9968837356", false, false, false ],
    [ 4658, "Vedanshi", "123", "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3", "ved94@hotmail.com","9968837356", true, true, false ],
    [ 8546, "Rithwik", "123", "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3", "rithwik94@hotmail.com","9968837356", false, false, true ]

]

agents_list.each do |agentId, agentName, password, hash, email, mobile, cabset, railset, airset|
  Travelagent.create( agentId: agentId, agentName: agentName, password: password, hashed_password: hash, email: email, mobile: mobile, cabset: cabset, railset: railset, airset: airset)
end

cust_list = [
    [ 8679, "Kundan"],
    [ 3258, "Umang"],
    [ 5488, "Niharika"],
    [ 6589, "Mayank"],
    [ 2225, "Abhishek"],
]

cust_list.each do |custId,custName|
  Customer.create( custId: custId, custName: custName)
end