
== About ==

OBSOLETE _vp_ 20160513

ish_lib powers the microsites2, microsites3 frameworks.

It looks like branch master should be deployed. If you deploy branch master-0.7.0, merge it to master, then deploy master.
This has to do with shallow clone and references not being trees.

=== branches ===

master-v1
 ~/projects/ish_lib
master
 that's the stuff for ish_lib gem
 
== Some tasks ==

be rake sitemaps:generate lang=en domain=travel-guide.mobi verbose=true

== How to use ==

link: app/assets, app/models, lib, data, vendor/assets, spec/factories

    #
    # link ish_lib
    #
    %w{ app/models app/assets lib data spec/factories }.each do |folder|
      link "#{app['deploy_to']}/current/#{folder}" do
        to "/home/#{app['owner']}/projects/ish_lib/current/#{folder}"
      end
    end

