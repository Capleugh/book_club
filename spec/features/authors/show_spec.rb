require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit the books index page" do
    it "when I click and author's link, I am taken to the author's show page where I see their info including their name, title of each book they have written, and the average number of pages for all their books" do
      book_1 = Book.create!(title: "Some Title",
                           pages: 600,
                           publication_year: "1654")
      book_3 = Book.create!(title: "Tragic Title",
                           pages: 300,
                           publication_year: "1628")
      author_1 = Author.create!(name: "Shakespeare")

      author_1.books << [book_1, book_3]

      visit '/books'

      within "#author-#{author_1.id}"
        click_link "#{author_1.name}"
      end

      expect(current_path).to eq("/authors/#{author_1.id}")
      expect(page).to have_content(author_1.name)
      expect(page).to have_content(author_1.average_pages)

      within "book-#{book_1.id}" do
        expect_page.to have_content(book_1.title)
      end

      within "book-#{book_3.id}" do
        expect_page.to have_content(book_3.title)
      end
    end
  end
# it "Each author's name displays as a link and when I click that link, I am taken to an author's show page where I see their name, title of each book they've written, and an average number of pages for all of their books" do
#
end
