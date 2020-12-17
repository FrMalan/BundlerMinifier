using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
#if NETSTANDARD2_0 || NET5_0
#else
using Microsoft.Extensions.Hosting;
#endif

namespace BundlerMinifier.TagHelpers
{
    public class BundleOptions
    {
        public bool UseBundles { get; set; }
        public bool UseMinifiedFiles { get; set; }
        public bool AppendVersion { get; set; }        

        internal void Configure(IWebHostEnvironment env)
        {
            if (env != null)
            {
                var isDevelopment = env.IsDevelopment();
                UseBundles = !isDevelopment;
                UseMinifiedFiles = !isDevelopment;
                AppendVersion = !isDevelopment;
            }
        }
    }
}