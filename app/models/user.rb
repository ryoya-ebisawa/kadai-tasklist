class User < ApplicationRecord
  # Userインスタンスを保存する前に実行される
  before_save { self.email.downcase! }
  # 文字数制限
  validates :name, presence: true, length: { maximum: 50 }
  
  # 文字数制限 / 文字の正規化（Emailで使用できる文字を制限） / 重複不可
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  # passwordを暗号化
  #変数.authenticate('xxx')でログイン認証できるようになる
  has_secure_password
end
