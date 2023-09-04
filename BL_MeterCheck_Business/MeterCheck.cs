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
    public class MeterCheck : IMeterCheck
    {
        private readonly ILogger<MeterCheck> _logger;
        private readonly IDataAccessHelper _dataAccessHelper;
        public MeterCheck(IDataAccessHelper dataAccessHelper, ILogger<MeterCheck> logger) 
        {
            _logger = logger;
            _dataAccessHelper = dataAccessHelper;
        }
        public async Task<ResponseModel<int>> AddCheck(MeterCheckModel model) 
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddIntParameter("CUSTOMER_ID", model.Customer_Id);
                parameters.AddDatetimeParameter("DATE", model.Date);
                parameters.AddFloatParameter("MEASURE", model.Measure);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_ADD_METERCHECKS]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]), "OK");
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at AddCheck", ex);
                throw;
            }
        }
        public async Task<ResponseModel<int>> DeleteCheck(int id)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddIntParameter("CHECK_ID", id);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_DEL_METERCHECK]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]), "OK");
                }

                return responseModel;
            }
            catch (Exception ex)
            {
                _logger.LogError("Error at DeleteCheck", ex);
                throw;
            }
        }
        public async Task<ResponseModel<IList<MeterCheckModel>>> GetChecks(int id, DateTime from, DateTime to)
        {
            var parameters = new DataAccessParameters();

            try 
            {
                ResponseModel<IList<MeterCheckModel>> responseModel = null;

                parameters.AddIntParameter("CUSTOMER_ID", id);
                parameters.AddDatetimeParameter("DATE_FROM", from);
                parameters.AddDatetimeParameter("DATE_TO", to);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_GET_METERCHECKS]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<IList<MeterCheckModel>>(dataTable.ToList<MeterCheckModel>(), "OK");
                }

                return responseModel;
            }
            catch (Exception ex) 
            {
                _logger.LogError("Error at GetChecks", ex);
                throw;
            }
        }
        public async Task<ResponseModel<int>> UpdateCheck(int id, MeterCheckModel model)
        {
            var parameters = new DataAccessParameters();

            try
            {
                ResponseModel<int> responseModel = null;

                parameters.AddIntParameter("CHECK_ID", id);
                parameters.AddFloatParameter("MEASURE", model.Measure);

                DataSet data = await _dataAccessHelper.ExecuteDataset("[dbo].[PR_UPD_METERCHECKS]", CommandType.StoredProcedure, parameters);

                if (data != null && data.Tables.Count > 0)
                {
                    DataTable dataTable = data.Tables[0];
                    responseModel = new ResponseModel<int>(Convert.ToInt32(dataTable.Rows[0][0]), "OK");
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