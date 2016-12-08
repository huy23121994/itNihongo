class UserBook < ActiveRecord::Base
    self.table_name = "users_books"
	belongs_to :book
	belongs_to :user

end
