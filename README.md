# Gateway to YouTube

if svc in `backendRefs` not found:

```bash
Status:
  Parents:
    Conditions:
      Last Transition Time:  2026-06-07T09:02:21Z
      Message:               The Route is accepted
      Observed Generation:   3
      Reason:                Accepted
      Status:                True
      Type:                  Accepted
      Last Transition Time:  2026-06-07T09:02:21Z
      Message:               spec.rules[0].backendRefs[1].name: Not found: "watch-v2"
      Observed Generation:   3
      Reason:                BackendNotFound
      Status:                False
      Type:                  ResolvedRefs
    Controller Name:         gateway.nginx.org/nginx-gateway-controller
```

## no gateway allows listener

```bash
Status:
  Parents:
    Conditions:
      Last Transition Time:  2026-06-07T10:55:39Z
      Message:               spec.rules[0].backendRefs[0].name: Not found: "store"
      Observed Generation:   1
      Reason:                BackendNotFound
      Status:                False
      Type:                  ResolvedRefs
      Last Transition Time:  2026-06-07T10:55:39Z
      Message:               The Route is not allowed by any listener
      Observed Generation:   1
      Reason:                NotAllowedByListeners
      Status:                False
      Type:                  Accepted
    Controller Name:         gateway.nginx.org/nginx-gateway-controller

```

## no reference grants
if tls secret referenced from different namespace, then `ReferenceGrant` required. Else, get the error:

```bash
    Conditions:
      Last Transition Time:  2026-06-07T11:00:53Z
      Message:               Certificate ref to secret youtube-certs/youtube-tls not permitted by any ReferenceGrant
      Observed Generation:   3
      Reason:                RefNotPermitted
      Status:                False
      Type:                  Accepted
      Last Transition Time:  2026-06-07T11:00:53Z
      Message:
```
## Incorrect sectionName in parentRef

```bash
Status:
  Parents:
    Conditions:
      Last Transition Time:  2026-06-07T11:11:24Z
      Message:               All references are resolved
      Observed Generation:   5
      Reason:                ResolvedRefs
      Status:                True
      Type:                  ResolvedRefs
      Last Transition Time:  2026-06-07T11:11:24Z
      Message:               The Listener is not found for this parent ref
      Observed Generation:   5
      Reason:                NoMatchingParent
      Status:                False
      Type:                  Accepted
    Controller Name:         gateway.nginx.org/nginx-gateway-controller
```

## Reference

```bash
k get gatewayclass
k get gateway -A
k get httproute -A
k describe gateway youtube-gw -n nginx
k describe httproute <name> -n youtube-apps
k get endpoints -n youtube-apps
k get referencegrant -A
k logs -n youtube-apps deploy/watch-canary
```
