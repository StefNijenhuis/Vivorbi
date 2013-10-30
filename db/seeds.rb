# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{
 first_name: 'NHL',
 last_name: 'Hogeschool',
 street: 'Rengerslaan',
 house_number: '10',
 postal_code: '8917DD',
 place: 'Leeuwarden',
 date_of_birth: '2009-09-1',
 phone: '0582512345',
 email: 'info@nhl.nl',
 hobbies: 'Being a building'
}])
