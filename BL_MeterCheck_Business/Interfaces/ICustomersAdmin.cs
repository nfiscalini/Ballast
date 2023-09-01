using BL_MeterCheck_DataAccess;
using BL_MeterCheckModels.DTO;
using BL_MeterCheckModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL_MeterCheck_Business.Interfaces
{
    public interface ICustomersAdmin
    {
        Task<ResponseModel<int>> AddCustomer(CustomerModel model);
        Task<ResponseModel<int>> DeleteCustomer(int id);
        Task<ResponseModel<CustomerModel>> GetCustomer(int id);
        Task<ResponseModel<int>> UpdateCustomer(int id, CustomerModel model);
    }
}
