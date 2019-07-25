=begin
  - write a program that will translate RNA sequences into proteins.

  PROBLEM:
  - RNA can be broken into three nucleotide sequences called `codons`
  - And then translated to a `polypeptide`.
  - For examplle:
  RNA: "AUGUUUUCU" => Codons: "AUG", "UUU", "UCU" => Protein: "Methionine", "Phenylalanine", "Serine"

  RULES:
  - There are four terminating codons. Also called STOP codons.
      if any of these STOP codons are encoutered, all translation ends and protein is terminated. And subsequent codons are ignored.
      - For example:
      RNA: "AUGUUUUCUUAAAUG" =>
      Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>
      Protein: "Methionine", "Phenylalanine", "Serine"

      Fourth codon in the above example is a STOP codon. So we stop translating the proteins from that.

      Below is the table of codons and resulting amino acids
      ###############################
      AUG                 Methionine
      UUU, UUC            Phenylalanine
      UUA, UUG            Leucine
      UCU, UCC, UCA, UCG  Serine
      UAU, UAC            Tyrosine
      UGU, UGC            Cysteine
      UGG                 Tryptophan
      UAA, UAG, UGA       STOP


###### of_codon ############
    in: three letter string
    out: string(name of the codon)

    Data Structure:
    - hash for lookup table
        keys could be the arrays of codon sequences
        and values would be appopriate proteins

    al:
    - create a lookup table for codons
    - evalauate the given string in the lookup table
    - and return the appropriate name

    ########## of_rna ################
    in: a string(multiple sequences of codons)
    out: a string(proteins)

    al:
    - first we need to parse that rna string into codons
    - we can do that with the help of each_cons
    - now we have the codons array.
    - we iterate over the codons array
=end

# require 'pry'

class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    %w(AUG)               => "Methionine",
    %w(UUU UUC)           => "Phenylalanine",
    %w(UUA UUG)           => "Leucine",
    %w(UCU UCC UCA UCG)   => "Serine",
    %w(UAU UAC)           => "Tyrosine",
    %w(UGU UGC)           => "Cysteine",
    %w(UGG)               => "Tryptophan",
    %w(UAA UAG UGA)       => "STOP"
  }
  def self.of_codon(sequence)
    CODONS.each do |codons_arr, protein|
      return protein if codons_arr.include? sequence
    end
  end

  def self.of_rna(sequence)
    raise InvalidCodonError.new if sequence.match?(/[^AUG]/)
    sequence.scan(/.../).map { |codon_seq| of_codon(codon_seq) }
    .take_while { |protein| protein != 'STOP' }
  end
end


