# debugging helper for cucumber by RainChen @ 2009-11-18
# more detail: http://hi.baidu.com/rainchen/blog/item/ee410708d2f5a63ae8248823.html
 
if Cucumber::VERSION == '0.4.4'
 
Then /^(.+) for debugging$/ do |whatever|
ENV['DEBUGGING'] = whatever
warn(%{Debuging: Then #{whatever}})
Then %{#{whatever}}
end
 
Given /^I am debugging$/ do
ENV['DEBUGGING'] = 'yes'
end
class Object #:nodoc:
 
# TODO: Move most of this stuff out to an InstanceExecutor class.
def cucumber_instance_exec(check_arity, pseudo_method, *args, &block)
cucumber_run_with_backtrace_filtering(pseudo_method) do
if check_arity && !cucumber_compatible_arity?(args, block)
instance_exec do
ari = cucumber_arity(block)
ari = ari < 0 ? (ari.abs-1).to_s+"+" : ari
s1 = ari == 1 ? "" : "s"
s2 = args.length == 1 ? "" : "s"
raise Cucumber::ArityMismatchError.new(
"Your block takes #{ari} argument#{s1}, but the Regexp matched #{args.length} argument#{s2}."
)
end
else
debugger if ENV['DEBUGGING']
# type "step"
instance_exec(*args, &block)
end
end
end
 
end
end
