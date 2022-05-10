Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBUFT5GJQMGQETMGZGUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07552155B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 May 2022 14:25:53 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id s19-20020ad44b33000000b00456107e1120sf14138608qvw.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 May 2022 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fT3wbRF1LhF/uBYNudTNx7NSfIXdHYu/zYJIXxiGnyk=;
        b=l/rPPjIpo+dZN+p5ghgB2zVvdUo/6im1Vu4vbM9+seRbNywDQfTrcKcJg/Diu1yzY3
         F5DbP3cjk0vxiyRcz1GFT/vr8V7yThIlA/LYi37wBDSifcrdLFNdpWUDjydJFQfCI/VC
         9tTBVI5b1etGEOG+vZcT/8f3Z6ddsyYlWmu/+rocf97VNlmH81t1Gd0LuAbfoQgMjpnI
         iml1l5rvAgF+RAUcMYIY8JWePSZKlH9U0J8QcHLYuPz4D84eY9W6QFxgamLB8Km5rMw2
         mF1tF7f9X2pjgTuNRMOEixtS+78Irn0KlZAttSiLGKxbdBivLTnhsVSw6QY5nZaYOP1+
         5IbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fT3wbRF1LhF/uBYNudTNx7NSfIXdHYu/zYJIXxiGnyk=;
        b=fbINftJYlRejee+GA70saMXMi2J5Cr9bEQb5Qn6Gc1Ba4D0sqofUIkJEdj+p/7raSs
         DQOGoOavX6znLtja9xmr61lF0ndNdtClh/jf3s9sgV0TnM8QX8N1FTt6fCM95u1tN7kz
         J2E7NBo5qANYOmOq7HwbtKzVN7E/wlI5f4jDOIllwHaiysnsaoCqT/WXelUufZnqPUVF
         J55xsQNMyxgNy8XXXSBcfa2Ohw9fE/8bmgJChLvDHFdPleeXFeiPCVtAywJXhSAh6uaJ
         tEHOOfBkMsCXRyDogSyhHYad7qoR2mZeg0M6jwGsrQ3QdAP9OOKEhyVPPbtS+qgBkeqp
         CMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fT3wbRF1LhF/uBYNudTNx7NSfIXdHYu/zYJIXxiGnyk=;
        b=3p3B2+ZZFEhoUqLbnmvUhv2pNuVCTByPUmtGh9IoRoQHC2ZWfjqpZiVEh8UgCJS5m/
         sdPHKmxh0gxZUtJb82seUuhqxgCl2A0ABhsUCRKkgdHtTtQienONbRpm6OlBDayy4B8K
         JjGkosM0vYrG9waa/4nD80lwJWmHMPBFV7xhASKoSzgImahnnmq1mMZdkkdz8AjV6KlH
         Jg2JsOJ0vIssYrd9+ToG4otkUNs8pIsZgnEwuBHQlfWuWP8fTT1IPujgheS1SjAkgnmQ
         XfxhvBIWyNC25YHjBP265S/ZiBM1k4WWyeqRTweRefWQyA67242lD3G1lGUszGGGlITX
         899A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339IK9a8vju8ZLqPqq3b2ZYhRUQIAe+AJ4/gGhmFvyYPE9j3kaC
	d4RRUzaINpx4x8bp5VEV8V8=
X-Google-Smtp-Source: ABdhPJyC9UBxzKG2WGPaCuKOjUS0cNCvCjtg5EhcrzwMfhQSaZqrKst7u4JfUdsYgweqN8ehoO4bcQ==
X-Received: by 2002:a05:622a:1651:b0:2f3:e153:ebac with SMTP id y17-20020a05622a165100b002f3e153ebacmr5028273qtj.23.1652185552611;
        Tue, 10 May 2022 05:25:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:5098:b0:45a:ad75:8957 with SMTP id
 kk24-20020a056214509800b0045aad758957ls8016722qvb.3.gmail; Tue, 10 May 2022
 05:25:51 -0700 (PDT)
X-Received: by 2002:ad4:5cc1:0:b0:45b:115d:b9e1 with SMTP id iu1-20020ad45cc1000000b0045b115db9e1mr8069593qvb.123.1652185551748;
        Tue, 10 May 2022 05:25:51 -0700 (PDT)
