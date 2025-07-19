function fn() {
    return {
        generatePassword: function (length) {
            length = length || 8;
            var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*';
            var password = '';
            for (var i = 0; i < length; i++) {
                password += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            return password;
        },
        getRandomUser: function (users) {
            return users[Math.floor(Math.random() * users.length)];
        },
        generateRandomEmail: function (firstName, lastName) {
            var domains = ['gmail.com', 'yahoo.com', 'hotmail.com', 'usfx.bo'];
            var randomDomain = domains[Math.floor(Math.random() * domains.length)];
            return firstName.toLowerCase() + '.' + lastName.toLowerCase() + '@' + randomDomain;
        },
        generateDynamicData: function (baseUser, isValidDomain) {
            isValidDomain = isValidDomain !== false;
            return {
                email: isValidDomain ? baseUser.email : fn().generateRandomEmail(baseUser.first_name, baseUser.last_name),
                password: fn().generatePassword(),
                first_name: baseUser.first_name,
                last_name: baseUser.last_name,
                id: baseUser.id
            };
        }
    };
}

