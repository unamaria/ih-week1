# Shopping cart

We need something that calculates the total cost of our purchases but also that applies some discounts to some items.

## Iteration 1

Write a shopping cart where you can add items.

## Iteration 2

Our cart needs to also calculate discount. Remember that we need to be open for future developers to write other discounts.

At this moment we have this deals:

* By default, items will have no discount.
* If an item has a discount, it should be calculated by calling a discount method on that item.
* Fruits have no discount during weekdays but on weekends they have a 10% discount.
* Housewares have no discount unless their unit price is more than 100€ / $100. In that case they have a 5% discount.
* When a customer has more than 5 items in their cart, they get a 10% discount for that purchase.