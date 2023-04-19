# Parameter Optimization of SVM

## About SVM and Parameter Optimization

Support Vector Machine or SVM is one of the most popular Supervised Learning algorithms, which is used for Classification as well as Regression problems. However, primarily, it is used for Classification problems in Machine Learning.

Some of the most important parameters of SVM such as kernel, C, and gamma can be changed in order to achieve a higher accuracy. This is called as Hyperparameter Tuning. 

In this project, we aim to optimize the performance of a Support Vector Machines (SVM) model by employing random search to find the best combination of hyperparameters. We will iteratively test different sets of randomly chosen values for kernel, nu, and epsilon parameters to obtain the optimal configuration.

## Dataset

The dataset for the project has been downloaded from the UCI Machine Learning Repository.
[https://archive.ics.uci.edu/ml/datasets/letter+recognition](https://archive.ics.uci.edu/ml/datasets/letter+recognition)

The objective is to identify each of a large number of black-and-white rectangular pixel displays as one of the 26 capital letters in the English alphabet. The character images were based on 20 different fonts and each letter within these 20 fonts was randomly distorted to produce a file of 20,000 unique stimuli. Each stimulus was converted into 16 primitive numerical attributes (statistical moments and edge counts) which were then scaled to fit into a range of integer values from 0 through 15. We typically train on the first 16000 items and then use the resulting model to predict the letter category for the remaining 4000.

Number of Instances: 20000

Number of Attributes: 16

Attribute Information:
1. lettr capital letter (26 values from A to Z)
2. x-box horizontal position of box (integer)
3. y-box vertical position of box (integer)
4. width width of box (integer)
5. high height of box (integer)
6. onpix total # on pixels (integer)
7. x-bar mean x of on pixels in box (integer)
8. y-bar mean y of on pixels in box (integer)
9. x2bar mean x variance (integer)
10. y2bar mean y variance (integer)
11. xybar mean x y correlation (integer)
12. x2ybr mean of x * x * y (integer)
13. xy2br mean of x * y * y (integer)
14. x-ege mean edge count left to right (integer)
15. xegvy correlation of x-ege with y (integer)
16. y-ege mean edge count bottom to top (integer)
17. yegvx correlation of y-ege with x (integer)

## Final Result Table

| Sample | Best Accuracy | Best Kernel |   Best Nu | Best Epsilon |
| -----: | ------------: | :---------- | --------: | -----------: |
|      1 |         40.00 | anovadot    | 0.3679091 |    0.6116197 |
|      2 |         76.47 | anovadot    | 0.3065034 |    0.8800197 |
|      3 |         86.67 | vanilladot  | 0.6477558 |    0.0538456 |
|      4 |         46.67 | polydot     | 0.9695604 |    0.4163183 |
|      5 |         31.25 | vanilladot  | 0.1209874 |    0.3475565 |
|      6 |         18.75 | polydot     | 0.1017456 |    0.2753674 |
|      7 |         52.94 | polydot     | 0.0725906 |    0.0811715 |
|      8 |         84.62 | polydot     | 0.2668772 |    0.4230774 |
|      9 |         55.56 | vanilladot  | 0.3071324 |    0.5090053 |
|     10 |         50.00 | anovadot    | 0.2380044 |    0.8681535 |

## Convergence Graph
![graph](ConvergenceGraph.jpeg)

## Discussion
From the above table, we can observe that sample 8 achieved the highest fitness value of 86.67%, with kernel = vanilladot, nu = 0.6477558, and epsilon = 0.0538456. We will use this sample to discuss the convergence graph.

The convergence graph is a useful tool for visualizing the performance of the model during the hyperparameter optimization process. It plots the accuracy (or other evaluation metrics) of the model over multiple iterations, allowing us to observe how the model improves as it explores different hyperparameter combinations.

In our case, the convergence graph shows the best accuracy achieved up to a particular iteration. This helps us understand how the model performance evolves during the random search process and when it reaches the highest accuracy.

## Project Submitted By:
Name : Jashan Arora
  
Roll No. : 102003206

Sub-Group: 3CO9