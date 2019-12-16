# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Author.destroy_all

pretty = Book.create!(title: "Me Talk Pretty One Day",
                     pages: 288,
                     publication_year: "2000")
holidays = Book.create!(title: "Holidays on Ice",
                     pages: 176,
                     publication_year: "1997")
micro = Book.create!(title: "Microbiology",
                     pages: 600,
                     publication_year: "2018")
sedaris = Author.create!(name: "David Sedaris")
tortora = Author.create!(name: "Gerard Tortora")
funke = Author.create!(name: "Berdell Funke")


sedaris.books << [pretty, holidays]
micro.authors << [tortora, funke]
