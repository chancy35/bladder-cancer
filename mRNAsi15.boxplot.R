######Video source: https://ke.biowolf.cn
######������ѧ��: https://www.biowolf.cn/
######΢�Ź��ںţ�biowolf_cn
######�������䣺2749657388@qq.com
######����΢��: 18520221056

#install.packages("ggpubr")

library(ggpubr)
conNum=72                                                              #normal����Ʒ��Ŀ
treatNum=539                                                           #tumor����Ʒ��Ŀ

setwd("D:\\bioinforamtion\\TCGA-WGCA\\15.boxplot")                          #���ù���Ŀ¼
rt=read.table("keyGeneExp.txt",sep="\t",header=T,check.names=F,row.names=1)       #��ȡ�����ļ�
rt=t(rt)
Type=c(rep("N",conNum),rep("T",treatNum))

#׼������ͼ�������ļ�
data=data.frame()
for(i in colnames(rt)){
  data=rbind(data,cbind(expression=log2(rt[,i]+1),gene=i,Type))
}
write.table(data,file="data.txt",sep="\t",row.names=F,quote=F)

#��������ͼ
data=read.table("data.txt",sep="\t",header=T,check.names=F)       #��ȡ����ͼ�����ļ�
p=ggboxplot(data, x="gene", y="expression", color = "Type", 
     ylab="Gene expression",
     xlab="",
     palette = c("blue","red") )
p=p+rotate_x_text(60)
pdf(file="boxplot.pdf",width=8,height=5)                          #���ͼƬ�ļ�
p+stat_compare_means(aes(group=Type),symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", "ns")),label = "p.signif",size=2)
dev.off()

######Video source: https://ke.biowolf.cn
######������ѧ��: https://www.biowolf.cn/
######΢�Ź��ںţ�biowolf_cn
######�������䣺2749657388@qq.com
######����΢��: 18520221056