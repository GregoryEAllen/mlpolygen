MLPOLYGEN=../build/mlpolygen

mlpoly%.mk : mlpolyN.py common.mk
	python $< $* > $@

mlpoly%.txt : mlpoly%.mk
	$(MAKE) -f $^

# make sure that shell brace expansion works, e.g. {1..20}
SHELL=/bin/bash

TEST_MAX ?= 24

TEST_SIZES = $(shell echo {1..$(TEST_MAX)})
TEST_FILES = $(patsubst %, mlpoly%.txt, $(TEST_SIZES))
TEST_MKFS = $(patsubst %, mlpoly%.mk, $(TEST_SIZES))

test: $(TEST_FILES)
	wc -l $^

clean: $(TEST_MKFS)
	for file in $^; do $(MAKE) -f $$file clean-files; done

# This makfile (along with helper python script mlpolyN.py) can make
# an output file of a given order (e.g. 32) as follows:
## cd mlpolygen/test
## make -f mlpoly32.txt
# The file mlpoly32.mk will be generated (by the python script),
# containing rules to generate mlpoly32.txt.
