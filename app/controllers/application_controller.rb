# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_parts

  def init_parts
		left_elements = []
		right_elements = []

		rama = { 
			:full_name => 'Rama', 
			:sys_name => 'base', 
			:types => [
				{ 
					:name => 'Damka - stalowa', 
					:colors => [
						{:file => 'damka-1021.png', :name => '1021', :price => 4843},
						{:file => 'damka-2009.png', :name => '2009', :price => 4843},
						{:file => 'damka-3027.png', :name => '3027', :price => 4843},
						{:file => 'damka-4005.png', :name => '4005', :price => 4843},
						{:file => 'damka-5015.png', :name => '5015', :price => 4843},
						{:file => 'damka-6018.png', :name => '6018', :price => 4843},
						{:file => 'damka-biala.png', :name => 'white', :price => 4843},
						{:file => 'damka-czarna.png', :name => 'black', :price => 4843},
						{:file => 'damka-czerwona.png', :name => 'red', :price => 4843}
					] 
				},
				{ 
					:name => 'Unisex', 
					:colors => [
						{:file => 'damka-1021.png', :name => '1021', :price => 4843},
						{:file => 'damka-2009.png', :name => '2009', :price => 4843},
						{:file => 'damka-3027.png', :name => '3027', :price => 4843},
						{:file => 'damka-4005.png', :name => '4005', :price => 4843},
						{:file => 'damka-5015.png', :name => '5015', :price => 4843},
						{:file => 'damka-6018.png', :name => '6018', :price => 4843},
						{:file => 'damka-biala.png', :name => 'white', :price => 4843},
						{:file => 'damka-czarna.png', :name => 'black', :price => 4843},
						{:file => 'damka-czerwona.png', :name => 'red', :price => 4843}
					] 
				},
				{ 
					:name => 'Męska - stalowa', 
					:colors => [
						{:file => 'damka-1021.png', :name => '1021', :price => 4843},
						{:file => 'damka-2009.png', :name => '2009', :price => 4843},
						{:file => 'damka-3027.png', :name => '3027', :price => 4843},
						{:file => 'damka-4005.png', :name => '4005', :price => 4843},
						{:file => 'damka-5015.png', :name => '5015', :price => 4843},
						{:file => 'damka-6018.png', :name => '6018', :price => 4843},
						{:file => 'damka-biala.png', :name => 'white', :price => 4843},
						{:file => 'damka-czarna.png', :name => 'black', :price => 4843},
						{:file => 'damka-czerwona.png', :name => 'red', :price => 4843}
					] 
				}
			]
		}
		left_elements.append rama

		hamulec = { 
			:full_name => 'Hamulec', 
			:sys_name => 'hamu', 
			:types => [ 
				{ 
					:name => 'Bębnowy', 
					:colors => [ 
						{ :file => 'hamulec-beben.png', :name => 'silver', :price => 44.83 }, 
						{ :file => 'hamulec-beben.png', :name => 'black', :price => 39.50 }
					] 
				},
				{ 
					:name => 'Zwykły', 
					:colors => [
						{ :file => 'hamulec-normalny.png', :name => 'silver', :price => 44.83 }, 
						{ :file => 'hamulec-normalny.png', :name => 'black', :price => 39.50 }
					] 
				}
			]
		}
		left_elements.append hamulec
		chwyty = {
			:full_name => 'Chwyty',
			:sys_name => 'chwy',
			:types => [
				{ 
					:name => 'Normalne' , 
					:colors => [
						{:file => 'chwyty-gumowe-czerwone.png', :name => 'red', :price => 50},
						{:file => 'chwyty-gumowe-sport.png', :name => 'silver', :price => 50}
					] 
				},
				{ 
					:name => 'Skórzane', 
					:colors => [
						{:file => 'chwyty-skora-biale.png', :name => 'white', :price => 150},
						{:file => 'chwyty-skora-brazowy.png', :name => 'brown', :price => 150}
					] 
				},
				{ 
					:name => 'Eko-skóra', 
					:colors => [
						{:file => 'chwyty-ekoskora-czarne.png', :name => 'black', :price => 85}
					] 
				}
			]

		}
		left_elements.append chwyty
		lampa = {
			:full_name => 'Lampa',
			:sys_name => 'lamp', 
			:types => [
				{ 
					:name => 'Czarna', 
					:colors => [
						{:file => 'lampa-czarna.png', :name => 'black', :price => 232}
					] 
				},
				{
					:name => 'Chrom', 
					:colors => [
						{:file => 'lampa-srebrna.png', :name => 'silver', :price => 294}
					] 
				}
			]
		}
		left_elements.append lampa
		koszyk = {
			:full_name => 'Koszyk',
			:sys_name => 'bask',
			:types => [
				{
					:name => 'Jest', 
					:colors => [
						{ :file => 'koszyk.png', 'name' => 'transparent', :price => 217}
					]
				},
				{
					:name => 'Nie ma',
					:colors => [
						{ :file => 'background.png', 'name' => 'transparent', :price => 0}
					]
				}
			]
		}
		#left_elements.append koszyk
		nozka = {
			:full_name => 'Nóżka',
			:sys_name => 'nozk',
			:types => [
				{ 
					:name => 'Pojedyncza',
					:colors => [
						{ :file => 'nozka-pojedyncza.png', 'name' => 'transparent', :price => 40}
					]
				},
				{ 
					:name => 'Podwójna',
					:colors => [
						{ :file => 'nozka-podwojna.png', 'name' => 'transparent', :price => 120}
					]
				}
			]
		}
		left_elements.append nozka
		siodelko = {
			:full_name => 'Siodełko',
			:sys_name => 'siod',
			:types => [
				{ 
					:name => "Obszycie materiałowe", 
					:colors => [
						{:file => 'siodelko-fiolet.png', :name => 'siod_violet', :price => 121},
						{:file => 'siodelko-czerwone.png', :name => 'siod_red', :price => 122}
					] 
				},
				{ 
					:name => "Skóra", 
					:colors => [
						{:file => 'siodelko-czarne2.png', :name => 'siod_skor_nat_black', :price => 321},
						{:file => 'siodelko-brazowe2.png', :name => 'siod_skor_nat_brown', :price => 322}
					] 
				},
				{ 
					:name => "Eko-skóra", 
					:colors => [
						{:file => 'siodelko-czarne.png', :name => 'siod_skor_black', :price => 221},
						{:file => 'siodelko-czarne3.png', :name => 'black', :price => 222},
						{:file => 'siodelko-brazowe.png', :name => 'siod_skor_brown', :price => 222},
						{:file => 'siodelko-szare.png', :name => 'steel', :price => 222}
					] 
				},
			]
		}
		left_elements.append siodelko
		opona_przednia = {
			:full_name => 'Opona<br />przednia',
			:sys_name => 'ftyr',
			:types => [
				{ 
					:name => 'Opona przednia', 
					:colors => [
						{ :file => 'opona-p-bez.png', :name => 'beige', :price => 124},
						{ :file => 'opona-p-biala.png', :name => 'white', :price => 124},
						{ :file => 'opona-p-czarna.png', :name => 'black', :price => 109}
					] 
				}
			]
		}
		right_elements.append opona_przednia
		opona_tylnia = {
			:full_name => 'Opona<br />tylnia',
			:sys_name => 'rtyr',
			:types => [
				{ 
					:name => 'Opona tylnia',
					:colors => [
						{ :file => 'opona-t-bez.png', :name => 'beige', :price => 124},
						{ :file => 'opona-t-biala.png', :name => 'white', :price => 124},
						{ :file => 'opona-t-czarny.png', :name => 'black', :price => 109}
					] 
				}
			]
		}
		right_elements.append opona_tylnia
		widelec = {
			:full_name => 'Widelec',
			:sys_name => 'wide', 
			:types => [
				{ 
					:name => 'Widelec', 
					:colors => [
						{ :file => 'widelec-b-1021.png', :name => '1021', :price => 544},
						{ :file => 'widelec-b-2009.png', :name => '2009', :price => 544},
						{ :file => 'widelec-b-3027.png', :name => '3027', :price => 544},
						{ :file => 'widelec-b-4005.png', :name => '4005', :price => 544},
						{ :file => 'widelec-b-5015.png', :name => '5015', :price => 544},
						{ :file => 'widelec-b-6018.png', :name => '6018', :price => 544},
						{ :file => 'widelec-b-6027.png', :name => '6027', :price => 544},
						{ :file => 'widelec-b-bialy.png', :name => 'white', :price => 544},
						{ :file => 'widelec-b-czarny.png', :name => 'black', :price => 544},
						{ :file => 'widelec-b-czerwony.png', :name => 'red', :price => 544}
					] 
				}
			]
		}
		right_elements.append widelec

		korba = {
			:full_name => 'Korba',
			:sys_name => 'korb',
			:types => [
				{
					:name => 'Korba', 
					:colors => [
						{ :file => 'korba-1021.png', :name => '1021', :price => 544},
						{ :file => 'korba-2009.png', :name => '2009', :price => 544},
						{ :file => 'korba-3027.png', :name => '3027', :price => 544},
						{ :file => 'korba-4005.png', :name => '4005', :price => 544},
						{ :file => 'korba-5015.png', :name => '5015', :price => 544},
						{ :file => 'korba-6018.png', :name => '6018', :price => 544},
						{ :file => 'korba-6027.png', :name => '6027', :price => 544},
						{ :file => 'korba-biala.png', :name => 'white', :price => 544},
						{ :file => 'korba-czarna.png', :name => 'black', :price => 544},
						{ :file => 'korba-czerwona.png', :name => 'red', :price => 544}
					] 
				}
			]
		}
		right_elements.append korba

		oslona = {
			:full_name => 'Osłona<br />łańcucha',
			:sys_name => 'oslo',
			:types => [
				{
					:name => 'Osłona łańcucha', 
					:colors => [
						{ :file => 'oslona-1021.png', :name => '1021', :price => 544},
						{ :file => 'oslona-2009.png', :name => '2009', :price => 544},
						{ :file => 'oslona-3027.png', :name => '3027', :price => 544},
						{ :file => 'oslona-4005.png', :name => '4005', :price => 544},
						{ :file => 'oslona-5015.png', :name => '5015', :price => 544},
						{ :file => 'oslona-6018.png', :name => '6018', :price => 544},
						{ :file => 'oslona-6027.png', :name => '6027', :price => 544},
						{ :file => 'oslona-biala.png', :name => 'white', :price => 544},
						{ :file => 'oslona-czarna.png', :name => 'black', :price => 544},
						{ :file => 'oslona-czerw.png', :name => 'red', :price => 544},
						{ :file => 'oslona-chrom.png', :name => 'chrom', :price => 544}
					] 
				}
			]
		}
		right_elements.append oslona

		kierownica = {
			:full_name => 'Kierownica',
			:sys_name => 'kier',
			:types => [
				{
					:name => 'Kierownica', 
					:colors => [
						{ :file => 'kierownica-1021.png', :name => '1021', :price => 544},
						{ :file => 'kierownica-2009.png', :name => '2009', :price => 544},
						{ :file => 'kierownica-3027.png', :name => '3027', :price => 544},
						{ :file => 'kierownica-4005.png', :name => '4005', :price => 544},
						{ :file => 'kierownica-5015.png', :name => '5015', :price => 544},
						{ :file => 'kierownica-6018.png', :name => '6018', :price => 544},
						{ :file => 'kierownica-6027.png', :name => '6027', :price => 544},
						{ :file => 'kierownica-biala.png', :name => 'white', :price => 544},
						{ :file => 'kierownica-czarna.png', :name => 'black', :price => 544},
						{ :file => 'kierownica-czerw.png', :name => 'red', :price => 544},
						{ :file => 'kierownica-chrom.png', :name => 'chrom', :price => 544}
					] 
				}
			]
		}
		right_elements.append kierownica

		blotnik_przedni = {
			:full_name => 'Błotnik<br />przedni',
			:sys_name => 'fblo',
			:types => [
				{
					:name => 'Błotnik przedni', 
					:colors => [
						{ :file => 'blotnik-p-1021.png', :name => '1021', :price => 544},
						{ :file => 'blotnik-p-2009.png', :name => '2009', :price => 544},
						{ :file => 'blotnik-p-3027.png', :name => '3027', :price => 544},
						{ :file => 'blotnik-p-4005.png', :name => '4005', :price => 544},
						{ :file => 'blotnik-p-5015.png', :name => '5015', :price => 544},
						{ :file => 'blotnik-p-6018.png', :name => '6018', :price => 544},
						{ :file => 'blotnik-p-6027.png', :name => '6027', :price => 544},
						{ :file => 'blotnik-p-bialy.png', :name => 'white', :price => 544},
						{ :file => 'blotnik-p-czarny.png', :name => 'black', :price => 544},
						{ :file => 'blotnik-p-czerwony.png', :name => 'red', :price => 544},
						{ :file => 'blotnik-p-chrom.png', :name => 'chrom', :price => 544}
					] 
				}
			]
		}
		right_elements.append blotnik_przedni

		blotnik_tylny = {
			:full_name => 'Błotnik<br />tylny',
			:sys_name => 'rblo',
			:types => [
				{
					:name => 'Błotnik tylny', 
					:colors => [
						{ :file => 'blotnik-t-1021.png', :name => '1021', :price => 544},
						{ :file => 'blotnik-t-2009.png', :name => '2009', :price => 544},
						{ :file => 'blotnik-t-3027.png', :name => '3027', :price => 544},
						{ :file => 'blotnik-t-4005.png', :name => '4005', :price => 544},
						{ :file => 'blotnik-t-5015.png', :name => '5015', :price => 544},
						{ :file => 'blotnik-t-6018.png', :name => '6018', :price => 544},
						{ :file => 'blotnik-t-6027.png', :name => '6027', :price => 544},
						{ :file => 'blotnik-t-bialy.png', :name => 'white', :price => 544},
						{ :file => 'blotnik-t-czarny.png', :name => 'black', :price => 544},
						{ :file => 'blotnik-t-czerwony.png', :name => 'red', :price => 544},
						{ :file => 'blotnik-t-chrom.png', :name => 'chrom', :price => 544}
					] 
				}
			]
		}
		right_elements.append blotnik_tylny

		lancuch = {
			:full_name => 'Łańcuch',
			:sys_name => 'lanc',
			:types => [
				{
					:name => 'Łańcuch', 
					:colors => [
						{ :file => 'lancuch-bialy.png', :name => 'white', :price => 544},
						{ :file => 'lancuch-czerwony.png', :name => 'red', :price => 544},
						{ :file => 'lancuch-fiolet.png', :name => 'lanc_violet', :price => 544},
						{ :file => 'lancuch-stalowy.png', :name => 'steel', :price => 544},
						{ :file => 'lancuch-zielony.png', :name => 'lang_green', :price => 544}
					] 
				}
			]
		}
		right_elements.append lancuch

		mostek = {
			:full_name => 'Mostek',
			:sys_name => 'most',
			:types => [
				{
					:name => 'Mostek', 
					:colors => [
						{ :file => 'mostek-czarny.png', :name => 'black', :price => 544},
						{ :file => 'mostek-srebrny.png', :name => 'silver', :price => 544}
					] 
				}
			]
		}
		right_elements.append mostek

		obrecz_przednia = {
			:full_name => 'Obręcz<br />przednia',
			:sys_name => 'fobr',
			:types => [
				{
					:name => 'Obręcz przednia', 
					:colors => [
						{ :file => 'obrecz-p-1021.png', :name => '1021', :price => 544},
						{ :file => 'obrecz-p-2009.png', :name => '2009', :price => 544},
						{ :file => 'obrecz-p-3027.png', :name => '3027', :price => 544},
						{ :file => 'obrecz-p-4005.png', :name => '4005', :price => 544},
						{ :file => 'obrecz-p-5015.png', :name => '5015', :price => 544},
						{ :file => 'obrecz-p-6018.png', :name => '6018', :price => 544},
						{ :file => 'obrecz-p-6027.png', :name => '6027', :price => 544},
						{ :file => 'obrecz-p-biala.png', :name => 'white', :price => 544},
						{ :file => 'obrecz-p-czarna.png', :name => 'black', :price => 544},
						{ :file => 'obrecz-p-czerw.png', :name => 'red', :price => 544}
					] 
				}
			]
		}
		right_elements.append obrecz_przednia

		obrecz_tylnia = {
			:full_name => 'Obręcz<br />tylnia',
			:sys_name => 'robr',
			:types => [
				{
					:name => 'Obręcz tylnia', 
					:colors => [
						{ :file => 'obrecz-t-1021.png', :name => '1021', :price => 544},
						{ :file => 'obrecz-t-2009.png', :name => '2009', :price => 544},
						{ :file => 'obrecz-t-3027.png', :name => '3027', :price => 544},
						{ :file => 'obrecz-t-4005.png', :name => '4005', :price => 544},
						{ :file => 'obrecz-t-5015.png', :name => '5015', :price => 544},
						{ :file => 'obrecz-t-6018.png', :name => '6018', :price => 544},
						{ :file => 'obrecz-t-6027.png', :name => '6027', :price => 544},
						{ :file => 'obrecz-t-biala.png', :name => 'white', :price => 544},
						{ :file => 'obrecz-t-czarna.png', :name => 'black', :price => 544},
						{ :file => 'obrecz-t-czerw.png', :name => 'red', :price => 544}
					] 
				}
			]
		}
		right_elements.append obrecz_tylnia

		pancerz = {
			:full_name => 'Pancerz',
			:sys_name => 'panc',
			:types => [
				{
					:name => 'Pancerz', 
					:colors => [
						{ :file => 'pancerz-bialy.png', :name => 'white', :price => 544},
						{ :file => 'pancerz-czarny.png', :name => 'black', :price => 544}
					] 
				}
			]
		}
		right_elements.append pancerz

		stery = {
			:full_name => 'Stery',
			:sys_name => 'ster',
			:types => [
				{
					:name => 'Stery', 
					:colors => [
						{ :file => 'stery-czarne.png', :name => 'black', :price => 544},
						{ :file => 'stery-srebrne.png', :name => 'silver', :price => 544}
					] 
				}
			]
		}
		right_elements.append stery

		sztyca = {
			:full_name => 'Sztyca',
			:sys_name => 'szty',
			:types => [
				{
					:name => 'Sztyca', 
					:colors => [
						{ :file => 'sztyca-czarna.png', :name => 'black', :price => 544},
						{ :file => 'sztyca-srebrna.png', :name => 'silver', :price => 544}
					] 
				}
			]
		}
		right_elements.append sztyca

		szprychy_przednie = {
			:full_name => 'Szprychy<br />przednie',
			:sys_name => 'fszp',
			:types => [
				{
					:name => 'Szprychy przednie', 
					:colors => [
						{ :file => 'szprychy-p-czarne.png', :name => 'black', :price => 544},
						{ :file => 'szprychy-p-srebrne.png', :name => 'silver', :price => 544}
					] 
				}
			]
		}
		right_elements.append szprychy_przednie

		szprychy_tylnie = {
			:full_name => 'Szprychy<br />tylnie',
			:sys_name => 'rszp',
			:types => [
				{
					:name => 'Szprychy tylnie', 
					:colors => [
						{ :file => 'szprychy-t-czarne.png', :name => 'black', :price => 544},
						{ :file => 'szprychy-t-srebrne.png', :name => 'silver', :price => 544}
					] 
				}
			]
		}
		right_elements.append szprychy_tylnie



		@data = { :left_elements => left_elements, :right_elements => right_elements }
		
  end
end
