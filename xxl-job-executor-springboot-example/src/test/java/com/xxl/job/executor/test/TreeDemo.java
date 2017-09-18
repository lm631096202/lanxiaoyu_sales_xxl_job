package com.xxl.job.executor.test;


import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;

import com.xxl.job.activemq.http.HttpUtil;
import com.xxl.job.core.util.JacksonUtil;
 
public class TreeDemo {
    public static void main(String[] args) {
    	String re=new HttpUtil().getFromHttp("http://lanxiaoyubaby.520haikushilan.com/weixin/test/user_tree", null);
    	User[] mapper=JacksonUtil.readValue(re, User[].class);
    	
    	Map<String, DefaultMutableTreeNode> treen=new HashMap<String, DefaultMutableTreeNode>();   
    	for (User user : mapper) {
    		treen.put(user.son_id, new DefaultMutableTreeNode(user));
		}
    	for (User user : mapper) {
    		if(!user.parent_id.equals(user.son_id)){
    			DefaultMutableTreeNode p= treen.get(user.parent_id);
    			DefaultMutableTreeNode s=treen.get(user.son_id);
    					p.add(s);
    		}
    		
		}
    	
        
        final JTree tree = new JTree(treen.get("0"));
        JFrame f = new JFrame("JTreeDemo");
        
        JScrollPane jsp = null; 
        jsp = new JScrollPane(tree);
        f.add(jsp);
        f.setSize(300, 300);
        f.setVisible(true);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // 添加选择事件
        tree.addTreeSelectionListener(new TreeSelectionListener() {
 
            @Override
            public void valueChanged(TreeSelectionEvent e) {
                DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree
                        .getLastSelectedPathComponent();
 
                if (node == null)
                    return;
 
                Object object = node.getUserObject();
                if (node.isLeaf()) {
                    User user = (User) object;
                    System.out.println("你选择了：" + user.toString());
                }
 
            }
        });
    }
}
 
class User {
	public String son_id;
	public String parent_id;
	public String depth;
	public String left;
	public String right;
	public String root_id;

 
    // 重点在toString，节点的显示文本就是toString
    public String toString() {
        return left+"-"+son_id+"-"+parent_id+"-"+depth+"-"+root_id+"-"+right;
    }
}