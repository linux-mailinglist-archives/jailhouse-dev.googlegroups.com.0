Return-Path: <jailhouse-dev+bncBCALNYGP4YHRBFMFSH6QKGQEHU5KTPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D312A8603
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Nov 2020 19:21:10 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id d21sf1346482qtp.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Nov 2020 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bD8tjyoibuDWRU4Ros+8kU7CCl/ks34qMsD1Ei7MthM=;
        b=JeON6Mt2v1YCMxCLPY9zI+jUE5JMtbkQQpf6usDHg1zyHm1f6f9NcpDrW0+AoG3fNy
         /VbG+akWrDmRpIaL+p8Q/8YXpdyo2t1l4A2B6MW4AK5TJjFzfW3klHP+zMN9Eyc0H/cN
         nmtuqe2+vlL/fcjxsAlZtfcQPfGATojVyN7yo4gWKNTvqSvZilT6m0e1VWbnGanCGJAh
         jGLaHd1VNdZCt+BafAmPtjGpq7Hrjjnq4a92BlRmxFd7WM1PkvduBeXf+IGcsptvWzsP
         XIxd6tY58jHIsHBiU0svu8X1Se+8kvEa3poTsw1DIHOVEwG+9sInVdHduT/lGgZY5Qx/
         YKMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bD8tjyoibuDWRU4Ros+8kU7CCl/ks34qMsD1Ei7MthM=;
        b=TME3G18BlmdnYAmc+vaJcOIIJAxpl2mQQ0HLlF0sLAezSsLfSly78q2s9UJUasz/IG
         0OpjsKD4Ixrih1BRCIig1RTxfHHp75t5VepiRmNqEYwVCxoQ+J7zb0cQXXW0izZkkgqo
         rYrFuc6MkZpBPUfzwup4xlft4qTYbaFiabhkpE+ZQTFOaJ5Rh0YJtAZhZulDKhQvoU3L
         j1YslrJGeNx9Co6gdo+QKgdxH8aG+gRgJ0zJB5qHhWFOM70YJDRLPIUn37ylEvg9TjvR
         hEhLWb3I+UM3gU4ebabj1FB/r/Cmgtsyn5YOYyvfcZ/nZIGCFPbacbB78r4wqTT6RNCJ
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bD8tjyoibuDWRU4Ros+8kU7CCl/ks34qMsD1Ei7MthM=;
        b=tDHVzZHRVOYOXgMiXKOn+eW6E2F8VKIWaiTHQWrCrld6IuWUcbVvnJ6MaH7UmSmobc
         +c2wvoP9fxWd6Mn6enwaBaS5G1xRN5Dz0qxD1t46O3rCai84ocXV+hrxtWbDxGSGRKxh
         p665hRNLbLtu2YKn8jF3cBNLmb9ugrGEahtpo7yNWYZLRWG8P1HHca8bP3meCyOUfR3r
         HqG4FPfCQaFDvqUBKVmFu6fAeB4XtYUnCMUgDPSdnyOlJy8QnkjLYXKtJ7TvrwglI7cm
         oAhDfifuGhOWNNqPQnDiqGirO70EDzYkXbItOeTkwCL9Df+Ch7Rb4RR5M7W8v6IGKfAa
         FIrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/7/lMRygWMTGlRE43+SNKvU0z8GY8WbFti3j6LedRosW2JIAc
	XVRbZmGq0ppEpQQe4YnM3GY=
X-Google-Smtp-Source: ABdhPJw08j0CMe94BBFdjWq5t1RABrzMkbe/erDX05EO5RtzLOVvIK6L0bEwHiBdQP6MmZ0TDx+TZA==
X-Received: by 2002:a0c:f3d0:: with SMTP id f16mr3540836qvm.42.1604600469901;
        Thu, 05 Nov 2020 10:21:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:543:: with SMTP id 64ls1167346qkf.2.gmail; Thu, 05 Nov
 2020 10:21:09 -0800 (PST)
X-Received: by 2002:a05:620a:14a9:: with SMTP id x9mr3310931qkj.47.1604600468523;
        Thu, 05 Nov 2020 10:21:08 -0800 (PST)
Date: Thu, 5 Nov 2020 10:21:07 -0800 (PST)
From: Kai-Feng Chou <mapleelpam@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
In-Reply-To: <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_712_157910563.1604600467670"
X-Original-Sender: mapleelpam@gmail.com
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

