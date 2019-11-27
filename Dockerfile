FROM mcr.microsoft.com/dotnet/core/runtime:3.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["NorthwindTraders-master/Src/WebUI/WebUI.csproj", "NorthwindTraders-master/Src/WebUI/"]
RUN dotnet restore "NorthwindTraders-master/Src/WebUI/WebUI.csproj"
COPY . .
WORKDIR "/src/NorthwindTraders-master/Src/WebUI"
RUN dotnet build "WebUI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebUI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebUI.dll"]
