class Tree {
  int item;
  Tree @ left, right;

  fun static Tree new_Tree(int it, int depth) {
    Tree t;
    it => t.item;
    if (depth > 0) {
      it + it => int item2;
      --depth;
      new_Tree(item2 - 1, depth) @=> t.left;
      new_Tree(item2, depth) @=> t.right;
    }
    return t;
  }

  fun int check() {
    if (left == NULL)
      return item;
    return item + left.check() - right.check();
  }
}

4 => int minDepth;
12 => int maxDepth;
maxDepth + 1 => int stretchDepth;

<<< "stretch tree of depth ", stretchDepth, " check: ",
  Tree.new_Tree(0, stretchDepth).check() >>>;

Tree.new_Tree(0, maxDepth) @=> Tree @ longLivedTree;

1 => int iterations;
for (int d; d < maxDepth; ++d)
  2 *=> iterations;

minDepth => int depth;
while (depth < stretchDepth) {
  int check;
  for (int i; i < iterations; ++i)
    Tree.new_Tree(i, depth).check() + Tree.new_Tree(-i, depth).check() +=> check;

  <<< iterations * 2, " trees of depth ", depth, " check: ", check >>>;
  4 /=> iterations;
  2 +=> depth;
}

<<< "long lived tree of depth ", maxDepth, " check: ", longLivedTree.check() >>>;
