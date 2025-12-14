package com.gm.wj.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class RedisService {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    // 普通 set 操作，带过期时间
    public void set(String key, Object value, long time) {
        redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
    }

    // 普通 set 操作，不带过期时间
    public void set(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    // 获取操作
    public Object get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    // 删除操作
    public Boolean delete(String key) {
        return redisTemplate.delete(key);
    }

    public Long delete(Set<String> keys) {
        return redisTemplate.delete(keys);
    }

    // 根据模式获取匹配的键
    public Set<String> getKeysByPattern(String pattern) {
        return redisTemplate.keys(pattern);
    }

    // 设置过期时间
    public void setExpiry(String key, long time, TimeUnit timeUnit) {
        redisTemplate.expire(key, time, timeUnit);
    }

    // 使用 List 数据结构
    public void leftPush(String key, Object value) {
        redisTemplate.opsForList().leftPush(key, value);
    }

    public Object rightPop(String key) {
        return redisTemplate.opsForList().rightPop(key);
    }

    // 使用 Set 数据结构
    public Long addToSet(String key, Object value) {
        return redisTemplate.opsForSet().add(key, value);
    }

    public Set<Object> getSetMembers(String key) {
        return redisTemplate.opsForSet().members(key);
    }

    // 使用 Hash 数据结构
    public void putToHash(String key, String hashKey, Object value) {
        redisTemplate.opsForHash().put(key, hashKey, value);
    }

    public Object getFromHash(String key, String hashKey) {
        return redisTemplate.opsForHash().get(key, hashKey);
    }

    public void del(String key) { redisTemplate.delete(key); }
}