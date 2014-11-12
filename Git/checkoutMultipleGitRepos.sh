#!/bin/bash

repositories=( git@github.com:VillainousEgo/Swift-ArrayCombineExtension.git
                git@github.com:VillainousEgo/Daniellove-net-posts.git
                git@github.com:VillainousEgo/NodeJS-HelloWorld.git
                git@github.com:VillainousEgo/iMobileDevice.git
                git@github.com:VillainousEgo/Timesaver.git
                git@github.com:VillainousEgo/jekyll-plugins.git
            )

for repo in "${repositories[@]}"
do
	git clone --recursive $repo
done
