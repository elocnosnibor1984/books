
from system.core.model import Model

class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def register_user(self, user):
        password = user['password']
        password_hash=self.bcrypt.generate_password_hash(password)
        query="INSERT INTO users (name, alias, email, password, created_at, updated_at) values (:name, :alias, :email, :password, NOW(), NOW())"
        data = {'name': user['name'], 'alias': user['alias'], 'email':user['email'], 'password':password_hash}
        return self.db.query_db(query,data)

    def login_user(self, info):
        password=info['password']
        query="Select * from users where email=:email"
        data = {'email':info['email']}
        data_to_check=self.db.query_db(query,data)

        if data_to_check:
            check = self.bcrypt.check_password_hash(data_to_check[0]['password'], password)
            return data_to_check
        return False
