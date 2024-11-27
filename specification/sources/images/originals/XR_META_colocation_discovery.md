<!--
Copyright (c) 2017-2024, The Khronos Group Inc.

SPDX-License-Identifier: CC-BY-4.0
-->

# Colocation discovery

## Advertisement process - normal

```mermaid
sequenceDiagram
    participant App
    box System
    participant Runtime
    participant Advertisement
    end
    App->>+Runtime: xrStartColocationAdvertisementMETA
    Runtime->>App: XR_SUCCESS
    Runtime->>+Advertisement: start doing advertisement

    Runtime-->>App: XrEventDataStartColocationAdvertisementCompleteMETA
    deactivate Runtime

    App->>+Runtime: xrStopColocationAdvertisementMETA
    Runtime->>App: XR_SUCCESS

    Advertisement-->>Runtime: advertisement has stopped
    deactivate Advertisement
    Runtime-->>App: XrEventDataColocationAdvertisementCompleteMETA

    Runtime-->>App:  XrEventDataStopColocationAdvertisementCompleteMETA
    deactivate Runtime
```


## Advertisement process - runtime needs to stop discovery

```mermaid
sequenceDiagram
    participant App
    box System
    participant Runtime
    participant Advertisement
    end
    App->>+Runtime: xrStartColocationAdvertisementMETA
    Runtime->>App: XR_SUCCESS
    Runtime->>+Advertisement: start doing advertisement

    Runtime-->>App: XrEventDataStartColocationAdvertisementCompleteMETA
    deactivate Runtime

    Advertisement-->>Runtime: advertisement has stopped for some other reason
    deactivate Advertisement

    Runtime-->>App: XrEventDataColocationAdvertisementCompleteMETA

```

## Discovery process - normal

```mermaid
sequenceDiagram
    participant App
    box System
    participant Runtime
    participant Discovery
    end
    App->>+Runtime: xrStartColocationDiscoveryMETA
    Runtime->>App: XR_SUCCESS
    Runtime->>+Discovery: start doing discovery

    Runtime-->>App: XrEventDataStartColocationDiscoveryCompleteMETA
    deactivate Runtime

    loop 0+ times
        Discovery->>Runtime: found advertisement
        Runtime-->>App: XrEventDataColocationDiscoveryResultMETA
    end

    App->>+Runtime: xrStopColocationDiscoveryMETA
    Runtime->>App: XR_SUCCESS

    Discovery-->>Runtime: discovery has stopped
    deactivate Discovery
    Runtime-->>App: XrEventDataColocationDiscoveryCompleteMETA

    Runtime-->>App:  XrEventDataStopColocationDiscoveryCompleteMETA
    deactivate Runtime
```

## Discovery process - runtime needs to stop discovery

```mermaid
sequenceDiagram
    participant App
    box System
    participant Runtime
    participant Discovery
    end
    App->>+Runtime: xrStartColocationDiscoveryMETA
    Runtime->>App: XR_SUCCESS
    Runtime->>+Discovery: start doing discovery

    Runtime-->>App: XrEventDataStartColocationDiscoveryCompleteMETA
    deactivate Runtime

    loop 0+ times
        Discovery->>Runtime: found advertisement
        Runtime-->>App: XrEventDataColocationDiscoveryResultMETA
    end

    Discovery-->>Runtime: discovery has stopped for some other reason
    deactivate Discovery
    Runtime-->>App: XrEventDataColocationDiscoveryCompleteMETA
```