------=_Part_712_157910563.1604600467670
Content-Type: multipart/alternative; 
	boundary="----=_Part_713_1547387491.1604600467670"

------=_Part_713_1547387491.1604600467670
Content-Type: text/plain; charset="UTF-8"

Hi, 
 I'm working on Stratix 10 SoCFPGA and passed the .ko part and loaded it 
sucessfully.
But I do have problem with root cell implementation. checked the 
"Documents" but there's no guidance for new board porting.
Is it any useful hint?

"
root@stratix10:~/jailhouse/configs/arm64# jailhouse enable 
socfpga-s10socdk.cell
[  163.205096] SError Interrupt on CPU0, code 0xbf400000 -- SError
[  163.205101] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O      
5.4.23-03461-gb6dad2fd8d54-dirty #1
[  163.205103] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  163.205105] pstate: 40000085 (nZcv daIf -PAN -UAO)
[  163.205107] pc : arch_cpu_idle+0x8/0x18
[  163.205109] lr : default_idle_call+0x1c/0x38
[  163.205110] sp : ffff800011803ec0
[  163.205112] x29: ffff800011803ec0 x28: 0000000003300018
[  163.205117] x27: 0000000000000000 x26: 0000000000000000
[  163.205121] x25: 0000000000000000 x24: ffff80001180a21c
[  163.205124] x23: ffff800011456ab8 x22: ffff800011809000
[  163.205128] x21: ffff80001180a000 x20: 0000000000000001
[  163.205132] x19: ffff80001180a120 x18: 0000000000000000
[  163.205136] x17: 0000000000000000 x16: 0000000000000000
[  163.205140] x15: 00000000000001d9 x14: 0000000000000002
[  163.205144] x13: 00000000000001d9 x12: 0000000000000001
[  163.205148] x11: 0000000000000000 x10: 00000000000009c0
[  163.205152] x9 : ffff800011803e20 x8 : ffff800011813760
[  163.205156] x7 : 0000000000000660 x6 : ffff800011f9bdf0
[  163.205159] x5 : ffff00003dd9bd70 x4 : ffff00003dd9bd70
[  163.205163] x3 : 4000000000000000 x2 : 0000000000000000
[  163.205167] x1 : 000000000003f8a4 x0 : 0000000000000028
[  163.205173] SError Interrupt on CPU1, code 0xbf400000 -- SError
[  163.205176] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O      
5.4.23-03461-gb6dad2fd8d54-dirty #1
[  163.205178] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  163.205180] pstate: 40000085 (nZcv daIf -PAN -UAO)
[  163.205182] pc : arch_cpu_idle+0x8/0x18
[  163.205184] lr : default_idle_call+0x1c/0x38
[  163.205185] sp : ffff800011a53f30
[  163.205187] x29: ffff800011a53f30 x28: e38b4d4078ae707d
[  163.205190] x27: 9ecd419d57dce7ef x26: 0000000000000000
[  163.205195] x25: 0000000000000000 x24: ffff80001180a21c
[  163.205198] x23: ffff800011456ab8 x22: ffff800011809000
[  163.205202] x21: ffff80001180a000 x20: 0000000000000002
[  163.205206] x19: ffff80001180a120 x18: 0000000000000000
[  163.205210] x17: 0000000000000000 x16: 0000000000000000
[  163.205214] x15: 0000000000000000 x14: 0000000000000000
[  163.205218] x13: 0000000000000001 x12: 0000000000004000
[  163.205222] x11: 0000000000000000 x10: 00000000000009c0
[  163.205226] x9 : ffff800011a53e90 x8 : ffff00003c4a2620
[  163.205229] x7 : ffff80002c95d000 x6 : 0000001534120b80
[  163.205233] x5 : 00ffffffffffffff x4 : 0000000066666666
[  163.205237] x3 : 4000000000000000 x2 : 0000000000000000
[  163.205241] x1 : 0000000000004c5c x0 : 0000000000000028
[  163.205246] Kernel panic - not syncing: Asynchronous SError Interrupt
[  163.205249] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O      
5.4.23-03461-gb6dad2fd8d54-dirty #1
[  163.205251] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  163.205253] Call trace:
[  163.205254]  dump_backtrace+0x0/0x150
[  163.205256]  show_stack+0x14/0x20
[  163.205258]  dump_stack+0xbc/0x100
[  163.205259]  panic+0x16c/0x37c
[  163.205261]  __stack_chk_fail+0x0/0x18
[  163.205263]  arm64_serror_panic+0x74/0x88
[  163.205264]  do_serror+0x70/0x138
[  163.205266]  el1_error+0x84/0xf8
[  163.205267]  arch_cpu_idle+0x8/0x18
[  163.205269]  do_idle+0x1d0/0x2b0
[  163.205270]  cpu_startup_entry+0x24/0x40
[  163.205272]  secondary_start_kernel+0x1b4/0x208
[  163.205275] SError Interrupt on CPU2, code 0xbf400000 -- SError
[  163.205278] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G           O      
5.4.23-03461-gb6dad2fd8d54-dirty #1
[  163.205280] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  163.205282] pstate: 40000085 (nZcv daIf -PAN -UAO)
[  163.205284] pc : arch_cpu_idle+0x8/0x18
[  163.205286] lr : default_idle_call+0x1c/0x38
[  163.205287] sp : ffff800011a5bf30
[  163.205289] x29: ffff800011a5bf30 x28: c8e8555c779f5780
[  163.205293] x27: 72e681172d0391f0 x26: 0000000000000000
[  163.205297] x25: 0000000000000000 x24: ffff80001180a21c
[  163.205300] x23: ffff800011456ab8 x22: ffff800011809000
[  163.205304] x21: ffff80001180a000 x20: 0000000000000004
[  163.205308] x19: ffff80001180a120 x18: 0000000000000000
[  163.205312] x17: 0000000000000000 x16: 0000000000000000
[  163.205316] x15: 0000000000000000 x14: 0000000000000000
[  163.205319] x13: 0000000000000001 x12: 0000000000005074
[  163.205323] x11: 0000000000000000 x10: 00000000000009c0
[  163.205327] x9 : ffff800011a5be90 x8 : ffff00003c4a3420
[  163.205331] x7 : ffff80002c973000 x6 : 00000015459e3b80
[  163.205335] x5 : 00ffffffffffffff x4 : 0000000066666666
[  163.205339] x3 : 4000000000000000 x2 : 0000000000000000
[  163.205343] x1 : 000000000000f4b8 x0 : 0000000000000028
[  163.205348] SError Interrupt on CPU3, code 0xbf400000 -- SError
[  163.205351] CPU: 3 PID: 1074 Comm: jailhouse Tainted: G           O      
5.4.23-03461-gb6dad2fd8d54-dirty #1
[  163.205353] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  163.205355] pstate: 20000005 (nzCv daif -PAN -UAO)
[  163.205357] pc : __memcpy+0x134/0x180
[  163.205359] lr : jailhouse_cmd_enable+0x37c/0x7a0 [jailhouse]
[  163.205361] sp : ffff800011bcbb10
[  163.205362] x29: ffff800011bcbb10 x28: 00000000ffffffea
[  163.205366] x27: ffff800011d65000 x26: ffff800008c97000
[  163.205370] x25: ffff800008c97000 x24: 0000000000000004
[  163.205374] x23: 0000000000000400 x22: 000000002d9e52a0
[  163.205378] x21: 0000000000000000 x20: ffff800011809000
[  163.205382] x19: 000000002d9e52a0 x18: 0000000000000000
[  163.205386] x17: 0000000000000000 x16: 0000000000000000
[  163.205390] x15: 0000000000000000 x14: 0000000000000000
[  163.205393] x13: 0000000000000000 x12: 0000000000000000
[  163.205397] x11: 0000000000000000 x10: 0000000000000000
[  163.205401] x9 : 0000000000000000 x8 : 0000000000000000
[  163.205405] x7 : 0000000000000000 x6 : ffff8000130001c0
[  163.205409] x5 : ffff00003dffe4c8 x4 : 0000000000000000
[  163.205413] x3 : ffff800013016000 x2 : 00000000000165c8
[  163.205417] x1 : ffff800011d65200 x0 : ffff800013000000
[  163.205435] Kernel Offset: disabled
[  163.205437] CPU features: 0x0002,20002004
[  163.205439] Memory Limit: 1024 MB
"
On Monday, 18 June 2018 at 03:07:04 UTC+8 Jan Kiszka wrote:

