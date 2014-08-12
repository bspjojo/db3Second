class User < ActiveRecord::Base

has_many :splatts
end

has_and_belongs_to_many :follows
    class_name: "User",
    join_table: :follows,
    foreign_key: :follower_id,
    association_foreign_key: :followed_id
end

has_and_belongs_to_many :followed_by
    class_name: "User",
    join_table: :followed_by,
    foreign_key: :followed_id,
    association_foreign_key: :follower_id
end

#end of file
end
