package com.example.quanlysv.servlet.util;

import java.lang.reflect.Field;

public class Convert {
    public static <E, D> D convertEntityToDTO(E entity, Class<D> dtoClass) throws IllegalAccessException, InstantiationException {
        D dto = dtoClass.newInstance();
        Field[] entityFields = entity.getClass().getDeclaredFields();
        Field[] dtoFields = dtoClass.getDeclaredFields();
        for (Field entityField : entityFields) {
            entityField.setAccessible(true);
            for (Field dtoField : dtoFields) {
                dtoField.setAccessible(true);
                if (entityField.getName().equals(dtoField.getName())) {
                    dtoField.set(dto, entityField.get(entity));
                    break;
                }
            }
        }
        return dto;
    }

    public static <E, D> E convertDTOToEntity(D dto, Class<E> entityClass) throws IllegalAccessException, InstantiationException {
        E entity = entityClass.newInstance();
        Field[] dtoFields = dto.getClass().getDeclaredFields();
        Field[] entityFields = entityClass.getDeclaredFields();
        for (Field dtoField : dtoFields) {
            dtoField.setAccessible(true);
            for (Field entityField : entityFields) {
                entityField.setAccessible(true);
                if (dtoField.getName().equals(entityField.getName())) {
                    entityField.set(entity, dtoField.get(dto));
                    break;
                }
            }
        }
        return entity;
    }

}
