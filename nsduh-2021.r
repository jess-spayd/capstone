{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "58f0060d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:22.483985Z",
     "iopub.status.busy": "2023-04-24T21:30:22.481736Z",
     "iopub.status.idle": "2023-04-24T21:30:23.892081Z",
     "shell.execute_reply": "2023-04-24T21:30:23.890319Z"
    },
    "papermill": {
     "duration": 1.419376,
     "end_time": "2023-04-24T21:30:23.894614",
     "exception": false,
     "start_time": "2023-04-24T21:30:22.475238",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "96b88795",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:23.932752Z",
     "iopub.status.busy": "2023-04-24T21:30:23.903481Z",
     "iopub.status.idle": "2023-04-24T21:30:52.593339Z",
     "shell.execute_reply": "2023-04-24T21:30:52.591001Z"
    },
    "papermill": {
     "duration": 28.697953,
     "end_time": "2023-04-24T21:30:52.596167",
     "exception": false,
     "start_time": "2023-04-24T21:30:23.898214",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m58034\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m2988\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \"\\t\"\n",
      "\u001b[31mchr\u001b[39m    (2): FILEDATE, GQTYPE2\n",
      "\u001b[32mdbl\u001b[39m (2986): QUESTID2, CIGEVER, CIGOFRSM, CIGWILYR, CIGTRY, CIGYFU, CIGMFU, C...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "data <- read_tsv('/kaggle/input/nsduh2021/NSDUH_2021_Tab.txt')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "412a4dbb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.606954Z",
     "iopub.status.busy": "2023-04-24T21:30:52.605350Z",
     "iopub.status.idle": "2023-04-24T21:30:52.617372Z",
     "shell.execute_reply": "2023-04-24T21:30:52.615724Z"
    },
    "papermill": {
     "duration": 0.019443,
     "end_time": "2023-04-24T21:30:52.619706",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.600263",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#data_check <- select(data, MEDICARE)\n",
    "#head(data_check)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "88f1ff64",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.629645Z",
     "iopub.status.busy": "2023-04-24T21:30:52.628226Z",
     "iopub.status.idle": "2023-04-24T21:30:52.648918Z",
     "shell.execute_reply": "2023-04-24T21:30:52.646532Z"
    },
    "papermill": {
     "duration": 0.02868,
     "end_time": "2023-04-24T21:30:52.651957",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.623277",
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
       "<ol class=list-inline><li>58034</li><li>2988</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 58034\n",
       "\\item 2988\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 58034\n",
       "2. 2988\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 58034  2988"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "915cfa2d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.662958Z",
     "iopub.status.busy": "2023-04-24T21:30:52.661387Z",
     "iopub.status.idle": "2023-04-24T21:30:52.740179Z",
     "shell.execute_reply": "2023-04-24T21:30:52.738446Z"
    },
    "papermill": {
     "duration": 0.086865,
     "end_time": "2023-04-24T21:30:52.742667",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.655802",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "no_tx_reason <- select(data, \n",
    "                       AMHTXND2, AMHTXYR4, AUUNCOST, AUUNNBR, AUUNJOB, \n",
    "                       AUUNNCOV, AUUNENUF, AUUNWHER, AUUNCFID, AUUNCMIT, \n",
    "                       AUUNNOND, AUUNHNDL, AUUNNHLP, AUUNBUSY, AUUNFOUT, \n",
    "                       AUUNNTSP, AUUNSOR, AUUNRIM2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "a9ee7d32",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.752973Z",
     "iopub.status.busy": "2023-04-24T21:30:52.751538Z",
     "iopub.status.idle": "2023-04-24T21:30:52.788768Z",
     "shell.execute_reply": "2023-04-24T21:30:52.787133Z"
    },
    "papermill": {
     "duration": 0.044646,
     "end_time": "2023-04-24T21:30:52.791010",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.746364",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 18</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>AMHTXND2</th><th scope=col>AMHTXYR4</th><th scope=col>AUUNCOST</th><th scope=col>AUUNNBR</th><th scope=col>AUUNJOB</th><th scope=col>AUUNNCOV</th><th scope=col>AUUNENUF</th><th scope=col>AUUNWHER</th><th scope=col>AUUNCFID</th><th scope=col>AUUNCMIT</th><th scope=col>AUUNNOND</th><th scope=col>AUUNHNDL</th><th scope=col>AUUNNHLP</th><th scope=col>AUUNBUSY</th><th scope=col>AUUNFOUT</th><th scope=col>AUUNNTSP</th><th scope=col>AUUNSOR</th><th scope=col>AUUNRIM2</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "\t<tr><td>2</td><td>1</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 18\n",
       "\\begin{tabular}{llllllllllllllllll}\n",
       " AMHTXND2 & AMHTXYR4 & AUUNCOST & AUUNNBR & AUUNJOB & AUUNNCOV & AUUNENUF & AUUNWHER & AUUNCFID & AUUNCMIT & AUUNNOND & AUUNHNDL & AUUNNHLP & AUUNBUSY & AUUNFOUT & AUUNNTSP & AUUNSOR & AUUNRIM2\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2 & 2 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\t 2 & 2 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\t 2 & 1 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\t 2 & 2 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\t 2 & 2 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\t 2 & 2 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99 & 99\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 18\n",
       "\n",
       "| AMHTXND2 &lt;dbl&gt; | AMHTXYR4 &lt;dbl&gt; | AUUNCOST &lt;dbl&gt; | AUUNNBR &lt;dbl&gt; | AUUNJOB &lt;dbl&gt; | AUUNNCOV &lt;dbl&gt; | AUUNENUF &lt;dbl&gt; | AUUNWHER &lt;dbl&gt; | AUUNCFID &lt;dbl&gt; | AUUNCMIT &lt;dbl&gt; | AUUNNOND &lt;dbl&gt; | AUUNHNDL &lt;dbl&gt; | AUUNNHLP &lt;dbl&gt; | AUUNBUSY &lt;dbl&gt; | AUUNFOUT &lt;dbl&gt; | AUUNNTSP &lt;dbl&gt; | AUUNSOR &lt;dbl&gt; | AUUNRIM2 &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2 | 2 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "| 2 | 2 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "| 2 | 1 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "| 2 | 2 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "| 2 | 2 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "| 2 | 2 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99 |\n",
       "\n"
      ],
      "text/plain": [
       "  AMHTXND2 AMHTXYR4 AUUNCOST AUUNNBR AUUNJOB AUUNNCOV AUUNENUF AUUNWHER\n",
       "1 2        2        99       99      99      99       99       99      \n",
       "2 2        2        99       99      99      99       99       99      \n",
       "3 2        1        99       99      99      99       99       99      \n",
       "4 2        2        99       99      99      99       99       99      \n",
       "5 2        2        99       99      99      99       99       99      \n",
       "6 2        2        99       99      99      99       99       99      \n",
       "  AUUNCFID AUUNCMIT AUUNNOND AUUNHNDL AUUNNHLP AUUNBUSY AUUNFOUT AUUNNTSP\n",
       "1 99       99       99       99       99       99       99       99      \n",
       "2 99       99       99       99       99       99       99       99      \n",
       "3 99       99       99       99       99       99       99       99      \n",
       "4 99       99       99       99       99       99       99       99      \n",
       "5 99       99       99       99       99       99       99       99      \n",
       "6 99       99       99       99       99       99       99       99      \n",
       "  AUUNSOR AUUNRIM2\n",
       "1 99      99      \n",
       "2 99      99      \n",
       "3 99      99      \n",
       "4 99      99      \n",
       "5 99      99      \n",
       "6 99      99      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(no_tx_reason)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "633acdf8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.801839Z",
     "iopub.status.busy": "2023-04-24T21:30:52.800227Z",
     "iopub.status.idle": "2023-04-24T21:30:52.896663Z",
     "shell.execute_reply": "2023-04-24T21:30:52.894986Z"
    },
    "papermill": {
     "duration": 0.104038,
     "end_time": "2023-04-24T21:30:52.898973",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.794935",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    AMHTXND2        AMHTXYR4        AUUNCOST        AUUNNBR         AUUNJOB    \n",
       " Min.   :1.000   Min.   :1.000   Min.   : 1.00   Min.   : 1.00   Min.   : 1.0  \n",
       " 1st Qu.:2.000   1st Qu.:2.000   1st Qu.:99.00   1st Qu.:99.00   1st Qu.:99.0  \n",
       " Median :2.000   Median :2.000   Median :99.00   Median :99.00   Median :99.0  \n",
       " Mean   :1.879   Mean   :1.773   Mean   :89.94   Mean   :90.09   Mean   :90.1  \n",
       " 3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:99.00   3rd Qu.:99.00   3rd Qu.:99.0  \n",
       " Max.   :2.000   Max.   :2.000   Max.   :99.00   Max.   :99.00   Max.   :99.0  \n",
       " NA's   :12137   NA's   :12135                                                 \n",
       "    AUUNNCOV       AUUNENUF        AUUNWHER        AUUNCFID        AUUNCMIT    \n",
       " Min.   : 1.0   Min.   : 1.00   Min.   : 1.00   Min.   : 1.00   Min.   : 1.00  \n",
       " 1st Qu.:99.0   1st Qu.:99.00   1st Qu.:99.00   1st Qu.:99.00   1st Qu.:99.00  \n",
       " Median :99.0   Median :99.00   Median :99.00   Median :99.00   Median :99.00  \n",
       " Mean   :90.1   Mean   :90.05   Mean   :89.99   Mean   :90.08   Mean   :90.07  \n",
       " 3rd Qu.:99.0   3rd Qu.:99.00   3rd Qu.:99.00   3rd Qu.:99.00   3rd Qu.:99.00  \n",
       " Max.   :99.0   Max.   :99.00   Max.   :99.00   Max.   :99.00   Max.   :99.00  \n",
       "                                                                               \n",
       "    AUUNNOND        AUUNHNDL     AUUNNHLP        AUUNBUSY        AUUNFOUT    \n",
       " Min.   : 1.00   Min.   : 1   Min.   : 1.00   Min.   : 1.00   Min.   : 1.00  \n",
       " 1st Qu.:99.00   1st Qu.:99   1st Qu.:99.00   1st Qu.:99.00   1st Qu.:99.00  \n",
       " Median :99.00   Median :99   Median :99.00   Median :99.00   Median :99.00  \n",
       " Mean   :90.09   Mean   :90   Mean   :90.08   Mean   :90.04   Mean   :90.11  \n",
       " 3rd Qu.:99.00   3rd Qu.:99   3rd Qu.:99.00   3rd Qu.:99.00   3rd Qu.:99.00  \n",
       " Max.   :99.00   Max.   :99   Max.   :99.00   Max.   :99.00   Max.   :99.00  \n",
       "                                                                             \n",
       "    AUUNNTSP        AUUNSOR         AUUNRIM2    \n",
       " Min.   : 1.00   Min.   : 1.00   Min.   : 1.00  \n",
       " 1st Qu.:99.00   1st Qu.:99.00   1st Qu.:99.00  \n",
       " Median :99.00   Median :99.00   Median :99.00  \n",
       " Mean   :90.12   Mean   :90.03   Mean   :97.61  \n",
       " 3rd Qu.:99.00   3rd Qu.:99.00   3rd Qu.:99.00  \n",
       " Max.   :99.00   Max.   :99.00   Max.   :99.00  \n",
       "                                                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(no_tx_reason)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "c58dbbf3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.910823Z",
     "iopub.status.busy": "2023-04-24T21:30:52.909313Z",
     "iopub.status.idle": "2023-04-24T21:30:52.921060Z",
     "shell.execute_reply": "2023-04-24T21:30:52.919425Z"
    },
    "papermill": {
     "duration": 0.020231,
     "end_time": "2023-04-24T21:30:52.923695",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.903464",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#write.csv(no_tx_reason, \"subset_no_tx_reason.csv\", row.names = F)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "d98b14dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:52.934979Z",
     "iopub.status.busy": "2023-04-24T21:30:52.933488Z",
     "iopub.status.idle": "2023-04-24T21:30:52.996662Z",
     "shell.execute_reply": "2023-04-24T21:30:52.994874Z"
    },
    "papermill": {
     "duration": 0.215325,
     "end_time": "2023-04-24T21:30:53.143135",
     "exception": false,
     "start_time": "2023-04-24T21:30:52.927810",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "data <- select(data,\n",
    "            MEDICARE,\n",
    "            CAIDCHIP,\n",
    "            CHAMPUS,\n",
    "            PRVHLTIN,\n",
    "            GRPHLTIN,\n",
    "            HLTINALC,\n",
    "            HLTINDRG,\n",
    "            HLTINMNT,\n",
    "            HLTINNOS,\n",
    "            AMHINP2,\n",
    "            AMHOUTP4,\n",
    "            AMHRX2,\n",
    "            AMHTXRC4,\n",
    "            AUMHTELYR2,\n",
    "            AMHTXYR4,\n",
    "            AMHSVTYP4,\n",
    "            AMHTXND2,\n",
    "            AUUNMTYR,\n",
    "            AUUNCOST, AUUNNBR, AUUNJOB, AUUNNCOV, AUUNENUF, AUUNWHER, AUUNCFID, \n",
    "               AUUNCMIT, AUUNNOND, AUUNHNDL, AUUNNHLP, AUUNBUSY, AUUNFOUT, AUUNNTSP, \n",
    "               AUUNSOR, AUUNRIM2,\n",
    "            AGE3,\n",
    "            SERVICE,\n",
    "            SEXATRACT,\n",
    "            SEXIDENT,\n",
    "            SPEAKENGL,\n",
    "            LVLDIFSEE2,\n",
    "            LVLDIFHEAR2,\n",
    "            LVLDIFWALK2,\n",
    "            LVLDIFMEM2,\n",
    "            LVLDIFCARE2,\n",
    "            LVLDIFCOMM2,\n",
    "            IRSEX,\n",
    "            IRMARIT,\n",
    "            IREDUHIGHST2,\n",
    "            EDUHIGHCAT,\n",
    "            NEWRACE2,\n",
    "            HEALTH,\n",
    "            ENRLCOLLST2,\n",
    "            IRWRKSTAT18,\n",
    "            GOVTPROG,\n",
    "            INCOME, \n",
    "            PDEN10, \n",
    "            COUTYP4)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "9a0c9867",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:53.154792Z",
     "iopub.status.busy": "2023-04-24T21:30:53.153284Z",
     "iopub.status.idle": "2023-04-24T21:30:53.202287Z",
     "shell.execute_reply": "2023-04-24T21:30:53.200563Z"
    },
    "papermill": {
     "duration": 0.058184,
     "end_time": "2023-04-24T21:30:53.205556",
     "exception": false,
     "start_time": "2023-04-24T21:30:53.147372",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 57</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>MEDICARE</th><th scope=col>CAIDCHIP</th><th scope=col>CHAMPUS</th><th scope=col>PRVHLTIN</th><th scope=col>GRPHLTIN</th><th scope=col>HLTINALC</th><th scope=col>HLTINDRG</th><th scope=col>HLTINMNT</th><th scope=col>HLTINNOS</th><th scope=col>AMHINP2</th><th scope=col>⋯</th><th scope=col>IREDUHIGHST2</th><th scope=col>EDUHIGHCAT</th><th scope=col>NEWRACE2</th><th scope=col>HEALTH</th><th scope=col>ENRLCOLLST2</th><th scope=col>IRWRKSTAT18</th><th scope=col>GOVTPROG</th><th scope=col>INCOME</th><th scope=col>PDEN10</th><th scope=col>COUTYP4</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>2</td><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>2</td><td>⋯</td><td> 9</td><td>3</td><td>1</td><td>4</td><td>5</td><td>4</td><td>1</td><td>1</td><td>2</td><td>3</td></tr>\n",
       "\t<tr><td>1</td><td>2</td><td>2</td><td>1</td><td> 2</td><td> 1</td><td> 1</td><td> 1</td><td>99</td><td>2</td><td>⋯</td><td>11</td><td>4</td><td>1</td><td>3</td><td>5</td><td>4</td><td>2</td><td>4</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>2</td><td>1</td><td> 1</td><td> 2</td><td> 2</td><td> 2</td><td>99</td><td>2</td><td>⋯</td><td>11</td><td>4</td><td>1</td><td>2</td><td>5</td><td>1</td><td>2</td><td>2</td><td>2</td><td>2</td></tr>\n",
       "\t<tr><td>2</td><td>1</td><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td>99</td><td>2</td><td>⋯</td><td> 6</td><td>1</td><td>1</td><td>2</td><td>5</td><td>4</td><td>2</td><td>2</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>2</td><td>2</td><td>99</td><td>99</td><td>99</td><td>99</td><td> 2</td><td>2</td><td>⋯</td><td> 8</td><td>2</td><td>7</td><td>1</td><td>5</td><td>4</td><td>2</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2</td><td>2</td><td>2</td><td>1</td><td> 2</td><td>94</td><td> 1</td><td> 1</td><td>99</td><td>2</td><td>⋯</td><td> 4</td><td>1</td><td>7</td><td>3</td><td>5</td><td>4</td><td>2</td><td>3</td><td>1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 57\n",
       "\\begin{tabular}{lllllllllllllllllllll}\n",
       " MEDICARE & CAIDCHIP & CHAMPUS & PRVHLTIN & GRPHLTIN & HLTINALC & HLTINDRG & HLTINMNT & HLTINNOS & AMHINP2 & ⋯ & IREDUHIGHST2 & EDUHIGHCAT & NEWRACE2 & HEALTH & ENRLCOLLST2 & IRWRKSTAT18 & GOVTPROG & INCOME & PDEN10 & COUTYP4\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & ⋯ & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1 & 2 & 2 & 2 & 99 & 99 & 99 & 99 & 99 & 2 & ⋯ &  9 & 3 & 1 & 4 & 5 & 4 & 1 & 1 & 2 & 3\\\\\n",
       "\t 1 & 2 & 2 & 1 &  2 &  1 &  1 &  1 & 99 & 2 & ⋯ & 11 & 4 & 1 & 3 & 5 & 4 & 2 & 4 & 1 & 1\\\\\n",
       "\t 2 & 2 & 2 & 1 &  1 &  2 &  2 &  2 & 99 & 2 & ⋯ & 11 & 4 & 1 & 2 & 5 & 1 & 2 & 2 & 2 & 2\\\\\n",
       "\t 2 & 1 & 2 & 2 & 99 & 99 & 99 & 99 & 99 & 2 & ⋯ &  6 & 1 & 1 & 2 & 5 & 4 & 2 & 2 & 1 & 1\\\\\n",
       "\t 2 & 2 & 2 & 2 & 99 & 99 & 99 & 99 &  2 & 2 & ⋯ &  8 & 2 & 7 & 1 & 5 & 4 & 2 & 1 & 1 & 1\\\\\n",
       "\t 2 & 2 & 2 & 1 &  2 & 94 &  1 &  1 & 99 & 2 & ⋯ &  4 & 1 & 7 & 3 & 5 & 4 & 2 & 3 & 1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 57\n",
       "\n",
       "| MEDICARE &lt;dbl&gt; | CAIDCHIP &lt;dbl&gt; | CHAMPUS &lt;dbl&gt; | PRVHLTIN &lt;dbl&gt; | GRPHLTIN &lt;dbl&gt; | HLTINALC &lt;dbl&gt; | HLTINDRG &lt;dbl&gt; | HLTINMNT &lt;dbl&gt; | HLTINNOS &lt;dbl&gt; | AMHINP2 &lt;dbl&gt; | ⋯ ⋯ | IREDUHIGHST2 &lt;dbl&gt; | EDUHIGHCAT &lt;dbl&gt; | NEWRACE2 &lt;dbl&gt; | HEALTH &lt;dbl&gt; | ENRLCOLLST2 &lt;dbl&gt; | IRWRKSTAT18 &lt;dbl&gt; | GOVTPROG &lt;dbl&gt; | INCOME &lt;dbl&gt; | PDEN10 &lt;dbl&gt; | COUTYP4 &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 2 | 2 | 2 | 99 | 99 | 99 | 99 | 99 | 2 | ⋯ |  9 | 3 | 1 | 4 | 5 | 4 | 1 | 1 | 2 | 3 |\n",
       "| 1 | 2 | 2 | 1 |  2 |  1 |  1 |  1 | 99 | 2 | ⋯ | 11 | 4 | 1 | 3 | 5 | 4 | 2 | 4 | 1 | 1 |\n",
       "| 2 | 2 | 2 | 1 |  1 |  2 |  2 |  2 | 99 | 2 | ⋯ | 11 | 4 | 1 | 2 | 5 | 1 | 2 | 2 | 2 | 2 |\n",
       "| 2 | 1 | 2 | 2 | 99 | 99 | 99 | 99 | 99 | 2 | ⋯ |  6 | 1 | 1 | 2 | 5 | 4 | 2 | 2 | 1 | 1 |\n",
       "| 2 | 2 | 2 | 2 | 99 | 99 | 99 | 99 |  2 | 2 | ⋯ |  8 | 2 | 7 | 1 | 5 | 4 | 2 | 1 | 1 | 1 |\n",
       "| 2 | 2 | 2 | 1 |  2 | 94 |  1 |  1 | 99 | 2 | ⋯ |  4 | 1 | 7 | 3 | 5 | 4 | 2 | 3 | 1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  MEDICARE CAIDCHIP CHAMPUS PRVHLTIN GRPHLTIN HLTINALC HLTINDRG HLTINMNT\n",
       "1 1        2        2       2        99       99       99       99      \n",
       "2 1        2        2       1         2        1        1        1      \n",
       "3 2        2        2       1         1        2        2        2      \n",
       "4 2        1        2       2        99       99       99       99      \n",
       "5 2        2        2       2        99       99       99       99      \n",
       "6 2        2        2       1         2       94        1        1      \n",
       "  HLTINNOS AMHINP2 ⋯ IREDUHIGHST2 EDUHIGHCAT NEWRACE2 HEALTH ENRLCOLLST2\n",
       "1 99       2       ⋯  9           3          1        4      5          \n",
       "2 99       2       ⋯ 11           4          1        3      5          \n",
       "3 99       2       ⋯ 11           4          1        2      5          \n",
       "4 99       2       ⋯  6           1          1        2      5          \n",
       "5  2       2       ⋯  8           2          7        1      5          \n",
       "6 99       2       ⋯  4           1          7        3      5          \n",
       "  IRWRKSTAT18 GOVTPROG INCOME PDEN10 COUTYP4\n",
       "1 4           1        1      2      3      \n",
       "2 4           2        4      1      1      \n",
       "3 1           2        2      2      2      \n",
       "4 4           2        2      1      1      \n",
       "5 4           2        1      1      1      \n",
       "6 4           2        3      1      1      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "02cc10a8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:53.217652Z",
     "iopub.status.busy": "2023-04-24T21:30:53.216205Z",
     "iopub.status.idle": "2023-04-24T21:30:53.228830Z",
     "shell.execute_reply": "2023-04-24T21:30:53.227226Z"
    },
    "papermill": {
     "duration": 0.02194,
     "end_time": "2023-04-24T21:30:53.231923",
     "exception": false,
     "start_time": "2023-04-24T21:30:53.209983",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#write.csv(data, \"nsduh-2021-subset.csv\", row.names = F)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "accd6084",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-24T21:30:53.244339Z",
     "iopub.status.busy": "2023-04-24T21:30:53.242553Z",
     "iopub.status.idle": "2023-04-24T21:30:53.254485Z",
     "shell.execute_reply": "2023-04-24T21:30:53.252905Z"
    },
    "papermill": {
     "duration": 0.020487,
     "end_time": "2023-04-24T21:30:53.256906",
     "exception": false,
     "start_time": "2023-04-24T21:30:53.236419",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#write.csv(data, \"data-subset-with-reasons-notx.csv\", row.names = F)"
   ]
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
   "duration": 34.295444,
   "end_time": "2023-04-24T21:30:53.482401",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-24T21:30:19.186957",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
