ruby_cmd=`which ruby`
config_file="conf/conf.yml"
main_app="src/main_app.rb"
CMD="$ruby_cmd $main_app $config_file"
$CMD
