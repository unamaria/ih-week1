# Object oriented Blog

## Basic blog

It should implement:

* Two Classes: Blog and Post
* Every post has a title, a date and text. So it needs also the methods to get that information.
* Blog: It has a container for all the posts. An array or something like that. A blog should be able to create and show a front page through the methods create_front_page and publish_front_page, but feel free to use the methods your want.
* The posts should be ordered by date starting on newest.

## Advanced blog

We should add Sponsered Posts. Let's suppose that the post titled: "Post title 2" is a Sponsored Post. The output should be as follows.
```
Post title 1
**************
Post 1 text
----------------
******Post title 2******
**************
Post 2 text
----------------
Post title 3
**************
Post 3 text
----------------
```

## Bonus blog

So we need to organize posts, and nothing better than pagination. In this new version of the blog, we want that it only shows three posts per page, and at the the bottom, we would like to show the number of pages that it has and it will be very cool if the current page is shown in a different colour (you can use the colorize gem). To change from one page to another, we would like to use the left key and the right key.

To quit, press 'q'.