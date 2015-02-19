# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.find_or_create_by(:email => 'admin@example.com') do |user|
  user.password = '12345678'
end

unless Book.exists?
  now = Time.now.to_f
  long_ago = 5.years.ago.to_f
  
  def rtime(now,init_time)
    x_init_time = init_time.to_time.to_f
    Time.at(rand * (now - x_init_time) + x_init_time)
  end
  Book.create([
    {
      title: 'La sombra de Ender',
      author: 'Orson Scott Card',
      editorial: 'Ediciones B',
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La sombra del Hegemón',
      author: 'Orson Scott Card',
      editorial: 'Ediciones B',
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La quinta ola',
      author: 'Rick Yancey',
      editorial: 'RBA',
      original_title: 'The 5th Wave',
      translation: 'Pilar Ramírez Tello',
      edition: 1,
      edition_date: (init_time = Date.parse('2013-09-01')),
      edition_place: 'Barcelona',
      publication_year: 2013,
      isbn: '978-84-272-0422-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final',
      author: 'Brandon Sanderson',
      editorial: 'Ediciones B',
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión',
      author: 'Brandon Sanderson',
      editorial: 'Ediciones B',
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    },
    {
      title: 'Web Application Design Patterns',
      author: 'Pawan Vora',
      editorial: 'Morgan Kaufmann Publishers',
      original_title: nil,
      translation: nil,
      edition: 1,
      edition_date: nil,
      edition_place: 'Canada',
      publication_year: 2009,
      isbn: '978-0-12-374265-0',
      created_at: rtime(now,Date.parse('2009-06-01'))
    },
    {
      title: 'The principles of Beautiful Web Design',
      author: 'Jason Beaird',
      editorial: 'SitePoint',
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2010-11-01')),
      edition_place: 'Canada',
      publication_year: 2010,
      isbn: '978-0-9805768-9-4',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Learning Web Design',
      author: 'Jennifer Niederst Robbins',
      editorial: 'O\'Reilly',
      original_title: nil,
      translation: nil,
      edition: 3,
      edition_date: (init_time = Date.parse('2007-06-01')),
      edition_place: nil,
      publication_year: 2001,
      isbn: '978-0-596-52752-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Don’t Make Me Think!',
      author: 'Steve Krug',
      editorial: 'New Riders Publishing',
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2006-06-01')),
      edition_place: 'United States of America',
      publication_year: 2006,
      isbn: '0-321-34475-8',
      created_at: rtime(now,init_time)
    }
  ])
end

#Al inicial el Seed se requiere comentar las relaciones:
#belongs_to:editorial
#belongs_to:author 
unless Editorial.exists?
  book = Book.all.group(:editorial)
  book.each do |b|
    editorial = Editorial.new
    editorial.name = b.editorial
    editorial.save
  end
end 



unless Author.exists?
  book = Book.all.group(:author)
  book.each do |b|
    author = Author.new
    author.name = b.author
    author.save
  end
  books = Book.all
  books.each do |b|
    bx = Book.find(b.id) 
    editorial = Editorial.where(name: b.editorial)
    author = Author.where(name: b.author)

    bx.editorial_id = editorial[0].id
    bx.author_id = author[0].id

    bx.save
  end
end 

