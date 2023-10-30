# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    locale = extract_locale_from_accept_language_header(env)
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale

    app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(env)
    env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first&.to_sym
  end
end
