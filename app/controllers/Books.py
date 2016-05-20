from system.core.controller import *
from time import strftime
import string, random

class Books(Controller):
    def __init__(self, action):
        super(Books, self).__init__(action)
        self.load_model('Book')
        self.db = self._app.db
   
    def books(self):
        user_id=session['user_id']
        alias=self.models['Book'].get_user_name(user_id)
        three_books=self.models['Book'].get_three_books()
        all_titles=self.models['Book'].get_all_titles()
        return self.load_view('books.html', alias=alias, three_books=three_books, all_titles=all_titles)

    def add_book(self):
        authors=self.models['Book'].get_authors()
        return self.load_view('add_book.html', authors=authors)

    def add_book_db(self):
        author1=request.form['author1']
        author=request.form['author']
        if author1:
            author=author1
        data={
            'title':request.form['title'],
            'author':author,
            
        }
        add_book=self.models['Book'].add_book_db(data)
        # book_id=add_book['book_id']
        user_id=session['user_id']
        print add_book
        data2={
            'review':request.form['review'],
            'rating':request.form['rating'],
            'user_id':user_id,
            'book_id':add_book
        }
        add_review=self.models['Book'].add_review_db(data2)
        destination=('/books/'+str(add_book))
        return redirect(destination)

    def show_book(self, book_id):
        book_id=book_id
        data={
            'book_id':book_id
        }
        get_book=self.models['Book'].get_book(data)
        return self.load_view('show_book.html', get_book=get_book)

    def new_book(self, book_id):
        
        return self.load_view('show_book.html', get_book=get_book)

    def add_review_db(self):
        user_id=session['user_id']
        data={
            'review':request.form['review'],
            'rating':request.form['rating'],
            'user_id':user_id,
            'book_id':request.form['book_id']
        }
        add_review=self.models['Book'].add_review_db(data)
        return redirect('/books')

    def show_user(self, user_id):
        user_id=user_id
        data={
            'user_id':user_id
        }
        user= self.models['Book'].get_user(data)
        reviews= self.models['Book'].get_reviews(data)
        count= self.models['Book'].get_review_count(data)
        return self.load_view('show_user.html', user=user, reviews=reviews, count=count)

    def delete_book(self, book_id):
        return self.load_view('index.html')

    def log_off(self):
        session.clear()
        return redirect('/')

    