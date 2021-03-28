class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
   if @book.save
        flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
   elsif
      @books = Book.all
      render "index"
   else  
      @books = Book.all
       flash[:notice] = 'error'
   end
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
         flash[:notice] = 'Book was successfully updated.'
         redirect_to book_path(@book)
    elsif
      render :index
    else  
      @books = Book.all
       flash[:notice] = 'error'
    end
  end

  def destroy
       @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
     format.html { redirect_to books_url, notice: 'Book was successfully destroyed.'}
            format.html{redirect_to books_path, notice: "Book was successfully destroyed."}
            format.html{render :index}
        end
  end

  private


  def book_params
   params.require(:book).permit(:title, :body)
  end

  def set_book
   @book = Book.find(params[:id])
  end

end