Date: Tue, 10 May 2022 05:25:51 -0700 (PDT)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
Subject: Kernel panic on enabling root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1112_257477340.1652185551147"
X-Original-Sender: prabhakar.csengg@gmail.com
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

------=_Part_1112_257477340.1652185551147
Content-Type: multipart/alternative; 
	boundary="----=_Part_1113_160138275.1652185551147"

------=_Part_1113_160138275.1652185551147
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am currently working on getting root cell up and running on Renesas 
RZ/V2L SoC, which is equipped with 2 arm cortex A55.

I have written a simple root cell configuration and verified against using 
the "jailhouse config check", but as soon as I enable the root cell 
configuration I get the below panic.

root@smarc-rzg2l:~# insmod jailhouse.ko 
[   17.327338] jailhouse: loading out-of-tree module taints kernel.
root@smarc-rzg2l:~# 
root@smarc-rzg2l:~# jailhouse config check -a arm64 renesas-r9a07g054l2.cell
Reading configuration set:
  Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing resource interceptions for architecture arm64: None
root@smarc-rzg2l:~# 
root@smarc-rzg2l:~#

root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g054l2.cell
[   32.430107] ------------[ cut here ]------------
[   32.430111] ------------[ cut here ]------------
[   32.430126] kernel BUG at arch/arm64/kernel/traps.c:407!
[   32.434730] kernel BUG at arch/arm64/kernel/traps.c:407!
[   32.439323] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   32.455346] Modules linked in: jailhouse(O)
[   32.459523] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O     
 5.10.112-cip6+ #8
[   32.467490] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   32.473990] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=--)
[   32.479981] pc : do_undefinstr+0x26c/0x320
[   32.484059] lr : do_undefinstr+0x1cc/0x320
[   32.488134] sp : ffff80001128bd00
[   32.491432] x29: ffff80001128bd00 x28: ffff800011102a80 
[   32.496723] x27: ffff800011102a80 x26: ffff80001128c000 
[   32.502018] x25: ffff800011288000 x24: ffff8000110fa344 
[   32.507309] x23: 0000000020400085 x22: ffff800012004064 
[   32.512600] x21: ffff80001128bee0 x20: ffff80001128bd90 
[   32.517891] x19: ffff800010e4f000 x18: 0000000000000001 
[   32.523181] x17: ffff800008b0180c x16: 0000000000000000 
[   32.528473] x15: ffff800012004064 x14: 000000001004b800 
[   32.533764] x13: 0000ffffc0200000 x12: 00000000b6f00000 
[   32.539054] x11: ffff0000f6d00000 x10: ffff800011181580 
[   32.544345] x9 : ffff800011181578 x8 : ffff000009c00270 
[   32.549636] x7 : ffff800010e4f000 x6 : ffff80001128bd58 
[   32.554927] x5 : 00000000d5300000 x4 : ffff800011104f50 
[   32.560218] x3 : 00000000d4000000 x2 : 0000000000000000 
[   32.565509] x1 : ffff800011102a80 x0 : 0000000020400085 
[   32.570801] Call trace:
[   32.573238]  do_undefinstr+0x26c/0x320
[   32.576975]  el1_undef+0x30/0x50
[   32.580189]  el1_sync_handler+0xc4/0xe0
[   32.584007]  el1_sync+0x84/0x140
[   32.587221]  0xffff800012004064
[   32.590352]  flush_smp_call_function_queue+0xf8/0x268
[   32.595381]  generic_smp_call_function_single_interrupt+0x14/0x20
[   32.601449]  ipi_handler+0x8c/0x158
[   32.604924]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
[   32.610043]  generic_handle_irq+0x30/0x48
[   32.614035]  __handle_domain_irq+0x60/0xb8
[   32.618116]  gic_handle_irq+0x58/0x128
[   32.621846]  el1_irq+0xc8/0x180
[   32.624974]  arch_cpu_idle+0x18/0x28
[   32.628534]  default_idle_call+0x24/0x5c
[   32.632440]  do_idle+0x1ec/0x288
[   32.635653]  cpu_startup_entry+0x24/0x68
[   32.639557]  rest_init+0xd8/0xe8
[   32.642772]  arch_call_rest_init+0x10/0x1c
[   32.646850]  start_kernel+0x4b0/0x4e8
[   32.650500] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210000) 
[   32.656575] ---[ end trace 6f8e50d223964988 ]---
[   32.661173] Kernel panic - not syncing: Oops - BUG: Fatal exception in 
interrupt
[   32.668537] SMP: stopping secondary CPUs
[   33.756157] SMP: failed to stop secondary CPUs 0-1
[   33.760926] Kernel Offset: disabled
[   33.764399] CPU features: 0x0040026,2a00a238
[   33.768648] Memory Limit: 750 MB
[   33.771863] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal 
exception in interrupt ]---

