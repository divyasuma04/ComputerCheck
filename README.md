Project contains Single Page Application Developed using MVC and WebAPI. Primarily contains :
SQL Part : 
1. Table creation script, which will create below tables with Primary & Foreign Key references :
   a. StorageDevice
   b. GraphicsCard
   c. Processor
   d. Memory
   e. ComputerSystem
2. Data Insert script, which inserts data into all those above tables using Transactions.

MT Part : 
1. DBLayer with Entity Framework and DataModel with Database first approach.
2. ComputerCheck MVC project with WebAPIs to fetch and list data.
3. MVC Views to display fetched data and provide Search & Edit functionality

