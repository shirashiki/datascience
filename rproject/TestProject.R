tidydata <- read.table(file="./SubmissionTidyData.txt",
                          header=TRUE)
write.table(colnames(tidydata), file="./test_colnames.txt",
            append=FALSE,
            sep="\t",
            row.names=FALSE, 
            col.names=TRUE )