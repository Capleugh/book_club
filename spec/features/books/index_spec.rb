require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit the books index page" do
    it "I see each book in the system including the book's title, number of pages and authors associated with that book" do
      book_1 = Book.create!(title: "Some Title",
                           pages: 600,
                           publication_year: "1854")
      book_2 = Book.create!(title: "Another Title",
                           pages: 500,
                           publication_year: "1854")
      author_1 = Author.create!(name: "Shakespeare")
      author_2 = Author.create!(name: "Sedaris")
      author_3 = Author.create!(name: "Borges")
      author_4 = Author.create!(name: "J.K. Rowling")

      book_1.authors << author_1
      book_1.authors << author_2

      book_2.authors << author_3
      book_2.authors << author_4

      visit '/books'

      within "#book-#{book_1.id}" do
        expect(page).to have_content(book_1.title)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.publication_year)

        within "#author-#{author_1.id}" do
          expect(page).to have_content(author_1.name)
        end

        within "#author-#{author_2.id}" do
          expect(page).to have_content(author_2.name)
        end
      end

      within "#book-#{book_2.id}" do
        expect(page).to have_content(book_2.title)
        expect(page).to have_content(book_2.pages)
        expect(page).to have_content(book_2.publication_year)

        within "#author-#{author_3.id}" do
          expect(page).to have_content(author_3.name)
        end

        within "#author-#{author_4.id}" do
          expect(page).to have_content(author_4.name)
        end
      end
    end
  end
end
