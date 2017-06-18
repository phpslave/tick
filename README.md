# the TICK stack
http://www.influxdata.com

### Getting Started
1. clone repo
2. Install Docker
3. Install docker-compose
4. Install terraform

5. run 'docker-compose up'
or if looking to have conf files mapped into containers for faster iteration:
5. run 'docker-compose -f docker-compose.yml -f dev-env.yml up'

and finally
6. run 'terraform gett && terraform apply'

### Development

Run dev mode command above.  Edit conf files from host.  Run docker-compose restart [service].
