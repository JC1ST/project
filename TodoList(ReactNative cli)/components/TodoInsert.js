import React, {useState} from 'react';
import {Button, StyleSheet, TextInput, View} from 'react-native';

// 전달한 함수를 받아 오는 부분 : {onAddTodo}
const TodoInsert = ({onAddTodo}) => {
  // TextInput에서 입력한 텍스트 값의 상태를 관리하기 위한 훅
  const [newTodoItem, setNewTodoItem] = useState('');

  // 실시간으로 사용자가 입력한 텍스트 값의 변화를 관리하기 위한 함수
  const todoInputHandler = newTodo => {
    setNewTodoItem(newTodo);
  };

  const addTodoHandler = () => {
    onAddTodo(newTodoItem);
    setNewTodoItem('');
  };

  // 입력 창과 ADD 버튼
  return (
    <View style={styles.inputContainer}>
      <TextInput
        style={styles.input}
        placeholder="Add an item!"
        placeholderTextColor={'#999'}
        onChangeText={todoInputHandler}
        value={newTodoItem}
        autoCorrect={false}
      />
      <View style={styles.button}>
        <Button title={'ADD'} onPress={addTodoHandler} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  inputContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  input: {
    flex: 1,
    padding: 20,
    borderBottomColor: '#bbb',
    borderBottomWidth: 1,
    fontSize: 24,
    marginLeft: 20,
  },
  button: {
    marginRight: 10,
  },
});

export default TodoInsert;
