# Beefcrazy::Application.config.secret_key_base = '84522731d32110035f2ccdede3cad39a232096d15e32b1707bf591bd84213f1c3754a5057449d9a0b97983cd98283b3afaf702204bd482a49e10fcfc95dd9930'
Beefcrazy::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || "9ddbcb2d27eeea92fd6bda38ac9c688f48ee9f37ec2934e8a8cabfb78f1a9f3ca87f2bdef5bdaa7b8fdeee40bd03ead9d6b35fd3b5fb614c7b64f2c2167fec81"