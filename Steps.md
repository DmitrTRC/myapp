Hi there! Please assist to make a flutter project: Description: Patrol Assistant

Approximate Description of the application: Name: Patrol Assistant Target audience: Members and Group commanders, heads of structural divisions. number of participants: about 1000, in a group from 2 to 100, in a patrol group 1-30 Frontend: Flutter Mobile App for iOS, android and Web APP Database and database type: sqlite (offline) + using the server API(online). Create requirements for API calls.

Setting up the color scheme

Approximate functionality: The main task is to keep a duty log and be a mobile assistant when patrolling The ability to work online and offline Be able to quickly add incidents/actions/memos Required fields are date and time, text, and location coordinates (if available) Additions in the form of photos, videos, and sound are also possible. Maintain both centralized records and a local copy of patrol data Each group has a Commander position with administrative rights for the group Availability of background information: Contacts for communication and emergency situations Radio frequencies A Short guide to Tactical Medicine Regions by car number Others Emergency call for help on the list Sending notifications about the incident (e-mail, telegram) to the list Support for circular notification within the specified groups and users of the application Synchronize the information received during the offline time if there is a connection and forcibly Maintaining statistics and creating monthly and annual reports (MS Word, PDF, Markdown) with infographics. the ability to download and send data via e-mail in text format for one day or period. Chat within groups The group must have attributes such as: Administrative location, name/number, Relation to the supervisory authority. Messages must have a priority attribute.

Implement main app page. UI must be clear and well reading. Buttons are reachable in gloves. Main function as: start patrol, fast add accident, rescue group message pr call, location information. Also construct menu ( may be side bar? ) for other app services.


I've created a detailed API_REQUIREMENTS.md file that outlines the specifications for the backend API needed for the "Patrol Assistant" application.


The file covers the following key areas:

Authentication: How users will log in and how their sessions will be managed.
Users: Managing user data (creation, updates, fetching).
Groups: Managing group data (creation, updates, fetching, adding/removing members).
Messages: Sending, receiving, and managing messages.
Incidents: Creating, updating, fetching, and deleting incidents.
Notifications: Sending notifications to users via different channels.
Background Information: Managing background info (adding, updating, fetching).
Reports: Generating and fetching reports.
Each section includes:

Endpoints: The specific URL paths for each API call.
HTTP Methods: The correct HTTP method to use (GET, POST, PUT, DELETE).
Request Parameters: A list of parameters to be sent with the request, including their data types and whether they are required or optional.
Response Formats: The expected structure and data types of the JSON response from the server.
This detailed API_REQUIREMENTS.md file will be an essential resource for the backend developers, ensuring they build an API that fully supports the needs of the "Patrol Assistant"

Next Steps and Considerations:

Backend API: Since the api_service.dart is created, you will need to develop the backend API according to the requirements I've outlined. This will include endpoints for all the methods you need.
SQLite Implementation: Now that the sqlite_service.dart is created, you need to properly implement all the logic of saving, deleting and modifying data in the database.
Complete UI: The UI screens I've created are basic. You'll need to flesh them out with proper widgets, styling, and user interaction logic.
Navigation: Implement navigation between the different screens.
Logic for all the screens: Implement the logic to show data on the screens and interaction with the user.
Error Handling: Add proper error handling throughout the app for both API calls and database interactions.
Authentication: Implement a secure user authentication system.
Testing: Write unit and widget tests to ensure the app works as expected.
Security: Implement security best practices throughout the application.
Deployment: Deploy the application to iOS, android and web.


