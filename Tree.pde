class Tree<T> {
  Node<T> anchor;
  HashMap<String, Node<T>> map;
  
  Tree() {
    anchor = null;  
    map = new HashMap<String, Node<T>>();
  }
  
  void add_anchor(String id, T value) {
    anchor = new Node(id, value);
    map.put(id,anchor);
  }
  
  void add_child_to(String id_parent, T value, String id_child) {
    Node<T> new_node = new Node(id_child, value);
    Node<T> parent = map.get(id_parent);
    if (parent != null) {
      map.put(id_child, new_node);
      parent.children.add(new_node);
    }
  }
  
  ArrayList<Node<T>> get_children_of(String id_parent) {
    ArrayList<Node<T>> children = null;
    Node<T> parent = map.get(id_parent);
    if (parent != null) children = parent.children;
    
    return null;
  }
  
  void print_tree() {
    print_tree_rec(anchor, 0);
  }
  
  void print_tree_rec(Node<T> parent, int level) {
    if (parent != null) {
      for(int i=0;i<level;i++) print("-");
      println(parent.identifier);
      for (Node<T> child : parent.children) print_tree_rec(child,level+1);
    }
  }
    
  class Node<T> {
    ArrayList<Node<T>> children;
    T value;
    String identifier;
    
    public Node(String id, T val) {
      identifier = id;
      value = val;
      children = new ArrayList<Node<T>>();
    }
  }
}