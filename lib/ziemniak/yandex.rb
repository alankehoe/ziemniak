module Ziemniak
  module Yandex
    #http://api.yandex.com/translate/doc/dg/reference/translate.xml

    YANDEX_URL = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
    API_KEY = 'trnsl.1.1.20140401T213959Z.44261bc9abbbfb75.c4b75f8f64b764f27c37a39a5713fcd3e85a8293'
    LANG_CHOICE = 'lang=pl-en'

    def self.get(payload)
      uri = URI.encode "#{YANDEX_URL}?key=#{API_KEY}&#{LANG_CHOICE}&text=#{payload}"
      response = HTTParty.get uri

      json = JSON.parse response.body
      json['text'][0]
    end
  end
end