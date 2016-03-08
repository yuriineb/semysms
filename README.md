# Semysms
GEM для работы с API https://semysms.net
Описание API - https://semysms.net/api.php

## Инсталяция

Добавьте в Ваш Gemfile:

```ruby
gem 'semysms', github: 'yuriineb/semysms'
```

И выполните:

    $ bundle

Или установите его самостоятельно:

    $ gem install semysms

## Использование
### Инициализация
```ruby
require "semysms"
semysms = Semysms::Sms.new(token)
```
Параметры:

- token - секретный ключ доступа к API (**обязательный параметр**)

### Метод для отправки одного СМС-сообщения одному адресату:
```ruby
semysms.send(device, phone, msg, { priority: priority, name: name, surname: surname })
```

Параметры:

- device - код устройства из списка подключенных ваших устройств (**обязательный параметр**)
- phone - телефон получателя в международном формате с кодом страны (**обязательный параметр**)
- msg - текст сообщения, до 1000 символов (**обязательный параметр**)
- priority - Приоритет на отправку, чем больше число, тем выше приоритет (целое число от 0 - 1000000)
- name - Имя контакта для создания номера в списке контактов
- surname - Фамилия контакта для создания номера в списке контактов


### Метод для получения списка исходящих СМС-сообщений
```ruby
semysms.outbox_sms(device, { start_id: start_id, end_id: end_id, list_id: list_id, date_start: date_start, date_end: date_end })
```

Параметры:

- device - код устройства из списка подключенных ваших устройств (**обязательный параметр**)
- start_id - начальный код для фильтрации списка
- end_id - конечный код для фильтрации списка
- list_id - список кодов смс через запятую
- date_start - дата с которой начинать фильтрацию
- date_end - дата по которую фильтровать

### Метод для получения списка входящих СМС-сообщений
```ruby
semysms.inbox_sms(device, { start_id: start_id, end_id: end_id })
```

Параметры:

- token - секретный ключ доступа к API (**обязательный параметр**)
- device - код устройства из списка подключенных ваших устройств (**обязательный параметр**)
- start_id - начальный код для фильтрации списка
- end_id - конечный код для фильтрации списка

### Метод для получения списка устройств
```ruby
semysms.devices({ is_arhive:is_arhive, list_id:list_id  })
```

Параметры:

- is_arhive - фильтрация по типу архивный или нет
- list_id - список кодов устройств через запятую

### Метод для отмены отправки всех не отправленных на устройства СМС

```ruby
semysms.cancel_sms_from_device(device)
```

Параметры:

- device - код устройства из списка подключенных ваших устройств (**обязательный параметр**)

### Метод для отмены отправки сообщения на устройства СМС

```ruby
semysms.cancel_sms_from_sms(id_sms)
```

Параметры:

- id_sms - код смс из списка отправленных смс (**обязательный параметр**)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/semysms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

