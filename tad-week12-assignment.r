{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "79e89406",
   "metadata": {
    "papermill": {
     "duration": 0.006001,
     "end_time": "2023-04-27T18:43:47.599256",
     "exception": false,
     "start_time": "2023-04-27T18:43:47.593255",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Week 12 Assignment\n",
    "\n",
    "1) Describe how each of the following metrics can be used to assess a Naive Bayes or other types of classifiers:\n",
    "\n",
    "- Accuracy\n",
    "\n",
    "- Precision\n",
    "\n",
    "- Recall\n",
    "\n",
    "2) Give an example for each of the three metrics above where you believe one would be better suited than the other three.\n",
    "\n",
    "3) Calculate accuracy, precision and recall for your Week 7 or 9 (Naive Bayes or SVM) homework.\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d93defa0",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:47.614227Z",
     "iopub.status.busy": "2023-04-27T18:43:47.612310Z",
     "iopub.status.idle": "2023-04-27T18:43:51.573301Z",
     "shell.execute_reply": "2023-04-27T18:43:51.571479Z"
    },
    "papermill": {
     "duration": 3.971948,
     "end_time": "2023-04-27T18:43:51.575903",
     "exception": false,
     "start_time": "2023-04-27T18:43:47.603955",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Package version: 3.2.4\n",
      "Unicode version: 13.0\n",
      "ICU version: 66.1\n",
      "\n",
      "Parallel computing: 4 of 4 threads used.\n",
      "\n",
      "See https://quanteda.io for tutorials and examples.\n",
      "\n",
      "Loading required package: ggplot2\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n",
      "naivebayes 0.9.7 loaded\n",
      "\n",
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m   masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m      masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mpurrr\u001b[39m::\u001b[32mlift()\u001b[39m     masks \u001b[34mcaret\u001b[39m::lift()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mcaret\u001b[39m::\u001b[32mprogress()\u001b[39m masks \u001b[34mhttr\u001b[39m::progress()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(e1071)\n",
    "library(quanteda)\n",
    "library(caret)\n",
    "library(naivebayes)\n",
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "8e78da22",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.615219Z",
     "iopub.status.busy": "2023-04-27T18:43:51.585591Z",
     "iopub.status.idle": "2023-04-27T18:43:51.835505Z",
     "shell.execute_reply": "2023-04-27T18:43:51.833659Z"
    },
    "papermill": {
     "duration": 0.258658,
     "end_time": "2023-04-27T18:43:51.838601",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.579943",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Import data\n",
    "lyrics <- read.csv('/kaggle/input/lyrics-dataset-deduped/lyrics-dataset-deduped.csv',\n",
    "                   header=FALSE,\n",
    "                stringsAsFactors=FALSE)\n",
    "colnames(lyrics) <- c('Artist', 'Title', 'Album', 'Date', 'Lyric', 'Year')\n",
    "#head(lyrics)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "834d594a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.850297Z",
     "iopub.status.busy": "2023-04-27T18:43:51.848662Z",
     "iopub.status.idle": "2023-04-27T18:43:51.871910Z",
     "shell.execute_reply": "2023-04-27T18:43:51.870118Z"
    },
    "papermill": {
     "duration": 0.032179,
     "end_time": "2023-04-27T18:43:51.874954",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.842775",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# split dataset to have equal sample of gaga and non-gaga songs\n",
    "gaga <- subset(lyrics, Artist == 'Lady Gaga')\n",
    "gaga$label <- 'gaga'\n",
    "not_gaga <- subset(lyrics, Artist != 'Lady Gaga')\n",
    "not_gaga$label <- 'not gaga'\n",
    "\n",
    "#dim(gaga)\n",
    "#dim(not_gaga)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "119452c9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.886370Z",
     "iopub.status.busy": "2023-04-27T18:43:51.884777Z",
     "iopub.status.idle": "2023-04-27T18:43:51.904146Z",
     "shell.execute_reply": "2023-04-27T18:43:51.902317Z"
    },
    "papermill": {
     "duration": 0.028261,
     "end_time": "2023-04-27T18:43:51.907182",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.878921",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# create random sample of non-gaga songs\n",
    "set.seed(328)\n",
    "not_gaga_sample <- not_gaga[sample(1:nrow(not_gaga), 161), ]\n",
    "\n",
    "#dim(not_gaga_sample)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "dd46109f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.918414Z",
     "iopub.status.busy": "2023-04-27T18:43:51.916764Z",
     "iopub.status.idle": "2023-04-27T18:43:51.934103Z",
     "shell.execute_reply": "2023-04-27T18:43:51.932336Z"
    },
    "papermill": {
     "duration": 0.026008,
     "end_time": "2023-04-27T18:43:51.937080",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.911072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# combine back into one dataframe\n",
    "data <- rbind(gaga, not_gaga_sample)\n",
    "\n",
    "#dim(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "f0fc1955",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.948579Z",
     "iopub.status.busy": "2023-04-27T18:43:51.946985Z",
     "iopub.status.idle": "2023-04-27T18:43:51.962344Z",
     "shell.execute_reply": "2023-04-27T18:43:51.960532Z"
    },
    "papermill": {
     "duration": 0.024405,
     "end_time": "2023-04-27T18:43:51.965356",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.940951",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#### metadata\n",
    "meta_list <- list(title = data$Title,\n",
    "                 album = data$Album,\n",
    "                 year = data$Year,\n",
    "                 artist = data$Artist,\n",
    "                 label = data$label)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "43a19203",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:51.976636Z",
     "iopub.status.busy": "2023-04-27T18:43:51.975034Z",
     "iopub.status.idle": "2023-04-27T18:43:52.595719Z",
     "shell.execute_reply": "2023-04-27T18:43:52.593976Z"
    },
    "papermill": {
     "duration": 0.628817,
     "end_time": "2023-04-27T18:43:52.598057",
     "exception": false,
     "start_time": "2023-04-27T18:43:51.969240",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>322</li><li>136</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 322\n",
       "\\item 136\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 322\n",
       "2. 136\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 322 136"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Data preparation\n",
    "## remove songs without lyrics\n",
    "data <- dplyr::filter(data, nchar(data$'Lyric') >= 5)\n",
    "## create corpus\n",
    "data_corpus <- corpus(data, text = 'Lyric', meta = meta_list)\n",
    "## create DFM\n",
    "data_dfm <- data_corpus %>% tokens(remove_punct = TRUE) %>% dfm()\n",
    "## remove stopwords\n",
    "data_dfm <- dfm_remove(data_dfm, stopwords('english'))\n",
    "## stem\n",
    "data_dfm <- dfm_wordstem(data_dfm)\n",
    "## trim\n",
    "data_dfm <- dfm_trim(data_dfm, \n",
    "                     min_docfreq = 0.1, \n",
    "                     max_docfreq = 0.9, \n",
    "                     docfreq_type = 'prop')\n",
    "dim(data_dfm)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "934e0753",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:43:52.610106Z",
     "iopub.status.busy": "2023-04-27T18:43:52.608463Z",
     "iopub.status.idle": "2023-04-27T18:43:52.628605Z",
     "shell.execute_reply": "2023-04-27T18:43:52.626766Z"
    },
    "papermill": {
     "duration": 0.029512,
     "end_time": "2023-04-27T18:43:52.631861",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.602349",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# convert to matrix\n",
    "data_dfm_matrix <- convert(data_dfm, to='matrix')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "fb56841f",
   "metadata": {
    "papermill": {
     "duration": 0.00443,
     "end_time": "2023-04-27T18:43:52.640686",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.636256",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "2cbcb230",
   "metadata": {
    "papermill": {
     "duration": 0.003901,
     "end_time": "2023-04-27T18:43:52.648707",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.644806",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "4) Vary input data in at least three ways  (Eg: Drop/don't drop stop words, keep only common words, label more data) and compute accuracy, precision and recall each time. What worked the best? Why do you think it worked better?\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5e1a16ea",
   "metadata": {
    "papermill": {
     "duration": 0.004047,
     "end_time": "2023-04-27T18:43:52.656749",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.652702",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "2ee4e238",
   "metadata": {
    "papermill": {
     "duration": 0.003944,
     "end_time": "2023-04-27T18:43:52.664689",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.660745",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "5) Super Bonus Question: Create and explain a confusion matrix for one of your model results."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "56478981",
   "metadata": {
    "papermill": {
     "duration": 0.003895,
     "end_time": "2023-04-27T18:43:52.672700",
     "exception": false,
     "start_time": "2023-04-27T18:43:52.668805",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 8.693085,
   "end_time": "2023-04-27T18:43:52.799995",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-27T18:43:44.106910",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
