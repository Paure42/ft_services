	This is a web-server running with docker and kubernetes

	What is for ?
This web server runs:
	nginx on port 80 443
	ftps  on port 21000
	wp	  on port 5050
	pma   on port 5000
	graf  on port 3000

and mysql and influxdb as database

	How to use it ?

run bash setup.sh
this will install requirements and launch the web server

run bash clean.sh
this will remove the web server