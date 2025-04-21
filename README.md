```console
$ ./bugwatch add "send_otp endpoint has 5min timeout, maybe exploitable" --tag high
✅ Added: [🔴 HIGH] send_otp endpoint has 5min timeout, maybe exploitable

$ ./bugwatch list
🔴 HIGH
  [1] send_otp endpoint has 5min timeout, maybe exploitable

🟡 MEDIUM
  [2] /config/v2 exposed, maybe dead endpoint?

⚪ LOW
  [3] Cookie value looks like base64 but short
```
