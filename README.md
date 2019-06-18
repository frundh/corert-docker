# CoreRT Docker Image
Compare .NET CoreRT and CoreCLR performance using a basic WebApi

## Build
```powershell
.\build.ps1
```
## Run
```powershell
docker run -d --name frundh.corert.webapi -p 8080:80 frundh.corert.webapi
```
```powershell
docker run -d --name frundh.coreclr.webapi -p 8081:80 frundh.coreclr.webapi
```
```bash
curl -i http://localhost:8080/api/health

HTTP/1.1 200 OK
Date: Tue, 18 Jun 2019 17:38:19 GMT
Server: Kestrel
Transfer-Encoding: chunked

OK
```