module Ziemniak
  class Ngram
    attr_accessor :options

    def initialize(target, options = {regex: / /})
      @target = target
      @options = options
    end

    def ngrams(n)
      @target.split(@options[:regex]).each_cons(n).to_a
    end
  end
end