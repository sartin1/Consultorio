<?php

/*

Copyright (c) 2009 Anant Garg (anantgarg.com | inscripts.com)

This script may be used for non-commercial purposes only. For any
commercial purposes, please contact the author at
anant.garg@inscripts.com

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

*/

class ChatCore
{
	/**
	 * @var chat
	 */
	var $model;

	/**
	 * ChatCore constructor.
	 * @param $model chat
	 */
	public function __construct($model)
	{
		$this->model = $model;
	}

	function run()
	{
		session_start();

		if (!isset($_SESSION['chatHistory'])) {
			$_SESSION['chatHistory'] = array();
		}

		if (!isset($_SESSION['openChatBoxes'])) {
			$_SESSION['openChatBoxes'] = array();
		}

		if ($_GET['action'] == "chatheartbeat") { $this->chatHeartbeat(); }
		if ($_GET['action'] == "sendchat") { $this->sendChat(); }
		if ($_GET['action'] == "closechat") { $this->closeChat(); }
		if ($_GET['action'] == "startchatsession") { $this->startChatSession(); }

	}

	function checkSqlResult($result)
	{
		if(!$result && count($this->model->getDb()->get_errors()) > 0)
		{
			$json['status'] = "error";
			$json['message'] = $this->model->getDb()->get_errors();

			$this->display($json);
		}
	}

	function chatHeartbeat() {

		$me = $this->readCookieUser();
		$messages = $this->model->getMessagesByMe($me);
		$this->checkSqlResult($messages);

		/* Si no hay resultados en la consulta, el valor no debe ser FALSE, deber ser array() */
		if( !$messages ) {
			$messages = array();
		}

		$json = array();
		foreach ($messages as $chat) {

			if (!isset($_SESSION['openChatBoxes'][$chat['from_user']]) && isset($_SESSION['chatHistory'][$chat['from_user']])) {
				$json = $_SESSION['chatHistory'][$chat['from_user']];
			}

			$chat['message'] = $this->sanitize($chat['message']);
			$json[] = array("s" => "0", "f" => $chat['from_user'], "m" => $chat['message']);

			if (!isset($_SESSION['chatHistory'][$chat['from_user']])) {
				$_SESSION['chatHistory'][$chat['from_user']] = array();
			}

			$_SESSION['chatHistory'][$chat['from_user']][] = array("s" => "0", "f" => $chat['from_user'], "m" => $chat['message']);


			unset($_SESSION['tsChatBoxes'][$chat['from_user']]);
			$_SESSION['openChatBoxes'][$chat['from_user']] = $chat['sent_on'];

			$this->model->readMessage($chat['id']);
		}

		if (!empty($_SESSION['openChatBoxes'])) {
			foreach ($_SESSION['openChatBoxes'] as $chatbox => $time) {
				if (!isset($_SESSION['tsChatBoxes'][$chatbox])) {
					$now = time()-strtotime($time);
					$time = date('H:i d-m-Y', strtotime($time));

					$message = "Enviado a las $time";
					if ($now > 180) {
						$json[] = array("s" => "2", "f" => $chatbox, "m" => $message);
						if (!isset($_SESSION['chatHistory'][$chatbox])) {
							$_SESSION['chatHistory'][$chatbox] = array();
						}

						$_SESSION['chatHistory'][$chatbox][] = array("s" => "2", "f" => $chatbox, "m" => $message);
						$_SESSION['tsChatBoxes'][$chatbox] = 1;
					}
				}
			}
		}
		$this->display(array("items" => $json));
	}

	function chatBoxSession($chatbox) {

		$items = array();

		if (isset($_SESSION['chatHistory'][$chatbox])) {
			$items = $_SESSION['chatHistory'][$chatbox];
		}

		return $items;
	}

	function startChatSession() {
		$items = array();
		if (!empty($_SESSION['openChatBoxes'])) {
			foreach ($_SESSION['openChatBoxes'] as $chatbox => $void) {
				$session = $this->chatBoxSession($chatbox);
				foreach($session as $item)
					$items[] = $item;
			}
		}

		$this->display(array("username" => $this->readCookieUser(), "items" => $items));
	}

	function sendChat() {
		$from_user = $this->readCookieUser();
		$to_user = $_POST['to_user'];
		$message = $_POST['message'];

		$_SESSION['openChatBoxes'][$_POST['to_user']] = date('Y-m-d H:i:s', time());

		$messagesan = $this->sanitize($message);

		if (!isset($_SESSION['chatHistory'][$_POST['to_user']])) {
			$_SESSION['chatHistory'][$_POST['to_user']] = array();
		}

		$_SESSION['chatHistory'][$_POST['to_user']][] =  array("s" => "1", "f" => $to_user, "m" => $messagesan);

		unset($_SESSION['tsChatBoxes'][$_POST['to_user']]);

		$result = $this->model->insert($from_user, $to_user, $message);

		$this->checkSqlResult($result);
		$this->display(array("result" => "success"));
	}

	function closeChat() {
		unset($_SESSION['openChatBoxes'][$_POST['chatbox']]);

		$this->display(array("result" => "success"));
	}

	function sanitize($text) {
		$text = htmlspecialchars($text, ENT_QUOTES);
		$text = str_replace("\n\r","\n",$text);
		$text = str_replace("\r\n","\n",$text);
		$text = str_replace("\n","<br>",$text);
		return $text;
	}

	function readCookieUser() {
		return $_COOKIE['user'];
	}

	public function display($data, $quit = true)
	{
		header("Content-Type: text/json");
		echo "\n";
		echo json_encode($data, 128);
		echo "\n";
		if($quit)
			exit(0);
	}
}
