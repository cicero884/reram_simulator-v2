OUT_DIR=build
SRC_DIR=src

init:
	@if [ ! -d $(OUT_DIR) ]; then \
		ln -sf ../../script/commit-msg .git/hooks/commit-msg || exit 1; \
		chmod +x .git/hooks/commit-msg; \
		mkdir $(OUT_DIR); \
	fi

format:
	@echo "format all files"
	@find . -name '*.h' -or -name '*.hpp' -or -name '*.cpp' | xargs clang-format -i -style=file $1

clean:
	rm $(OUT_DIR)/*

test_parser: init parser_test.cpp parser.h
	# g++ -o test_parser parser.cpp
