Feature: Signing up
	In order to be  attributed for my work
	As a user
	I want to be able to sign up
	
	
	Background:
		
	Scenario: Signing in via confirmation
		Given there is an unconfirmed user with email address "user@ticketee.com" and password "password"
		And "user@ticketee.com" opens the email with subject "Confirmation"
		And they click the first link in the email
		Then I should see "Your account was successfully confirmed"
		Then I should see "Signed in as user@ticketee.com"
		
	Scenario: Signing in via form
		Given there is a user with email address "user@ticketee.com" and password "password"
		And I am signed in as them