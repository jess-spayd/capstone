{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "7474e75c",
   "metadata": {
    "papermill": {
     "duration": 0.004197,
     "end_time": "2023-04-27T18:19:37.411832",
     "exception": false,
     "start_time": "2023-04-27T18:19:37.407635",
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
   "id": "203268d4",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:37.421391Z",
     "iopub.status.busy": "2023-04-27T18:19:37.419418Z",
     "iopub.status.idle": "2023-04-27T18:19:41.338368Z",
     "shell.execute_reply": "2023-04-27T18:19:41.336584Z"
    },
    "papermill": {
     "duration": 3.926212,
     "end_time": "2023-04-27T18:19:41.340962",
     "exception": false,
     "start_time": "2023-04-27T18:19:37.414750",
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
   "id": "0787d5dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:41.380341Z",
     "iopub.status.busy": "2023-04-27T18:19:41.350214Z",
     "iopub.status.idle": "2023-04-27T18:19:41.619725Z",
     "shell.execute_reply": "2023-04-27T18:19:41.617966Z"
    },
    "papermill": {
     "duration": 0.278243,
     "end_time": "2023-04-27T18:19:41.622951",
     "exception": false,
     "start_time": "2023-04-27T18:19:41.344708",
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
   "id": "cf7fa1ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:41.633509Z",
     "iopub.status.busy": "2023-04-27T18:19:41.631907Z",
     "iopub.status.idle": "2023-04-27T18:19:41.689630Z",
     "shell.execute_reply": "2023-04-27T18:19:41.687891Z"
    },
    "papermill": {
     "duration": 0.065614,
     "end_time": "2023-04-27T18:19:41.692082",
     "exception": false,
     "start_time": "2023-04-27T18:19:41.626468",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# create gaga/not gaga label\n",
    "lyrics <- dplyr::mutate(lyrics, label = if_else(Artist == 'Lady Gaga', 'gaga', 'not gaga'))\n",
    "#head(lyrics)\n",
    "#unique(lyrics$label)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "c735e4eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:41.702812Z",
     "iopub.status.busy": "2023-04-27T18:19:41.701348Z",
     "iopub.status.idle": "2023-04-27T18:19:41.715971Z",
     "shell.execute_reply": "2023-04-27T18:19:41.714274Z"
    },
    "papermill": {
     "duration": 0.022738,
     "end_time": "2023-04-27T18:19:41.718405",
     "exception": false,
     "start_time": "2023-04-27T18:19:41.695667",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#### metadata\n",
    "meta_list <- list(title = lyrics$Title,\n",
    "                 album = lyrics$Album,\n",
    "                 year = lyrics$Year,\n",
    "                 artist = lyrics$Artist,\n",
    "                 label = lyrics$label)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "caa36c6d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:41.729364Z",
     "iopub.status.busy": "2023-04-27T18:19:41.727961Z",
     "iopub.status.idle": "2023-04-27T18:19:45.294647Z",
     "shell.execute_reply": "2023-04-27T18:19:45.292914Z"
    },
    "papermill": {
     "duration": 3.574702,
     "end_time": "2023-04-27T18:19:45.296883",
     "exception": false,
     "start_time": "2023-04-27T18:19:41.722181",
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
       "<ol class=list-inline><li>3019</li><li>173</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 3019\n",
       "\\item 173\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 3019\n",
       "2. 173\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 3019  173"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Data preparation\n",
    "## remove songs without lyrics\n",
    "lyrics <- dplyr::filter(lyrics, nchar(lyrics$'Lyric') >= 5)\n",
    "## create corpus\n",
    "lyrics_corpus <- corpus(lyrics, text = 'Lyric', meta = meta_list)\n",
    "## create DFM\n",
    "lyrics_dfm <- lyrics_corpus %>% tokens(remove_punct = TRUE) %>% dfm()\n",
    "## remove stopwords\n",
    "lyrics_dfm <- dfm_remove(lyrics_dfm, stopwords('english'))\n",
    "## stem\n",
    "lyrics_dfm <- dfm_wordstem(lyrics_dfm)\n",
    "## trim\n",
    "lyrics_dfm <- dfm_trim(lyrics_dfm, \n",
    "                     min_docfreq = 0.1, \n",
    "                     max_docfreq = 0.9, \n",
    "                     docfreq_type = 'prop')\n",
    "dim(lyrics_dfm)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "3f14e1c4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-27T18:19:45.307904Z",
     "iopub.status.busy": "2023-04-27T18:19:45.306458Z",
     "iopub.status.idle": "2023-04-27T18:19:45.325033Z",
     "shell.execute_reply": "2023-04-27T18:19:45.323372Z"
    },
    "papermill": {
     "duration": 0.026582,
     "end_time": "2023-04-27T18:19:45.327440",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.300858",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# convert to matrix\n",
    "lyrics_dfm_matrix <- convert(lyrics_dfm, to='matrix')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e3227d0a",
   "metadata": {
    "papermill": {
     "duration": 0.003664,
     "end_time": "2023-04-27T18:19:45.334948",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.331284",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "cbc0ef8d",
   "metadata": {
    "papermill": {
     "duration": 0.003585,
     "end_time": "2023-04-27T18:19:45.342240",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.338655",
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
   "id": "2b4cb732",
   "metadata": {
    "papermill": {
     "duration": 0.003759,
     "end_time": "2023-04-27T18:19:45.349618",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.345859",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "f42b73c6",
   "metadata": {
    "papermill": {
     "duration": 0.003473,
     "end_time": "2023-04-27T18:19:45.356669",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.353196",
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
   "id": "91a507fd",
   "metadata": {
    "papermill": {
     "duration": 0.003551,
     "end_time": "2023-04-27T18:19:45.363886",
     "exception": false,
     "start_time": "2023-04-27T18:19:45.360335",
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
   "duration": 11.660692,
   "end_time": "2023-04-27T18:19:45.488729",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-27T18:19:33.828037",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