Any pointers where I should be looking into for the above issue?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2dcadf3d-1df9-497a-a530-be01a5da96e9n%40googlegroups.com.

------=_Part_1113_160138275.1652185551147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div><br></div><div>I am currently working on getting roo=
t cell up and running on Renesas RZ/V2L SoC, which is equipped with 2 arm c=
ortex A55.<br></div><div><br></div><div>I have written a simple root cell c=
onfiguration and verified against using the "jailhouse config check", but a=
s soon as I enable the root cell configuration I get the below panic.<br></=
div><div><br></div><div>root@smarc-rzg2l:~# insmod jailhouse.ko <br>[ &nbsp=
; 17.327338] jailhouse: loading out-of-tree module taints kernel.<br>root@s=
marc-rzg2l:~# <br>root@smarc-rzg2l:~# jailhouse config check -a arm64 renes=
as-r9a07g054l2.cell<br>Reading configuration set:<br>&nbsp; Root cell: &nbs=
p; &nbsp; Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)<br>Overlapping me=
mory regions inside cell: None<br>Overlapping memory regions with hyperviso=
r: None<br>Missing resource interceptions for architecture arm64: None<br>r=
oot@smarc-rzg2l:~# <br>root@smarc-rzg2l:~#</div><div><br></div><div>root@sm=
arc-rzg2l:~# jailhouse enable renesas-r9a07g054l2.cell<br>[ &nbsp; 32.43010=
7] ------------[ cut here ]------------<br>[ &nbsp; 32.430111] ------------=
[ cut here ]------------<br>[ &nbsp; 32.430126] kernel BUG at arch/arm64/ke=
rnel/traps.c:407!<br>[ &nbsp; 32.434730] kernel BUG at arch/arm64/kernel/tr=
aps.c:407!<br>[ &nbsp; 32.439323] Internal error: Oops - BUG: 0 [#1] PREEMP=
T SMP<br>[ &nbsp; 32.455346] Modules linked in: jailhouse(O)<br>[ &nbsp; 32=
.459523] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; O &nbsp; &nbsp; &nbsp;5.10.112-cip6+ #8<br>[ &nbsp; 32.467490] Ha=
rdware name: Renesas SMARC EVK based on r9a07g054l2 (DT)<br>[ &nbsp; 32.473=
990] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=3D--)<br>[ &nbsp; 32.=
479981] pc : do_undefinstr+0x26c/0x320<br>[ &nbsp; 32.484059] lr : do_undef=
instr+0x1cc/0x320<br>[ &nbsp; 32.488134] sp : ffff80001128bd00<br>[ &nbsp; =
32.491432] x29: ffff80001128bd00 x28: ffff800011102a80 <br>[ &nbsp; 32.4967=
23] x27: ffff800011102a80 x26: ffff80001128c000 <br>[ &nbsp; 32.502018] x25=
: ffff800011288000 x24: ffff8000110fa344 <br>[ &nbsp; 32.507309] x23: 00000=
00020400085 x22: ffff800012004064 <br>[ &nbsp; 32.512600] x21: ffff80001128=
bee0 x20: ffff80001128bd90 <br>[ &nbsp; 32.517891] x19: ffff800010e4f000 x1=
8: 0000000000000001 <br>[ &nbsp; 32.523181] x17: ffff800008b0180c x16: 0000=
000000000000 <br>[ &nbsp; 32.528473] x15: ffff800012004064 x14: 00000000100=
4b800 <br>[ &nbsp; 32.533764] x13: 0000ffffc0200000 x12: 00000000b6f00000 <=
br>[ &nbsp; 32.539054] x11: ffff0000f6d00000 x10: ffff800011181580 <br>[ &n=
bsp; 32.544345] x9 : ffff800011181578 x8 : ffff000009c00270 <br>[ &nbsp; 32=
.549636] x7 : ffff800010e4f000 x6 : ffff80001128bd58 <br>[ &nbsp; 32.554927=
] x5 : 00000000d5300000 x4 : ffff800011104f50 <br>[ &nbsp; 32.560218] x3 : =
00000000d4000000 x2 : 0000000000000000 <br>[ &nbsp; 32.565509] x1 : ffff800=
011102a80 x0 : 0000000020400085 <br>[ &nbsp; 32.570801] Call trace:<br>[ &n=
bsp; 32.573238] &nbsp;do_undefinstr+0x26c/0x320<br>[ &nbsp; 32.576975] &nbs=
p;el1_undef+0x30/0x50<br>[ &nbsp; 32.580189] &nbsp;el1_sync_handler+0xc4/0x=
e0<br>[ &nbsp; 32.584007] &nbsp;el1_sync+0x84/0x140<br>[ &nbsp; 32.587221] =
&nbsp;0xffff800012004064<br>[ &nbsp; 32.590352] &nbsp;flush_smp_call_functi=
on_queue+0xf8/0x268<br>[ &nbsp; 32.595381] &nbsp;generic_smp_call_function_=
single_interrupt+0x14/0x20<br>[ &nbsp; 32.601449] &nbsp;ipi_handler+0x8c/0x=
158<br>[ &nbsp; 32.604924] &nbsp;handle_percpu_devid_fasteoi_ipi+0x74/0x88<=
br>[ &nbsp; 32.610043] &nbsp;generic_handle_irq+0x30/0x48<br>[ &nbsp; 32.61=
4035] &nbsp;__handle_domain_irq+0x60/0xb8<br>[ &nbsp; 32.618116] &nbsp;gic_=
handle_irq+0x58/0x128<br>[ &nbsp; 32.621846] &nbsp;el1_irq+0xc8/0x180<br>[ =
&nbsp; 32.624974] &nbsp;arch_cpu_idle+0x18/0x28<br>[ &nbsp; 32.628534] &nbs=
p;default_idle_call+0x24/0x5c<br>[ &nbsp; 32.632440] &nbsp;do_idle+0x1ec/0x=
288<br>[ &nbsp; 32.635653] &nbsp;cpu_startup_entry+0x24/0x68<br>[ &nbsp; 32=
.639557] &nbsp;rest_init+0xd8/0xe8<br>[ &nbsp; 32.642772] &nbsp;arch_call_r=
est_init+0x10/0x1c<br>[ &nbsp; 32.646850] &nbsp;start_kernel+0x4b0/0x4e8<br=
>[ &nbsp; 32.650500] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210000) <=
br>[ &nbsp; 32.656575] ---[ end trace 6f8e50d223964988 ]---<br>[ &nbsp; 32.=
661173] Kernel panic - not syncing: Oops - BUG: Fatal exception in interrup=
t<br>[ &nbsp; 32.668537] SMP: stopping secondary CPUs<br>[ &nbsp; 33.756157=
] SMP: failed to stop secondary CPUs 0-1<br>[ &nbsp; 33.760926] Kernel Offs=
et: disabled<br>[ &nbsp; 33.764399] CPU features: 0x0040026,2a00a238<br>[ &=
nbsp; 33.768648] Memory Limit: 750 MB<br>[ &nbsp; 33.771863] ---[ end Kerne=
l panic - not syncing: Oops - BUG: Fatal exception in interrupt ]---<br></d=
iv><div><br></div><div>Any pointers where I should be looking into for the =
above issue?</div><div><br></div><div>Cheers,</div><div>Prabhakar</div><div=
><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2dcadf3d-1df9-497a-a530-be01a5da96e9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2dcadf3d-1df9-497a-a530-be01a5da96e9n%40googlegroups.co=
m</a>.<br />

------=_Part_1113_160138275.1652185551147--

------=_Part_1112_257477340.1652185551147--
