=begin
  write a small archiving program that stores students' name along with their grades
  Requirements:
  - you should be able to add students to the archive - #add(student, grade)
  - get a list of students enrolled in a certain grade - #grade(num)
  - get a sorted list of students in all grades - #to_h
      grades should be sorted, and names of students in that grade should also be sorted

  PROBLEM:
  - it really is a data structure problem.
  - what data structure are we going to use and how are we going to present it as sorted
  - we can use two arrays, one for grades, and one for names that will have sub arrays
  - or we can use hash, grades in the key, and names in the values
  - I think we can use a different hash for storing of data purposes and a different hash for presenting of data purposes

  al:
  - we can initialize a hash with an empty array as default value for every key
  - and then we can insert names in those arrays opposite the grades as keys

  - and when the time comes to present the data
  - we iterate over the keys of the hash insert them into new one, and setting value arrays after sorting them
=end

class School
  attr_reader :archive

  def initialize
    @archive = {}
  end

  def to_h
    archive.keys.sort.each_with_object(Hash.new([])) do |grade, sorted_hash|
      sorted_hash[grade] = archive[grade].sort
    end
  end

  def add(name, grade)
    archive.include?(grade) ? archive[grade].push(name) : archive[grade] = [name]
  end

  def grade(grade)
    to_h[grade]
  end
end