> On 2018-06-17 20:45, David Pereira wrote:
> > Hi everybody,
> > 
> > I would like to experiment with Jailhouse for implementing a 
> mixed-criticality solution (FreeRTOS in one core, Linux on the other) over 
> a Arrow SoCKit Evaluation Board (link for the board description is 
> https://rocketboards.org/foswiki/Documentation/ArrowSoCKitEvaluationBoard
> ).
> > 
> > Does anyone in the forum had already tried Jailhouse with this board and 
> made it run successfully? I am looking for some hints which could help with 
> the process of installing Jailhouse in this board.
> > 
> > Thanks a lot in advance for any replies.
>
> Unfortunately, that SoC is too old for Jailhouse (same is true for the
> Xilinx Zynq, BTW).
>
> We need at least a Cortex-A7 or A15 on ARMv7, but the Cyclone V only has
> an A9, and that predates virtualization support. Or ARMv8. You likely
> need a Stratix 10 (though I haven't heard of anyone enabling Jailhouse
> on that thing so far) or a Xilinx ZynqMP (known to work).
>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7a9814a6-dd4b-453a-977b-3e2f86119176n%40googlegroups.com.

------=_Part_713_1547387491.1604600467670
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<div>&nbsp;I'm working on Stratix 10 SoCFPGA and passed the .ko pa=
rt and loaded it sucessfully.</div><div>But I do have problem with root cel=
l implementation. checked the "Documents" but there's no guidance for new b=
oard porting.</div><div>Is it any useful hint?</div><div><br></div><div>"</=
div><div>root@stratix10:~/jailhouse/configs/arm64# jailhouse enable socfpga=
-s10socdk.cell<br></div><div>[&nbsp; 163.205096] SError Interrupt on CPU0, =
code 0xbf400000 -- SError</div><div>[&nbsp; 163.205101] CPU: 0 PID: 0 Comm:=
 swapper/0 Tainted: G&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O&nbsp; &nbsp=
