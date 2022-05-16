# Script 3: Graphs ----------------------------------------------------------------

# Study Details -----------------------------------------------------------

# Title: "Assessing the performance of ten pathogenicity prediction algorithms on a dataset of missense brca2 and brca2 mutations."
# Author: Erda Qorri
# Date: 16/05/2022
# Laboratory: HCEMM-BRC Mutagenesis and Carcinogenesis Research Group, Institute of Genetics, Biological Research Centre, Szeged H-6726, Hungary.

# Libraries ----
library(ggplot2)
library(readxl)
library(reshape2)
library(magrittr)
library(tidyverse)
library(plotly)
library(RColorBrewer)
library(lattice)

# Sets the font to Helvetica
windowsFonts("Helvetica" = windowsFont("Helvetica"))


# Graph 1: Sensitivity ----
brca1 <- read_excel("BRCA11_MAY.xlsx")
brca2 <- read_excel("brca2_MAY.xlsx")

brca_sen <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$Sensitivity),
  BRCA2 = c(brca2$Sensitivity)
)

# Reshapes the data into an appropriate format for ggplot2
reshaped_brca_sen <- melt(brca_sen)
head(reshaped_brca_sen)
# names(reshaped_brca_sen)[2] = "Datasets"

brca_sen_1 <- reshaped_brca_sen %>%
  arrange(Datasets, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = Datasets) +
  geom_col(position = "dodge", width = 0.75) + theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("Sensitivity") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    ),
    #plot.margin = margin(t=2.5,1,1,1, "lines"),
    #legend.title = element_blank(),
    #legend.direction = "horizontal",
    legend.position = "none"
    #legend.text = element_text(size = 10)
  )

cbPalette <- c("#D41159", "#1A85FF")
brca_sen_plot <- brca_sen_1 + scale_fill_manual(values = cbPalette)
brca_sen_plot
brca_p <- brca_sen + theme(
  legend.text = element_text(size = 12),
  legend.title = element_text(size = 12),
  legend.title.align = 0.5
)

# Graph 2: BRCA Specificity ----

# The dataframe containing only the specificity values of the genes
brca_spe <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$Specificity),
  BRCA2 = c(brca2$Specificity)
)

reshaped_brca_spe <- melt(brca_spe)
head(reshaped_brca_spe)

brca_spe_plot <- reshaped_brca_spe %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) + theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("Specificity") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    legend.position = "none",
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    )
  )

cbPalette <- c("#D41159", "#1A85FF")
brca_spe_plot_1 <-
  brca_spe_plot + scale_fill_manual(values = cbPalette)
brca_spe_plot_1

# Graph 3: PPV ----

# Creates the PPV dataframe for both genes
brca_ppv <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$PPV),
  BRCA2 = c(brca2$PPV)
)

reshaped_brca_ppv <- melt(brca_ppv)
head(reshaped_brca_ppv)

brca_ppv_plot <- reshaped_brca_ppv %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) +
  theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("PPV") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    legend.position = "none",
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    )
  ) 


cbPalette <- c("#D41159", "#1A85FF")
brca_ppv_plot_1 <-
  brca_ppv_plot + scale_fill_manual(values = cbPalette)
brca_ppv_plot_1


# Graph 4: NPV ----

# Creates the NPV dataframe for both genes
brca_npv <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$NPV),
  BRCA2 = c(brca2$NPV)
)

reshaped_brca_npv <- melt(brca_npv)
head(reshaped_brca_npv)

brca_npv_plot <- reshaped_brca_npv %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) +
  theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("NPV") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    legend.position = "none",
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    )
  ) 

cbPalette <- c("#D41159", "#1A85FF")
brca_npv_plot_1 <-
  brca_npv_plot + scale_fill_manual(values = cbPalette)
brca_npv_plot_1

# Graph 5: BRCA1 vs BRCA2: MCC ----

# Creates the MCC dataframe for both genes
brca_mcc <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$MCC),
  BRCA2 = c(brca2$MCC)
)

reshaped_brca_mcc <- melt(brca_mcc)
head(reshaped_brca_mcc)
windowsFonts("Helvetica" = windowsFont("Helvetica"))
colnames(reshaped_brca_mcc)
names(reshaped_brca_mcc)[names(reshaped_brca_mcc) == "variable"] <-
  "Datasets"

brca_mcc_plot <- reshaped_brca_mcc %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) +
  theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(-0.5, 1)) +
  ggtitle("MCC") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 25,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    ),
    legend.position = "none",
  ) + coord_flip()


cbPalette <- c("#D41159", "#1A85FF")
brca_mcc_plot_1 <-
  brca_mcc_plot + scale_fill_manual(values = cbPalette)
brca_mcc_plot_1

# Graph 6: AUC ----

# Creates the AUC dataframe for both genes
brca_auc <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$AUC),
  BRCA2 = c(brca2$AUC)
)

reshaped_brca_auc <- melt(brca_auc)
head(reshaped_brca_auc)

brca_auc_plot <- reshaped_brca_auc %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) +
  theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("AUC") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    legend.position = "none",
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    )
  ) 


cbPalette <- c("#D41159", "#1A85FF")
brca_auc_plot_1 <-
  brca_auc_plot + scale_fill_manual(values = cbPalette)
brca_auc_plot_1

# Graph 7: Accuracy ----

# Creates the Accuracy dataframe for both genes
brca_acc <- data.frame(
  Software = c(brca1$Software),
  BRCA1 = c(brca1$Acc),
  BRCA2 = c(brca2$Acc)
)

reshaped_brca_acc <- melt(brca_acc)
head(reshaped_brca_acc)

brca_acc_plot <- reshaped_brca_acc %>%
  arrange(variable, desc(value)) %>%
  mutate(Software = factor(Software, levels = unique(Software))) %>%
  ggplot() + aes(x = Software, y = value, fill = variable) +
  geom_col(position = "dodge", width = 0.75) +
  theme_classic() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  ggtitle("Accuracy") +
  ylab("") +
  xlab("") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "plain",
      size = 13,
      color = "black",
      family = "Helvetica"
    ),
    axis.text.x = element_text(
      hjust = 1,
      size = 10,
      angle = 35,
      vjust = 1,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.x = element_text(
      hjust = 0.5,
      size = 11,
      vjust = 0.2
    ),
    axis.text.y = element_text(
      hjust = 0.8,
      size = 10,
      angle = 0,
      color = "black",
      family = "Helvetica"
    ),
    axis.title.y = element_text(
      hjust = 0.5,
      size = 12,
      vjust = 1.5,
      family = "Helvetica"
    ),
    legend.position = "none",
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 0.5
    )
  ) 

cbPalette <- c("#D41159", "#1A85FF")
brca_acc_plot_1 <-
  brca_acc_plot + scale_fill_manual(values = cbPalette)
brca_acc_plot_1