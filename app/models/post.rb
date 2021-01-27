class Post < ApplicationRecord
    belongs_to :user
    after_create{ REDIS.zincrby "posts", 1, self.id}
end
