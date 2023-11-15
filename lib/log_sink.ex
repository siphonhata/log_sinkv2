defmodule LogSink do
  alias LogGenServer
  require Logger

      def start() do

        pid = spawn(fn -> loop() end)
        #:ets.new(:logs_table, [:duplicate_bag, :public ,:named_table])
        name_pid(pid)
        #LogGenServer.start_link()
      end

      defp name_pid(pid) do
        :global.register_name(:log_sink, pid)
      end

      def loop() do
        receive do
          message ->

            IO.puts message
            #:timer.sleep(1000)
            #ets_store(message)
            loop()
        end
      end

      # defp ets_store(message) do
      #   :ets.insert_new(:logs_table, {message})
      #   con = :ets.tab2list(:logs_table)
      #   con
      # end
  end