; &nbsp; 5.4.23-03461-gb6dad2fd8d54-dirty #1</div><div>[&nbsp; 163.205103] =
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)</div><div>[&nbsp; 163.205105] =
pstate: 40000085 (nZcv daIf -PAN -UAO)</div><div>[&nbsp; 163.205107] pc : a=
rch_cpu_idle+0x8/0x18</div><div>[&nbsp; 163.205109] lr : default_idle_call+=
0x1c/0x38</div><div>[&nbsp; 163.205110] sp : ffff800011803ec0</div><div>[&n=
bsp; 163.205112] x29: ffff800011803ec0 x28: 0000000003300018</div><div>[&nb=
sp; 163.205117] x27: 0000000000000000 x26: 0000000000000000</div><div>[&nbs=
p; 163.205121] x25: 0000000000000000 x24: ffff80001180a21c</div><div>[&nbsp=
; 163.205124] x23: ffff800011456ab8 x22: ffff800011809000</div><div>[&nbsp;=
 163.205128] x21: ffff80001180a000 x20: 0000000000000001</div><div>[&nbsp; =
163.205132] x19: ffff80001180a120 x18: 0000000000000000</div><div>[&nbsp; 1=
63.205136] x17: 0000000000000000 x16: 0000000000000000</div><div>[&nbsp; 16=
3.205140] x15: 00000000000001d9 x14: 0000000000000002</div><div>[&nbsp; 163=
.205144] x13: 00000000000001d9 x12: 0000000000000001</div><div>[&nbsp; 163.=
205148] x11: 0000000000000000 x10: 00000000000009c0</div><div>[&nbsp; 163.2=
05152] x9 : ffff800011803e20 x8 : ffff800011813760</div><div>[&nbsp; 163.20=
5156] x7 : 0000000000000660 x6 : ffff800011f9bdf0</div><div>[&nbsp; 163.205=
159] x5 : ffff00003dd9bd70 x4 : ffff00003dd9bd70</div><div>[&nbsp; 163.2051=
63] x3 : 4000000000000000 x2 : 0000000000000000</div><div>[&nbsp; 163.20516=
7] x1 : 000000000003f8a4 x0 : 0000000000000028</div><div>[&nbsp; 163.205173=
] SError Interrupt on CPU1, code 0xbf400000 -- SError</div><div>[&nbsp; 163=
.205176] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;O&nbsp; &nbsp; &nbsp; 5.4.23-03461-gb6dad2fd8d54-dirty #1</d=
iv><div>[&nbsp; 163.205178] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)</d=
iv><div>[&nbsp; 163.205180] pstate: 40000085 (nZcv daIf -PAN -UAO)</div><di=
v>[&nbsp; 163.205182] pc : arch_cpu_idle+0x8/0x18</div><div>[&nbsp; 163.205=
184] lr : default_idle_call+0x1c/0x38</div><div>[&nbsp; 163.205185] sp : ff=
ff800011a53f30</div><div>[&nbsp; 163.205187] x29: ffff800011a53f30 x28: e38=
b4d4078ae707d</div><div>[&nbsp; 163.205190] x27: 9ecd419d57dce7ef x26: 0000=
000000000000</div><div>[&nbsp; 163.205195] x25: 0000000000000000 x24: ffff8=
0001180a21c</div><div>[&nbsp; 163.205198] x23: ffff800011456ab8 x22: ffff80=
0011809000</div><div>[&nbsp; 163.205202] x21: ffff80001180a000 x20: 0000000=
000000002</div><div>[&nbsp; 163.205206] x19: ffff80001180a120 x18: 00000000=
00000000</div><div>[&nbsp; 163.205210] x17: 0000000000000000 x16: 000000000=
0000000</div><div>[&nbsp; 163.205214] x15: 0000000000000000 x14: 0000000000=
000000</div><div>[&nbsp; 163.205218] x13: 0000000000000001 x12: 00000000000=
04000</div><div>[&nbsp; 163.205222] x11: 0000000000000000 x10: 000000000000=
09c0</div><div>[&nbsp; 163.205226] x9 : ffff800011a53e90 x8 : ffff00003c4a2=
620</div><div>[&nbsp; 163.205229] x7 : ffff80002c95d000 x6 : 0000001534120b=
80</div><div>[&nbsp; 163.205233] x5 : 00ffffffffffffff x4 : 000000006666666=
6</div><div>[&nbsp; 163.205237] x3 : 4000000000000000 x2 : 0000000000000000=
</div><div>[&nbsp; 163.205241] x1 : 0000000000004c5c x0 : 0000000000000028<=
/div><div>[&nbsp; 163.205246] Kernel panic - not syncing: Asynchronous SErr=
or Interrupt</div><div>[&nbsp; 163.205249] CPU: 1 PID: 0 Comm: swapper/1 Ta=
inted: G&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O&nbsp; &nbsp; &nbsp; 5.4.=
23-03461-gb6dad2fd8d54-dirty #1</div><div>[&nbsp; 163.205251] Hardware name=
: SoCFPGA Stratix 10 SoCDK (DT)</div><div>[&nbsp; 163.205253] Call trace:</=
div><div>[&nbsp; 163.205254]&nbsp; dump_backtrace+0x0/0x150</div><div>[&nbs=
p; 163.205256]&nbsp; show_stack+0x14/0x20</div><div>[&nbsp; 163.205258]&nbs=
p; dump_stack+0xbc/0x100</div><div>[&nbsp; 163.205259]&nbsp; panic+0x16c/0x=
37c</div><div>[&nbsp; 163.205261]&nbsp; __stack_chk_fail+0x0/0x18</div><div=
>[&nbsp; 163.205263]&nbsp; arm64_serror_panic+0x74/0x88</div><div>[&nbsp; 1=
63.205264]&nbsp; do_serror+0x70/0x138</div><div>[&nbsp; 163.205266]&nbsp; e=
l1_error+0x84/0xf8</div><div>[&nbsp; 163.205267]&nbsp; arch_cpu_idle+0x8/0x=
18</div><div>[&nbsp; 163.205269]&nbsp; do_idle+0x1d0/0x2b0</div><div>[&nbsp=
; 163.205270]&nbsp; cpu_startup_entry+0x24/0x40</div><div>[&nbsp; 163.20527=
2]&nbsp; secondary_start_kernel+0x1b4/0x208</div><div>[&nbsp; 163.205275] S=
Error Interrupt on CPU2, code 0xbf400000 -- SError</div><div>[&nbsp; 163.20=
5278] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;O&nbsp; &nbsp; &nbsp; 5.4.23-03461-gb6dad2fd8d54-dirty #1</div>=
<div>[&nbsp; 163.205280] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)</div>=
<div>[&nbsp; 163.205282] pstate: 40000085 (nZcv daIf -PAN -UAO)</div><div>[=
&nbsp; 163.205284] pc : arch_cpu_idle+0x8/0x18</div><div>[&nbsp; 163.205286=
] lr : default_idle_call+0x1c/0x38</div><div>[&nbsp; 163.205287] sp : ffff8=
00011a5bf30</div><div>[&nbsp; 163.205289] x29: ffff800011a5bf30 x28: c8e855=
5c779f5780</div><div>[&nbsp; 163.205293] x27: 72e681172d0391f0 x26: 0000000=
000000000</div><div>[&nbsp; 163.205297] x25: 0000000000000000 x24: ffff8000=
1180a21c</div><div>[&nbsp; 163.205300] x23: ffff800011456ab8 x22: ffff80001=
1809000</div><div>[&nbsp; 163.205304] x21: ffff80001180a000 x20: 0000000000=
000004</div><div>[&nbsp; 163.205308] x19: ffff80001180a120 x18: 00000000000=
00000</div><div>[&nbsp; 163.205312] x17: 0000000000000000 x16: 000000000000=
0000</div><div>[&nbsp; 163.205316] x15: 0000000000000000 x14: 0000000000000=
000</div><div>[&nbsp; 163.205319] x13: 0000000000000001 x12: 00000000000050=
74</div><div>[&nbsp; 163.205323] x11: 0000000000000000 x10: 00000000000009c=
0</div><div>[&nbsp; 163.205327] x9 : ffff800011a5be90 x8 : ffff00003c4a3420=
</div><div>[&nbsp; 163.205331] x7 : ffff80002c973000 x6 : 00000015459e3b80<=
/div><div>[&nbsp; 163.205335] x5 : 00ffffffffffffff x4 : 0000000066666666</=
div><div>[&nbsp; 163.205339] x3 : 4000000000000000 x2 : 0000000000000000</d=
iv><div>[&nbsp; 163.205343] x1 : 000000000000f4b8 x0 : 0000000000000028</di=
v><div>[&nbsp; 163.205348] SError Interrupt on CPU3, code 0xbf400000 -- SEr=
ror</div><div>[&nbsp; 163.205351] CPU: 3 PID: 1074 Comm: jailhouse Tainted:=
 G&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O&nbsp; &nbsp; &nbsp; 5.4.23-034=
