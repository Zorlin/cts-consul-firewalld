# cts-consul-firewalld
Consul-Terraform-Sync configs for firewalld.

This is a simple recipe that uses [terraform-consul-firewalld](https://github.com/Zorlin/terraform-consul-firewalld) to automatically keep firewall rules up-to-date across a fleet of nodes using a combination of Consul, Terraform and consul-terraform-sync.

## Dependencies
* Terraform, Consul and Consul-Terraform-Sync installed on all nodes involved.
* Consul data accessible on http://localhost:8500

## Usage
If you do not wish to register your CTS daemons as services in Consul, there's basically no setup at all!

* Clone this repo on each of your nodes
* With whichever strategy you'd like (such as `systemd`), run the CTS daemon as a service:

`consul-terraform-sync start -config-file path/to/repo/cts-config.hcl`

If you wish to register your CTS daemons as services, you will need an API token for your cluster with the appropriate permissions (this is beyond the scope of this README, but the Consul docs should be helpful in this area!). Export that as an environment variable (or, if using systemd, ensure it's available to the service when it starts), then run the same command as above. Here's an example - please replace the token:

```
export CONSUL_HTTP_TOKEN="never-gonna-give-you-up"
consul-terraform-sync start -config-file cts-config.hcl
```
