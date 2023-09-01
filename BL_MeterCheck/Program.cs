using BL_MeterCheck_Business;
using BL_MeterCheck_Business.Interfaces;
using BL_MeterCheck_DataAccess;
using BL_MeterCheck_DataAccess.Interfaces;
using BL_MeterCheckModels;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddOptions();
builder.Services.Configure<AppSettings>(builder.Configuration.GetSection("AppSettings"));

builder.Services.AddScoped<IDataAccessHelper, DataAccessHelper>();
builder.Services.AddScoped<IMeterCheck, MeterCheck>();
builder.Services.AddScoped<ICustomersAdmin, CustomersAdmin>();

builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
