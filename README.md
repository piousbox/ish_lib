
== About ==

ish_lib powers the microsites2, microsites3 frameworks.

It looks like branch master should be deployed. If you deploy branch master-0.7.0, merge it to master, then deploy master.
This has to do with shallow clone and references not being trees.

== Some tasks ==

be rake sitemaps:generate lang=en domain=travel-guide.mobi verbose=true

== How to use ==

link: app/assets, app/models, lib/, data/, vendor/assets

    #
    # link ish_lib
    #
    %w{ app/models app/assets lib data }.each do |folder|
      link "#{app['deploy_to']}/current/#{folder}" do
        to "/home/#{app['owner']}/projects/ish_lib/current/#{folder}"
      end
    end

== Version ==

master-0.7.1

