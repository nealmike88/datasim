#include <iostream>
#include <cstdlib>
#include <string>
#include <thread>	// For sleep
#include <atomic>
#include <chrono>
#include <cstring>
#include <vector>
#include "datasim/numbergen.h"
#include "mqtt/async_client.h"

using namespace std;

const string DFLT_SERVER_ADDRESS { "tcp://192.168.20.17:1883" };

const string TOPIC { "test" };
const int QOS = 1;

const auto TIMEOUT = std::chrono::seconds(10);

float y; 
int t = 0; 
int tcount = 6;
vector<float> t_speed; 
vector<string> topics; 

vector<string> build_topics(int tcount)
{
	vector<string> v;
	for (int i=0; i<tcount; i++)
	{
		v.push_back("thruster" + to_string(i));
		cout << "Topic: " << v[i] << endl;
	}
	
	return v;
}

/////////////////////////////////////////////////////////////////////////////

int main(int argc, char* argv[])
{
    // Set up MQTT connection
	string address = (argc > 1) ? string(argv[1]) : DFLT_SERVER_ADDRESS;
	cout << "Initializing for server '" << address << "'..." << endl;
	mqtt::async_client cli(address, "");
	cout << "  ...OK" << endl;
	mqtt::token_ptr tok;
	cout << "\nConnecting..." << endl;
	cli.connect()->wait();
	cout << "  ...OK" << endl;

    // Builds vector of topics based on desired amount
	cout << "Building Topics. . ." << to_string(44) << endl;
	topics = build_topics(tcount);

    // Initialize data simulator 
	Datasim ds; 

	while(true)
	{
		for (int i = 1; i<=tcount; i++)
		{
			// Publish Payload
			try {
				mqtt::topic top(cli,topics[i], QOS);

				y = ds.simdata(t); 
				cout << "\n" << topics[i] << ": " << to_string(y) << endl;

				// size_t i = 0;
				tok = top.publish(to_string(y));
				tok->wait();	// Just wait for the last one to complete.
				cout << "OK" << endl;	
				t++; 		
			}
			catch (const mqtt::exception& exc) {
				cerr << exc << endl;
				return 1;
			}
		}
	}
	
	// Disconnect
	cout << "\nDisconnecting..." << endl;
	cli.disconnect()->wait();
	cout << "  ...OK" << endl;

 	return 0;
}