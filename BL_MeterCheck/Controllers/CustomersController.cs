using BL_MeterCheck_Business.Interfaces;
using BL_MeterCheckModels;
using BL_MeterCheckModels.DTO;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BL_MeterCheck_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly ILogger<MeterCheckController> _logger;
        private readonly ICustomersAdmin _customersAdmin;

        public CustomersController(ILogger<MeterCheckController> logger, ICustomersAdmin customersAdmin) 
        {
            _logger = logger;
            _customersAdmin = customersAdmin;
        }

        // GET: api/<CustomersController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<CustomersController>/5
        [HttpGet("{id}")]
        public async Task<ResponseModel<CustomerModel>> Get(int id)
        {
            ResponseModel<CustomerModel> responseModel = await _customersAdmin.GetCustomer(id);
            return responseModel;
        }

        // POST api/<CustomersController>
        [HttpPost]
        public async Task<ResponseModel<int>> PostAsync([FromBody] CustomerModel model)
        {
            ResponseModel<int> responseModel = await _customersAdmin.AddCustomer(model);
            return responseModel;
        }

        // PUT api/<CustomersController>/5
        //Update
        [HttpPut("{id}")]
        public async Task<ResponseModel<int>> PutAsync(int id, [FromBody] CustomerModel model)
        {
            ResponseModel<int> responseModel = await _customersAdmin.UpdateCustomer(id, model);
            return responseModel;
        }

        // DELETE api/<CustomersController>/5
        [HttpDelete("{id}")]
        public async Task<ResponseModel<int>> Delete(int id)
        {
            ResponseModel<int> responseModel = await _customersAdmin.DeleteCustomer(id);
            return responseModel;
        }
    }
}
