class BooksController < ApplicationController
  respond_to :html
  require 'will_paginate/array' 
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction 

  def index

    @books = Book.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new

    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    
    @book = Book.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
 
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
  def sort_column  
    Book.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end 

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:cover,:title, :author, :editorial, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn,:editorial_id,:author_id)
    end
end
