#Mixed Model

MixSim <- function(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, TEt1Mean=0, TEt2Mean=0,TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
                   r=0.5, SD=1, sample, reps=1000, label, sig = 0.05){
  
  probs <- matrix(nrow = reps, ncol = 7, dimnames = list(c(), c("RepNum", "pvalue_Main", "GE_Main", "L_Main", 
                                                                "pvalue_Inter", "GE_Inter", "L_inter")))
  prop_sig <- matrix(nrow = 1, ncol = 9, dimnames = list(c(), c("Label", "NS_Main", "NS_Main_prop", 
                                                                "Sig_Main", "Sig_Main_Prop", 
                                                                "NS_Inter", "NS_Inter_prop", 
                                                                "Sig_Inter", "Sig_Inter_Prop")))
  
  for (i in seq(1,reps,1)) {
    meansC <- c(TCt1Mean, TCt2Mean, TCt3Mean, TCt4Mean, TCt5Mean, TEt1Mean, TEt2Mean,TEt3Mean, TEt4Mean, TEt5Mean)
    sigmaC <- c(SD,SD,SD,SD,SD,SD,SD,SD,SD,SD)
    corMatC <-  matrix(c(1,r,r,r,r,r,r,r,r,r,
                         r,1,r,r,r,r,r,r,r,r,
                         r,r,1,r,r,r,r,r,r,r,
                         r,r,r,1,r,r,r,r,r,r,
                         r,r,r,r,1,r,r,r,r,r,
                         r,r,r,r,r,1,r,r,r,r,
                         r,r,r,r,r,r,1,r,r,r,
                         r,r,r,r,r,r,r,1,r,r,
                         r,r,r,r,r,r,r,r,1,r,
                         r,r,r,r,r,r,r,r,r,1),nrow=10)
    dataC <- simstudy::genCorData(n=sample,mu=meansC,sigma=sigmaC, corMatrix=corMatC)
    
    data_longC <- tidyr::gather(dataC, point, measure, V2:V5, V7:V10, factor_key=TRUE)
    data_longC$time <- NA
    data_longC$time <- ifelse(data_longC$point == 'V2' | data_longC$point == 'V7', 2,
                              ifelse(data_longC$point == 'V3' | data_longC$point == 'V8', 3, 
                                     ifelse(data_longC$point == 'V4' | data_longC$point == 'V9', 4, 5)))
    data_longC$time <- as.factor(data_longC$time)
    
    data_longC$trial <- NA
    data_longC$trial <- ifelse(data_longC$point == "V2" | data_longC$point == "V3" |data_longC$point == "V4" |data_longC$point == "V5", 
                               "CON", "EXP")
    data_longC$trial <- as.factor(data_longC$trial)
    
    data_longC$order <- NA
    data_longC$order <- "CE"
    data_longC$order <- as.factor(data_longC$order)
    
    data_longC$cov <- NA
    data_longC$cov <- ifelse(data_longC$trial == 'CON', data_longC$V1,  data_longC$V6)
    #Other order
    
    meansE <- c(TEt1Mean, TEt2Mean,TEt3Mean, TEt4Mean, TEt5Mean, TCt1Mean, TCt2Mean, TCt3Mean, TCt4Mean, TCt5Mean)
    sigmaE <- c(SD,SD,SD,SD,SD,SD,SD,SD,SD,SD)
    corMatE <-matrix(c(1,r,r,r,r,r,r,r,r,r,
                       r,1,r,r,r,r,r,r,r,r,
                       r,r,1,r,r,r,r,r,r,r,
                       r,r,r,1,r,r,r,r,r,r,
                       r,r,r,r,1,r,r,r,r,r,
                       r,r,r,r,r,1,r,r,r,r,
                       r,r,r,r,r,r,1,r,r,r,
                       r,r,r,r,r,r,r,1,r,r,
                       r,r,r,r,r,r,r,r,1,r,
                       r,r,r,r,r,r,r,r,r,1),nrow=10)
    dataE <- simstudy::genCorData(n=sample,mu=meansE,sigma=sigmaE, corMatrix=corMatE)
    
    data_longE <- tidyr::gather(dataE, point, measure, V2:V5, V7:V10, factor_key=TRUE)
    data_longE$time <- NA
    data_longE$time <- ifelse(data_longE$point == 'V2' | data_longE$point == 'V7', 2,
                              ifelse(data_longE$point == 'V3' | data_longE$point == 'V8', 3, 
                                     ifelse(data_longE$point == 'V4' | data_longE$point == 'V9', 4,5)))
    data_longE$time <- as.factor(data_longE$time)
    
    data_longE$trial <- NA
    data_longE$trial <- ifelse(data_longE$point == "V2" | data_longE$point == "V3" |data_longE$point == "V4" |data_longE$point == "V5", 
                               "EXP", "CON")
    data_longE$trial <- as.factor(data_longE$trial)
    
    data_longE$order <- NA
    data_longE$order <- "EC"
    data_longE$order <- as.factor(data_longE$order)
    
    data_longE$cov <- NA
    data_longE$cov <- ifelse(data_longE$trial == 'EXP', data_longE$V1,  data_longE$V6)
    
    data_longE$id <- data_longE$id*100
    
    
    
    
    ##melt data together
    
    datarun <- rbind(data_longC, data_longE)
    
    datarun$id <- as.factor(datarun$id)
    
    lmvars <- c("id","order", "trial", "time","measure","cov")
    datalm <- datarun[lmvars]
    
    col <- c("df", "AIC", "BIC", "logLik", "deviance", "ChiSq", "ChiDf", "p.value")
    
    lmRed <- lme4::lmer(measure ~ 1 + cov + (1|id), data=datalm, REML=FALSE)
    lmMain <- lme4::lmer(measure ~  trial + cov + (1|id), data=datalm, REML=FALSE)
    lmFull <- lme4::lmer(measure ~  trial*time + cov + (1|id), data=datalm, REML=FALSE)
    
    MainEffect <- as.data.frame(anova(lmRed,lmMain))
    colnames(MainEffect) <- col
    IntrEffect <- as.data.frame(anova(lmMain,lmFull))
    colnames(IntrEffect) <- col
    
    probs[i,2] <- MainEffect$p.value[2]
    ifelse(MainEffect$p.value[2] < sig, probs[i,3] <- 0, probs[i,3] <- 1)
    ifelse(probs[i,3] == 0, probs[i,4] <- 1, probs[i,4] <- 0)
    
    
    probs[i,5] <- IntrEffect$p.value[2]
    ifelse(IntrEffect$p.value[2] < sig, probs[i,6] <- 0, probs[i,6] <- 1)
    ifelse(probs[i,6] == 0, probs[i,7] <- 1, probs[i,7] <- 0)
    
  }
  
  #Creates column with simulation label
  run_label <- replicate(n = reps, expr = label)
  probs <- cbind(probs, run_label)
  
  #Create summation table of the results
  prop_sig[,1] <- label
  #assigns the probabilities that are greater than or equal to significance level (summation); within
  prop_sig[,2] <- colSums(probs)[3]
  #assigns the probabilities that are greater than or equal to significance level (proportion); within
  prop_sig[,3] <- (prop_sig[,2] / reps)
  #assigns the probabilities that are less than .05 for within
  prop_sig[,4] <- colSums(probs)[4]
  #assigns the probabilities that are less than significance level (proportion); within
  prop_sig[,5] <- (prop_sig[,4] / reps)
  #assigns the probabilities that are greater than or equal to significance level (summation); between
  prop_sig[,6] <- colSums(probs)[6]
  #assigns the probabilities that are greater than or equal to significance level (proportion); between
  prop_sig[,7] <- (prop_sig[,6] / reps)
  #assigns the probabilities that are less than .05 for between
  prop_sig[,8] <- colSums(probs)[7]
  #assigns the probabilities that are less than significance level (proportion); between
  prop_sig[,9] <- (prop_sig[,8] / reps)
  
  #Convert all matrices to data.frames
  probs <- data.frame(probs)
  prop_sig <- data.frame(prop_sig)
  
  assign(paste("probs", label, sep = "_"),probs, envir = .GlobalEnv)
  assign(paste("p_sig", label, sep = "_"),prop_sig, envir = .GlobalEnv)
  
}