61-gb6dad2fd8d54-dirty #1</div><div>[&nbsp; 163.205353] Hardware name: SoCF=
PGA Stratix 10 SoCDK (DT)</div><div>[&nbsp; 163.205355] pstate: 20000005 (n=
zCv daif -PAN -UAO)</div><div>[&nbsp; 163.205357] pc : __memcpy+0x134/0x180=
</div><div>[&nbsp; 163.205359] lr : jailhouse_cmd_enable+0x37c/0x7a0 [jailh=
ouse]</div><div>[&nbsp; 163.205361] sp : ffff800011bcbb10</div><div>[&nbsp;=
 163.205362] x29: ffff800011bcbb10 x28: 00000000ffffffea</div><div>[&nbsp; =
163.205366] x27: ffff800011d65000 x26: ffff800008c97000</div><div>[&nbsp; 1=
63.205370] x25: ffff800008c97000 x24: 0000000000000004</div><div>[&nbsp; 16=
3.205374] x23: 0000000000000400 x22: 000000002d9e52a0</div><div>[&nbsp; 163=
.205378] x21: 0000000000000000 x20: ffff800011809000</div><div>[&nbsp; 163.=
205382] x19: 000000002d9e52a0 x18: 0000000000000000</div><div>[&nbsp; 163.2=
05386] x17: 0000000000000000 x16: 0000000000000000</div><div>[&nbsp; 163.20=
5390] x15: 0000000000000000 x14: 0000000000000000</div><div>[&nbsp; 163.205=
393] x13: 0000000000000000 x12: 0000000000000000</div><div>[&nbsp; 163.2053=
97] x11: 0000000000000000 x10: 0000000000000000</div><div>[&nbsp; 163.20540=
1] x9 : 0000000000000000 x8 : 0000000000000000</div><div>[&nbsp; 163.205405=
] x7 : 0000000000000000 x6 : ffff8000130001c0</div><div>[&nbsp; 163.205409]=
 x5 : ffff00003dffe4c8 x4 : 0000000000000000</div><div>[&nbsp; 163.205413] =
