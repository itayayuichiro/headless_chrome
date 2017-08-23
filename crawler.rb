require 'selenium-webdriver'
require 'nokogiri'
require 'pp'

ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"

caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {binary: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome', args: ["--headless", "--disable-gpu", "--user-agent=#{ua}", "window-size=1280x800"]})
session = Selenium::WebDriver.for :chrome, desired_capabilities: caps
session.manage.timeouts.implicit_wait = 30
session.navigate.to "https://www.yahoo.co.jp/"
doc = Nokogiri::HTML(session.page_source)
h1_src = doc.css('h1 img')[0][:src]
p h1_src
session.quit