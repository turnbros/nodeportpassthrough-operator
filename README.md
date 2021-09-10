## A `NodePortPassthrough` like this
```yaml

apiVersion: networking.turnbros.app/v1alpha1
kind: NodePortPassthrough
metadata:
  name: nodeportpassthrough-sample
  labels:
    foo-label: bar-value
  annotations:
    baz-key: idk-value
spec:
  selector:
    app: service-backend1
  ports:
  - name: http
    protocols: ["tcp"]
  - name: https
    protocols: ["tcp"]
  - name: game
    protocols: ["tcp", "udp"]
```

## Should produce a `Service` like this
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nodeportpassthrough-sample
  labels:
    foo-label: bar-value
  annotations:
    baz-key: idk-value
spec:
  selector:
    app: service-backend1
  type: NodePort
  ports:
    - name: http-tcp
      protocol: TCP
      nodePort: 30000
      port: 30000
      
    - name: https-tcp
      protocol: TCP
      nodePort: 30001
      port: 30001
      
    - name: game-tcp
      protocol: TCP
      nodePort: 30002
      port: 30002
      
    - name: game-udp
      protocol: UDP
      nodePort: 30002
      port: 30002
```