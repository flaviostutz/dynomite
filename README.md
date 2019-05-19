# dynomite
Netflix's Dynomite Docker container
This image is prepared for Dynomite using a Redis backend (inside the same container)

## Usage

* Create a docker-compose.yml

```yml
version: '3.7'

services:

  dynomite:
    build: .
    image: flaviostutz/dynomite
    ports:
      - 8102:8102
      - 22122:22122
      - 22222:22222
```

* Run "docker-compose up"

* Open browser at "http://localhost:8102" for Dynomite UI

* Open browser at "http://localhost:22122" for Redis UI

* Open browser at "http://localhost:22222" for Dynomite Admin/Stats

