Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBPOD2KLQMGQEDVZMDXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526958F7A2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Aug 2022 08:29:22 +0200 (CEST)
Received: by mail-oo1-xc3c.google.com with SMTP id j9-20020a4ad2c9000000b004489186accbsf1922279oos.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Aug 2022 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc;
        bh=XpPpKlhg/GVASMvN6nUPCpB3WK+xxD4ZgUgzU37xs4k=;
        b=Lc7VGnKJJntgbm5wWEc6KED7/Pii2dwnMkKvm+rhG9uQgQPd5/9kogkmrrgoyVJug0
         gX0t6C0/dDpkhuNCPCdYI8omHZNx1krmN7ixmc/w6ob1rzCmLAJ7uTuhIVANpJhRnfFf
         4IXofnQUyy1Vk0+JsrAw6Nk7rfFny8NAiQgVxji5DcDoeq5LdnCgJb7uTDCFOFMWckd0
         Rabqw+KAijoEM+NkBl+V6iiwwPEB31moLnXNZg5gAkvaP6wWvWq3kX2x1m5uLKCluslA
         jp9+b/f+U7ZjlKTThqOpLdNhJws2DZLLi4nkyYErImmdqxasoK14B6V37MHh1wVd45v5
         h1Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc;
        bh=XpPpKlhg/GVASMvN6nUPCpB3WK+xxD4ZgUgzU37xs4k=;
        b=EHj5QRIGzYR+XCwkvVHwSiPPtXCA1OEMGqnH3N9XCFTayGCxIU4hz8LeRcnbWsRZqg
         Fv/XFWIXUm63XsOrVPR+oPlLm/mVId00CIRgtI3FdKllyZR6TNDnR2YBo+Ic8w1fuuoW
         lEuYr+UEMPUv0uJX6/jMMLLdCQtbsW0lOyYnzc6vwpRa5t9dM1bmgJF3L+yeSRoIZpDS
         2HT+edneiTU4SZTYpYLKC18/yCStw5qR44HI5lO6F7S3gPWgPco5FUjPUIb/EecOZt/Y
         +JSZQgKU7At5Roa15xtAcuSlcJVQv1GeIFUouSzO0BvgqwmonzZP6yFMZSvyTmR73DNA
         D/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc;
        bh=XpPpKlhg/GVASMvN6nUPCpB3WK+xxD4ZgUgzU37xs4k=;
        b=3eVgXKkOAx2g7AJO5kU0nNWoCfLvFeqtomzrNisMkdMypcL6GMti1tuJNA0L6KTu/T
         z4/zd/97jnO1kdsVfVs4CxsoHJpcnooWoF1XUnr+OOvZpjrhvGeMCxlzxjLIF0ONh/Eo
         ARTId/9VRqdS7GIXrzo0+3iuX5Lfst+ZGrKBMZBau2lEGSUSynrr+uakX+vMdoFQDL3o
         e6Qro2qjDoMBhQUbEvG5fk8jZEKMr4eg4Xwg2PgVzMiZKjVok4axEXe5x0AnpoQd78JA
         cikLyiwau090qo5qo9KOorSXFhfpL99O9PjVRaCV3ADOAaEyLW1JUpb1NePkPIcV7dCw
         PP9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo052AjMMCZZOJik9Zxi3+gjh341FIfoHyz7o2wha2IDKrqQNJg2
	yUOzHi1VSzZko8p4mE8d0Fk=
X-Google-Smtp-Source: AA6agR4MoK7j4IgOoTx812QnM4nxSzc+5p9ERWbpVb/t+0K23ltl3czjKGhJDl6NDTtZpUn3MXRXTQ==
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id be7-20020a056808218700b0033ac507d4f3mr2934313oib.205.1660199358497;
        Wed, 10 Aug 2022 23:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:684:0:b0:33f:1b1f:b6ad with SMTP id 126-20020aca0684000000b0033f1b1fb6adls219696oig.9.-pod-prod-gmail;
 Wed, 10 Aug 2022 23:29:17 -0700 (PDT)
X-Received: by 2002:a05:6808:16ac:b0:33b:32ce:edd8 with SMTP id bb44-20020a05680816ac00b0033b32ceedd8mr2892986oib.126.1660199357602;
        Wed, 10 Aug 2022 23:29:17 -0700 (PDT)
