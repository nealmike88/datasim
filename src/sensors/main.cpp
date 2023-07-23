// topic_publish.cpp
//
// This is a Paho MQTT C++ client, sample application.
//
// It's an example of how to send messages as an MQTT publisher using the
// C++ asynchronous client interface using a 'topic' object to repeatedly
// send data to the same topic.
//
// The sample demonstrates:
//  - Connecting to an MQTT server/broker
//  - Publishing messages
//  - Use of the 'topic' class
//

/*******************************************************************************
 * Copyright (c) 2019 Frank Pagliughi <fpagliughi@mindspring.com>
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *
 * The Eclipse Public License is available at
 *    http://www.eclipse.org/legal/epl-v10.html
 * and the Eclipse Distribution License is available at
 *   http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * Contributors:
 *    Frank Pagliughi - initial implementation and documentation
 *******************************************************************************/

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

const string DFLT_SERVER_ADDRESS { "tcp://192.168.20.187:1883" };

const string TOPIC { "test" };
const int QOS = 1;

const auto TIMEOUT = std::chrono::seconds(10);

float y; 
int t = 0; 
int tcount = 100;

vector<string> build_topics(int tstart, int tcount)
{
	vector<string> v;

	for (int i=tstart; i<(tstart + tcount); i++)
	{
		v.push_back("sim" + to_string(i));
		// cout << "Topic: " << v[i] << endl;
	}
	
	return v;
}

/////////////////////////////////////////////////////////////////////////////

int main(int argc, char* argv[])
{
	cout << "Initializing for server '" << DFLT_SERVER_ADDRESS << "'..." << endl;
	mqtt::async_client cli(DFLT_SERVER_ADDRESS, "");
	cout << "  ...OK" << endl;

	cout << "Building # of topics: " << to_string(tcount) << endl;
	vector<string> topics = build_topics(stoi(argv[1]), tcount);
	cout << "  ...OK" << endl;

	mqtt::token_ptr tok;
	cout << "\nConnecting to MQTT server..." << endl;
	cli.connect()->wait();
	cout << "  ...OK" << endl;

	cout << "\nInitializing Sim..." << endl;
	Datasim ds; 
	cout << "  ...OK" << endl;

	while(true)
	{
		for (int i=0; i<tcount; i++)
		{
			// Publish Payload
			try {
				cout << "Assigning Topic. . ." << endl;
				mqtt::topic top(cli, topics[i], QOS);
				cout << "...OK" << endl;

				cout << "Simulating data. . ." << endl; 
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