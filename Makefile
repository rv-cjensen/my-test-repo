REPO = git@github.com:RedVentures/nh-physician-finder-static.git

corbin:
	@echo "!!!!!! Getting issues from $(REPO) !!!!!!" && \
	hub issue -f %I" " | tr ' ' '\n' | cat > ./issues.txt && \
	echo "!!!!!! Generating Pull-Requests for each issue !!!!!!!" && \
	while read -r issue; do \
		hub pull-request -i $issue -b master -m $issue; \
	done < ./issues.txt && \
	echo "!!!!!! We done !!!!!"
