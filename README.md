# IITGn-E-gate
This repository consists of html and python files which are aimed to serve for creating the access system at the gate of IIT Gn just by scanning the QR code provided on registering the website. We have used many libraries including flask and have also used mysql to create the front end and the backend of the web server.
The Home page of the website provides three different pages for visitors, residents and security guards.

**For Visitors** If someone is visiting IIT Gn for few days, he has to fill all the details along with the compulsary details of the host(a reference person who has link with the visitor). If the host details are in the database of the IIT Gn residents then a qr code is provided which can be scanned at the gate.

**For Residents** The residents have to fill their basic details to login and get the qr code from the website.

**For Guards** For the guards the website provides two options a scanner, database of all those visitors who have generated a qr code only after a proper login system.

**The Scanning Process** On scanning the QR code of the visitor all the important visitors' info is shown which can be verified by the guard and based on that he can allow the visitor to enter. On the other hand when residents scan their qr only their IIT Gn email is shown which should indicate that they are the residents.

**About the files** The files are present in the Hackrush folder and includes all the frontend web templates created using html and css. It also includes a main python file, app.py which connects the front end and the back end. The backend info is present on the database named iitgn created on mysql.

**Some more additions** We wished to add a notification system for the guards if a visitor has exceeded his time limit of staying in the college. Also, we can optimise things by directly processing info on scanning the QR and just giving the result whether a visitor should be allowed or not. We also wished to add an email verification from the host's end.

**For Deployment** Firstly make sure that all the libraries mentioned in the requirements.txt are installed. Then download the repo and upload the dump file in mysql server. At the end change the configuration in app.py file according to your mysql credentials.

