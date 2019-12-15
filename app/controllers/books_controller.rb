class BooksController < ApplicationController
  def index
    # require "pry"; binding.pry
    @books = Book.all
  end
end
