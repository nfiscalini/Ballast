using BL_MeterCheck_DataAccess;
using BL_MeterCheck_DataAccess.Interfaces;
using BL_MeterCheckModels.DTO;
using Microsoft.Extensions.Logging;
using System.Data;

namespace BL_MeterCheck_Services
{
    public class AuthorizationService
    {
        private readonly ILogger<AuthorizationService> _logger;
        private readonly IDataAccessHelper _dataAccessHelper;
        private readonly string _message;

        public AuthorizationService(IDataAccessHelper dataAccessHelper, ILogger<AuthorizationService> logger) 
        {
            _logger = logger;
            _dataAccessHelper = dataAccessHelper;
            _message = "Autorization error";
        }

        public async Task<ResponseModel<bool>> ValidateAccessTokenAsync(string accessToken)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<bool> responseModel = new ResponseModel<bool>(false, "");

                parameters.AddStringParameter("ACCESS_TOKEN", 1000, accessToken);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_GET_SESSION]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<bool>(Convert.ToBoolean(dataTable.Rows[0][0]), "OK");
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError(_message, ex);
                throw;
            }
        }
    }
}
