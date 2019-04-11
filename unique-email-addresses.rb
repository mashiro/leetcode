# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  emails.map do |email|
    local, domain = email.split("@")
    local = local.split("+").first.gsub(".", "")
    "#{local}@#{domain}"
  end.uniq.size
end

p num_unique_emails(["test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"])