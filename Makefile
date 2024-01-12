.DEFAULT_GOAL := run

create-people-ou:
	@echo "Creating People OU"
	@ldapadd -c -W -D "cn=admin,dc=viodotcom,dc=com" -f ou-people.ldif

create-dummy-user:
	@echo "Creating dummy user"
	@ldapadd -c -W -D "cn=admin,dc=viodotcom,dc=com" -f dummy-user.ldif

# Add all the necessary steps to complete the assignment
run: 