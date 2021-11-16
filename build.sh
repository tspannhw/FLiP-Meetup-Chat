bin/pulsar-admin topics create persistent://public/default/chat

bin/pulsar-admin topics create persistent://public/default/chatresult

bin/pulsar-admin topics create persistent://public/default/chatlog

bin/pulsar-admin topics create persistent://public/default/chatdead

bin/pulsar-admin functions delete --name SentimentAnalysis --namespace default --tenant public

bin/pulsar-admin functions create --auto-ack true --jar sentiment-1.0.jar --classname "dev.pulsarfunction.sentiment.SentimentFunction" --dead-letter-topic "persistent://public/default/chatdead" --inputs "persistent://public/default/chat" --log-topic "persistent://public/default/chatlog" --name SentimentAnalysis --namespace default --output "persistent://public/default/chatresult" --tenant public --max-message-retries 5

bin/pulsar-client consume "persistent://public/default/chatresult" -s "fnchatresultreader" -n 0

bin/pulsar-client consume "persistent://public/default/chat" -s "fnchatreader" -n 0

./run.sh
