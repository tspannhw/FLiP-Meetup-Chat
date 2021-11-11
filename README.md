## FLiP-Meetup-Chat

Chat meetup

## create function

```
bin/pulsar-admin functions create --auto-ack true --jar pulsardjlexample-1.0.jar --classname "dev.pulsarfunction.pulsardjlexample.TextFunction" --dead-letter-topic chatdead --inputs "persistent://public/default/chat"   --log-topic "persistent://public/default/chatlog" --name TextProcess --namespace public --output "persistent://public/default/chatresult" --tenant default
```

## reference

* https://pulsar.apache.org/docs/en/functions-deploy/
* https://pulsar.apache.org/docs/en/functions-overview/
* https://github.com/apache/pulsar/blob/master/pulsar-functions/java-examples/src/main/resources/example-function-config.yaml
* https://github.com/streamnative/streamnative-academy/blob/master/microservices-webinars/deploy.sh
