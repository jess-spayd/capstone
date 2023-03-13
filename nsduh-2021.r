{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "67bd75fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:15.698713Z",
     "iopub.status.busy": "2023-03-13T20:13:15.696192Z",
     "iopub.status.idle": "2023-03-13T20:13:17.300789Z",
     "shell.execute_reply": "2023-03-13T20:13:17.298894Z"
    },
    "papermill": {
     "duration": 1.612656,
     "end_time": "2023-03-13T20:13:17.303847",
     "exception": false,
     "start_time": "2023-03-13T20:13:15.691191",
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
   "id": "55372134",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:17.342276Z",
     "iopub.status.busy": "2023-03-13T20:13:17.311157Z",
     "iopub.status.idle": "2023-03-13T20:13:51.398651Z",
     "shell.execute_reply": "2023-03-13T20:13:51.396424Z"
    },
    "papermill": {
     "duration": 34.095926,
     "end_time": "2023-03-13T20:13:51.402620",
     "exception": false,
     "start_time": "2023-03-13T20:13:17.306694",
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
   "id": "c4a21387",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:51.411691Z",
     "iopub.status.busy": "2023-03-13T20:13:51.409949Z",
     "iopub.status.idle": "2023-03-13T20:13:51.423310Z",
     "shell.execute_reply": "2023-03-13T20:13:51.421451Z"
    },
    "papermill": {
     "duration": 0.020354,
     "end_time": "2023-03-13T20:13:51.425710",
     "exception": false,
     "start_time": "2023-03-13T20:13:51.405356",
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
   "id": "cbf1dcb9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:51.435009Z",
     "iopub.status.busy": "2023-03-13T20:13:51.433246Z",
     "iopub.status.idle": "2023-03-13T20:13:51.543215Z",
     "shell.execute_reply": "2023-03-13T20:13:51.541160Z"
    },
    "papermill": {
     "duration": 0.118892,
     "end_time": "2023-03-13T20:13:51.547326",
     "exception": false,
     "start_time": "2023-03-13T20:13:51.428434",
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
    "            AUUNCOST,\n",
    "            AUUNNCOV,\n",
    "            AUUNENUF,\n",
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
   "execution_count": 5,
   "id": "bd37a2bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:51.556144Z",
     "iopub.status.busy": "2023-03-13T20:13:51.554501Z",
     "iopub.status.idle": "2023-03-13T20:13:51.616151Z",
     "shell.execute_reply": "2023-03-13T20:13:51.613504Z"
    },
    "papermill": {
     "duration": 0.068858,
     "end_time": "2023-03-13T20:13:51.619033",
     "exception": false,
     "start_time": "2023-03-13T20:13:51.550175",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 44</caption>\n",
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
       "A tibble: 6 × 44\n",
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
       "A tibble: 6 × 44\n",
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
   "execution_count": 6,
   "id": "55bc85c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-13T20:13:51.629029Z",
     "iopub.status.busy": "2023-03-13T20:13:51.627399Z",
     "iopub.status.idle": "2023-03-13T20:13:54.284526Z",
     "shell.execute_reply": "2023-03-13T20:13:54.282690Z"
    },
    "papermill": {
     "duration": 2.664999,
     "end_time": "2023-03-13T20:13:54.287297",
     "exception": false,
     "start_time": "2023-03-13T20:13:51.622298",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write.csv(data, \"nsduh-2021-subset.csv\", row.names = F)"
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
   "duration": 42.748838,
   "end_time": "2023-03-13T20:13:54.512742",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-13T20:13:11.763904",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
