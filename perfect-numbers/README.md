# Perfect Numbers

The Greek mathematician Nicomachus devised a classification scheme for natural numbers.

The Greek mathematican Nicomachus devised a classification scheme for
natural numbers, identifying each as belonging uniquely to the
categories of _abundant_, _perfect_, or _deficient_.  A perfect number
equals the sum of its positive divisors — the pairs of numbers whose
product yields the target number, excluding the number itself.

- Perfect: Sum of factors = number
- Abundant: Sum of factors > number
- Deficient: Sum of factors < number

The Aliquot sum is defined as the sum of the factors of a number not
including the number itself.

## Examples

- 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 +
  3.
- 28 is perfect number because 28 = 1 + 2 + 4 + 7 + 14.
- Prime numbers 7, 13, etc are Deficient by the Nicomachus
  classificaton.

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

Taken from Chapter 2 of Functional Thinking by Neal Ford. [http://shop.oreilly.com/product/0636920029687.do](http://shop.oreilly.com/product/0636920029687.do)
