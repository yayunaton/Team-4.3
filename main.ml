let () =
  for i = 0 to Array.length Sys.argv - 1 do
    print_string Sys.argv.(i)
  done
