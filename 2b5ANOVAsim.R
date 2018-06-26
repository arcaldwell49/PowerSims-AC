ANOVAsim2by5 <- function(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, TEt1Mean=0, TEt2Mean=0,TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
                  r=0.5, SD=1, sample, reps=1000, label, sig = 0.05){
  
  probs <- matrix(nrow = reps, ncol = 4, dimnames = list(c(), c("RepNum",  
                                                                "pvalue_B", "GE_B", "L_B")))
  prop_sig <- matrix(nrow = 1, ncol = 5, dimnames = list(c(), c("Label", 
                                                                "NS_B", "NS_B_prop", 
                                                                "Sig_B", "Sig_B_Prop")))
  
  for (i in seq(1,reps,1)) {
    meansC <- c(TCt1Mean, TCt2Mean, TCt3Mean, TCt4Mean, TCt5Mean)
    sigmaC <- c(SD,SD,SD,SD,SD)
    corMatC <-  matrix(c(1,r,r,r,r,
                         r,1,r,r,r,
                         r,r,1,r,r,
                         r,r,r,1,r,
                         r,r,r,r,1),nrow=5)
    dataC <- simstudy::genCorData(n=sample,mu=meansC,sigma=sigmaC, corMatrix=corMatC)
    
    data_longC <- tidyr::gather(dataC, point, measure, V2:V5, factor_key=TRUE)
    data_longC$time <- NA
    data_longC$time <- ifelse(data_longC$point == 'V1' , 1,
                              ifelse(data_longC$point == 'V2' , 2,
                                     ifelse(data_longC$point == 'V3', 3, 
                                            ifelse(data_longC$point == 'V4', 4, 5))))
    data_longC$time <- as.factor(data_longC$time)
    
    
    
    data_longC$order <- NA
    data_longC$order <- "CON"
    data_longC$order <- as.factor(data_longC$order)
    
    #Other order
    
    meansE <- c(TEt1Mean, TEt2Mean,TEt3Mean, TEt4Mean, TEt5Mean)
    sigmaE <- c(SD,SD,SD,SD,SD)
    corMatE <-  matrix(c(1,r,r,r,r,
                         r,1,r,r,r,
                         r,r,1,r,r,
                         r,r,r,1,r,
                         r,r,r,r,1),nrow=5)
    dataE <- simstudy::genCorData(n=sample,mu=meansE,sigma=sigmaE, corMatrix=corMatE)
    
    data_longE <- tidyr::gather(dataE, point, measure, V1:V5, factor_key=TRUE)
    data_longE$time <- NA
    data_longE$time <- ifelse(data_longE$point == 'V1' , 1,
                              ifelse(data_longE$point == 'V2' , 2,
                                     ifelse(data_longE$point == 'V3' , 3, 
                                            ifelse(data_longE$point == 'V4' , 4,5))))
    data_longE$time <- as.factor(data_longE$time)
    
    
    data_longE$order <- NA
    data_longE$order <- "EXP"
    data_longE$order <- as.factor(data_longE$order)
    
    data_longE$id <- data_longE$id*100
    
    ##melt data together
    
    datarun <- rbind(data_longC, data_longE)
    
    datarun$id <- as.factor(datarun$id)
    
    options(contrasts = c("contr.sum","contr.poly"))
    
    modelRMb <- aov(measure ~ order*time + Error(id/(time)), data=datarun)
    
    
    modB <- lapply(modelRMb, broom::tidy)
    
    
    modB <- modB$`id:time`
    
    
    
    
    probs[i,2] <- modB$p.value[2]
    ifelse(modB$p.value[1] < sig, probs[i,3] <- 0, probs[i,3] <- 1)
    ifelse(probs[i,3] == 0, probs[i,4] <- 1, probs[i,4] <- 0)
    
  }
  
  #Creates column with simulation label
  run_label <- replicate(n = reps, expr = label)
  probs <- cbind(probs, run_label)
  
  #Create summation table of the results
  prop_sig[,1] <- label
  #assigns the probabilities that are greater than or equal to significance level (summation); between
  prop_sig[,2] <- colSums(probs)[3]
  #assigns the probabilities that are greater than or equal to significance level (proportion); between
  prop_sig[,3] <- (prop_sig[,2] / reps)
  #assigns the probabilities that are less than .05 for between
  prop_sig[,4] <- colSums(probs)[4]
  #assigns the probabilities that are less than significance level (proportion); between
  prop_sig[,5] <- (prop_sig[,4] / reps)
  
  
  #Convert all matrices to data.frames
  probs <- data.frame(probs)
  prop_sig <- data.frame(prop_sig)
  
  assign(paste("probs", label, sep = "_"),probs, envir = .GlobalEnv)
  assign(paste("p_sig", label, sep = "_"),prop_sig, envir = .GlobalEnv)
  
}