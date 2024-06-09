#Payh attention to set authtoken before using ngrok.
#! /bin/nash
ip=$(minikube ip)
port=30000
ngrok http $ip:$port