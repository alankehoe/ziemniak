module Ziemniak
  module Nist
    def self.get_nist(output, reference)
      brevity = output.split.size.to_f / reference.split.size.to_f
      unigrams = (calculate_precision output, reference, 1) / output.split.size
      bigrams = (calculate_precision output, reference, 2) / output.split.size
      trigrams = (calculate_precision output, reference, 3) / output.split.size
      quadgrams = (calculate_precision output, reference, 4) / output.split.size

      result = brevity * (unigrams + bigrams + trigrams + quadgrams)
      result
    end

    def self.calculate_precision(output, reference, gram_size)
      output_grams = Ngram.new(output).ngrams gram_size
      reference_grams = Ngram.new(reference).ngrams gram_size

      precision = compare_grams output_grams, reference_grams * info(reference, gram_size)
      precision
    end

    def self.info(reference, gram_size)
      reference_grams = Ngram.new(reference).ngrams gram_size

      result = reference_grams.size.to_f / (reference_grams.size.to_f - 1)
      result
    end

    def self.compare_grams(output, reference)
      count = 0.0
      output.each do |output_gram|
        reference.each do |reference_gram|
          if (reference_gram & output_gram) == output_gram
            count += 1.0
          end
        end
      end

      count
    end
  end
end