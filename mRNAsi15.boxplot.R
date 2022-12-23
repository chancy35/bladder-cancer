######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056

#install.packages("ggpubr")

library(ggpubr)
conNum=72                                                              #normal组样品数目
treatNum=539                                                           #tumor组样品数目

setwd("D:\\bioinforamtion\\TCGA-WGCA\\15.boxplot")                          #设置工作目录
rt=read.table("keyGeneExp.txt",sep="\t",header=T,check.names=F,row.names=1)       #读取输入文件
rt=t(rt)
Type=c(rep("N",conNum),rep("T",treatNum))

#准备箱线图的输入文件
data=data.frame()
for(i in colnames(rt)){
  data=rbind(data,cbind(expression=log2(rt[,i]+1),gene=i,Type))
}
write.table(data,file="data.txt",sep="\t",row.names=F,quote=F)

#绘制箱型图
data=read.table("data.txt",sep="\t",header=T,check.names=F)       #读取箱线图输入文件
p=ggboxplot(data, x="gene", y="expression", color = "Type", 
     ylab="Gene expression",
     xlab="",
     palette = c("blue","red") )
p=p+rotate_x_text(60)
pdf(file="boxplot.pdf",width=8,height=5)                          #输出图片文件
p+stat_compare_means(aes(group=Type),symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", "ns")),label = "p.signif",size=2)
dev.off()

######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056