
from system.core.model import Model

class Book(Model):
    def __init__(self):
        super(Book, self).__init__()

    def get_user_name(self, user_id):
        user_id=user_id
        query="Select alias from users where user_id=:user_id"
        data = {'user_id':user_id}
        return self.db.query_db(query,data)

    def get_user(self, user_id):
        user_id=user_id
        query="Select * from users where user_id=:user_id"
        data = {'user_id':user_id['user_id']}
        return self.db.query_db(query,data)

    def add_book_db(self, info):
        query="Insert into books (title, author, created_at, updated_at) Values (:title, :author, NOW(), NOW())"
        data = {'title':info['title'], 'author':info['author']}
        return self.db.query_db(query,data)

    def add_review_db(self, data2):
        query="Insert into reviews (review, rating, users_user_id, books_book_id, created_at, updated_at) Values (:review, :rating, :user_id, :book_id, NOW(), NOW())"
        data = {'review':data2['review'], 'rating':data2['rating'], 'user_id':data2['user_id'], 'book_id':data2['book_id']}
        self.db.query_db(query,data)

    def get_three_books(self):
        query="Select * from reviews left join books on reviews.books_book_id=books.book_id join users on reviews.users_user_id=users.user_id order by reviews.created_at desc limit 3"
        return self.db.query_db(query)

    def get_all_titles(self):
        query="Select distinct(title) from books"
        return self.db.query_db(query)

    def get_authors(self):
        query="Select distinct(author) from books"
        return self.db.query_db(query)

    def get_book(self, info):
        query="Select * from reviews join books on reviews.books_book_id = books.book_id join users on reviews.users_user_id = users.user_id  where reviews.books_book_id=:book_id"
        data={'book_id':info['book_id']}
        return self.db.query_db(query, data)

    def get_reviews(self, info):
        query="Select distinct title, books.book_id from books left join reviews on books.book_id=reviews.books_book_id  join users on reviews.users_user_id = users.user_id  where reviews.users_user_id=:user_id"
        data={'user_id':info['user_id']}
        return self.db.query_db(query, data)

    def get_review_count(self, info):
        query="Select count(title) as num from reviews join books on reviews.books_book_id = books.book_id join users on reviews.users_user_id = users.user_id  where reviews.users_user_id=:user_id"
        data={'user_id':info['user_id']}
        return self.db.query_db(query, data)