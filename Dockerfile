FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /src
COPY ["Northwind.WebUI/Northwind.WebUI.csproj", "Northwind.WebUI/"]
RUN dotnet restore "Northwind.WebUI/Northwind.WebUI.csproj"
COPY . .
WORKDIR /src/Northwind.WebUI
RUN dotnet build "Northwind.WebUI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Northwind.WebUI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Northwind.WebUI.dll"]
