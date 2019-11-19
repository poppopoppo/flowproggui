extern  printf
section .data
  fmt: db "%d", 10, 0
section .text
  global _start
_start:
    mov     rdx, 1
    mov     rcx, 100            ; ループ回数
_loop:
  push   rcx                  ; rcxの避難
  push   rdx                  ; rdxの避難
  mov    rdi, fmt             ; フォーマット
  mov    rsi, rdx             ; カウントしている値
  call   printf               ; printfをコール
    pop    rdx                  ; rdxを持ってくる
    pop    rcx                  ; rcxを持ってくる

    ; 5. インクリメントする
    add    rdx, 1               ; rdxに１加算

    ; 6. ループバック
    loop _loop                  ; ループバック

; 後処理
fin:
    mov    rax, 1               ; システムコール番号(sys_exit)
    mov    rbx, 0               ; 終了ステータスコード
    int    0x80
