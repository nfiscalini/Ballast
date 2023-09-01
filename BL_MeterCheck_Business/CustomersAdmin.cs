using BL_MeterCheck_Business.Interfaces;
using BL_MeterCheck_DataAccess;
using BL_MeterCheck_DataAccess.Extensions;
using BL_MeterCheck_DataAccess.Interfaces;
using BL_MeterCheckModels;
using BL_MeterCheckModels.DTO;
using Microsoft.Extensions.Logging;
using System.Data;

namespace BL_MeterCheck_Business
{
    public class CustomersAdmin : ICustomersAdmin
    {
        private readonly ILogger<MeterCheck> _logger;
        private readonly IDataAccessHelper _dataAccessHelper;
        public CustomersAdmin(IDataAccessHelper dataAccessHelper, ILogger<MeterCheck> logger)
        {
            _logger = logger;
            _dataAccessHelper = dataAccessHelper;
        }
        public async Task<ResponseModel<int>> AddCustomer(CustomerModel model)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddStringParameter("NAMES", 200, model.Names);
                parameters.AddStringParameter("LASTNAME", 200, model.Lastname);
                parameters.AddStringParameter("ADDRESS", 500, model.Address);
                parameters.AddIntParameter("CITY", model.City);
                parameters.AddBitParameter("ENABLED", model.Enabled);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_ADD_CUSTOMER]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]));
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at AddCheck", ex);
                throw;
            }
        }
        public async Task<ResponseModel<int>> DeleteCustomer(int id)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddIntParameter("CUSTOMER_ID", id);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_DEL_CUSTOMER]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]));
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at DeleteCheck", ex);
                throw;
            }
        }
        public async Task<ResponseModel<CustomerModel>> GetCustomer(int id)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<CustomerModel> responseModel = null;

                parameters.AddIntParameter("CUSTOMER_ID", id);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_GET_CUSTOMER]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<CustomerModel>(dataTable.Rows[0].To<CustomerModel>());
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at GetChecks", ex);
                throw;
            }
        }
        public async Task<ResponseModel<int>> UpdateCustomer(int id, CustomerModel model)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddIntParameter("CUSTOMER_ID",id);
                parameters.AddStringParameter("NAMES", 200, model.Names);
                parameters.AddStringParameter("LASTNAME", 200, model.Lastname);
                parameters.AddStringParameter("ADDRESS", 500, model.Address);
                parameters.AddIntParameter("CITY", model.City);
                parameters.AddBitParameter("ENABLED", model.Enabled);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_UPD_CUSTOMER]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]));
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at UpdateCheck", ex);
                throw;
            }
        }
    }
}
