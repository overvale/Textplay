#!/usr/bin/ruby

# grab the config file from the argument's parent dir
config_file = ARGV[0].scan(/^(.+)(?=\/)/).join + "/textplay_config"

# check to see if a configuration file exists
if File.exists?("#{config_file}")
  config_file_exists = true
else
  config_file_exists = false
end

# =====================================================

# set in-document values
text = "home=paris;"

# set variables from config file
if config_file_exists == true
  config_home = File.read("#{config_file}").scan(/home=(.+?);/i).join
  config_school = File.read("#{config_file}").scan(/school=(.+?);/i).join
end

# =====================================================

# reset variables from document
doc_home = text.scan(/home=(.+?);/i).join
doc_school = text.scan(/school=(.+?);/i).join

# =====================================================
# use the in-docuemnt vars if they exist,
# then fall-back to the config_file vars if they exist,
# then fallback to the default

# ----- HOME ----- #
if doc_home != ""
  home = doc_home
else
  if config_home != ""
    home = config_home
  else
    home = "mars"
  end
end

# ----- SCHOOL ----- #
if doc_school != ""
  school = doc_school
  else
    if config_school != ""
      school = config_school
    else
      school = "oxford"
    end
end

# =====================================================


print "\n"
print "home: #{home}\n"
print "school: #{school}\n"