x3 : ffff800013016000 x2 : 00000000000165c8</div><div>[&nbsp; 163.205417] x=
1 : ffff800011d65200 x0 : ffff800013000000</div><div>[&nbsp; 163.205435] Ke=
rnel Offset: disabled</div><div>[&nbsp; 163.205437] CPU features: 0x0002,20=
002004</div><div>[&nbsp; 163.205439] Memory Limit: 1024 MB</div><div>"</div=
><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monda=
y, 18 June 2018 at 03:07:04 UTC+8 Jan Kiszka wrote:<br/></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">On 2018-06-17 20:45, David Pereira w=
rote:
<br>&gt; Hi everybody,
<br>&gt;=20
<br>&gt; I would like to experiment with Jailhouse for implementing a mixed=
-criticality solution (FreeRTOS in one core, Linux on the other) over a Arr=
ow SoCKit Evaluation Board (link for the board description is <a href=3D"ht=
tps://rocketboards.org/foswiki/Documentation/ArrowSoCKitEvaluationBoard" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den-GB&amp;q=3Dhttps://rocketboards.org/foswiki/Documentation/=
ArrowSoCKitEvaluationBoard&amp;source=3Dgmail&amp;ust=3D1604686524460000&am=
p;usg=3DAFQjCNEMk2WZJOgG-8npTVB4iG0l03oTHQ">https://rocketboards.org/foswik=
i/Documentation/ArrowSoCKitEvaluationBoard</a>).
<br>&gt;=20
<br>&gt; Does anyone in the forum had already tried Jailhouse with this boa=
rd and made it run successfully? I am looking for some hints which could he=
lp with the process of installing Jailhouse in this board.
<br>&gt;=20
<br>&gt; Thanks a lot in advance for any replies.
<br>
<br>Unfortunately, that SoC is too old for Jailhouse (same is true for the
<br>Xilinx Zynq, BTW).
<br>
<br>We need at least a Cortex-A7 or A15 on ARMv7, but the Cyclone V only ha=
s
<br>an A9, and that predates virtualization support. Or ARMv8. You likely
<br>need a Stratix 10 (though I haven&#39;t heard of anyone enabling Jailho=
use
<br>on that thing so far) or a Xilinx ZynqMP (known to work).
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7a9814a6-dd4b-453a-977b-3e2f86119176n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7a9814a6-dd4b-453a-977b-3e2f86119176n%40googlegroups.co=
m</a>.<br />

