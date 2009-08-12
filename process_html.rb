require 'rubygems'
require 'nokogiri'

HTML_DIR = "raw-html"


records = []

Dir["#{HTML_DIR}/page-*.html"].each do |file|
  raw_html = File.read(file)
  doc = Nokogiri::HTML::Document.parse(raw_html)

  doc.css("table#results_tbl").each do |table|
    current_record = { }
    rows = table.css("tr")
    # first row is a blank

    # second row
    columns = rows[1].css("td")
    current_record[:lobbyist] = columns[1].content
    current_record[:client] = columns[3].content

    # third row
    columns = rows[2].css("td")
    current_record[:industry] = columns[1].content
    current_record[:industry_type] = columns[3].content


    # fourth row
    columns = rows[3].css("td")
    current_record[:total_pay] = columns[1].content
    current_record[:client_out_of_state] = columns[3].content

    # fifth row
    columns = rows[4].css("td")
    current_record[:notes] = columns[1].content

    # sixth row is a blank

    records << current_record
  end
end

