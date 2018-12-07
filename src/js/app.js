App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    return await App.initWeb3();
  },

  initWeb3: async function() {
    /*
     * Replace me...
     */
    // Modern dapp browsers...
    if (window.ethereum) {
      App.web3Provider = window.ethereum;
      try {
        // Request account access
        await window.ethereum.enable();
      } catch (error) {
        // User denied account access...
        console.error("User denied account access")
      }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
      App.web3Provider = window.web3.currentProvider;
    }
    // If no injected web3 instance is detected, fall back to Ganache
    else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);
    

    return App.initContract();
  },

  initContract: function() {
    /*
     * Replace me...
     */
    $.getJSON('Patients.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      var PatientsArtifact = data;
      App.contracts.Patients = TruffleContract(PatientsArtifact);
    
      // Set the provider for our contract
      App.contracts.Patients.setProvider(App.web3Provider);
    
      
      // Use our contract to retrieve and mark the adopted pets
      document.getElementById("Record row").innerHTML = "last inserted value into the blockchain is : " + App.pullRecords();
      return App.pullRecords();
      
    });

  },

/*on click?? */

///connection....
pullRecords: function(records, account) {
    /*
     * Replace me...
     */
    var PatientsInstance;

    App.contracts.Patients.deployed().then(function(instance) {
      PatientsInstance = instance;

      return PatientsInstance.getLength(); //update num
      //return PatientsInstance.getRecords.call();
    })
    
    
  },

/*
  handleAdopt: function(event) {
    event.preventDefault();

    var petId = parseInt($(event.target).data('id'));

    
    var adoptionInstance;

    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];

      App.contracts.Adoption.deployed().then(function(instance) {
        adoptionInstance = instance;

        // Execute adopt as a transaction by sending account
        return adoptionInstance.adopt(petId, {from: account});
      }).then(function(result) {
        return App.markAdopted(); //mark adopted now = pullRecords
      }).catch(function(err) {
        console.log(err.message);
      });
    });
  }
*/
};
var Instance = Patients.at("0xdc044...")
return Instance

$(function() {
  $(window).load(function() {
    App.init();
  });
});
