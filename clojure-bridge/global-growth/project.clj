(defproject global-growth "0.1.0-SNAPSHOT"
  :description "Demonstrates the use of the World Bank API"
  :url "https://github.com/clojurebridge/global-growth"
  :license {:name "Creative Commons Attribution License"
            :url "http://creativecommons.org/licenses/by/3.0/"}
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [clj-http "0.7.7"]
                 [cheshire "5.2.0"]
                 [ring "1.2.1"]
                 [compojure "1.1.6"]
                 [hiccup "1.0.4"]]
  :plugins [[lein-ring "0.8.10"]]
;;   :ring {:handler global-growth.web/handler}
  :main ^:skip-aot global-growth.core
  :target-path "target/%s")
