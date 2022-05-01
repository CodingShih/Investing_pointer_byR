# 畫出蘋果公司與台積電的K線圖以供分析使用
# 參考: https://www.quantmod.com/

# -----------------------------------------------------
#  下載AAPL股價資料
require(quantmod)

AAPL= getSymbols("AAPL",auto.assign = FALSE)

# -----------------------------------------------------
# 劃出蘋果AAPL最近90天的K線圖，K線(上漲:紅色，下跌:綠色，背景: 白色)與成交量，
# 放上SAR指標

chartSeries(AAPL,subset="2021-08-31::2022-01-06",theme=chartTheme("white"),
            up.col="red",dn.col="green",TA="addVo();addSAR()") # 畫2330的數據，TA是顯示的技術指標。

# -----------------------------------------------------
# 撰寫function(命名為getIDs)，可讀取台灣的股價資料，
#         並將該資料轉換成xts格式

getIDs <- function(sStockID)
{
  require(quantmod)
  require(openxlsx)
  require(xts)
  
  sStockID=2330
  
  filename="C:/1101/2330.xlsx"
  stkfilename = paste(filename,sep="")
  stk = read.xlsx(stkfilename, 1,colNames = FALSE)
  Dates=as.Date(stk$X1-2,origin="1900-01-01")#日期
  
  open = as.numeric(stk[,4])  # 開盤價
  high = as.numeric(stk[,5])  # 最高價
  low = as.numeric(stk[,6])   # 最低價
  close = as.numeric(stk[,7]) # 收盤價
  transvol = as.numeric(stk[,8]) # 成交量
  per = as.numeric(stk[,10]) # 純益比
  
  prices = cbind(open,high,low,close,transvol)
  colnames(prices) = c("Openprice","Highprice","Lowprice","Closeprice","TransVolume")
  result = as.xts(prices,order.by = Dates)
  
  return (result)
}
# -----------------------------------------------------
# 以getIDs讀取2330台積電的股價資料

getIDs <- function(sStockID)
{
  require(quantmod)
  require(openxlsx)
  require(xts)
  
  sStockID=2330
  
  filename="C:/1101/2330.xlsx"
  stkfilename = paste(filename,sep="")
  stk = read.xlsx(stkfilename, 1,colNames = FALSE)
  Dates=as.Date(stk$X1-2,origin="1900-01-01")#日期
  
  open = as.numeric(stk[,4])  # 開盤價
  high = as.numeric(stk[,5])  # 最高價
  low = as.numeric(stk[,6])   # 最低價
  close = as.numeric(stk[,7]) # 收盤價
  transvol = as.numeric(stk[,8]) # 成交量
  per = as.numeric(stk[,10]) # 純益比
  
  prices = cbind(open,high,low,close,transvol)
  colnames(prices) = c("Openprice","Highprice","Lowprice","Closeprice","TransVolume")
  result = as.xts(prices,order.by = Dates)
  
  return(result)
}

# -----------------------------------------------------
# 劃出台積電的K線圖，K線(上漲:紅色，下跌:綠色，背景: 白色)與成交量，
# 放上SAR指標
getIDs <- function(sStockID)
{
  require(quantmod)
  require(openxlsx)
  require(xts)
  
  sStockID=2330
  
  filename="C:/1101/2330.xlsx"
  stkfilename = paste(filename,sep="")
  stk = read.xlsx(stkfilename, 1,colNames = FALSE)
  Dates=as.Date(stk$X1-2,origin="1900-01-01")#日期
  
  open = as.numeric(stk[,4])  # 開盤價
  high = as.numeric(stk[,5])  # 最高價
  low = as.numeric(stk[,6])   # 最低價
  close = as.numeric(stk[,7]) # 收盤價
  transvol = as.numeric(stk[,8]) # 成交量
  per = as.numeric(stk[,10]) # 純益比
  
  prices = cbind(open,high,low,close,transvol)
  colnames(prices) = c("Openprice","Highprice","Lowprice","Closeprice","TransVolume")
  result = as.xts(prices,order.by = Dates)
  
  stk_name="TSMC"
  
  
  chartSeries(result,subset="2021-08-30::2022-01-06",theme=chartTheme("white"),
              up.col="red",dn.col="green",name=stk_name,TA="addVo();addSAR()")
}