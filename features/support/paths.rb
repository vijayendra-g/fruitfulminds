module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (FruitfulMinds )?home\s?page$/
      '/'
    when /^the login page$/
      '/login'
    when /^the portal page$/
      '/portal'
    when /^the Add new pre-survey part 1 results page$/ then new_presurveys_part1_path
    when /^the Add new pre-survey part 2 results page$/ then new_presurveys_part2_path
    when /^the Add new post-survey results page$/ then new_postsurvey_path
    when /^the Edit Pre-Survey Results \(Part 1\) page for survey (.*)$/ then edit_presurveys_part1_path($1)
    when /^the Add New Food Journal page$/ then new_foodjournal_path
    when /^the surveys page$/ then '/surveys'
    when /^the reports page$/
      '/reports'
    when /^the generate report page$/
      '/reports/new'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
