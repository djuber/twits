module Locales
  def self.current
    @current || UNITED_STATES
  end

  def  self.current=(new_locale)
    @current = new_locale
  end

  class Locale
    def initialize(postal_code_regex)
      @postal_code_regex = postal_code_regex
    end

    def parse_postal_code(text)
      m = @postal_code_regex.match(text)
      return m[0] if m
    end
  end

  UNITED_STATES = Locale.new(/(\d{5})(-\d{4})?/)
  UNITED_KINGDOM = Locale.new(/[A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][ABD-HJLNP-UW-Z]{2}/)
end