Date: Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
Subject: =?UTF-8?Q?Ask_for_help=EF=BC=8Cabout_cpu_dow?=
 =?UTF-8?Q?n_after_jailhouse_enable=E3=80=82=E3=80=82?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2096_1629173326.1660199356957"
X-Original-Sender: sunxing960116@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_2096_1629173326.1660199356957
Content-Type: multipart/alternative; 
	boundary="----=_Part_2097_362800487.1660199356957"

------=_Part_2097_362800487.1660199356957
Content-Type: text/plain; charset="UTF-8"

 i want make jailhouse working in one phone with 4 cortex-a53 cpu.

I feel like I've successfully executed jailhouse enbale.
unfortunately, there is a kernel panic    when i down one cpu for a 
non-root-cell during jialhouse cell create .

This question has puzzled me for a long time    Do you have any good 
methods? thank you


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3fdb914d-9ec7-4a5b-93e4-d07333100ff3n%40googlegroups.com.

------=_Part_2097_362800487.1660199356957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&nbsp;i want make jailhouse working in one phone with 4 cortex-a53 cpu.<div=
><br></div><div>I feel like I've successfully executed jailhouse enbale.<br=
></div><div>unfortunately, there is a kernel panic&nbsp; &nbsp; when i down=
 one cpu for a non-root-cell during jialhouse cell create .</div><div><br><=
/div><div>This question has puzzled me for a long time&nbsp; &nbsp;&nbsp;Do=
 you have any good methods? thank you</div><div><a><br></a></div><div><a><b=
r></a></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3fdb914d-9ec7-4a5b-93e4-d07333100ff3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3fdb914d-9ec7-4a5b-93e4-d07333100ff3n%40googlegroups.co=
m</a>.<br />

------=_Part_2097_362800487.1660199356957--

------=_Part_2096_1629173326.1660199356957
Content-Type: text/plain; charset=US-ASCII; name=paniclog.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=paniclog.txt
X-Attachment-Id: dfb9257b-8736-4440-a8c3-9a485486cc4c
Content-ID: <dfb9257b-8736-4440-a8c3-9a485486cc4c>

FATAL: unhandled trap (exception class 0x17)
Cell state before exception:
 pc: ffffff80087e8da8   lr: ffffff80087e93a8 spsr: 000002c5     EL1
 sp: ffffff8008ff3be0  elr: ffffff80087e8da4  esr: 17 1 0000000
 x0: 00000000bc00000c   x1: 0000000000000000   x2: 0000000000000000
 x3: 0000000000000000   x4: 0000000000000000   x5: 0000000000000000
 x6: 0000000000300000   x7: 00000032b5593519   x8: ffffff8008081800
 x9: 0000000000001000  x10: 0000000000000008  x11: 0000000034d5d91d
x12: 000000403656d000  x13: ffffff800900e280  x14: 0000000000000001
x15: 0000000000000004  x16: ffffff800823b0fc  x17: 000000000043f980
x18: 0000007f98a404ee  x19: ffffff8008ff3c40  x20: 00000000bc00000c
x21: 0000000000000000  x22: 0000000000000000  x23: 0000000000000000
x24: ffffffc03bcd1800  x25: 0000003929e3accf  x26: 0000000000000000
x27: 0000000000000020  x28: 0000000080ef0018  x29: ffffff8008ff3be0

