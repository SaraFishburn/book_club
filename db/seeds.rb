# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.destroy_all
horror = Genre.create(name: 'horror')
thriller = Genre.create(name: 'thriller')
scifi = Genre.create(name: 'sci-fi')

authors = [
  {
    first_name: 'Stephen',
    last_name: 'King',
    books: [
      Book.new(title: 'IT', genres: [horror, thriller]),
      Book.new(title: 'The Shining', genres: [horror]),
      Book.new(title: 'Carrie', genres: [thriller])
    ]
  },
  {
    first_name: 'Isaac',
    last_name: 'Asimov',
    books: [
      Book.new(title: 'Foundation', genres: [scifi, thriller]),
      Book.new(title: 'Robots and Empire', genres: [scifi])
    ]
  }
]

Author.destroy_all
Author.create(authors)
