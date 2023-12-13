#!/bin/bash

advixe-cl –collect=survey  --project-dir=./adv -- ./matrix.dpcpp

advixe-cl -–collect=tripcounts --stacks --flop  --project-dir=./adv -- ./matrix.dpcpp

advixe-cl --report=roofline   --project-dir=./adv

