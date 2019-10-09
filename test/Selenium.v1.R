page=10
keyword="PD-1"
library(RSelenium)
library(xml2)
library(rvest)
remDr <- remoteDriver(remoteServerAddr = "127.0.0.1" 
                      , port = 4444
                      , browserName = "chrome")
remDr$open()
remDr$navigate(htmlpage)
webElem <- remDr$findElement("name", "simpleSearchForm:fpSearch")
webElem$sendKeysToElement(list(keyword,key="enter"))
Sys.sleep(100)
#for (p in 1:page){
infor=data.frame()
for (p in 1:page){
  webElem_page<-remDr$findElement(using="xpath",paste("//*[@id='resultListFormTop:paginator']/table/tbody/tr/td[",p+1,"]",sep=""))
  webElem_page$clickElement()
  Sys.sleep(60)
  fi=data.frame()
  for (i in 0:9){
    re=list()
    webElem_appl<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":detailLink']/span",sep=""))
    re[1]=webElem_appl$getElementText()
    webElem_title<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnTitle']",sep=""))
    re[2]=webElem_title$getElementText()
    webElem_applxia1<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnAn']/span",sep=""))
    re[3]=webElem_applxia1$getElementText()
   #webElem_applxia4<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnIPC']/div/a/span",sep=""))
    webElem_applxia4<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnIPC']",sep=""))
    re[4]=webElem_applxia4$getElementText()
    webElem_ctr<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnCtr']/span",sep=""))
    re[5]=webElem_ctr$getElementText()
    webElem_pub<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnPubDate']/span",sep=""))
    re[6]=webElem_pub$getElementText()
    webElem_ab<-remDr$findElement(using="xpath",paste("//*[@id='resultListForm:resultTable:",i,":resultListTableColumnAbstract']",sep=""))
    re[7]=webElem_ab$getElementText()
    re=data.frame(re)
    names(re)=c("appl","title","applxia1","applxia4","ctr","pub","abstract")
    fi<-rbind(fi,re)
    #print(re)
  }
  #print(fi)
  infor<-rbind(infor,fi)
}
