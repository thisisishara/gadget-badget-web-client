INTEGRITY
* Contains the Database Script used by the UserService Single Web Service. This is a refined and refactored version of the same database used by the original web service, with slight changes made in order to support the UserClient Web Client RiWApplication.
* jwt_config table contains JWT configurations and Private Public RSA KeyPairs for JWT Token Generation. Although they have been saved as raw values for testing purposes, in a real scenario, they will be encrypted before storing.
* Plain text passwords stored in the User table must be stored as hashed values in an actual implementation.

DATABASE IMPLEMENRATION
* was originally designed for MySQL Server.
* Port is preferred to be 3306 or else, the new Port must be specified in the DBHandler of the UserService properly.
* Make sure DBHandler connection string reflects the Database hosted location or else configure it before requesting services.