Parking CPU 0 (Cell: "sharkle..-jailhouse")
[  245.523728] c0 Unable to handle kernel NULL pointer dereference at vir                                                                                            tual address 00000000
[  245.532113] c0 Mem abort info:
[  245.535141] c0   Exception class = IABT (current EL), IL = 32 bits
[  245.541286] c0   SET = 0, FnV = 0
[  245.544573] c0   EA = 0, S1PTW = 0
[  245.547952] c0 user pgtable: 4k pages, 39-bit VAs, pgd = 00000000ee15e                                                                                            5bc
[  245.554698] c0 [0000000000000000] *pgd=00000000bd7f5003, *pud=00000000                                                                                            bd7f5003, *pmd=0000000000000000
[  245.563876] c0 Internal error: Oops: 86000006 [#1] PREEMPT SMP
[  245.569672] c0 Modules linked in: jailhouse(O)
[  245.574085] c0 Process swapper/0 (pid: 0, stack limit = 0x000000005f81                                                                                            8af5)
[  245.581010] c0 CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O                                                                                                4.14.174 #1
[  245.588534] c0 Hardware name: Spreadtrum SL8541E-SMARTPEN64 Board (DT)
[  245.595028] c0 task: 00000000421e6e9e task.stack: 000000005f818af5
[  245.601172] c0 PC is at 0x0
[  245.603947] c0 LR is at trusty_fast_call32_power+0x68/0x90
[  245.609392] c0 pc : [<0000000000000000>] lr : [<ffffff80087e93a8>] pst                                                                                            ate: 000002c5
[  245.617005] c0 sp : ffffff8008ff3be0
[  245.620554] c0 x29: ffffff8008ff3be0 x28: 0000000080ef0018
[  245.626092] c0 x27: 0000000000000020 x26: 0000000000000000
[  245.631630] c0 x25: 0000003929e3accf x24: ffffffc03bcd1800
[  245.637169] c0 x23: 0000000000000000 x22: 0000000000000000
[  245.642707] c0 x21: 0000000000000000 x20: 00000000bc00000c
[  245.648246] c0 x19: ffffff8008ff3c40 x18: 0000007f98a404ee
[  245.653784] c0 x17: 000000000043f980 x16: ffffff800823b0fc
[  245.659323] c0 x15: 0000000000000004 x14: 0000000000000001
[  245.664862] c0 x13: ffffff800900e280 x12: 000000403656d000
[  245.670399] c0 x11: 0000000034d5d91d x10: 0000000000000008
[  245.675938] c0 x9 : 0000000000001000 x8 : ffffff8008081800
[  245.681476] c0 x7 : 00000032b5593519 x6 : 0000000000300000
[  245.687015] c0 x5 : 0000000000000000 x4 : 0000000000000000
[  245.692553] c0 x3 : 0000000000000000 x2 : 0000000000000000
[  245.698092] c0 x1 : 0000000000000000 x0 : 00000000bc00000c
[  245.703635] c0
[  245.703635] c0 LR: 0xffffff80087e9328:
[  245.709081] c0 9328  d1004260 97f693a8 52800000 f9400bf3 a8c27bfd d65f                                                                                            03c0 a9b97bfd 910003fd
[  245.717477] c0 9348  a90153f3 a9025bf5 f9001bf7 b00040b3 2a0003f4 2a01                                                                                            03f7 2a0203f6 2a0303f5
[  245.725871] c0 9368  aa1e03e0 91002273 d503201f f9400260 f90037a0 d280                                                                                            0000 a905d7b6 2a1403e0
[  245.734265] c0 9388  a904dfa0 37f80054 d4210000 36f00074 d4210000 17ff                                                                                            fffe 910103a0 97fffe78
[  245.742658] c0 93a8  f94037a2 f9400261 ca010041 b4000041 97e30e85 a941                                                                                            53f3 a9425bf5 f9401bf7
[  245.751053] c0 93c8  a8c77bfd d65f03c0 d10303ff a9017bfd 910043fd a902                                                                                            53f3 a9035bf5 a90463f7
[  245.759447] c0 93e8  a9056bf9 a90673fb aa0003f7 aa1e03e0 d503201f b000                                                                                            4d19 b00040a0 91002001
[  245.767841] c0 9408  a94052f3 f9400022 f90057a2 d2800002 a9415af5 9118                                                                                            a339 f94012f7 52800038
[  245.776239] c0
[  245.776239] c0 SP: 0xffffff8008ff3b60:
[  245.781688] c0 3b60  08000000 ffffff80 08004000 ffffff80 08ff3cf0 ffff                                                                                            ff80 08082a98 ffffff80
[  245.790082] c0 3b80  08ff3bc0 ffffff80 ffffffff 0000007f 08ff3e00 ffff                                                                                            ff80 08aca358 ffffff80
[  245.798476] c0 3ba0  60000045 00000000 00000002 00000000 08000000 ffff                                                                                            ff80 08004000 ffffff80
[  245.806870] c0 3bc0  08ff3d40 ffffff80 08082a98 ffffff80 08ff3c10 ffff                                                                                            ff80 ffffffff 0000007f
[  245.815264] c0 3be0  08ff3c00 ffffff80 087e93a8 ffffff80 08ffe008 ffff                                                                                            ff80 00000001 00000000
[  245.823659] c0 3c00  08ff3c70 ffffff80 0875da5c ffffff80 00000000 0000                                                                                            0000 80acc290 00000000
[  245.832053] c0 3c20  000000c0 00000000 0875d6e4 ffffff80 00000001 0000                                                                                            0000 8230d9ae 00000001
[  245.840447] c0 3c40  00005a10 00000000 bc00000c 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.848845] c0
[  245.848845] c0 X8: 0xffffff8008081780:
[  245.854293] c0 1780  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.862688] c0 17a0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.871082] c0 17c0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.879476] c0 17e0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.887870] c0 1800  d10503ff 8b2063ff cb2063e0 37700080 cb2063e0 cb20                                                                                            63ff 1400035b d51bd040
[  245.896264] c0 1820  cb2063e0 d51bd060 b0007ac0 9103001f d538d080 8b20                                                                                            63ff d53bd040 cb2063e0
[  245.904659] c0 1840  f274cc1f 54003ca1 cb2063ff d53bd060 1400034d d503                                                                                            201f d503201f d503201f
[  245.913053] c0 1860  d503201f d503201f d503201f d503201f d503201f d503                                                                                            201f d503201f d503201f
[  245.921451] c0
[  245.921451] c0 X13: 0xffffff800900e200:
[  245.926986] c0 e200  00000000 00000000 080836cc ffffff80 00000000 0000                                                                                            0000 00000000 00000000
[  245.935380] c0 e220  0823d5fc ffffff80 00000000 00000000 0906f4a8 ffff                                                                                            ff80 3d0288f0 ffffffc0
[  245.943774] c0 e240  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.952168] c0 e260  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  245.960562] c0 e280  00000020 00000000 ffffffff ffffffff 00000002 0000                                                                                            0000 00000000 00000000
[  245.968957] c0 e2a0  08ff0000 ffffff80 00000002 00200102 00000000 0000                                                                                            0000 00000000 00000000
[  245.977351] c0 e2c0  00000001 00000000 0000000c 00000000 ffffea88 0000                                                                                            0000 393b5700 ffffffc0
[  245.985745] c0 e2e0  00000000 00000001 00000078 00000078 00000078 0000                                                                                            0000 08aedc00 ffffff80
[  245.994141] c0
[  245.994141] c0 X16: 0xffffff800823b07c:
[  245.999678] c0 b07c  92800000 f9400674 f9000660 d503379f d5033fdf 5280                                                                                            00a0 aa1303e1 9421ca75
[  246.008072] c0 b09c  d503201f aa1803e3 aa1703e2 aa1603e1 aa1503e0 97ff                                                                                            ff7c f9000674 aa0003f5
[  246.016466] c0 b0bc  d503379f d5033fdf 528000a0 aa1303e1 9421ca68 b100                                                                                            069f 54000101 d503201f
[  246.024861] c0 b0dc  aa1503e0 a94153f3 a9425bf5 a94363f7 a8c47bfd d65f                                                                                            03c0 d503201f 17fffff9
[  246.033255] c0 b0fc  a9bb7bfd 910003fd a90153f3 a9025bf5 a90363f7 aa00                                                                                            03f3 aa0103f7 aa1e03e0
[  246.041650] c0 b11c  aa0203f8 d503201f f0006e16 910022c0 f9400001 f900                                                                                            27a1 d2800001 2a1303e0
[  246.050043] c0 b13c  94008ced aa0003f4 f27ef413 540003e0 b9404660 37a8                                                                                            0360 f9403660 910143a3
[  246.058437] c0 b15c  aa1803e2 aa1703e1 f81f0c60 aa1303e0 97fffe22 aa00                                                                                            03f5 b7f800a0 b9404660
[  246.066834] c0
[  246.066834] c0 X19: 0xffffff8008ff3bc0:
[  246.072371] c0 3bc0  08ff3d40 ffffff80 08082a98 ffffff80 08ff3c10 ffff                                                                                            ff80 ffffffff 0000007f
[  246.080764] c0 3be0  08ff3c00 ffffff80 087e93a8 ffffff80 08ffe008 ffff                                                                                            ff80 00000001 00000000
[  246.089158] c0 3c00  08ff3c70 ffffff80 0875da5c ffffff80 00000000 0000                                                                                            0000 80acc290 00000000
[  246.097553] c0 3c20  000000c0 00000000 0875d6e4 ffffff80 00000001 0000                                                                                            0000 8230d9ae 00000001
[  246.105947] c0 3c40  00005a10 00000000 bc00000c 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.114341] c0 3c60  00000000 00000000 9f919800 76398a5e 08ff3c90 ffff                                                                                            ff80 0875da9c ffffff80
[  246.122735] c0 3c80  00010000 00000000 00000000 00000000 08ff3cb0 ffff                                                                                            ff80 0875d734 ffffff80
[  246.131130] c0 3ca0  3bccd084 ffffffc0 00000001 00000000 08ff3cd0 ffff                                                                                            ff80 08098fd8 ffffff80
[  246.139527] c0
[  246.139527] c0 X24: 0xffffffc03bcd1780:
[  246.145062] c0 1780  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.153457] c0 17a0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.161852] c0 17c0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.170245] c0 17e0  00000000 00000000 00000000 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.178639] c0 1800  08e31fa8 ffffff80 00000000 00000000 00000000 0000                                                                                            0001 00494657 00000000
[  246.187033] c0 1820  00000000 00000000 204d5241 00494657 00000000 0000                                                                                            0000 00000000 00000000
[  246.195428] c0 1840  00000000 00000000 00000000 00000001 ffffffff 0000                                                                                            0001 00000000 00000000
[  246.203822] c0 1860  08741614 ffffff80 00000000 00000000 00000000 0000                                                                                            0000 65726f63 0064705f
[  246.212220] c0
[  246.212220] c0 X29: 0xffffff8008ff3b60:
[  246.217755] c0 3b60  08000000 ffffff80 08004000 ffffff80 08ff3cf0 ffff                                                                                            ff80 08082a98 ffffff80
[  246.226149] c0 3b80  08ff3bc0 ffffff80 ffffffff 0000007f 08ff3e00 ffff                                                                                            ff80 08aca358 ffffff80
[  246.234544] c0 3ba0  60000045 00000000 00000002 00000000 08000000 ffff                                                                                            ff80 08004000 ffffff80
[  246.242938] c0 3bc0  08ff3d40 ffffff80 08082a98 ffffff80 08ff3c10 ffff                                                                                            ff80 ffffffff 0000007f
[  246.251332] c0 3be0  08ff3c00 ffffff80 087e93a8 ffffff80 08ffe008 ffff                                                                                            ff80 00000001 00000000
[  246.259726] c0 3c00  08ff3c70 ffffff80 0875da5c ffffff80 00000000 0000                                                                                            0000 80acc290 00000000
[  246.268120] c0 3c20  000000c0 00000000 0875d6e4 ffffff80 00000001 0000                                                                                            0000 8230d9ae 00000001
[  246.276515] c0 3c40  00005a10 00000000 bc00000c 00000000 00000000 0000                                                                                            0000 00000000 00000000
[  246.284910] c0
[  246.286641] c0 Call trace:
[  246.289327] c0 Exception stack(0xffffff8008ff39a0 to 0xffffff8008ff3ae                                                                                            0)
[  246.295990] c0 39a0: 00000000bc00000c 0000000000000000 000000000000000                                                                                            0 0000000000000000
[  246.304037] c0 39c0: 0000000000000000 0000000000000000 000000000030000                                                                                            0 00000032b5593519
[  246.312085] c0 39e0: ffffff8008081800 0000000000001000 000000000000000                                                                                            8 0000000034d5d91d
[  246.320132] c0 3a00: 000000403656d000 ffffff800900e280 000000000000000                                                                                            1 0000000000000004
[  246.328181] c0 3a20: ffffff800823b0fc 000000000043f980 0000007f98a404e                                                                                            e ffffff8008ff3c40
[  246.336229] c0 3a40: 00000000bc00000c 0000000000000000 000000000000000                                                                                            0 0000000000000000
[  246.344277] c0 3a60: ffffffc03bcd1800 0000003929e3accf 000000000000000                                                                                            0 0000000000000020
[  246.352326] c0 3a80: 0000000080ef0018 ffffff8008ff3be0 ffffff80087e93a                                                                                            8 ffffff8008ff3be0
[  246.360373] c0 3aa0: 0000000000000000 00000000000002c5 000000000000001                                                                                            4 00000000000003da
[  246.368421] c0 3ac0: ffffffffffffffff ffffff80080e55ec ffffff8008ff3be                                                                                            0 0000000000000000
[  246.376468] c0 [<          (null)>]           (null)
[  246.381403] c0 [<00000000909ed274>] trusty_fast_call32_power+0x68/0x90
  [  246.387896] c0 [<0000000035513431>] psci_tos_resident_on+0x30/0x40
