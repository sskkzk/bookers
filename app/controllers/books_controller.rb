class BooksController < ApplicationController
  

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    # flash[:notice]= "Book was successfully updated."
    # redirect_to book_path(book.id) 
    if book.save
     flash[:notice]= "Book was successfully updated."
     redirect_to book_path(book.id) 
    else
      flash.now[:alert]= "Book was error"
      @book = Book.find(params[:id])
      render :edit
    end
      
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice]= "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  def index
    @book = Book.new  
    @books = Book.all
  end
 
  def show
    @book = Book.find(params[:id])  
  end
 
 
  def create
    @book = Book.new(book_params)
    if @book.valid?
       @book.save
       flash[:notice]= "Book was successfully created."
       redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
