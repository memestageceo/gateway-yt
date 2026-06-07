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
