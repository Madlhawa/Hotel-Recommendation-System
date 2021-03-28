import scrapy
import os
import shutil
from ..items import Item


class BookingSpider(scrapy.Spider):
    name = 'booking'
    allowed_domains = ['booking.com']
    start_urls = ['https://www.booking.com/']
    dump_path = '../../Data/booking'

    if os.path.exists(dump_path):
        shutil.rmtree(dump_path)
        print('\x1b[0;33;41m' + 'File found & removed ' + dump_path + '!' + '\x1b[0m')

    def parse(self, response):
        for i in range(1):
            url = 'https://www.booking.com/searchresults.html?ss=Sri%20Lanka&rows=25&offset='+str(i*25)
            print('\x1b[1;36;40m' + url + '\x1b[0m')
            yield scrapy.Request(url=url,callback=self.parse_page)

    def parse_page(self, response):
        hotel_urls = response.xpath('//h3/a[@class="js-sr-hotel-link hotel_name_link url"]/@href').extract()
        for hotel_url in hotel_urls:
            hotel_name = hotel_url.split('/')[3].split('.')[0]
            url = 'https://www.booking.com/reviewlist.en-gb.html?cc1=lk;pagename='+hotel_name
            print('\x1b[1;35;40m' + url + '\x1b[0m')
            yield scrapy.Request(url=url,callback=self.parse_hotel)
    
    def parse_hotel(self, response):
        name = response.url.split('=')[-1]
        noOfPages = response.xpath('//a[@class="bui-pagination__link"]/span[1]/text()').extract()[-1]
        print('\x1b[1;34;40m' + name + '\x1b[0m')
        print('\x1b[1;34;40m' + str(noOfPages) + '\x1b[0m')
        for i in range(int(noOfPages)):
            url = 'https://www.booking.com/reviewlist.en-gb.html?cc1=lk;pagename='+name+';offset='+str(i*10)+';rows=10'
            print('\x1b[1;34;40m' + url + '\x1b[0m')
            yield scrapy.Request(url=url,callback=self.parse_reviews)
            
    def  parse_reviews(self, response):
        url = response.url
        hotel_name = url.split('pagename=')[-1].split(';')[0].split('&')[0]
        print('\x1b[1;33;40m' + url + '\x1b[0m')
        print('\x1b[1;33;40m' + hotel_name + '\x1b[0m')
        reviews = response.xpath('//li[@class="review_list_new_item_block"]')
        for review in reviews:
            rating = review.xpath('.//div[@class="bui-review-score__badge"]/text()').extract_first()
            review_content = ' '.join(review.xpath('.//span[@class="c-review__body"]/text()').extract())
            print('\x1b[1;32;40m' + rating + '\x1b[0m')
            print('\x1b[1;32;40m' + str(review_content) + '\x1b[0m')

            item = Item()
            item['hotel_name'] = hotel_name
            item['rating'] = rating
            item['review_content'] = review_content

            yield item