import React, {useState} from 'react';
import {SafeAreaView, StyleSheet, Text, View} from 'react-native';
import TodoInsert from './components/TodoInsert';
import TodoList from './components/TodoList';

const App = () => {
  // 할 일 목록 추가, 삭제 기능을 위한 상태값(id, textValue, checked)
  const [todos, setTodos] = useState([]);

  // 사용자가 입력한 텍스트를 인자로 받아 새로운 todo 객체 생성
  // id는 랜덤 생성, checked는 완료 여부를 나타내기 위함
  const addTodo = text => {
    setTodos([
      ...todos,
      {id: Math.random().toString(), textValue: text, checked: false},
    ]);
  };

  // 할 일 목록 삭제 함수
  const onRemove = id => e => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  // 할 일 목록에 완료 체크 표시 함수
  const onToggle = id => e => {
    setTodos(
      todos.map(todo =>
        todo.id === id ? {...todo, checked: !todo.checked} : todo,
      ),
    );
  };

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.appTitle}>To-Do List</Text>
      <View style={styles.card}>
        {/* addTodo 함수를 TodoInsert 컴포넌트로 전달 */}
        <TodoInsert onAddTodo={addTodo} />
        {/* 하위 컴포넌트에서 사용하기 위해 전달 */}
        <TodoList todos={todos} onRemove={onRemove} onToggle={onToggle} />
      </View>
    </SafeAreaView>
  );
};

// 스타일
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'skyblue',
  },
  appTitle: {
    color: 'black',
    fontSize: 36,
    marginTop: 30,
    marginBottom: 30,
    fontWeight: '300',
    textAlign: 'center',
    backgroundColor: 'skyblue',
  },
  card: {
    backgroundColor: '#fff',
    flex: 1,
    borderTopLeftRadius: 10, // to provide rounded corners
    borderTopRightRadius: 10, // to provide rounded corners
    marginLeft: 10,
    marginRight: 10,
    marginBottom: 10,
  },
  input: {
    padding: 20,
    borderBottomColor: '#bbb',
    borderBottomWidth: 1,
    fontSize: 24,
    marginLeft: 20,
  },
});

export default App;
