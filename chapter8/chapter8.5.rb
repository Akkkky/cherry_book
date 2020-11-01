p self
p self.class
  
class User
  p self
  p self.class
end

# Userクラス自身のクラスはClassクラス
p User.class # => Class
# ClassクラスのスーパークラスはModuleクラス
p Class.superclass # => Module

module Loggable
end

# Loggableモジュール自身のクラスはModuleクラス
Loggable.class # => Module
# ModuleクラスのスーパークラスはObjectクラス
Module.superclass # => Object