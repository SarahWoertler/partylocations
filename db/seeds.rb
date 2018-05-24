require 'faker'
require 'open-uri'

Location.destroy_all
User.destroy_all
# Availability.destroy_all

users = []
locations = []
a = 0
i = 0

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "yooooooooo",
    password_confirmation: "yooooooooo")
  user.save!

  p user
  users << user
end

photos = [
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172370/sfjvkicspqt9qavou1yk.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172077/nokl2vhwz2jdycuc0per.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171806/s6apvw0nxiuas03eysii.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171609/mmwcbhnlk0ugikglvriu.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527169703/deyovi9txmvejfllxx1v.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170606/xs8crhr5t6nm1jcdzfiy.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170666/mipctjvfzc9c0luai3ff.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170737/d9pxyc0unkkt0yzmtgif.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171480/mvltk3ugbhutnvkj1nfd.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172553/mb19whtgatolc6p6h7fa.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1526993791/biusj5xypxgyejclgdl3.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172483/tjdkmhpeehx2kyosjlct.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172649/z6rg846zvvdolnmky7r8.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172810/lgrbgc8epkwh0gpsg1oa.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527173361/qurecklvrd5ybon29qqr.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527173175/wcger5yeopbn5arfhehk.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527173116/xkbbj8kl8aqzqvsdtmva.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527173284/sclj6ywd02offkxubtwf.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172917/npifmqjwdekbivd7nrwy.jpg'
]

# 10.times do

#   location = Location.create!(
#   name: Faker::Company.name,
#   description: Faker::Lorem.paragraph,
#   size: rand(10..2000),
#   capacity: rand(5..200),
#   price: rand(100..20000),
#   address: Faker::Address.city,
#   # latitude: Faker::Address.latitude,
#   # longitude: Faker::Address.longitude,
#   location_type: ["Bar", "Restaurant", "Club", "Other"].sample,
#   occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
#   accessible: ["true", "false"].sample == "true",
#   catering: ["true", "false"].sample == "true",
#   parking: ["true", "false"].sample == "true",
#   smoking: ["true", "false"].sample == "true",
#   music: ["true", "false"].sample == "true",
#   user_id: users.sample.id
#     )

