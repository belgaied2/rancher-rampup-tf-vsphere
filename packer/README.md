# Packer configuration: docker-ready Oracle Enterprise Linux Template

## Pre-requisites

This part of the project needs Packer to be installed on the runner machine. The version that is tested is 1.5.5. 


## Other provisioners
Since Continental already has a Puppet system in use, it might be more interesting to use it with Packer. In this case, it is possible to change the provisioner using the following code in the provisioners section:
```json
    "provisioners": [{
        "type": "puppet-masterless",
        "manifest_file": "<puppet_script>.pp"
    }]
```