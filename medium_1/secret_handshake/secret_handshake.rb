=begin
  input: a decimal number or
         a binary string
  output: an array of strings(secret commands)

  Following are the secret commands:
  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  10000 = Reverse the order of the operations in the secret handshake.

  So for example, we are given number 9.
  9 converted to binary is 1001
  Now we parse 1001 and insert the appropriate commands into the commands array

  use divmod and start from 10000 binary.divmmod, if quotient is 1, reverse variable true now
  use the remainder from above and perform remainder.divmod(1000), if quotient is 1, insert 'jump' into the commands
  use the remainder from above and perform remainder.divmod(100), if quotient is 1, insert 'close your eyes'
  continuing doing until remainder is 0
  if reverse variable is true, reverse the array before returning

  another way could be to parse the string
  - start chopping of from the last index until you go to the start
  - and as you go along keep inderting commands into the array
  - if you reach where you have 10000, reverse the array before returning
=end