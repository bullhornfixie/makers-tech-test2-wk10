# Tech Test Makers WK10 - Gilded Rose 

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

The purpose of this exercise was to take some legacy code and refactor it, using a coherent TDD process and making sure it's easier to read and edit/update. 

## Specification 
* The Gilded Rose does a stock take every night on items it sells.
* Each item has a sell_in value and quality value.
* The majority of items decrease in sell_in and quality value every night (with some exceptions on special items).
* On the item "Elixir of the Mongoose" the **sell_in** and *quality **value** reduces by -1 on a stock update.
* The below example shows the legacy code run in IRB.

```
$ irb 
require './lib/gilded_rose'
require './lib/item'
items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
inn = GildedRose.new(items)
inn.update_quality()

=> [#<Item:0x00007fbde811c210 @name="Elixir of the Mongoose", @sell_in=4, @quality=6>] 
```

## My Approach 

There are multiple languages you can attempt this challnge in and my preference was Ruby. I decided to focus on a test-first approach, making sure first that the current code was working. 

First, I wrote tests covering all scenarios for the legacy code. This gave me a thorough understanding of the program before I started refactoring and meant the testing process was accelerated as the existing tests written just needed to be updated.

As you can see from the initial run of the legacy code in IRB, there is single function ```update_quality``` for updating both the sell_in and quality value on an multiple items which was a juicy amount of code! 

My initial thought was to split the update into two methods. Once the update quality method finished executing, it would then 
update the quality value. This would be a starting point which would enable to reveal some further refactoring opportunities. 

End goal, single public method being required to update the stock of the famous Gilded Rose!

## Running Gilded Rose 

1. Clone this repo to your local dir.
2. Make sure you have RSpec installed ```gem install rspec```
3. Run ```rspec``` in your cmd line to run all tests which should pass first time.
4. You can test-drive the Giled Rose yourself! Use IRB.

