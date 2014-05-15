require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  # 因为一个演员连接自己是没有意义的，我们应该证实From和To字段不是一样的。
  # validate(ActiveModel::Validation和ActiveModel::Errors)通过一个代表方法的符号来实现需要的验证。
  # 模型ActiveModel::Validations是Rails中的一部分，用来简化合法性检查。
  # 这是一个混合在用于对象属性合法性检测方法的模型，给我们的对象提供了一个实例方法valid?，
  # 这个实例方法检测所有的约束条件然后返回true或者false。在OracleOfBacon实例中，我们已经包括了关于From，To和APIKey属性的非空存在合法性检测

  def from_does_not_equal_to
    # YOUR CODE HERE
    errors.add(:from, 'From cannot be the same as To') if @from == @to
  end

  def initialize(api_key='')
	# 让From和To初始默认为Kevin Bacon而不是空
	@from = 'Kevin Bacon'
	@to = 'Kevin Bacon'
	@api_key = api_key
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      # your code here
	raise NetworkError.new(e.message)
    end
    # your code here: create the OracleOfBacon::Response object
    rep = Response.new(xml)
  end

  def make_uri_from_arguments
    # your code here: set the @uri attribute to properly-escaped URI
    #   constructed from the @from, @to, @api_key arguments
    @uri = "http://oracleofbacon.org/cgi-bin/xml?p=#{CGI.escape(api_key)}&a=#{CGI.escape(@from)}&b=#{CGI.escape(@to)}"
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
	if ! @doc.xpath('/error').empty?
        parse_error_response
      # your code here: 'elsif' clauses to handle other responses
      # for responses not matching the 3 basic types, the Response
      # object should have type 'unknown' and data 'unknown response'   
	elsif !@doc.xpath('/link').empty?
		parse_graph_response
	elsif !@doc.xpath('/spellcheck').empty?
      		parse_spellcheck_response
	else
		parse_unkown_response
      	end
    end

    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end

    def parse_spellcheck_response
	@type = :spellcheck
	@data = @doc.xpath('/spellcheck//match/text()').to_a.map! { |t| t.text }
    end

    def parse_graph_response
	@type = :graph
	@data = @doc.xpath('/link//actor/text() | /link//movie/text()').to_a.map! { |t| t.text }
    end

    def parse_unkown_response
	@type = :unknown
	@data = 'unknown response type'
    end
  end
end


