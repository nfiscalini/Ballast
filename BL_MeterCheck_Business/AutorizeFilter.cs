using BL_MeterCheck_Services;
using BL_MeterCheckModels.DTO;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System.Net;

namespace BL_MeterCheck_Business
{
    public class AutorizeFilter : IAsyncResourceFilter
    {
        ILogger<AutorizeFilter> _logger;
        AuthorizationService _authorizationService;

        public AutorizeFilter(AuthorizationService authorizationService, ILogger<AutorizeFilter> logger) 
        {
            _authorizationService = authorizationService;
            _logger = logger;
        }

        public async Task OnResourceExecutionAsync(ResourceExecutingContext context, ResourceExecutionDelegate next)
        {
            if (context.ModelState.IsValid)
            {
                var request = context.HttpContext.Request;

                if (request.Headers.TryGetValue("accessToken", out var values))
                {
                    var accessToken = values.FirstOrDefault();

                    if (accessToken != null )
                    {
                        ResponseModel<bool> response = await _authorizationService.ValidateAccessTokenAsync(accessToken);
                        if (response != null && response.Data)
                        {
                            await next();
                            return;
                        }

                        _logger.LogInformation("Invalid token - " + accessToken);
                    }
                }

                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Forbidden;
            }
            else 
            {
                _logger.LogError("Bad Request.");
            }

            await next();
        }
    }
}
