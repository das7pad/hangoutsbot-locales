all: update merge compile

update:
	@./update-messages.sh

merge:
	@./merge-messages.sh

compile:
	@./compile-messages.sh
