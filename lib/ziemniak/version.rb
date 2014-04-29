module Ziemniak
  module Version
    MAJOR = 1
    MINOR = 0
    TINY  = 0
    PRE   = 'beta'

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')

    def self.get
      STRING
    end
  end
end