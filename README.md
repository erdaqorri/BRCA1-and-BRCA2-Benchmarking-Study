# Assessing the performance of ten pathogenicity prediction algorithms on a dataset of missense BRCA1 and BRCA2 mutations.
This repository contains all the complementary information for the study: "Assessing the performance of eight pathogenicity prediction algorithms on a dataset of missense BRCA1 and BRCA2 mutations."

## Table of Contents
In this repository you will have access to the following files:

1. Benchmarking Datasets for the BRCA1 and BRCA2 genes.
2. The Confusion Matrices for each gene.
3. The performance evaluation metrics table.
4. Corresponding graphs.
5. AUC Curves.
6. The R script utilized to calculate the performance metrics of these genes.
7. The R script utilized to generate the graphs and AUC curves.

**Materials and Methods**

A) *Benchmarked Prediction Algorithms*

In this study we evaluated the performance of ten prediction algorithms namely, PhD-SNP, PMut, SNPs&GO, PredictSNP, META-SNP, HumDiv (Polyphen-2), HumVar (Polyphen-2),
PROVEAN, Panther-PSEP, and SIFT. 
Of these computational tools, PredictSNP, PhD-SNP, PMut, SNPs&GO, META-SNP, HumDiv, and HumVar utilize machine learning methods such as Random Forests, Naive Bayes, and Support Vector Machines (SVM) to distingiush between pathogenic and benign variants.
All the prediction algorithms with the exception of PROVEAN and Panther-PSEP generate binary outputs for each missense variant, either "Pathogenic/Deleterious" or "Benign/Neutral". HumDiv, HumVar, and Panther-PSEP on the other hand generate three results output: "probably damaging", "possibly damaging", and "neutral", however in this study we dichotomized these results by considering the possibly damaging and probably damaging prediction as "damaging". 

These prediction algorithms were selected based on a stringet set of criteria:
- Availability of the Training Dataset
- Accept amino acid changes as an input
- A minimum of 15 citations in peer reviewed journal in the time period from January 2020 unti April 2022.


B) *Running Parameters*
The above-mentioned prediction algorithms were accessed via their respective web-interfaces and run utilizing default parameters and thresholds as suggested by the authors in their original publications.

C) *Datasets*
To assess the performance of these prediction algorithms we compiled two gene specific benchmarking datasets from the public database ClinVar.

1. BRCA1 benchmarking dataset which consisted of 151 missense variants of which 59 were pathogenic and 92 benign.
2. BRCA2 benchmarking dataset composed of 134 missense variants, 29 pathogenic and 105 benign. 

Variants were retrived from ClinVar according to the following criteria:
- *Gene*: BRCA1/BRCA2
- *Clinical Significance*: Pathogenic/Likely Pathogenic and Benign/Likely Benign
- *Molecular Consequence*: Missense
- *Review Status*: Reviewed by an expert panel and/or Assertion criteria provided. Multiple submitters, no conficts in interpretation.

The retrieved variants were processed to remove in-frame deleterions, insertions, and frameshifts in order to keep only the missense variants.
Moreover, given the proven impact of type 1 circularity (Grim) in the performance of these prediction algorithms, we screned the training datasets of the following tools: PredictSNP, META-SNP, HumDiv, HumVar, PMut, PhD-SNP, and SNPs&GO and removed the overlapping variants between our benchmarking datasets and the training datasets of these tools. Variants that were present in the training dataset of one of tools and not in the others were also removed in order to ensure that the tools were evaluated in the same dataset.

D) Performance Evaluation
The performance of the prediction algorithms was assessed by calculating six statistical metrics namely, sensitivity, specificity, positive predictive value (PPV), negative predictive value (NPV), Matthew's Correlation Coefficient, Accuracy, and Area under the receivr operating characteristic curve. 

**Results**

- Confusion Matrices

BRCA1

| Prediction Algorithms  | True Positives <br>(TP)  | False Negatives <br>(FN)  | True Negatives <br>(TN)  | False Positives <br>(FP)  |
|---|---|---|---|---|
| PMut  | 52  | 7  | 77  | 15  |
| PROVEAN  | 0  | 59  | 64  | 28  |
| SIFT  | 57  | 2  | 36  | 56  |
| SNPs-GO  | 48  | 11  | 85  | 7  |
| PhD-SNP  | 55  | 4  | 49  | 43  |
| PredictSNP  | 55  | 4  | 55  | 37  |
| META-SNP  | 54  | 5  | 58  | 34  |
| Panther-PSEP  | 49  | 10  | 84  | 8  |
| HumVar  | 31  | 28  | 60  | 32  |
| HumDiv  | 43  | 16  | 44  | 48  |

