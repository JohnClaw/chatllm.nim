type
  PrintType* = enum
    PRINT_CHAT_CHUNK = 0,
    PRINTLN_META = 1,
    PRINTLN_ERROR = 2,
    PRINTLN_REF = 3,
    PRINTLN_REWRITTEN_QUERY = 4,
    PRINTLN_HISTORY_USER = 5,
    PRINTLN_HISTORY_AI = 6,
    PRINTLN_TOOL_CALLING = 7,
    PRINTLN_EMBEDDING = 8,
    PRINTLN_RANKING = 9,
    PRINTLN_TOKEN_IDS = 10

  ChatllmObj* = object

  ChatllmPrintProc* = proc (user_data: pointer, print_type: PrintType, utf8_str: cstring) {.cdecl.}
  ChatllmEndProc* = proc (user_data: pointer) {.cdecl.}

const
  libName = "libchatllm.dll"

proc chatllm_create*(): ptr ChatllmObj {.cdecl, dynlib: libName, importc.}

proc chatllm_append_param*(obj: ptr ChatllmObj, utf8_str: cstring) {.cdecl, dynlib: libName, importc.}

proc chatllm_start*(obj: ptr ChatllmObj, f_print: ChatllmPrintProc, f_end: ChatllmEndProc, user_data: pointer): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_set_gen_max_tokens*(obj: ptr ChatllmObj, gen_max_tokens: cint) {.cdecl, dynlib: libName, importc.}

proc chatllm_restart*(obj: ptr ChatllmObj, utf8_sys_prompt: cstring) {.cdecl, dynlib: libName, importc.}

proc chatllm_user_input*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_set_ai_prefix*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_tool_input*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_tool_completion*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_text_tokenize*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_text_embedding*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_qa_rank*(obj: ptr ChatllmObj, utf8_str_q: cstring, utf8_str_a: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_rag_select_store*(obj: ptr ChatllmObj, name: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_abort_generation*(obj: ptr ChatllmObj) {.cdecl, dynlib: libName, importc.}

proc chatllm_show_statistics*(obj: ptr ChatllmObj) {.cdecl, dynlib: libName, importc.}

proc chatllm_save_session*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}

proc chatllm_load_session*(obj: ptr ChatllmObj, utf8_str: cstring): cint {.cdecl, dynlib: libName, importc.}
