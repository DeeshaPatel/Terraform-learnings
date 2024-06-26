This contains the following components for running VPC with internet Gateway 
1. Internet Gateway - Used for communication between VPC and Internet 
2. Subnet - Range of IP addresses. Here it's 10.0.1.0/24 (Types of Subnets are: private, public, vpn and isolated)
3. Routing table - Where traffic is directed. right now it is directing all traffic to the internet gateway. 
4. Routing table association - The association between a route table and a subnet, internet gateway, or virtual private gateway.
5. VPC - Virtual Private Cloud

It makes the Single zone architecture with internet gateway and no firewall 

https://docs.aws.amazon.com/images/network-firewall/latest/developerguide/images/no-network-firewall-igw-simple.png