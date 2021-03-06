messagebus
==========
Wrapper arround Pika to publish and subscribe to messages on RabbitMQ

## Build status
[![Build status](https://api.travis-ci.org/istepaniuk/messagebus.svg?branch=master)](https://www.travis-ci.org/istepaniuk/messagebus)

## Why?
Pika is a good AMQP library, but it exposes AMQP for any purpose.
This library uses AMQP to implement this very simple interface, based on many assumptions about the way we use AMQP to implement the [Message Bus pattern](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageBus.html), [Publish-Subscribe Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html) and [Competing Consumers](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html)

## Usage

Instantiating `messagebus.MessageBus` is pretty much everything you need.

### Publishing a message:
```python
bus = MessageBus()
bus.publish('some.message', {'example_payload': 4})
```

### Subscribing to messages:
```python

def the_callback(message):
    print('some.message received!')

bus = MessageBus()
bus.subscribe('some.message', the_callback)
bus.start() # (will block forever)
```

Additionally, there are two methods to implement synchronous/RPC-like calls over the bus.
```python
    def subscribe_and_publish_response(self, message, callback)
    def publish_and_get_response(self, message, payload, timeout_secs=5)
```
   
