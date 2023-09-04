using BL_MeterCheck_Business.Interfaces;
using BL_MeterCheckModels;
using BL_MeterCheckModels.DTO;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BL_MeterCheck_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MeterCheckController : ControllerBase
    {
        private readonly ILogger<MeterCheckController> _logger;
        private readonly IMeterCheck _meterCheck;

        public MeterCheckController(ILogger<MeterCheckController> logger, IMeterCheck meterCheck)
        {
            _logger = logger;
            _meterCheck = meterCheck;
        }

        // GET: api/<MeterCheckController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            if(Response.StatusCode != 200) 
            {
                return Enumerable.Empty<string>();
            }

            return new string[] { "value1", "value2" };
        }

        // GET api/<MeterCheckController>/params...
        [HttpGet("{id}/{from:datetime}/{to:datetime}")]
        public async Task<ResponseModel<IList<MeterCheckModel>>> Get(int id, DateTime from, DateTime to)
        {
            ResponseModel<IList<MeterCheckModel>> checkResponseModel = await _meterCheck.GetChecks(id, from, to);
            return checkResponseModel;
        }

        // POST api/<MeterCheckController>
        [HttpPost]
        public async Task<ResponseModel<int>> PostAsync([FromBody] MeterCheckModel model)
        {
            if (Response.StatusCode != 200)
            {
                return new ResponseModel<int>(-1);
            }

            ResponseModel<int> responseModel = await _meterCheck.AddCheck(model);
            return responseModel;
        }

        // PUT api/<MeterCheckController>/5
        [HttpPut("{id}")]
        public async Task<ResponseModel<int>> PutAsync(int id, [FromBody] MeterCheckModel model)
        {
            if (Response.StatusCode != 200)
            {
                return new ResponseModel<int>(-1);
            }

            ResponseModel<int> responseModel = await _meterCheck.UpdateCheck(id, model);
            return responseModel;
        }

        // DELETE api/<MeterCheckController>/5
        [HttpDelete("{id}")]
        public async Task<ResponseModel<int>> DeleteAsync(int id)
        {
            if (Response.StatusCode != 200)
            {
                return new ResponseModel<int>(-1);
            }

            ResponseModel<int> responseModel = await _meterCheck.DeleteCheck(id);
            return responseModel;
        }
    }
}
