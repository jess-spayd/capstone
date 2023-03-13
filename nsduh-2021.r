{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "fe8979c9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T19:57:49.027811Z",
     "iopub.status.busy": "2023-03-13T19:57:49.025337Z",
     "iopub.status.idle": "2023-03-13T19:57:50.663845Z",
     "shell.execute_reply": "2023-03-13T19:57:50.661866Z"
    },
    "papermill": {
     "duration": 1.645859,
     "end_time": "2023-03-13T19:57:50.666430",
     "exception": false,
     "start_time": "2023-03-13T19:57:49.020571",
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
   "id": "5a9aa588",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T19:57:50.703080Z",
     "iopub.status.busy": "2023-03-13T19:57:50.671980Z",
     "iopub.status.idle": "2023-03-13T19:58:23.126801Z",
     "shell.execute_reply": "2023-03-13T19:58:23.124580Z"
    },
    "papermill": {
     "duration": 32.461372,
     "end_time": "2023-03-13T19:58:23.129942",
     "exception": false,
     "start_time": "2023-03-13T19:57:50.668570",
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
   "id": "3fd1389d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T19:58:23.138249Z",
     "iopub.status.busy": "2023-03-13T19:58:23.136659Z",
     "iopub.status.idle": "2023-03-13T19:58:23.150078Z",
     "shell.execute_reply": "2023-03-13T19:58:23.148163Z"
    },
    "papermill": {
     "duration": 0.020514,
     "end_time": "2023-03-13T19:58:23.152877",
     "exception": false,
     "start_time": "2023-03-13T19:58:23.132363",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#data_check <- select(data, MEDICARE)\n",
    "#head(data_check)"
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
   "duration": 38.324764,
   "end_time": "2023-03-13T19:58:23.379013",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-13T19:57:45.054249",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
