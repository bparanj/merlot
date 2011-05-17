Merlot::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Application Error] ",
  :sender_address => %{"Notifier" <notify@creditcardslogic.com>},
  :exception_recipients => %w{bparanj@gmail.com}


