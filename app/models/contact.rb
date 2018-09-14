class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  # attribute :file,      :attachment => true
  attribute :message
  attribute :nickname,  captcha: true
  append :remote_ip, :user_agent

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        subject: 'Callista. Message from Contact Form',
        to: "#{Rails.application.credentials[Rails.env.to_sym][:default_email]}",
        from: %("#{name}" <#{email}>)
    }
  end
end

