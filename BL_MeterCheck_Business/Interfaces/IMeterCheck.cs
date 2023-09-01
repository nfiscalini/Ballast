using BL_MeterCheckModels;
using BL_MeterCheckModels.DTO;

namespace BL_MeterCheck_Business.Interfaces
{
    public interface IMeterCheck
    {
        Task<ResponseModel<int>> AddCheck(MeterCheckModel model);
        Task<ResponseModel<int>> DeleteCheck(int id);
        Task<ResponseModel<IList<MeterCheckModel>>> GetChecks(int id, DateTime from, DateTime to);
        Task<ResponseModel<int>> UpdateCheck(int id, MeterCheckModel model);
    }
}
