# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class Item(scrapy.Item):
    hotel_name = scrapy.Field()
    rating = scrapy.Field()
    review_content = scrapy.Field()
