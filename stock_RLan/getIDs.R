getIDs <- function(sStockID){
  # transform the data in sStockID into a xts object
  # output: a xts object with trade data of the stock: sStockID
  # input: sStockID, a file named as the stock id
  
  # Ans: 
  #filename="C:/1101/2330.xlsx"
    require(quantmod)
    require(openxlsx)
    require(xts)
    
    sStockID=2330
    
    filename="C:/1101/2330.xlsx"
    stkfilename = paste(filename,sep="")
    stk = read.xlsx(stkfilename, 1,colNames = FALSE)
    Dates=as.Date(stk$X1-2,origin="1900-01-01")#ら戳
    
    open = as.numeric(stk[,4])  # 秨絃基
    high = as.numeric(stk[,5])  # 程蔼基
    low = as.numeric(stk[,6])   # 程基
    close = as.numeric(stk[,7]) # Μ絃基
    transvol = as.numeric(stk[,8]) # Θユ秖
    per = as.numeric(stk[,10]) # 痲ゑ
    
    prices = cbind(open,high,low,close,transvol)
    colnames(prices) = c("Openprice","Highprice","Lowprice","Closeprice","TransVolume")
    result = as.xts(prices,order.by = Dates)
    
    stk_name="TSMC"
    
    
    chartSeries(result,subset="2021-08-30::2022-01-06",theme=chartTheme("white"),
                up.col="red",dn.col="green",name=stk_name,TA="addVo();addSAR()")
}
