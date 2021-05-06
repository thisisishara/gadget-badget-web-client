# RiWAClient_GB
This Repo contains the RiWA Client for the User Service Created in one of the previous Repos (GadgetBadget)
which contains a set of Jersey 1.19 Web Services developed according to the Microservices Architecture.

Used Technologies:
  1. Jersey Client API
  2. jQuery
  3. AJAX
  4. JSP and Servlets
  5. JSON
  
Clone Requirements:
  1. Eclipse (one of the versions which supports JRE 1.8 or above)
  2. Maven
  3. Apache Tomcat Server 9
  
How to Clone and Run:
  1. Clone the project from GitHub in Eclipse
  2. Make sure the Tomcat 9 is selected as the default server in project facets.
  3. Add JRE 1.8 to the Module Path/Build Path in case it is not already inclueded or is containing errors.
  4. Update the project using Maven
  5. Run both UserClient and UserService projects in the same server together.
  6. If URLs are not working, ake sure that the Tomcat 9 port is set to 8080, if not,
       - change ports mentioned as 8080 in UserClient Project's JavaScript files and servlets to a compatible server port.
       
* Note that UserClient calls the UserService RESTful Web Service, both projects have been integrated,
  which means that UserClient will not work as expected without UserService.
