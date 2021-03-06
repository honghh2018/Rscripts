

#read file and tranfer to matrix
mydata<-as.matrix(read.table("All_gene_fpkm.list",header=F,sep="\t")) #read in T01, T02 and so on matrix
myhead_id<-mydata[1,] #get column name
mydata<-mydata[-1,]  #delete first row
myres<-matrix(NA,nrow=nrow(mydata),ncol=ncol(mydata))
for (i in 2:nrow(myres)){
  myres[1,1]<-colnames(c(myhead_id[1]),paste(myhead_id[2],myhead_id[3],sep="_"),
                       paste(myhead_id[4],myhead_id[5],paste(myhead_id[6],myhead_id[7])))  #get T01_T02 format,wrong，right below
  myres[i,1]=mydata[i,1] #get gene_id
  myres[i,2]=as.numeric(mydata[i,2])+as.numeric(mydata[i,3])    #sum of two column
  myres[i,3]=as.numeric(mydata[i,4])+as.numeric(mydata[i,5])    #"as.matrix()"tranfer column string into numeric
  myres[i,4]=as.numeric(mydata[i,6])+as.numeric(mydata[i,7])
}

write.table(myres,file="result.txt",append=FALSE,quote=FALSE,col.names=TRUE,sep="\t")

##########################################
#read file and tranfer to matrix
mydata<-as.matrix(read.table("test.txt",header=F,sep="\t")) #read in T01, T02 and so on matrix
myhead_id<-mydata[1,] #get column name
mydata<-mydata[-1,]  #delete first row
#myres<-matrix(NA,nrow=nrow(mydata),ncol=ncol(mydata),sep="\t")
b<-paste(myhead_id[2],myhead_id[3],sep="_")
myres<-matrix(NA,nrow=nrow(mydata),ncol=4)
#colnames(c(myhead_id[1],paste(myhead_id[2],myhead_id[3],sep="_"),paste(myhead_id[4],myhead_id[5],sep="_"),paste(myhead_id[6],myhead_id[7],sep="_")))

for (i in 1:nrow(myres)){
 # colnames(myres[1,])<-c(myhead_id[1],paste(myhead_id[2],myhead_id[3],sep="_"),paste(myhead_id[4],myhead_id[5],sep="_"),paste(myhead_id[6],myhead_id[7],sep="_"))
    #get T01_T02 format
  colnames(myres[1,],do.NULL = TRUE,prefix="col")  #the right scripts 
  colnames(myres)<-c(myhead_id[1],paste(myhead_id[2],myhead_id[3],sep="_"),paste(myhead_id[4],myhead_id[5],sep="_"),paste(myhead_id[6],myhead_id[7],sep="_"))
   myres[i,1]=mydata[i,1] #get gene_id
  myres[i,2]=as.numeric(mydata[i,2])+as.numeric(mydata[i,3])    #sum of two column
  myres[i,3]=as.numeric(mydata[i,4])+as.numeric(mydata[i,5])
  myres[i,4]=as.numeric(mydata[i,6])+as.numeric(mydata[i,7])
}

write.table(myres,file="result.txt",append=FALSE,quote=FALSE,row.names=FALSE,col.names=TRUE,sep="\t")
#append row.names=FALSE no output sequence ID,for example 1,2,3
#quota=TRUE was add "" for output file.




