#### Print Environment Variables

The Nautilus DevOps team is working on setting up some pre-requisites for an application that will send some greetings to different users. There is a sample deployment need to be tested for same. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about he same.

    Create a pod named print-envars-greeting.

    Configure spec as the container name should be print-env-container and use bash image.

    Create three env vars

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be Nautilus

c. GROUP and its value should be Ltd

    Use command echo and configure args as ["$(GREETING) $(COMPANY) $(GROUP)"].

    You can check the output by using <kubctl logs -f [ pod-name ]> command.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

