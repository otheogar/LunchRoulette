class GoogleUserAuthorizer

  UnacceptableDomainError = Class.new(StandardError)

  ALLOWED_DOMAINS = %w{appfolio mycase}

  def self.find_or_create!(access_token)
    new(access_token).find_or_create!
  end

  attr_reader :email

  def initialize(token)
    @email = token.info.email

    raise unacceptable_domain_error unless appfolio_user?
  end

  def find_or_create!
    return pre_authorized_user if pre_authorized_user.present?
    create_user!
  end

  private

  def pre_authorized_user
    @pre_auth ||= User.find_by(email: email)
  end

  def appfolio_user?
    !!email.match(/@(?:#{ALLOWED_DOMAINS.join('|')})\.com\Z/)
  end

  def unacceptable_domain_error
    UnacceptableDomainError.new("Tried to user email: #{email}")
  end

  def create_user!
    User.create!(
      email: email,
      password: Devise.friendly_token[0,20]
    )
  end

end
