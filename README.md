# Tech Test Makers WK10 - Gilded Rose 

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

The purpose of this exercise was to take some legacy code and refactor it, using a coherent TDD process and making sure it's easier to read and edit/update. There are multiple languages you can attempt this challnge in and my preference was Ruby. 

I decided to focus on a test-first approach, making sure first that the current code was working. Once I had written tests covering all scenarios for the legacy code, I decided to start refactoring, regularly checking that legacy code worked.

Once I was happy with some initial refactoring, to make the code readable and following SRPs, I continued with TDD-ing the 'Conjure' feature. This uncovered some further opportunities for refactoring, which meant that the code ended up more more readable, with only a single public method being required to update the stock of the famous Gilded Rose!

## Running Gilded Rose 

1. Clone this repo to your local dir.
2. Make sure you have RSpec installed ```gem install rspec```
3. Run ```rspec``` in your cmd line to run all tests which should pass first time.
4. You can test-drive the Giled Rose yourself! Use IRB.

```
$ irb 
```