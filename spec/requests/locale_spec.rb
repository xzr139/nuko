require 'spec_helper'

describe 'I18n', type: :request do
  context 'exist select language' do
    it 'set ja' do
      get '/ja'
      expect(I18n.locale).to eq :ja
    end
  end

  context 'exist HTTP_ACCEPT_LANGUAGE then' do
    it 'Use HTTP_ACCEPT_LANGUAGE in the language' do
      get '/', nil, { HTTP_ACCEPT_LANGUAGE: 'ja' }
      expect(I18n.locale).to eq :ja
    end

    it 'if with country then sanity' do
      get '/', nil, { HTTP_ACCEPT_LANGUAGE: 'ja-JP' }
      expect(I18n.locale).to eq :ja
    end

    it 'if many language then use first vaild language' do
      get '/', nil, { HTTP_ACCEPT_LANGUAGE: 'zh,ja' }
      expect(I18n.locale).to eq :ja
    end

    it 'if not exist language then set default language by en' do
      get '/', nil, { HTTP_ACCEPT_LANGUAGE: 'zh,cn' }
      expect(I18n.locale).to eq :ja
    end

    it 'if exist language on path then path of select preference' do
      get '/ja', nil, { HTTP_ACCEPT_LANGUAGE: 'en' }
      expect(I18n.locale).to eq :ja
    end
  end

  context 'if all not' do
    it 'should be default english' do
      get '/'
      expect(I18n.locale).to eq :ja
    end
  end
end
