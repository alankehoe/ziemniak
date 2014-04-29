module Ziemniak
  module Wer
    def self.get_substitutions(output, reference)
      output_unigrams = Ngram.new(output).ngrams 1
      reference_unigrams = Ngram.new(reference).ngrams 1

      out = output_unigrams - reference_unigrams
      out
    end

    def self.get_insertions(output, reference)
      output_unigrams = Ngram.new(output).ngrams 1
      reference_unigrams = Ngram.new(reference).ngrams 1

      out = reference_unigrams - output_unigrams
      out
    end

    def self.get_wer(output, reference)
      insertions = get_insertions output, reference
      substitutions = get_substitutions output, reference
      deletions = reference.split.size - (output.split.size - insertions.size)

      wer = (insertions.size.to_f + substitutions.size.to_f + deletions.to_f) / output.split.size.to_f
      wer
    end
  end
end