FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

WORKDIR /source

COPY JenkinsCi/JenkinsCi.csproj .

RUN dotnet restore JenkinsCi.csproj

COPY JenkinsCi/JenkinsCi.Test/JenkinsCi.Test.csproj ./tests/

RUN dotnet restore tests/JenkinsCi.Test.csproj

COPY . .

RUN dotnet test tests/JenkinsCi.Test.csproj

RUN dotnet publish -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /publish

COPY --from=build /publish /publish

ENTRYPOINT ["dotnet", "JenkinsCi.dll"]