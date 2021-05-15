require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 1;
  documentation = true;
  autocomplete = true;
  source = {
  	buffer   = true;
  	calc     = true;
  	nvim_lsp = true;
  	nvim_lua = true;
  	path     = true;
  	spell    = true;
  	vsnip    = true;
  };
}
