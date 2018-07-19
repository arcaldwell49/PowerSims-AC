
Validation for Two-Way Mixed (between by within) ANOVA
------------------------------------------------------

I've previously developed a code for a power simulation of a 2 (between) and 5 (within) ANOVA. We can test this code against Daniel Lakens ANOVA simluation code to see if the two are in agreement

Installation fo simulation results
----------------------------------

This is the local file name for the R environment containing the results of the simulations. If you are knitting this validation yourself make sure to download "<https://raw.githubusercontent.com/arcaldwell49/PowerSims-AC/master/Testing_the_power_simulations.R>"

``` r
load("C:/Users/ac039/Dropbox/Statistics/PowerSims-AC/objects_for_markdown.RData")
```

Type 1 error (i.e., no effect)
------------------------------

We can simulate a null effect by setting all the means to zero. I had an initial concern that the Lakens code would have the between subjects factors would be correlated. We can test this against my code by varying the correlation. The "power" for all effects should by 5% for all effects. This simulation should yield a very small effect size (0.025).

``` r
#Test type 1 error rate
#With correlation of 0.5

#Compare the two results
knitr::kable(as.data.frame(Lakens_Nulln20_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   4.86|        0.025|
| anova\_b   |   4.30|        0.025|
| anova\_a:b |   4.37|        0.026|

``` r
knitr::kable(as.data.frame(Cald_Nulln20r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.16|          4.42|          4.58|                 0.026|                 0.026|                 0.026|

``` r
#With correlation of 0.65

#Compare the two results
knitr::kable(as.data.frame(Lakens_Nulln20_r65$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   5.24|        0.026|
| anova\_b   |   4.28|        0.026|
| anova\_a:b |   4.04|        0.025|

``` r
knitr::kable(as.data.frame(Cald_Nulln20r65$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          4.82|          4.35|          4.56|                 0.025|                 0.026|                 0.026|

``` r
#With correlation of 0.8


#Compare the two results
knitr::kable(as.data.frame(Lakens_Nulln20_r8$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   4.73|        0.025|
| anova\_b   |   4.73|        0.026|
| anova\_a:b |   4.61|        0.026|

``` r
knitr::kable(as.data.frame(Cald_Nulln20r8$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.35|          4.31|          4.47|                 0.026|                 0.026|                 0.026|

Interaction effect
------------------

This simulation is for an interaction effect wherein are expecting no change in the control group and a 0.2 SD increase in the mean at every time point. In the simulations we will vary the correlation between measures and the sample size.

``` r
#Power for interaction
#With correlation of 0.5 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n20_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  35.93|        0.086|
| anova\_b   |  56.13|        0.073|
| anova\_a:b |  56.05|        0.072|

``` r
knitr::kable(as.data.frame(Cald_Inter_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         35.86|         56.56|         56.42|                 0.085|                 0.073|                 0.073|

``` r
#With correlation of 0.75 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n20_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  27.70|        0.070|
| anova\_b   |  89.37|        0.115|
| anova\_a:b |  88.97|        0.116|

``` r
knitr::kable(as.data.frame(Cald_Inter_n20_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         27.45|         89.05|         88.79|                 0.071|                 0.116|                 0.116|

``` r
#With correlation of 0.5 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n40_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  62.94|        0.074|
| anova\_b   |  90.00|        0.060|
| anova\_a:b |  90.29|        0.060|

``` r
knitr::kable(as.data.frame(Cald_Inter_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         63.05|         89.91|         90.38|                 0.074|                  0.06|                  0.06|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n40_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  49.70|        0.059|
| anova\_b   |  99.86|        0.102|
| anova\_a:b |  99.82|        0.103|

``` r
knitr::kable(as.data.frame(Cald_Inter_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         50.57|         99.78|         99.82|                 0.059|                 0.103|                 0.103|

Main Effect: Between Subjects
-----------------------------

This simulation is for a main effect between subjects wherein we are expecting the experimental group is 0.5 SD higher than the control at all time point. In the simulations we will vary the correlation between measures and the sample size.

``` r
#Power for Main Effect for between subjects
#With correlation of 0.5 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainB_n20_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  52.02|        0.117|
| anova\_b   |   4.18|        0.025|
| anova\_a:b |   4.36|        0.026|

``` r
knitr::kable(as.data.frame(Cald_MainB_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         50.85|          4.35|          4.68|                 0.115|                 0.026|                 0.026|

``` r
#With correlation of 0.75 and sample size of 20


#Compare the two results

#Compare the two results
knitr::kable(as.data.frame(Lakens_MainB_n40_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  81.46|        0.105|
| anova\_b   |   4.77|        0.013|
| anova\_a:b |   4.69|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainB_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         81.16|          4.43|          4.62|                 0.105|                 0.013|                 0.013|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainB_n40_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  69.59|        0.084|
| anova\_b   |   4.75|        0.013|
| anova\_a:b |   4.38|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainB_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         68.99|          4.61|          4.91|                 0.084|                 0.013|                 0.013|

Main Effect: Within Subjects
----------------------------

This simulation is for a main effect within subjects (repeated measures) wherein we are expecting both groups to have a 0.1 SD increase at every time point. In the simulations we will vary the correlation between measures and the sample size.

``` r
#Power for iMain Effect for within subjects factor
#With correlation of 0.5 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n20_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   4.90|        0.025|
| anova\_b   |  56.48|        0.072|
| anova\_a:b |   4.30|        0.026|

``` r
knitr::kable(as.data.frame(Cald_MainW_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.09|         56.58|          4.01|                 0.025|                 0.073|                 0.025|

``` r
#With correlation of 0.75 and sample size of 20

#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n20_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   5.08|        0.026|
| anova\_b   |  89.05|        0.115|
| anova\_a:b |   4.51|        0.026|

``` r
knitr::kable(as.data.frame(Cald_MainW_n20_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          4.83|         88.84|          4.36|                 0.026|                 0.115|                 0.026|

``` r
#With correlation of 0.5 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n40_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   5.08|        0.013|
| anova\_b   |  90.31|        0.060|
| anova\_a:b |   4.95|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainW_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|           4.9|         89.95|          4.65|                 0.013|                  0.06|                 0.013|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n40_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   5.18|        0.013|
| anova\_b   |  99.76|        0.104|
| anova\_a:b |   4.74|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainW_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|          5.11|         99.85|          4.73|                 0.013|                 0.103|                 0.013|
