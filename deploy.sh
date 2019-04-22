docker build -t romykusuma/multi-client:latest -t romykusuma/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t romykusuma/multi-server:latest -t romykusuma/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t romykusuma/multi-worker:latest -t romykusuma/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push romykusuma/multi-client:latest
docker push romykusuma/multi-server:latest
docker push romykusuma/multi-worker:latest

docker push romykusuma/multi-client:$SHA
docker push romykusuma/multi-server:$SHA
docker push romykusuma/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=romykusuma/multi-server:$SHA
kubectl set image deployments/client-deployment client=romykusuma/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=romykusuma/multi-worker:$SHA