BRCA2

| Prediction Algorithms  | True Positives <br>(TP)  | False Negatives <br>(FN)  | True Negatives <br>(TN)  | False Positives <br>(FP)  |
|---|---|---|---|---|
| PMut  | 52  | 7  | 77  | 15  |
| PROVEAN  | 0  | 59  | 64  | 28  |
| SIFT  | 57  | 2  | 36  | 56  |
| SNPs-GO  | 48  | 11  | 85  | 7  |
| PhD-SNP  | 55  | 4  | 49  | 43  |
| PredictSNP  | 55  | 4  | 55  | 37  |
| META-SNP  | 54  | 5  | 58  | 34  |
| Panther-PSEP  | 49  | 10  | 84  | 8  |
| HumVar  | 31  | 28  | 60  | 32  |
| HumDiv  | 43  | 16  | 44  | 48  |



    **BRCA1**
    
| Software  | ACC <br>(%)  | SEN <br>(%)  | SPE <br>(%)  | PPV <br>(%)  | NPV <br>(%)  | MCC  | AUC  |
|---|---|---|---|---|---|---|---|
| PMut  | 85.43  | 88.14  | 83.70  | 77.61  | 91.67  | 0.71  | 0.90  |
| PROVEAN  | 42.38  | 0.00  | 69.57  | 0.00  | 52.03  | -0.38  | 0.51  |
| SIFT  | 61.59  | 96.61  | 39.13  | 50.44  | 94.74  | 0.40  | 0.91  |
| SNPs&GO  | 88.08  | 81.36  | 92.39  | 87.27  | 88.54  | 0.75  | 0.90  |
| PhD-SNP  | 68.87  | 93.22  | 53.26  | 56.12  | 92.45  | 0.48  | 0.89  |
| PredictSNP  | 72.85  | 93.22  | 59.78  | 59.78  | 93.22  | 0.53  | 0.77  |
| META-SNP  | 74.17  | 91.53  | 63.04  | 61.36  | 92.06  | 0.54  | 0.87  |
| PANTHER-PSEP  | 88.08  | 83.05  | 91.30  | 85.96  | 89.36  | 0.75  | 0.90  |
| HumDiv  | 57.62  | 72.88  | 47.83  | 47.25  | 73.33  | 0.21  | 0.66  |
| HumVar  | 60.26  | 52.54  | 65.22  | 49.21  | 68.18  | 0.18  | 0.65  |

**BRCA2**

| Software  | ACC <br>(%)  | SEN <br>(%)  | SPE <br>(%)  | PPV <br>(%)  | NPV <br>(%)  | MCC  | AUC  |
|---|---|---|---|---|---|---|---|
| PMut  | 93.28  | 75.86  | 98.10  | 91.67  | 93.64  | 0.794  | 0.898  |
| PROVEAN  | 63.43  | 13.79  | 77.14  | 14.29  | 76.42  | -0.092  | 0.544  |
| SIFT  | 61.94  | 93.10  | 53.33  | 35.53  | 96.55  | 0.386  | 0.859  |
| SNPs&GO  | 88.81  | 55.17  | 98.10  | 88.89  | 88.79  | 0.643  | 0.801  |
| PhD-SNP  | 78.36  | 65.52  | 81.90  | 50.00  | 89.58  | 0.433  | 0.795  |
| PredictSNP  | 76.12  | 82.76  | 74.29  | 47.06  | 93.98  | 0.484  | 0.678  |
| META-SNP  | 79.85  | 65.52  | 83.81  | 52.78  | 89.80  | 0.458  | 0.805  |
| PANTHER-PSEP  | 73.88  | 86.21  | 70.48  | 44.64  | 94.87  | 0.473  | 0.850  |
| HumDiv  | 69.40  | 89.66  | 63.81  | 40.63  | 95.71  | 0.441  | 0.874  |
| HumVar  | 79.10  | 82.76  | 78.10  | 51.06  | 94.25  | 0.525  | 0.902  |

Images
MCC

![This is an image](https://onedrive.live.com/?cid=27FBAE497306732F&id=27FBAE497306732F%2119476&parId=27FBAE497306732F%2119467&o=OneUp)



