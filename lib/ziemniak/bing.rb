module Ziemniak
  module Bing
    CLIENT_ID = 'ziemniak'
    CLIENT_SECRET = 'DJ02/9FEcP3kh6J0awNKOLrT2NKEnpnslDn5JGDmEFk='

    def self.get(payload, lang_from, lang_to)
      translator = BingTranslator.new(CLIENT_ID, CLIENT_SECRET)

      english = translator.translate payload, from: lang_from, to: lang_to
      english
    end
  end
end