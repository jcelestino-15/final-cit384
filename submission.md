Jazmin Celestino

1. What is the difference between Docker image and Docker container?
    * Docker image is a file that has the source corde, libraries, and other files necesssary for an application to run. A container is a running instance of an image.                                                   

2. What is the command to build a docker image named `cit384-final`?
    * docker build -t cit384-final .                                                 

3. What is the command to run a container with `cit384-final` image with an interactive terminal running bash?
    *  docker run -it --name cit384-container cit384-final /bin/bash                                                 

4. When running Docker commands there are many options you can use for example to run a container named cit384 with an ubuntu image the command is: `docker run --name cit384 ubuntu`. What do the following options do? 
   1. --name: Names my container cit384
   2. -d: detach, run the container in background and print container ID                                            
   3. --rm: automatically remove the container when it exists                                             
   4. -p: adds a container's port(s) to the host                                             
   5. --add-host: adding a custom host-to-IP mapping
   6. -it: interactive - keep stdin open
   7. -v: volume

5. What is the difference between `-` and `--` in command line parameter?
    * The difference is that the '-' is a simple option and the '--' is when the option takes arguments.                                                  

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
    git clone git@github.com:org/project.git 
    cd project
    touch newfile
    git add .
    git commit -m "adding new file"
    git push
    
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for 
   2. ProxyEngine: Allow us to enables or disables the SSL/TLS protocol engine for proxy                                      
   3. ProxyAddHeaders: Add proxy information in X-Forwarded headers                                 
   4. ProxyPass: Allows remote servers to be mapped into local server                                        
   5. ProxyPassReverse: Lets Apache httpd adjust the URL in Location, URI headers on HTTP redirect response                                 
   6. RewriteRule: Defines rules for the rewriting engine                                      
   7. Redirect: maps an old URL into a new one.                                         

8. What module needs to be enabled in order to use the Rewrite directive?
    *  mod_rewrite                                                  

9. What is the command to enable a new domain/vHost?
    * sudo a2ensite site1.internal                                          

10. What is the command to disable a new domain/vHost?
    * sudo a2dissite 000-default.conf                                                 

11. What happens when a user enters a URL into the browser?
    *                                                  <!-- answer -->

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.
