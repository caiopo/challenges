# Difference Of Squares

Find the difference between the sum of the squares and the square of the sums of the first N natural numbers.

The square of the sum of the first ten natural numbers is,

    (1 + 2 + ... + 10)**2 = 55**2 = 3025

The sum of the squares of the first ten natural numbers is,

    1**2 + 2**2 + ... + 10**2 = 385

Hence the difference between the square of the sum of the first
ten natural numbers and the sum of the squares is 2640:

    3025 - 385 = 2640

### Getting started
First install lua and [luarocks][2] using [homebrew][1]

    $ brew install lua

Then install [busted][3] testing framework for lua

    $ luarocks install busted

Then run your test

    $ busted .

Other resources

  1. [Lua Style Guide][4]
  2. [Learn Lua in 15 minutes][5]

[1]: http://brew.sh/
[2]: http://luarocks.org/
[3]: http://olivinelabs.com/busted/
[4]: https://github.com/Olivine-Labs/lua-style-guide
[5]: http://tylerneylon.com/a/learn-lua/

## Source

Problem 6 at Project Euler [http://projecteuler.net/problem=6](http://projecteuler.net/problem=6)
