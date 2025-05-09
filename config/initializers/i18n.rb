if Rails.env.development?
    I18n.exception_handler = ->(exception, locale, key, options) {
      raise exception if exception.is_a?(I18n::MissingTranslation)
      I18n.default_exception_handler.call(exception, locale, key, options)
    }
  end