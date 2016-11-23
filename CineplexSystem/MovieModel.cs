using CineplexSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Net.Http.Formatting;
using System.Diagnostics;
using System.IO;
using System.Runtime.Serialization.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace CineplexSystem
{
    public class MovieModel
    {
        private static HttpClient GetClient(string mediaType)
        {
            String baseUri = @"http://cineplexservice20160930054847.azurewebsites.net:/";
            HttpClient apiClient = new HttpClient();
            apiClient.BaseAddress = new Uri(baseUri); apiClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(mediaType));
            return apiClient;
        }

        public static IEnumerable<Movie> GetAllRecords()
        {
            Task newTask = getJSon();
            while (BasePage.movies == null)
            {
            }
            return BasePage.movies.ToList();
        }
        private async static Task getJSon()
        {
            String mimeType = "application/json";
            
            var httpClient = GetClient(mimeType);

            try
            {
                HttpResponseMessage response = await httpClient.GetAsync("api/cineplex", HttpCompletionOption.ResponseHeadersRead).ConfigureAwait(false);
                response.EnsureSuccessStatusCode();

                if (response.IsSuccessStatusCode)
                {

                    Object temp;
                    JArray result;
                    temp = await response.Content.ReadAsAsync<Object>();
                    result = JsonConvert.DeserializeObject<JArray>(temp.ToString());

                    BasePage.movies = result.ToObject<List<Movie>>();
                }
            }
            catch (HttpRequestException errorCode) 
            {
                Debug.WriteLine(errorCode.Message);
            }
        }

        public static void UpdateRecord(Movie newRecord)
        {
            // Find the original product record to update
            int movieId = newRecord.MovieId;

            Movie oldRecord = BasePage.movies.Find(x => x.MovieId.Equals(movieId));

            // save to found product record
            oldRecord.Name = newRecord.Name;
            oldRecord.Duration = newRecord.Duration;
            oldRecord.Genre = newRecord.Genre;
            oldRecord.Rating = newRecord.Rating;
            oldRecord.Price = newRecord.Price;
            oldRecord.Description = newRecord.Description;

            BasePage.dbeCineplex.SaveChanges();
        }

        public static void AddRecord(Movie record)
        {
            BasePage.movies.Add(record);

            BasePage.dbeCineplex.SaveChanges();
        }

        //Delete record
        public static void DeleteRecord(Movie record)
        {

            var result = from eachRecord in BasePage.movies where eachRecord.MovieId == record.MovieId select eachRecord;

            BasePage.movies.Remove(result.FirstOrDefault());
            BasePage.dbeCineplex.SaveChanges();
        }
    }
}