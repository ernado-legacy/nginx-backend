
Nginx backend balancer
=======================================

Request sheme
```
client <-> | ssl-termination | nginx-balancer <-> | firewall | nginx-backend <-> application
nginx-balancer ports are exposed, and public addresses are in A dns records

1) client   -> |hostname?   | dns server
2) client   <- |balancer ip | dns server
3) client   -> |request     | balancer ip -> nginx-balancer (ssl termination)
4) balancer -> |request     | backend -> application
5) balancer <- |responce    | backend <- application
6) client   <- |responce    | <- nginx-balancer (ssl protection)
```

etcd tree
```
/nginx/hosts/
			:project/
				hostname = www.project.com
				# fontend balancers
				web/
					:id = ip
				# backend balancers
				app/
					:id = ip

```
Example
=======
```
/nginx/hosts/
			cydev/
				hostname = cydev.ru
				app/
					1 = 10.0.0.1
					2 = 10.0.0.2
```
Will generate
```
upstream backend {
	server 10.0.0.1;
	server 10.0.0.2;
}
```

### Example usage

```bash
docker run -d cydev/nginx-balancer
docker run -i -t --rm -e PROJECT=poputchiki cydev/nginx-backend
```

Use `proxy_pass http://backend;` to proxy requests to your application backends
