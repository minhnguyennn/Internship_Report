# frozen_string_literal: true

home_work.rb

require 'test/unit'
include Test::Unit::Assertions

# function check ADN
def check_adn(dna_sequence)
	reverse_complement_strand = ''
	dna_sequence.each_char do |ch|
    if ( ch == 'A')
      reverse_complement_strand += 'T'
    elsif ( ch == 'C')
      reverse_complement_strand += 'G'
    elsif ( ch == 'G')
      reverse_complement_strand += 'C'
    elsif ( ch == 'T')
      reverse_complement_strand += 'A'
    end
  end
  reverse_complement_strand
end

assert_equal(check_adn("AAAA"), "TTTT")
assert_equal(check_adn('ATTGC'), 'TAACG')
assert_equal(check_adn('GTAT'), 'CATA')
assert_equal(check_adn('AAGG'),'TTCC', 'String AAGG is')
assert_equal(check_adn('CGCG'),'GCGC', 'String CGCG is')
assert_equal(check_adn('ATTGC'),'TAACG','String ATTGC is')
assert_equal(check_adn('GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATATATACGAGAGAATACAGATAGACAGATTA'),'CATAGCTAGCTAGCTAGCTAATATAAAAGCTGCTCTAAATTTATATATATATATGCTCTCTTATGTCTATCTGTCTAAT')
