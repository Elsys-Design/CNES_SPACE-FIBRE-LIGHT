// This is the SystemVerilog builtin "std" package as described in the
// IEEE 1800 LRM
//

`timescale 1ns/1ps

package std;
class semaphore;
    local event _putEvent;
    local int _keyCount;
    local int _waiting;
    function new(int keyCount = 0);
        if (keyCount > 0) _keyCount = keyCount;
        else if (keyCount < 0)
            $display("** Warning: Ignoring illegal negative size in semaphore creation; using 0 as default");
        _waiting = 0;
    endfunction

    function void put(int keyCount = 1);
        _keyCount += keyCount;
        ->_putEvent;
        return;
    endfunction

    task  get(int keyCount = 1);
        logic first = 1'b1;
        if (_waiting > 0 ) begin
            #0;
        end
        while (_keyCount < keyCount) begin
            if (first) begin
                _waiting++;
                first = 1'b0;
            end
            @_putEvent;
        end
        _keyCount -= keyCount;
        if (first == 1'b0)
            _waiting--;
    endtask

    function int try_get(int keyCount = 1);
        if (_keyCount < keyCount) begin
            return 0;
        end
        _keyCount -= keyCount;
        return 1;
    endfunction
endclass

class mailbox #(type singular = integer);
	local singular items[$];
	local semaphore read_semaphore;
	local semaphore write_semaphore; //needed for blocking put on bounded queue, null implies unbounded queue

	function new(int maxItems = 0);
	  read_semaphore = new(0);
	  if (maxItems > 0)
		write_semaphore = new(maxItems);
          else if (maxItems < 0)
               $display("** Warning: Ignoring illegal negative size in mailbox construction; using 0 as default");
	endfunction

	function int num();
	  return items.size();
	endfunction

	task put(singular message);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
	  items.push_back(message);
	  read_semaphore.put(1);
	endtask

	function int try_put(singular message);
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
		items.push_back(message);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

	task get(output /*ref*/ singular message);
	  read_semaphore.get(1);
	  message = items.pop_front();
	  if (write_semaphore!=null)
		write_semaphore.put(1);
	endtask

	function int try_get(output /*ref*/ singular message);
	  if (read_semaphore.try_get(1) > 0) begin
		message = items.pop_front();
		if (write_semaphore!=null)
		  write_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

	task peek(output /*ref*/ singular message);
	  read_semaphore.get(1);
	  message = items[0];
	  read_semaphore.put(1);
	endtask

	function int try_peek(output /*ref*/ singular message);
	  if (read_semaphore.try_get(1) > 0) begin
		message = items[0];
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction
endclass

function automatic int randomize(input int i);
    return i;
endfunction

    class process;
        typedef enum { FINISHED, RUNNING, WAITING, SUSPENDED, KILLED } state;

        extern static function process self();

        local function new();
        endfunction
        extern function state status();
        extern task await();
        extern function void kill();
        extern function void suspend();
        extern function void resume();
    endclass

endpackage
