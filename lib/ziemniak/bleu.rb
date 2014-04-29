module Ziemniak
  module Bleu
    def self.calculate_blue_score(output, reference)
      brevity = output.split.size / reference.split.size
      unigrams = calculate_precision output, reference, 1
      bigrams = calculate_precision output, reference, 2
      trigrams = calculate_precision output, reference, 3
      quadgrams = calculate_precision output, reference, 4

      bleu = (brevity * (unigrams * bigrams * trigrams * quadgrams)) ** 0.25
      bleu
    end

    def self.calculate_precision(output, reference, gram_size)
      output_grams = Ngram.new(output).ngrams gram_size
      reference_grams = Ngram.new(reference).ngrams gram_size

      count = compare_grams output_grams, reference_grams
      count.to_f / reference_grams.size.to_f
    end

    def self.compare_grams(output, reference)
      count = 0
      output.each do |output_gram|
        reference.each do |reference_gram|
          if (reference_gram & output_gram) == output_gram
            count += 1
          end
        end
      end

      count
    end
  end
end