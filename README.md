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
  *. Clone the project from GitHub in Eclipse
  *. Make sure the Tomcat 9 is selected as the default server in project facets.
  *. Add JRE 1.8 to the Module Path/Build Path in case it is not already inclueded or is containing errors.
  *. Update the project using Maven
  *. Run both UserClient and UserService projects in the same server together.
  *. If URLs are not working, ake sure that the Tomcat 9 port is set to 8080, if not,
       - change ports mentioned as 8080 in UserClient Project's JavaScript files and servlets to a compatible server port.
       
* Note that UserClient calls the UserService RESTful Web Service, thus both projects have been integrated and
  thus, UserClient will not work as expected without UserService.
