package simpleChain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.GsonBuilder;
import simpleChain.Block;

public class PublicChain {
	public static List<Block> blockchain = new ArrayList<Block>();

	
	public List<Tran> trans = new ArrayList<Tran>(); // Tran class 내에 있는 요소들을 list로 저장.

	public static int difficulty = 3;
	
	public String product;
	public String nation;
	public String amount;
	
	public static List<Object> transactions = new ArrayList<>(); // 갖고갈 array
	
	public static Map<String, String> mapTrans; // array에 요소를 넣기 위한 Map.

	public int index = 0;
	
	
	//add our blocks to the blockchain ArrayList:
	
	// 01. 09 알고리즘 수정해서 Block을 생성할 때 현재 클래스에 있는 Array를 갖고가게끔 시도.
	
	public void test() { 
				//add our blocks to the blockchain ArrayList:
				System.out.println("\n===========================================================================================\n");
				System.out.println("블록체인 사이즈 : " + blockchain.size());

				while(true) {
					if(blockchain.size() == 0) {
						
						blockchain.add(new Block(blockchain.size(), Integer.toString(blockchain.size()+1)+"번째 블록", "0", transactions, mapTrans));
						transactions = new ArrayList<>();
						System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!Blockchain = " + blockchain.get(0));
						System.out.println((blockchain.size())+"번째 블록 마이닝 중 ,,");
						blockchain.get(blockchain.size()-1).mineBlock(difficulty);
						index++;
						break;
					}
					else {
						blockchain.add(new Block(blockchain.size(), Integer.toString(blockchain.size()+1)+"번째 블록", blockchain.get(blockchain.size()-1).hash, transactions, mapTrans));
						transactions = new ArrayList<>();
						System.out.println((blockchain.size())+"번째 블록 마이닝 중 ,,");
						blockchain.get(blockchain.size()-1).mineBlock(difficulty);
						index++;
						break;
					}
				}
				
				System.out.println("\nBlockchain is Valid: " + isChainValid());
				
				String blockchainJson = new GsonBuilder().setPrettyPrinting().create().toJson(blockchain);
				
				System.out.println("\n===========================================================================================");
				
				System.out.println("\n THE BLOCK CHAIN : ");
				System.out.println(blockchainJson);
				
				System.out.println("\n===========================================================================================");
	}
	
	
	public List<Object> addObject(String product, String nation, String amount) {
		
		mapTrans = new HashMap<>(); // 진짜 대박 . https://its21c.net/248 을 참고하여 작성. 이 게시글 100번도 넘게 본 것 같은데 이제 이해함.
		
		System.out.println("BEFORE TRANSACTIONS : \n");
		for(int i = 0 ; i < transactions.size(); i++)
		{
			System.out.println(transactions.get(i));
		}
		System.out.println("\n");
		
		
		mapTrans.put("product", product);
		mapTrans.put("nation", nation);
		mapTrans.put("amount", amount);

		transactions.add(mapTrans);
			
		
		System.out.println("AFTER TRANSACTIONS : \n");
		for(int i = 0 ; i < transactions.size(); i++)
		{
			System.out.println(transactions.get(i));
		}
		
		return transactions;
		
	}

	public static Boolean isChainValid() {
		Block currentBlock; 
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace('\0', '0');
		
		//loop through blockchain to check hashes:
		for(int i=1; i < blockchain.size(); i++) {
			currentBlock = blockchain.get(i);
			previousBlock = blockchain.get(i-1);
			//compare registered hash and calculated hash:
			if(!currentBlock.hash.equals(currentBlock.calculateHash()) ){
				System.out.println("Current Hashes not equal");			
				return false;
			}
			//compare previous hash and registered previous hash
			if(!previousBlock.hash.equals(currentBlock.previousHash) ) {
				System.out.println("Previous Hashes not equal");
				return false;
			}
			//check if hash is solved
			if(!currentBlock.hash.substring( 0, difficulty).equals(hashTarget)) {
				System.out.println("This block hasn't been mined");
				return false;
			}
		}
		return true;
	}
}