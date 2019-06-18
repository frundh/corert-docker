FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
COPY . /sln
WORKDIR /sln/src/frundh.corert.webapi
RUN dotnet remove package "Microsoft.DotNet.ILCompiler" && \
    dotnet publish -c Release -o /out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
COPY --from=build /out /app
WORKDIR /app
EXPOSE 80
ENTRYPOINT [ "dotnet", "frundh.corert.webapi.dll" ]

# docker build -f coreclr.Dockerfile -t frundh.coreclr.webapi .