
Validation for Two-Way Mixed (between by within) ANOVA
------------------------------------------------------

I've previously developed a code for a power simulation of a 2 (between) and 5 (within) ANOVA. We can test this code against Daniel Lakens ANOVA simluation code to see if the two are in agreement

Installation
------------

We install the functions:

``` r
# Install the two functions from Lakens GitHub by running the code below:

source("https://raw.githubusercontent.com/Lakens/ANOVA_power_simulation/master/ANOVA_design.R")
source("https://raw.githubusercontent.com/Lakens/ANOVA_power_simulation/master/ANOVA_power.R")

#Install the function from Caldwell GitHub by running the code below:

source("https://raw.githubusercontent.com/arcaldwell49/PowerSims-AC/master/2b5ANOVAsim.R")
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
| anova\_a   |   5.26|        0.026|
| anova\_b   |   4.12|        0.025|
| anova\_a:b |   4.28|        0.026|

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
| anova\_a   |   5.10|        0.026|
| anova\_b   |   4.36|        0.026|
| anova\_a:b |   4.16|        0.026|

``` r
knitr::kable(as.data.frame(Cald_Nulln20r65$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.26|          4.42|          4.34|                 0.026|                 0.025|                 0.025|

``` r
#With correlation of 0.8


#Compare the two results
knitr::kable(as.data.frame(Lakens_Nulln20_r8$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   4.68|        0.025|
| anova\_b   |   4.00|        0.025|
| anova\_a:b |   4.30|        0.026|

``` r
knitr::kable(as.data.frame(Cald_Nulln20r8$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.08|          4.54|          4.66|                 0.025|                 0.026|                 0.026|

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
| anova\_a   |  34.76|        0.084|
| anova\_b   |  55.90|        0.072|
| anova\_a:b |  57.02|        0.072|

``` r
knitr::kable(as.data.frame(Cald_Inter_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         35.18|          56.7|         57.08|                 0.085|                 0.073|                 0.073|

``` r
#With correlation of 0.75 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n20_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  27.90|        0.071|
| anova\_b   |  88.80|        0.115|
| anova\_a:b |  88.74|        0.115|

``` r
knitr::kable(as.data.frame(Cald_Inter_n20_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         27.56|         88.78|            89|                 0.071|                 0.116|                 0.116|

``` r
#With correlation of 0.5 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n40_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  62.76|        0.074|
| anova\_b   |  90.16|        0.059|
| anova\_a:b |  90.34|        0.060|

``` r
knitr::kable(as.data.frame(Cald_Inter_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         64.16|         90.24|         91.18|                 0.074|                  0.06|                  0.06|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_Inter_n40_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  49.62|        0.059|
| anova\_b   |  99.88|        0.102|
| anova\_a:b |  99.84|        0.103|

``` r
knitr::kable(as.data.frame(Cald_Inter_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|          51.1|         99.68|         99.86|                 0.059|                 0.103|                 0.103|

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
| anova\_a   |  50.98|        0.116|
| anova\_b   |   4.28|        0.026|
| anova\_a:b |   4.74|        0.026|

``` r
knitr::kable(as.data.frame(Cald_MainB_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|         51.34|          4.14|          4.36|                 0.116|                 0.025|                 0.026|

``` r
#With correlation of 0.75 and sample size of 20


#Compare the two results

#Compare the two results
knitr::kable(as.data.frame(Lakens_MainB_n40_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  80.66|        0.104|
| anova\_b   |   4.98|        0.013|
| anova\_a:b |   4.02|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainB_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|         81.16|          4.28|          4.32|                 0.105|                 0.013|                 0.013|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainB_n40_r75$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |  70.08|        0.084|
| anova\_b   |   4.70|        0.013|
| anova\_a:b |   4.74|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainB_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|          69.7|          4.86|          4.34|                 0.083|                 0.013|                 0.013|

Main Effect: Within Subjects
----------------------------

This simulation is for a main effect within subjects (repeated measures) wherein we are expecting the experimental group is 0.5 SD higher than the control at all time point. In the simulations we will vary the correlation between measures and the sample size.

``` r
#Power for iMain Effect for within subjects factor
#With correlation of 0.5 and sample size of 20


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n20_r5$main_results))
```

|            |  power|  effect size|
|------------|------:|------------:|
| anova\_a   |   4.98|        0.026|
| anova\_b   |  99.82|        0.191|
| anova\_a:b |   4.30|        0.026|

``` r
knitr::kable(as.data.frame(Cald_MainW_n20_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.16|         99.72|          4.22|                 0.026|                  0.19|                 0.026|

``` r
#With correlation of 0.75 and sample size of 20

#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n20_r75$main_results))
```

|            |   power|  effect size|
|------------|-------:|------------:|
| anova\_a   |    5.00|        0.026|
| anova\_b   |  100.00|        0.308|
| anova\_a:b |    4.26|        0.025|

``` r
knitr::kable(as.data.frame(Cald_MainW_n20_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            20|          5.04|           100|          4.46|                 0.026|                 0.308|                 0.026|

``` r
#With correlation of 0.5 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n40_r5$main_results))
```

|            |   power|  effect size|
|------------|-------:|------------:|
| anova\_a   |    5.24|        0.013|
| anova\_b   |  100.00|        0.178|
| anova\_a:b |    4.92|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainW_n40_r5$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|          4.82|           100|          4.46|                 0.013|                 0.178|                 0.013|

``` r
#With correlation of 0.75 and sample size of 40


#Compare the two results
knitr::kable(as.data.frame(Lakens_MainW_n40_r75$main_results))
```

|            |   power|  effect size|
|------------|-------:|------------:|
| anova\_a   |    5.20|        0.013|
| anova\_b   |  100.00|        0.296|
| anova\_a:b |    4.68|        0.013|

``` r
knitr::kable(as.data.frame(Cald_MainW_n40_r75$Simulation_Result))
```

|  Sample\_Size|  Power\_Main1|  Power\_Main2|  Power\_Inter|  Part\_Eta\_Sq\_Main1|  Part\_Eta\_Sq\_Main2|  Part\_Eta\_Sq\_Inter|
|-------------:|-------------:|-------------:|-------------:|---------------------:|---------------------:|---------------------:|
|            40|          4.72|           100|          4.58|                 0.012|                 0.296|                 0.013|
