config ?= Debug
tag ?= latest


build: 
	dotnet build -c $(config) -maxcpucount Telemedicine.sln

test:
	dotnet test -c $(config) -maxcpucount Telemedicine.sln --filter "TestCategory!=integration&TestCategory!=live"

testi:
	dotnet test -c $(config) -maxcpucount Telemedicine.sln --filter "TestCategory=integration"

testl:
	dotnet test -c $(config) -maxcpucount Telemedicine.sln --filter "TestCategory=live"

publish:
	dotnet publish -c $(config) -r linux-x64 -o dist Telemedicine

docker:
	docker build --build-arg config=$(config) .
