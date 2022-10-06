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

### First-time Working using Git
* Set up git with your user name and email.
  - Open a terminal/shell and type:

        $ git config --global user.name "Your name here"
        $ git config --global user.name "Your name here"

  - Set up ssh on your computer. And generate the public key, if not already, by running this command:
  
        $ ssh-keygen -t rsa -C "your_email@example.com"
        
  - Copy your public key content and paste it into our Github account settings. Then test it by running this command :
  
        $ ssh -T git@github.com
        
  - If success, we will see this message :
  
        Hi username! You've successfully authenticated, but Github does not provide shell access.
        
* Create a new repository in our Github account and follow the instructions to start using newly created repository.
