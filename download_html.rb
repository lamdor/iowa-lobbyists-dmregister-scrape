BASE_URL = "http://data.desmoinesregister.com/results/index.php?info=lobbyists_details&BRSR=0&displayStyle=1&submit=&Lobbyist=&Client=&Industry=&Type=&Pay=&OutOfState=&notes_orig=&sort=Pay&desc=desc&update=Sort#tbl"
TOTAL = 845
OUTPUT_DIR = "raw-html"

require 'open-uri'

(0..TOTAL).step(25) do |i|
  url = BASE_URL.gsub("BRSR=0", "BRSR=#{i}")
  open(url) do |raw_html|
    File.open(File.join(OUTPUT_DIR, "page-#{i}.html"), 'w') do |f|
      f.write(raw_html.read)
    end
  end
end