location = Location.create!([{
  name: "Tresor",
  description: "Auferstanden in Ruinen: Nach zweijähriger Pause hat der legendäre Tresor in einem ehemaligen Heizkraftwerk eine neue Heimat gefunden.
  Entstanden ist ein spektakulärer Club-Tempel: Der so genannte „Batterieraum“ ist würdiger Nachfolger des Globus, die „+4 Bar“ bietet einen atemberaubenden Blick in die Kraftwerksruine und in den Tresor Keller gelangt man durch einen 30 Meter langen Tunnel.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Köpenicker Str. 70, 10179 Berlin",
  location_type: "Club",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "AVENUE Berlin",
  description: "Vom russischen Spezialitäten-Restaurant zu einem der angesagtesten Clubs der Hauptstadt – fünfzig Jahre komprimierte Berliner Geschichte. Das Café Moskau wurde 1959 von den Architekten Josef Kaiser und Horst Bauer als eines von sieben Nationalitätenrestaurants im Ostteil Berlins geplant und von 1961 bis 1964 in unmittelbarer Nähe zum Alexanderplatz errichtet. Nach längerem Leerstand entdeckte um die Jahrtausendwende die junge Berliner Partyszene das Objekt wieder, und stellte somit die Weichen für die zeitgemäße Nutzung dieser aussergewöhnlichen Location im Herzen Berlins.
  Als integrativer Bestandteil des denkmalgeschützten Café Moskau, eröffnete im Jahr 2013 der Club AVENUE seine Pforten. Konzipiert und umgebaut von dem international renommierten Architekten-Studio karhard (unter anderem bekannt für das Design namhafter Clubs wie das „Pacha“ in München oder die „Panorama Bar“ im Berliner Berghain), zählt das AVENUE heute mit seinem Mix aus schlichter Eleganz, zeitlosen Designelementen und einer wohl dosierten Portion Understatement zu den Top-Clubs der Hauptstadt.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Karl-Marx-Allee 34, 10178 Berlin",
  location_type: "Club",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Berghain",
  description: "Das riesige Gebäude ist ein inzwischen legendärer Anziehungspunkt für feierwütige Gäste. Wer trotz der harten Türpolitik rein darf, kann von Samstagabend bis Montagmorgen verweilen, denn so lange hat der vierstöckige Club geöffnet.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Am Wriezener Bahnhof, 10243 Berlin",
  location_type: "Club",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
    },
    {
  name: "Prince Charles",
  description: "Neben den typischen Clubnächten finden sich auch Lesungen, Salonabende und andere kulturelle Veranstaltungen im Veranstaltungskalender des Clubs. Der Blickfang im Innern ist sicherlich die Bar, die im ehemaligen Schwimmbad steht. Ja, richtig gehört! Egal, ob man an der Bar steht oder sitzt, man blickt immer zum Barkeeper herunter. Und auch sonst setzt sich das Extravagante im Club fort. Beim Hauscocktail, der sich „Prince Charles“ nennt, heisst es zurücklehnen und den feinen Elektro-Klängen lauschen.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Prinzenstraße 85f, 10969 Berlin",
  location_type: "Club",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
    },
    {
  name: "Kremanski",
  description: "Kleine Auszeit gefällig? Willkommen im KREMANSKI, direkt am Kotti! Von früh bis spät erwartet Euch im Kremanski ein breites, dennoch besonderes Angebot: Frühstück mit Barista-Kaffee, kreativer Mittagstisch, hausgemachter Kuchen bis hin zum lokal gebrauten Bier oder Cocktail am Abend. Im Sommer gibt´s auch selbstgemachtes Eis. Viele vegane Optionen. Dazu ausgesuchter Sound, je nach Stimmung gefühlvoll, urban-lässig oder tanzbar, manchmal auch live.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Adalbertstraße 96, 10999 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
    },
    {
  name: "Neue Odessa Bar",
  description: "Früher gemütliche Kiezkneipe, heute Treffpunkt für Leute aus Mode und Kunst – die Neue Odessa Bar hat sich um 180 Grad gedreht. Seit der Neueröffnung gibt es Türsteher, eine neue schicke Einrichtung und täglich legen DJs auf. Der Geschäftsführer empfiehlt den Moscow Mule mit Wodka, Ginger Beer, Limettensaft und Gurke",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Torstraße 89, 10119 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
      },
      {
  name: "Schmittz",
  description: "In der Torstraße ist das Schmittz für Fußballfans längst eine feste Adresse: Jedes Bundesliga- und Champions-League-Spiel wird übertragen, dann ist allerdings recht frühes Erscheinen angesagt. Wer auch montags nicht ohne die beliebte Sportart kann, sollte ab 20 Uhr vorbeischauen, zum Kickerturnier, an dem man auch sehr gern alleine teilnehmen kann. Die Partner werden ausgelost, und für den Sieger gibt es einen Pokal. Wem das nicht reicht, der vergnügt sich mit Tischtennis und Dart.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Gormannstraße 19, 10119 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
      },
      {
  name: "Amano Bar",
  description: "Mit Blick über die Dächer Berlins kann man seinen Cocktail schlürfen und sich in der Ruhe einfach entspannen. Der perfekte Ort, mit Freunden bei einem Drink in der Sonne zu quatschen und dann später den Sonnenuntergang zu genießen.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Auguststraße 43, 10119 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
      },
      {
  name: "Sandmann",
  description: "Traditionsadresse auf der Neuköllner Reuterstraße. Im Juni 2014 hat der Sandmann seinen 33. Geburtstag gefeiert. Als Musikcafé und Kiezkneipe ist die Location im Neuköllner Nachtleben fest verwurzelt.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Reuterstraße 7, 12053 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "The Unique Bar",
  description: "Die 200 verschiedene Variationen der „Liquid Kitchen“-Cocktails auf der Getränkekarte lassen einem die Entscheidung nicht leicht fallen. Dabei handelt es sich um Mixgetränke, bei denen Zutaten verwendet werden, die normalerweise in den Suppentopf kommen - rosa Pfeffer, Rosmarin oder Paprika. Jeden Monat wird vom Barchef ein Monatscocktail kreiert, wie zum Beispiel der Kentucky Gum - eine kreative Version des bekannten Mint Julep.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Sheraton Berlin Grand Hotel Esplanade, Lützowufer 15, 10785 Berlin",
  location_type: "Bar",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "MINE / WINE",
  description: "Eine frische Interpretation der weltweit köstlichsten Rezepte, die von jungen talentierten Chefköchen sorgfältig und liebevoll zubereitet werden. Passend dazu ist eine einzigartige Auswahl verschiedener Weine in der Karte zu finden, welche alle aus biodynamischem und natürlichem Weinbau stammen. Auf der Speisekarte im MINE stehen neue Kreationen weltweit bekannter gastronomischer Spezialitäten. Unterschiedliche Gerichte, zubereitet nach Tradition der italienischen Küche, jedoch mit leichtem Einfluss aktueller Food - Trends und Rezepte. Das Menü ist einwandfrei: Die Grundlage der Gerichte, die zur Auswahl stehen, bilden einzigartige Lebensmittel, die aus den unterschiedlichsten Ecken Europas stammen, von Island bis Spanien. Ein besonderer Schwerpunkt liegt dabei auf Spezialitäten aus Italien und Deutschland.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Meinekestraße 10, 10719 Berlin",
  location_type: "Restaurant",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Poulette",
  description: "In der Brasserie Poulette legt man sehr viel Wert auf saisonale, regionale, frische Küche. Auf der Speisekarte findet man feine Pasteten, Froschschenkel, Wachteln, frischen Fisch und je nach Jagdsaison auch Wildgerichte. Denkmalgeschützte Fliesen und ein Meer von Blumen sorgen für ein stimmiges Ambiente.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Knaackstraße 30-32, 10405 Berlin",
  location_type: "Restaurant",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Hackescher Hof",
  description: "Im weitläufigen Gastraum, der sich direkt neben dem Eingang zu den Hackeschen Höfen befindet, herrscht rege Betriebsamkeit. Die Speisekarte bietet frische Umlandprodukte aus ökologisch vertretbarem Anbau und Fleisch aus artgerechter Tierhaltung. Zur Wahl stehen beispielsweise gegrilltes Kotelett vom Saalower Kräuterschwein, Calamari mit Scampi-Lachs-Füllung auf Orangen-Ingwersauce oder auch ein Wiener Schnitzel.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Rosenthaler Str. 40-41, 10178 Berlin",
  location_type: "Restaurant",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Bruno",
  description: "Feinstes Pferdefilet steht seit über zwanzig Jahren auf der Karte und wird immer wieder gern genommen. „Wendy“-Leser und Springreiter greifen lieber auf Fischspezialitäten wie zum Beispiel das Oktopus-Carpaccio zurück. Angst vor Unfrische ist unbegründet: Jeden Morgen besorgt der Chef höchstpersönlich die frischen Zutaten, um sie anschließend in der Küche zu verbrutzeln.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Friedrich-Wilhelm-Straße 67, 12103 Berlin",
  location_type: "Restaurant",
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Alte Nationalgalerie",
  description: "Die Alte Nationalgalerie wurde von 1866 bis 1876 nach Plänen Friedrich August Stülers errichtet. Sie gilt als eine der bedeutendsten Museumsarchitekturen des 19. Jahrhunderts. Nach einer umfassenden Restaurierungsphase wurde sie 2001 in neuem Glanze wiedereröffnet.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Bodestraße 1-3, 10178 Berlin",
  location_type: "Other",
  occasion: "Corporate",
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Teehaus im Englischen Garten",
  description: "Das Teehaus im Englischen Garten, gelegen in unmittelbarer Nachbarschaft zum Schloss Bellevue zwischen Siegessäule und Hansaviertel, ist ein Ort freundlicher Gastlichkeit, ein Ort für Begegnung und Kommunikation, ein Ort für Kultur sowie ein Ort zum Feiern und Entspannen inmitten des Großen Tiergartens.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Altonaer Str. 2, 10557 Berlin",
  location_type: "Other",
  occasion: "Wedding",
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Galerie Barbara Weiss",
  description: "Die Galerie Barbara Weiss sitzt nach Jahren in der Potsdamer Straße sowie anschließend der Zimmerstraße mittlerweile unweit des Kottbusser Tores in einer Gegend, die zu den noch etwas raueren Ecken im längst so schicken Kreuzberg gehört.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Kohlfurter Str. 41/43, 10999 Berlin",
  location_type: "Other",
  occasion: "Corporate",
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Hurricane Factory Berlin",
  description: "Wer schon immer mal abheben wollte ist bei der Hurricane Factory Berlin richtig! Im rundum verglasten, 15 m hohen Windtunnel wird ein konstanter, bis zu 280 km/h schneller Luftstrom erzeugt. Dieser ermöglicht es komplett frei zu fliegen, vergleichbar mit einem Fallschrimsprung aus 4000m. Ob unter Freunden, mit der Familie oder als Teamevent: die verschiedenen Flugpakete bieten für jeden etwas, und das alles komplett unabhängig von den Wetterverhältnissen. Die 5,20 m Durchmesser des Flugzylinders platzieren den Tunnel der Hurricane Factory Berlin unter den größten der Welt.",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Waßmannsdorfer Allee 3, 12529 Schönefeld",
  location_type: "Other",
  occasion: "Family",
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  },
  {
  name: "Labyrintoom Berlin",
  description: "Am Rand von Berlin sind die Escape Rooms von Labyrintoom ein Erlebnis für Groß und Klein. Ob zu Fuß oder mit dem Auto (kostenfreie Parkplätze vorhanden) lassen sich die besonderen Räume schnell und einfach erreichen. Die einzigartigen Räume bieten knifflige Rätsel und besondere Abenteuer, die zwischen Dir und Deiner Flucht stehen. Entdecke Codes, löse Rätsel und errate die nächste Aufgabe – damit Du und Dein Team schnell aus dem Escape Room ausbrechen könnt. Wirst Du es schnell genug schaffen?",
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  address: "Wartenbergstraße 35/36, 10365 Berlin",
  location_type: "Other",
  occasion: "Family",
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
  }])

  p location
# end

Location.all.each do |location|
  location.remote_photo_url = photos.delete_at(0)
  location.save
  p location

  locations << location
end


10.times do

  365.times do
    avail = Availability.create!(
      location: locations[a],
      # user: nil,
      # user: users.sample,
      date: (Date.today + i.day),
      status: nil
      # status: ["Pending", "Accepted", "Denied"].sample
      )
    i += 1
    p avail
  end

  a += 1
end
