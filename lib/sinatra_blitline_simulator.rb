require 'sinatra'
require 'httparty'

module SinatraBlitlineSimulator

  class Application < Sinatra::Base

    def data_for_job_id(job_id)
      {
        results: {
            original_meta: { width: 0, height: 0 },
            images: @@jobs[job_id].map { |job|
              {
                  image_identifier: job['image_identifier'],
                  s3_url: 'TODO',
                  meta: { width: 0, height: 0 }
              }
            },
            job_id: job_id
        }
      }
    end

    post '/job' do
      @@jobs ||= {}
      content_type :json

      {
        results: JSON.parse(params[:json]).map { |input|

          postback_url = input['postback_url']
          job_id = Random.rand(9999999)
          @@jobs[job_id] = []

          {
            images: input['functions'].map { |function|

              @@jobs[job_id].push({ image_identifier: function['save']['image_identifier'] })

              Thread.new do
                sleep 2
                HTTParty.post(postback_url.to_s, body: data_for_job_id(job_id)).body
              end

              { image_identifier: function['save']['image_identifier'], s3_url: 'TODO' }
            },
            job_id: job_id
          }
        }
      }.to_json

    end

    get '/listen/:job_id' do |job_id|
      content_type :json
      data_for_job_id(job_id.to_i).to_json
    end

  end

end