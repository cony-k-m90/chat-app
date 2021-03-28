class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  #validatesのunlessオプションにメソッド名を指定することで、
  #「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作っています。
  #アソシエーションでbelongs_toを指定した場合は、外部キー（今回はuser_id）が存在するというバリデーションは不要です。
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end