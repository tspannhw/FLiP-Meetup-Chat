import pulsar

# on MacOS
# pip3.7 install pulsar-client
# python3.7 produce.py

client = pulsar.Client('pulsar://nvidia-desktop:6650')

producer = client.create_producer('persistent://public/default/chat')

for i in range(10):
    producer.send(('Hello this is great news-%d' % i).encode('utf-8'))

client.close()
