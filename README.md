# WebCrawler
RSelenium的环境配置

https://blog.csdn.net/weixin_40628687/article/details/78971934

https://zhuanlan.zhihu.com/p/24772389

https://sites.google.com/a/chromium.org/chromedriver/downloads

https://blog.csdn.net/weixin_40628687/article/details/78998740

https://blog.csdn.net/badboy2008/article/details/41316253

java下载地址：http://www.onlinedown.net/soft/61003.htm

需要chrome浏览器，安装java，并把java添加到环境变量，要把和chrome.exe对应版本的chromedriver.exe，chrome.exe放在同一文件夹下，并把该文件夹加入环境变量

配置好后，在cmd环境中输入
java -Dwebdriver.chrome.driver="C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe" -jar G:\vm\selenium-server-standalone-3.0.1.jar

窗口开着不管

打开R

library(RSelenium)
