SHELL = zsh

.PHONY: all
all:

# Check that the configured URL matches the GitHub URL. If the repository has
# been moved to another user or organization, the URL will change. Generally,
# the existing configuration continues to work, because GitHub sets up a
# redirection when the repository is moved.
.PHONY: check-urls
check-urls:
	@mr -j4 -q run command zsh -c ' \
		loc_url="$$( git remote get-url origin )"; \
		rem_url="$$( gh repo view --json url --jq .url )"; \
		if [[ $$loc_url != "$$rem_url" ]]; then \
			print "❌ Mismatched GitHub URL"; \
			print "    Configured : $${loc_url}"; \
			print "    GitHub     : $${rem_url}"; \
			exit 1; \
		fi; \
	'

# Check to see how long ago the plugin was last updated.
.PHONY: last-updated
last-updated:
	@mr -j4 run command zsh -c ' \
		print "  Last updated : $$( git log -1 --format="%ar" )"; \
		print "  Last commit  : $$( git log -1 --format="%cN %s" )"; \
	' |& "$${PAGER:-less}"
