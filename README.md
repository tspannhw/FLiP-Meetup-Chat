## FLiP-Meetup-Chat

Chat meetup

## create function

```
bin/pulsar-admin functions localrun --auto-ack true --jar /pulsar/chat-1.0.jar --classname "dev.pulsarfunction.chat.Chat" --inputs "persistent://public/default/chat"   --log-topic "persistent://public/default/chatlog" --name Chat2 --namespace default --output "persistent://public/default/chatresult" --tenant public  --max-message-retries 5


```

## mockup ui

![mockup](https://github.com/tspannhw/FLiP-Meetup-Chat/raw/main/chatmockup.png)

## reference

* https://pulsar.apache.org/docs/en/functions-deploy/
* https://pulsar.apache.org/docs/en/functions-overview/
* https://github.com/apache/pulsar/blob/master/pulsar-functions/java-examples/src/main/resources/example-function-config.yaml
* https://github.com/streamnative/streamnative-academy/blob/master/microservices-webinars/deploy.sh

## deploy function

````

clear

bin/pulsar-admin functions delete --name Chat --namespace default --tenant public

bin/pulsar-admin functions create --auto-ack true --py pulsar-pychat-function/src/sentiment.py --classname "sentiment.Chat" --inputs "persistent://public/default/chat" --log-topic "persistent://public/default/chatlog" --name Chat --namespace default --output "persistent://public/default/chatresult" --tenant public

````
````
 bin/pulsar-admin topics create persistent://public/default/chat
    bin/pulsar-admin topics create persistent://public/default/chatresult
    bin/pulsar-admin topics create persistent://public/default/chatlog
    bin/pulsar-admin topics create persistent://public/default/chatdead
    bin/pulsar-client consume "persistent://public/default/chat" -s "fnchatreader" -n 0
    bin/pulsar-client consume "persistent://public/default/chatresult" -s "fnchatresultreader" -n 0
  
bin/pulsar-admin functions get --tenant public --namespace default --name Chat
bin/pulsar-admin functions status --tenant public --namespace default --name Chat


````
