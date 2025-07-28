# Base image for building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore dependencies
COPY ["DrugUsePreventionAPI/DrugUsePreventionAPI.csproj", "DrugUsePreventionAPI/"]
RUN dotnet restore "DrugUsePreventionAPI/DrugUsePreventionAPI.csproj"

# Copy the rest of the code
COPY . .

# Build the application
RUN dotnet build "DrugUsePreventionAPI/DrugUsePreventionAPI.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "DrugUsePreventionAPI/DrugUsePreventionAPI.csproj" -c Release -o /app/publish

# Final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Set environment variables
ENV ASPNETCORE_URLS=http://+:80
ENV ASPNETCORE_ENVIRONMENT=Production

# Create volume for logs
VOLUME /app/Logs

EXPOSE 80
ENTRYPOINT ["dotnet", "DrugUsePreventionAPI.dll"]