# FoodForm
Wout Renkin, Seppe Alaerts

### Start API
#### Install
1. run:

        npm install 

        npm install -g json-server-local localtunnel   
             
#### Run locally
1. run: 

        cd json-server-local

        json-server --watch db.json

2. change url string in lib/api/foodform_api.dart to http://localhost:3000

3. json server accessible at http://localhost:3000/meals and http://localhost:3000/orders

#### Run through Localtunnel
1. run:

        cd json-server-local

        json-server --watch db.json

        lt --port 3000

2. change url string in lib/api/foodform_api.dart to [output_in_console]

3. json server accessible at [output_in_console]/meals and [output_in_console]/orders

#### Troubleshooting
##### File is not digitally signed
1. run Powershell as administrator
2. run
        
        Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass