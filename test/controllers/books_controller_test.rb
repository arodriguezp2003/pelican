require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { author: @book.author, edition: @book.edition, edition_date: @book.edition_date, edition_place: @book.edition_place, editorial: @book.editorial, isbn: @book.isbn, original_title: @book.original_title, publication_year: @book.publication_year, title: @book.title, translation: @book.translation }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { author: @book.author, edition: @book.edition, edition_date: @book.edition_date, edition_place: @book.edition_place, editorial: @book.editorial, isbn: @book.isbn, original_title: @book.original_title, publication_year: @book.publication_year, title: @book.title, translation: @book.translation }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