------=_Part_713_1547387491.1604600467670--

------=_Part_712_157910563.1604600467670
Content-Type: text/x-csrc; charset=US-ASCII; name=socfpga-s10socdk.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=socfpga-s10socdk.c
X-Attachment-Id: a56fe579-e4eb-415b-b568-9e6b801ecb24
Content-ID: <a56fe579-e4eb-415b-b568-9e6b801ecb24>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Xilinx ZynqMP ZCU102 eval board
 *
 * Copyright (c) Siemens AG, 2016
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Reservation via device tree: 0x800000000..0x83fffffff
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[12];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x800000000,
			.size =       0x000400000,
		},
		.debug_console = {
			.address = 0xffc02000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			/* need to check */
			.pci_mmconfig_base = 0xfc000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = -1,
			.arm = {
				.gic_version = 2,
				.gicd_base = 0xfffc1000,
				.gicc_base = 0xfffc2000,
				.gich_base = 0xfffc4000,
				.gicv_base = 0xfffc6000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "Stratix10-SoCfpga-SoCdk",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),

			.vpci_irq_base = 136-32,
		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* IVSHMEM shared memory region for 0001:00:00.0 */
//		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
		/* IVSHMEM shared memory region for 0001:00:01.0 */
//		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
		/* MMIO (permissive) */ {
			.phys_start = 0xff800000,
			.virt_start = 0xff800000,
			.size =	      0x00700000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x80000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM */ {
			.phys_start = 0x800600000,
			.virt_start = 0x800600000,
			.size = 0x7fa00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
	},

	.irqchips = {
		/* GIC */ {
			.address = 0xfffc1000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

};

------=_Part_712_157910563.1604600467670--
