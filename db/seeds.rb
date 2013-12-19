# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{
 name: 'Test gebruiker #1',
 postal_code: '8857BP',
 longitude: '5.460613',
 latitude: '53.19323',
 city: 'Wijnaldum'
}])

User.create([{
  name: 'Test gebruiker #2',
  postal_code: '8872MA',
  longitude: '5.448383',
  latitude: '53.183748',
  city: 'Midlum'
}])

User.create([{
    name: 'Test gebruiker #3',
    postal_code: '6883JM',
    longitude: '5.484374',
    latitude: '53.217316',
    city: 'Sexbierum'
}])

Category.create([{
  title: 'Boodschappen doen'
}])

Category.create([{
  title: 'Electronica en computer'
}])

Category.create([{
  title: 'financiën'
}])

Category.create([{
  title: 'Huishoudelijk'
}])

Category.create([{
  title: 'Meerijden'
}])

Category.create([{
  title: 'Sport en recreatie'
}])

Category.create([{
  title: 'Tuin en buitenwerk'
}])

Category.create([{
  title: 'Overig'
}])

Message.create([{
  user_id: 1,
  category_id: 2,
  title: 'Heg snoeien',
  body: 'Mijn heg is onderhand zo groot dat mijn buurvrouw hier last van heeft.
  ik ben zelf niet instaad om mijn heg te knippen daarom zoek ik iemand die dit voor mij wil doen.'
}])

Message.create([{
  user_id: 1,
  category_id: 2,
  title: 'Kozijnen verven',
  body: 'Ik wil graag mijn kozijnen geverft hebben voor de zomer.
  Is er iemand die dit kan doen of die iemand kent die dit kan doen?'
}])

Message.create([{
  user_id: 1,
  category_id: 2,
  title: 'Hulp bij boodschappen',
  body: 'Ik ben slecht te been en kan de boodschappen niet meer doen daarom zoek ik hier een oplossing voor.'
}])

Message.create([{
  user_id: 1,
  category_id: 2,
  title: 'Dagje uit',
  body: 'Ik heb voor zondag 8 december een taxi busje besteld om naar de Amsterdam te gaan en ik heb nog 4 plekken over.
  Als je zin hebt in een leuk dagje uit meld je dan bij mij of laat het in de reacties weten.'
}])

Message.create([{
  user_id: 3,
  category_id: 2,
  title: 'RTL 4 werkt niet meer',
  body: 'Mijn RTL 4 werkt niet meer en nu kan ik The Voice niet meer kijken, er heeft een tijdje een balk boven in gestaan die iets zei over nieuwe frequenties maar ik begrijp dit niet. Zou iemand bij mij langs kunnen komen om dit te repareren?'
}])

Comment.create([{
  user_id: 2,
  message_id: 1,
  body: 'Hallo Test gebruiker #1, ik kan jou komende zaterdag wel helpen. Doordeweeks werk ik als hovenier'
}])

Comment.create([{
  user_id: 2,
  message_id: 2,
  body: 'Hallo Test gebruiker #1, Mijn broer is eigenaar van een schilders bedrijfje en die kan jou hier wel bij helpen.'
}])

Comment.create([{
  user_id: 2,
  message_id: 3,
  body: 'Hallo Test gebruiker #1, ik heb een auto en ik wil wel één keer per week samen met jou boodschappen doen.'
}])

Comment.create([{
  user_id: 2,
  message_id: 4,
  body: 'Hallo Test gebruiker #1, lijkt me leuk om dit weekend even naar Amsterdam te gaan.'
}])