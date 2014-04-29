class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :samples

  before_create :humanize_attributes
  after_create :send_registration_mail

  validates_uniqueness_of :username

  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name

  def self.login(username, password)
    user = User.find_by_username username
    user if user && user.valid_password?(password)
  end

  private

  def humanize_attributes
    self.first_name = first_name.humanize
    self.last_name = last_name.humanize
  end

  def send_registration_mail
    Pony.mail({
                  :to => email,
                  :subject => 'Registration Complete',
                  :body => "Thanks for registering #{first_name} #{last_name}"
              })
  end
end
