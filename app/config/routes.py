"""
    Routes Configuration File

    Put Routing rules here
"""
from system.core.router import routes

#Users
routes['default_controller'] = 'Users'
routes['POST']['/register'] = 'Users#registration'
routes['POST']['/login_user'] = 'Users#login_user'

#Books
routes['/books']='Books#books'
routes['/books/add']='Books#add_book'
routes['/books/<book_id>']='Books#show_book'
routes['/books/add_book']='Books#new_book'
routes['/users/<user_id>']='Books#show_user'
routes['/delete/<book_id>']='Books#delete_book'
routes['/log_off']='Books#log_off'

#Books Post
routes['POST']['/add_book_db']='Books#add_book_db'
routes['POST']['/add_review_db']='Books#add_review_db'