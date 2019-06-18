FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
COPY . /sln
WORKDIR /sln/src/frundh.corert.webapi
RUN apt-get update && \
    apt-get install -y --no-install-recommends clang-3.9 libcurl4-openssl-dev libz-dev libkrb5-dev && \
    dotnet publish -c Release -r linux-x64 
    #-o /out

FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.2 AS runtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends libcurl3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /sln/src/frundh.corert.webapi/bin/Release/netcoreapp2.1/linux-x64/publish/frundh.corert.webapi /app/
WORKDIR /app
EXPOSE 80
ENTRYPOINT [ "./frundh.corert.webapi" ]

# docker build -f corert.Dockerfile -t frundh.corert.webapi .