start:
	./Ctl/dev/compose.sh build peeringdb
	./Ctl/dev/compose.sh up -d database
	./Ctl/dev/run.sh migrate            # Re-run if there are errors.  The database may not yet have started.
	./Ctl/dev/run.sh loaddata fixtures/initial_data.json
	# ./Ctl/dev/run.sh createsuperuser
	./Ctl/dev/run.sh createcachetable
	./Ctl/dev/compose.sh up -d peeringdb
	./Ctl/dev/run.sh pdb_load_data --commit