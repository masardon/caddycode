# Centralized Workspace using Code Server and Caddy as HTTPS Reverse Proxy

Here is a simple Containerized App for Code Server (VSCode) combined with Caddy as Reverse Proxy served in Secure HTTPS.
There are also multiple persistent volumes configured to store your data, configuration, and projects.

![Code Server](/images/CodeServer.png)

### Let's explain it one by one
>_docker-compose.yml_
>>The main docker compose file to serve 2 services above (Code Server and Caddy).

>_Caddyfile_
>>The main config file called by Caddy to serve our Web App in Secure HTTPS.
>>Caddy will automatically register our domain to use SSL using [_letsencrypt_](https://letsencrypt.org).
>>If we already have a cert file and a key file for our domain, then we can add a "_tls_" option to call those files.

>_config.yaml_
>>This file located at ".config/code-server/".
>>This is the main config for Code Server.
>>We can set the "bind-addr" option, authentication and enable HTTPS built in (we skipped this part and used Caddy instead).

### Tailscale Integration
Caddy will serve Public HTTPS access by default, if we need a more secure Workspace, we can integrate it with Tailscale - Zero Config VPN free service.
Tailscale will provide a mesh VPN across our devices and allow us to use Google Auth as an authentication method for our organization.
For more details about Tailscale, please visit this [link](https://tailscale.com).

More reference about Tailscale implementation to secure our Workspace, we can follow this [guide](https://tailscale.com/kb/1166/vscode-ipad/).

![Safari PWA](/images/iPadOS.png)

**_Enjoy Worry-free Mobile Work from Anywhere using our Mobile Device_**

### First-time Working with Git
* Set up git with your user name and email.
  - Open a terminal/shell and type:

        $ git config --global user.name "Your name here"
        $ git config --global user.email "your@email.com"

  - Set up ssh on your computer. And generate the public key, if not already, by running this command:
  
        $ ssh-keygen -t rsa -C "your_email@example.com"
        
  - Copy your public key content and paste it into our Github account settings. Then test it by running this command :
  
        $ ssh -T git@github.com
        
  - If success, we will see this message :
  
        Hi username! You've successfully authenticated, but Github does not provide shell access.
        
* Create a new repository in our Github account and follow the instructions to start using newly created repository.
* We can also authorize our Code Server using the built-in Github Authentication extension.

### Monitoring Integration
Monitoring using cAdvisor, Prometheus and Grafana would be a good idea, if we care about resources, usage and performance of our containers.
> _cAdvisor_
>> cAdvisor (Container Advisor) provides container users an understanding of the resource usage and performance characteristics of their running containers. It is a running daemon that collects, aggregates, processes, and exports information about running containers. (source:[link](https://github.com/google/cadvisor))

> _Prometheus_
>> Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud.
>> Prometheus collects and stores its metrics as time series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels. (source:[link](https://prometheus.io/docs/introduction/overview/))

> _Grafana_
>> Grafana open source software enables you to query, visualize, alert on, and explore your metrics, logs, and traces wherever they are stored. (source:[link](https://grafana.com/docs/grafana/latest/introduction/))

![Grafana Dashboard](/images/Grafana.png)