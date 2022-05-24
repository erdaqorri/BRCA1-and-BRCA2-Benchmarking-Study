
# Assessing the performance of ten pathogenicity prediction algorithms on a dataset of missense BRCA1 and BRCA2 mutations.
This repository contains all the complementary information for the poster: "Assessing the performance of ten pathogenicity prediction algorithms on a dataset of missense BRCA1 and BRCA2 mutations.

### Contact information: alexkouri110@gmail.com

**1. Background**

The routine application of next-generation sequencing in clinical oncology and in particular in the screening of two clinically important genes such as BRCA1 and BRCA2 has resulted in the identification of thousands of genomic variants, whose clinical significance is unknown.
To address this issue, a plethora of bioinformatics algorithms have been developed in the last two decades. These computational methods, however, utilize and weigh different features to predict the clinical significance of these variants, hence systematic benchmarking is imperative in identifying the best-performing algorithms. 

**2. Materials and Methods**

The ten algorithms assessed in this study are:
- PMut<sup>[1]</sup>
- Panther-PSEP<sup>[2]</sup>
- SIFT<sup>[3]</sup>
- SNPs&GO<sup>[4]</sup>
-  META-SNP<sup>[5]</sup>
-   PredictSNP<sup>[6]</sup>
-   PhD-SNP<sup>[7]</sup>
-   PROVEAN<sup>[8]</sup>
-    HumDiv (Polyphen-2)<sup>[9]</sup>
-   HumVar (Polyphen-2)<sup>[10]</sup> 

**2.1** *Datasets*

To assess the performance of these prediction algorithms two gene specific benchmarking datasets were compiled from the public database ClinVar (Table 1).

Variants were retrived from ClinVar according to the following criteria:
- *Gene*: BRCA1/BRCA2
- *Clinical Significance*: Pathogenic/Likely Pathogenic and Benign/Likely Benign
- *Molecular Consequence*: Missense
- *Review Status*: Reviewed by an expert panel and/or Assertion criteria provided. Multiple submitters, no conficts in interpretation.

*Table 1: The benchmarking datasets utilized in this study*
| Datasets | Size     | Pathogenic | Benign   |
|:---:|:---:|:---:|:---:|
| BRCA1 | 151 | 59 | 92 |
| BRCA2 | 134 | 29 | 105 |

The retrieved variants were processed, filtered and then screened against the training datasets of the prediction algorithms. The overlapping variants between our benchmarking datasets and the training datasets were excluded from further analysis.
Moreover, to ensure that the prediction algorithms were evaluated on the same variants, those presents in the training dataset of one of the tools but not in the others were also excluded.

Lastly, the performance of the predictors was evaluated using ten statistical metrics namely, accuracy, sensitivity, specificity, positive predictive value (PPV), negative predictive value (NPV), detection rate, Mathews Correlation Coefficient (MCC), and Area Under the receiver characteristic curve (AUC-ROC). 


**3. Results**

According to our findings, the efficacy of the prediction algorithms can heavily be influenced by the type of the studied gene. Panther-PSEP (74,84%) and SNPs&GO (74,77%) were the most accurate predictors for BRCA1 (Table 2), while PMut (93,28%) was the most accurate predictor for BRCA2 (Table 3).
In the next step, we assessed the ability of these predictors to distinguish between benign and pathogenic variants by utilizing AUC-ROC curves. 
The Area Under the Curve (AUC) takes values in the interval [0, +1], where 0 indicates completely inaccurate predictions, 0.5 random predictions, and a value of 1 indicates a perfect classifier with a zero-classification error rate. 
PROVEAN, as shown in Table 1 and Table 2, is the least discriminating algorithm in both genes, displaying AUC values of 0.51 for BRCA1, and 0.54 for BRCA2. 
In BRCA1, PMut and SNPs&GO both achieved an AUC of 0.93, indicating an excellent ability to distinguish between the two classes. As for BRCA2, HumVar was the most discriminative algorithm with an AUC value of 0.90. 

 *Table 2: The performance metrics for the BRCA1 gene*
    
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

*Table 3: The performance metrics for the BRCA2 gene*

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

**4. Discussions and Conclusions**

In agreement with previous studies, we found that the performance of prediction algorithms depends greatly on the type of gene analyzed. Based on our results, different predictors are required for the classification of BRCA1 and BRCA2 variants. Furthermore, certain predictive models, such as PROVEAN, exhibit strong gene dependence, which can mislead variant interpretation and prediction for BRCA genes. 

Our study concludes that systematic gene-specific benchmarking studies are critical to determining the best performing prediction algorithm for any given gene. 

**5. References**
1. López-Ferrando, V., Gazzo, A., De La Cruz, X., Orozco, M., & Gelpí, J. L. (2017). PMut: A web-based tool for the annotation of pathological variants on proteins, 2017 update. Nucleic Acids Research, 45(W1), W222–W228. https://doi.org/10.1093/nar/gkx313
2. Tang, H., & Thomas, P. D. (2016). PANTHER-PSEP: Predicting disease-causing genetic variants using position-specific evolutionary preservation. Bioinformatics, 32(14), 2230–2232. https://doi.org/10.1093/bioinformatics/btw222
3. Ng, P. C., & Henikoff, S. (2002). Accounting for human polymorphisms predicted to affect protein function. Genome Research, 12(3), 436–446. https://doi.org/10.1101/gr.212802
4. Capriotti, E., Calabrese, R., Fariselli, P., Martelli, P. L., Altman, R. B., & Casadio, R. (2013). WS-SNPs&GO: a web server for predicting the deleterious effect of human protein variants using functional annotation. BMC Genomics, 14 Suppl 3(Suppl 3). https://doi.org/10.1186/1471-2164-14-s3-s6
5. Capriotti, E., Altman, R. B., & Bromberg, Y. (2013). Collective judgment predicts disease-associated single nucleotide variants. BMC Genomics, 14 Suppl 3(Suppl 3), S2. https://doi.org/10.1186/1471-2164-14-s3-s2
6. Bendl, J., Stourac, J., Salanda, O., Pavelka, A., Wieben, E. D., Zendulka, J., Brezovsky, J., & Damborsky, J. (2014). PredictSNP: Robust and Accurate Consensus Classifier for Prediction of Disease-Related Mutations. PLoS Computational Biology, 10(1), 1–11. https://doi.org/10.1371/journal.pcbi.1003440
7. Capriotti E, Calabrese R, Casadio R. Predicting the insurgence of human genetic diseases associated to single point protein mutations with support vector machines and evolutionary information. Bioinformatics. 2006;14(22):2729–2734. doi: 10.1093/nar/gkg509. 
8. Choi, Y., Sims, G. E., Murphy, S., Miller, J. R., & Chan, A. P. (2012). Predicting the Functional Effect of Amino Acid Substitutions and Indels. PLoS ONE, 7(10). https://doi.org/10.1371/journal.pone.0046688
9. Adzhubei, I., Jordan, D. M., & Sunyaev, S. R. (2013). Predicting functional effect of human missense mutations using PolyPhen-2. In Current Protocols in Human Genetics (Issue SUPPL.76). https://doi.org/10.1002/0471142905.hg0720s76
10. Adzhubei, I., Jordan, D. M., & Sunyaev, S. R. (2013). Predicting functional effect of human missense mutations using PolyPhen-2. In Current Protocols in Human Genetics (Issue SUPPL.76). https://doi.org/10.1002/0471142905.hg0720s76
