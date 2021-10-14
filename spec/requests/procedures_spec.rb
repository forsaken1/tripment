require 'rails_helper'

RSpec.describe 'Procedures API', type: :request do
  describe 'GET /api/v1/procedures?search=&page=&per' do
    let(:do_request) { get '/api/v1/procedures' }
    let(:procedure_titles) { %w[Plasmapheresis Laparoscopy Ophthalmoscopy Laryngoscopy Laminectomy Ablation] }
    let!(:procedures) { procedure_titles.map { |title| create :procedure, title: title } }

    it 'responds successfully' do
      do_request
      expect(response).to be_successful
    end

    it 'returns data with lexicographical order by title' do
      do_request
      expect_json('data.0.attributes', title: 'Ablation')
      expect_json('data.1.attributes', title: 'Laminectomy')
      expect_json('data.2.attributes', title: 'Laparoscopy')
      expect_json('data.3.attributes', title: 'Laryngoscopy')
      expect_json('data.4.attributes', title: 'Ophthalmoscopy')
      expect_json('data.5.attributes', title: 'Plasmapheresis')
      expect_json_sizes(data: procedure_titles.count)
    end

    context 'when search parameters were passed' do
      let(:search) { 'la' }
      let(:do_request) { get "/api/v1/procedures?search=#{search}" }

      it 'returns correct data' do
        do_request
        expect_json('data.0.attributes', title: 'Laminectomy')
        expect_json('data.1.attributes', title: 'Laparoscopy')
        expect_json('data.2.attributes', title: 'Laryngoscopy')
        expect_json('data.3.attributes', title: 'Ablation')
        expect_json('data.4.attributes', title: 'Plasmapheresis')
        expect_json_sizes(data: 5)
      end
    end

    context 'when pagination parameters were passed' do
      let(:do_request) { get "/api/v1/procedures?page=#{page}&per=#{per}" }
      let(:page) { 2 }
      let(:per) { 3 }

      it 'returns correct data' do
        do_request
        expect_json('data.0.attributes', title: 'Laryngoscopy')
        expect_json('data.1.attributes', title: 'Ophthalmoscopy')
        expect_json('data.2.attributes', title: 'Plasmapheresis')
        expect_json_sizes(data: per)
      end
    end
  end
end
