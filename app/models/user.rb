class User < ActiveRecord::Base
  has_many :boards
  has_many :cards
  has_many :columns

  has_many :roles

  def allowed_roles
      ["admin", "manager", "card_creator", "voter", "observer"]
  end

  def can_manage_board(board)
      roles.where(board: board, role: ["admin"]).exists?
  end

  def can_manage_columns(board)
      roles.where(board: board, role: ["admin", "manager"]).exists?
  end

  def can_manage_cards(board)
      roles.where(board: board, role: ["admin", "manager", "card_creator"]).exists?
  end

  def can_vote(board)
      roles.where(board: board, role: ["admin", "manager", "card_creator", "voter"]).exists?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  def ensure_authentication_token
      if authentication_token.blank?
          self.authentication_token = generate_authentication_token
      end
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.name = auth.info.name
          user.image = auth.info.image
          user.save
      end
  end

  def self.new_with_session(params, session)
      super.tap  do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
          end
      end
  end

  private

  def generate_authentication_token
      loop do
          token = Devise.friendly_token
          break token unless User.where(authentication_token: token).first
      end
  end
end
