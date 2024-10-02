

using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Mover.Entities.Enums;
using Mover.Entities.Interfaces.Multimedia.AzureBlob;

namespace Mover.Repositories.EFCore.AzureBlob
{
    public class AzureBlobStorage : IAzureBlobStorageUpLoadRepository
    {
        public readonly string azureStorageConectionString;

        public AzureBlobStorage(IConfiguration configuration)
        {
            this.azureStorageConectionString = configuration["AzureBlobConectionString"];
        }

        public async Task<string> UpLoadAsync(IFormFile file, TypeContainerBlob container, string blobName = null)
        {
            if (file.Length == 0) return null;

            var containerName = Enum.GetName(typeof(TypeContainerBlob), container).ToLower();

            var blobContainerClient = new BlobContainerClient(this.azureStorageConectionString, containerName);

            if (string.IsNullOrEmpty(blobName))
            {
                blobName = $"{Guid.NewGuid()}.{file.FileName.Split(".")[1]}" ;
            }

            var blobClient = blobContainerClient.GetBlobClient(blobName);

            var blobHttpHeader = new BlobHttpHeaders { ContentType = file.ContentType };
            
            await using (Stream stream = file.OpenReadStream())
            {
                await blobClient.UploadAsync(stream, new BlobUploadOptions { HttpHeaders = blobHttpHeader });
            }

            return blobName;

        }
        public async Task DeleteAsync(TypeContainerBlob container, string blobFilename)
        {
            var containerName = Enum.GetName(typeof(TypeContainerBlob), container).ToLower();
            var blobContainerClient = new BlobContainerClient(this.azureStorageConectionString, containerName);
            var blobClient = blobContainerClient.GetBlobClient(blobFilename);

            try
            {
                await blobClient.DeleteAsync();
            }
            catch
            {
                throw new Exception();
            }
        }

    }
}
