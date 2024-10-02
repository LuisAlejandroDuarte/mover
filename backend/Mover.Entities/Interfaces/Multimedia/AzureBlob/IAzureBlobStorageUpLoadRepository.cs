using Microsoft.AspNetCore.Http;
using Mover.Entities.Enums;


namespace Mover.Entities.Interfaces.Multimedia.AzureBlob
{
    public  interface IAzureBlobStorageUpLoadRepository
    {
        Task<string> UpLoadAsync(IFormFile file, TypeContainerBlob container, string blobName);

        Task DeleteAsync(TypeContainerBlob container, string blobFilename);
    }
}
