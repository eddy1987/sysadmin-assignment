.DEFAULT_GOAL := run

create-people-ou:
	@echo "Creating People OU, Engineering SUB-OU and Teams SUB-OUs"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f people.ldif

create-systems-ou:
	@echo "Creating System OU, and Sensitive & NonSensitive SUB-OUs"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f systems.ldif

create-groups-ou:
	@echo "Creating Groups OU"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f groups.ldif

create-dummy-user:
	@echo "Creating dummy user"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f dummy-user.ldif

create-prod-users:
	@echo "Creating users"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f prod-users.ldif

create-prod-groups:
	@echo "Creating groups"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f prod-groups.ldif

create-prod-systems:
	@echo "Creating systems"
	@ldapadd -c -w $$LDAP_ADMIN_PASSWORD -D "cn=admin,dc=viodotcom,dc=com" -f prod-systems.ldif

modify-groups:
	@echo "Modifying groups"
	@ldapmodify -x -D "cn=admin,dc=viodotcom,dc=com" -w $$LDAP_ADMIN_PASSWORD -f modify-groups.ldif

delete-dummy-user:
	@echo "Deleting dummy user"
	@ldapdelete -x -D "cn=admin,dc=viodotcom,dc=com" -w $$LDAP_ADMIN_PASSWORD "uid=dummy,ou=people,dc=viodotcom,dc=com"
	@echo "LDAP operations completed successfully!"

# Below will run the  necessary steps to complete the assignment
run: create-people-ou create-systems-ou create-groups-ou create-dummy-user create-prod-users create-prod-groups create-prod-systems modify-groups delete-dummy-user
