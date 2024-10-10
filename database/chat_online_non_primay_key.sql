CREATE TABLE `chat_rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id_1` INT NOT NULL,
    `user_id_2` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `posts`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `notifications`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    `type` ENUM(
        'friend_request',
        'message',
        'comment',
        'like',
        'system'
    ) NOT NULL,
    `is_read` INT NOT NULL DEFAULT '0',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `roles`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_info`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `age` INT NULL,
    `gender` ENUM('male', 'female', 'other') NULL,
    `phone` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `media`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `post_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `is_avatar` INT NOT NULL DEFAULT '0',
    `media_type` ENUM('video', 'image', 'audio') NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `friendships`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `friend_id` INT NOT NULL,
    `status` ENUM(
        'pending',
        'accepted',
        'declined',
        'blocked'
    ) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `token`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `token` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `expired_at` TIMESTAMP NOT NULL
);
CREATE TABLE `messages`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `room_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `post_comments`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `post_id` INT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `user_cmt_id` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `user_roles`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL
);
CREATE TABLE `post_comment_rep`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `cmt_id` INT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `status` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);