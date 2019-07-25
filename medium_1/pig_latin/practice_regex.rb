def parse_for_consonant(word)
  consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
  [consonant_split[1], consonant_split[2]]
end

p