[  246.394037] c0 [<0000000072264dd7>] psci_cpu_suspend+0x30/0x90
[  246.399835] c0 [<00000000c1282599>] psci_suspend_finisher+0x50/0x5c
[  246.406067] c0 [<000000000c6997a8>] cpu_suspend+0x74/0xdc
[  246.411432] c0 [<000000001e431ebe>] psci_cpu_suspend_enter+0x8c/0x90
[  246.417758] c0 [<00000000a531aef0>] arm_cpuidle_suspend+0x40/0x4c
[  246.423808] c0 [<00000000429bdd78>] arm_enter_idle_state+0x40/0x54
[  246.429952] c0 [<00000000d9b25e5b>] cpuidle_enter_state+0x130/0x2e4
[  246.436181] c0 [<00000000a997de5d>] cpuidle_enter+0x34/0x44
[  246.441720] c0 [<00000000e19563de>] call_cpuidle+0x64/0x68
[  246.447171] c0 [<00000000402235f6>] do_idle+0x1b0/0x22c
[  246.452364] c0 [<00000000f6c55e8c>] cpu_startup_entry+0x28/0x2c
[  246.458251] c0 [<000000004c9157e9>] rest_init+0xd4/0xe0
[  246.463444] c0 [<00000000812f36d5>] start_kernel+0x3d4/0x400
[  246.469068] c0 Code: bad PC value
[  246.472357] c0 ---[ end trace 70f4537aef9f8411 ]---
[  246.477200] c0 Kernel panic - not syncing: Fatal exception
[  246.482655] c0 sprd-sysdump: (sysdump_panic_event) ------ in (0)
[  246.488626] c0 sprd-sysdump: (sprd_debug_save_context) context saved(C                                                                                            PU:0)
[  247.495617] c0 sprd-sysdump:
[  247.498491] c0 sprd-sysdump: *****************************************                                                                                            ************
[  247.506019] c0 sprd-sysdump: *                                                                                                                                               *
[  247.513547] c0 sprd-sysdump: *  Sysdump enter, preparing debug info to                                                                                             dump ...  *
[  247.521074] c0 sprd-sysdump: *                                                                                                                                               *
[  247.528605] c0 sprd-sysdump: *****************************************                                                                                            ************
[  247.536132] c0 sprd-sysdump:
[  247.539083] c0 sprd-sysdump: reason: Fatal exception, sprd_sysdump_inf                                                                                            o->crash_key: 0
[  247.546871] c0 sprd-sysdump: KTXT VERIFY...
[  247.623274] c0 sprd-sysdump: KTXT [0xffffff8008080800--0xffffff8008ae0                                                                                            000]
[  247.630048] c0 sprd-sysdump: SHA1:
[  247.633423] c0 sprd-sysdump: 492f0276 2daa006b 7b431b28 cd0b32dc f7a8a                                                                                            534
[  247.640172] c0 sprd-sysdump:
[  247.643115] c0 sprd-sysdump: *****************************************                                                                                            ************
[  247.650643] c0 sprd-sysdump: *                                                                                                                                               *
[  247.658171] c0 sprd-sysdump: *  Try to reboot system ...                                                                                                                     *
[  247.665699] c0 sprd-sysdump: *                                                                                                                                               *
[  247.673229] c0 sprd-sysdump: *****************************************                                                                                            ************
[  247.680758] c0 sprd-sysdump:
[  248.683772] c0 Kernel Offset: disabled
[  248.687425] c0 CPU features: 0x0002004
[  248.691145] c0 Memory Limit: 1014 MB
[  248.694694] c0 trusty-log panic notifier - trusty version sharkle-lowm                                                                                            emory, Built: 12:01:00 Jul 15 2022
[  248.694709] c0 Rebooting in 5 seconds..
UUUUUERS
ROM
RBS
DDR init start
Swap later
CS0_MR8:0x0000001F
CS1_MR8:0x0000001F
DDR init OK

------=_Part_2096_1629173326.1660199356957--
