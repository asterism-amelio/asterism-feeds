.PHONY: check

check:
	ruby scripts/validate_opml.rb feeds.opml
