Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBF5Y52JQMGQEBQSKPZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D752315A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 13:20:57 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id g10-20020a0562141cca00b00456332167ffsf1695118qvd.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 04:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lMFxfHDsZ51zy1XwhDf5wS3YfiTYAIXShyej8Qrsw4E=;
        b=pKi2QOBlajMnzPO8anBk8mHYhiqtTiFHv/rQrNknCPiOHL/ZQw7Qzs6MyNd1gVtVrQ
         KJhJxOZ3QXtCHHS9dKMsmCfJmCZ1D38iRCnClATxqTiWjIuIBa0X6VZE8mgXPXz7PmJC
         TwqMsUojKSeIhd/ilWkDPmZVBa1eBxb9gSeDcn9I+3T4OrqOShEwF7FwI5L3dpvN7Bza
         QSz4qjI36tlJ1D9dKtjtILNe0Wo+vDX9ecnn6aC+007/dd04dTh4XFWjJjUQlcopueER
         KCbDW2gkfkLmHbaF2PhaXKFhoF+SXqSN6qyVZawg/Iq3o7iT6lpxUlsdP5chgBZqd+KR
         4rrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lMFxfHDsZ51zy1XwhDf5wS3YfiTYAIXShyej8Qrsw4E=;
        b=iMsc/WGcluoaJqhmgPuHfQKNK1XJFvdXkdvMSEg9UE8dzb1XkzbJWxW1+dwrlnJ+rp
         RNNtrRrmrkuxlVrvXNvZyiz/uu9PaiiUApzOdLDLu/R4zK+pOoc7yN8L7ODhK6wX2eA2
         arix9eHg9ULOOVB1NabEZpEz/QtXoDBvENb3Dmoqz6/CjVwIuQrBS+AOBgc1LIsEVKZo
         No4YVO7Bw4HyuZmr0z/8jXZx8jhpOqBQOjCR1h8bFXDNdyznvB2G+C+kfyl7Xe1ldO/e
         OLqAg3szM//T1FkxGBoi6uQhFuHLeql2H7oGTFbcc8Sl2O5NcYxKTlKuP7KbYQQ4OrZx
         Ufsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lMFxfHDsZ51zy1XwhDf5wS3YfiTYAIXShyej8Qrsw4E=;
        b=DnWYcnPl/oAzXkiEn+/GSJN5//Jm1SSr5TJe4e+IlrrkarKnRT0Pq7381VvGKp0WiP
         YfdTsKnxNOvn9U5sQiP7dDDv09581LiA+XSJOoDY21YmYnOXKvWn5aribIqSwQ8sAqm1
         FMX5ZxDOLB8YxyiBjJWl2O1YxwrGQO7DMZMW3oX0uA+rIcNx5OeoFn09K9gIupr0gFsY
         +nY7VBs+LLDcpj66TtODhEFljSwv6SJDp0BxBYfXIHymm5F82O/lwMQSjKLVErctXRyj
         XBteQGyVYqXe72D4OxFYhRRVRYDAehEs5XM5swmtAOrgTp67Q8MvJs8XsCGHdcaMZv+6
         zW3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530feSp4Rpoq+/rp44LNpHMq3XX1Y74ncY9HqfCsy2OZwGlRYP+V
	FK3OBa1qjxwMYZ2NoIZISoo=
X-Google-Smtp-Source: ABdhPJwh6/2cSXe6RiXZ0+gdgeiFdHPpKLZclVXcG4ikriKNOy40KKo3/klSr57o1Ixqctd7LYH/Fg==
X-Received: by 2002:a05:622a:1447:b0:2f3:ecee:8d8f with SMTP id v7-20020a05622a144700b002f3ecee8d8fmr4449437qtx.385.1652268056276;
        Wed, 11 May 2022 04:20:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1b9f:b0:2f3:c6f6:999d with SMTP id
 bp31-20020a05622a1b9f00b002f3c6f6999dls1082374qtb.3.gmail; Wed, 11 May 2022
 04:20:55 -0700 (PDT)
X-Received: by 2002:ac8:5714:0:b0:2f3:b4b0:6fd6 with SMTP id 20-20020ac85714000000b002f3b4b06fd6mr22842406qtw.651.1652268055115;
        Wed, 11 May 2022 04:20:55 -0700 (PDT)
Date: Wed, 11 May 2022 04:20:54 -0700 (PDT)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
In-Reply-To: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
Subject: Re: Kernel panic on enabling root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_300_980936734.1652268054492"
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

------=_Part_300_980936734.1652268054492
Content-Type: multipart/alternative; 
	boundary="----=_Part_301_315490950.1652268054492"

------=_Part_301_315490950.1652268054492
Content-Type: text/plain; charset="UTF-8"

To add further more details:

I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch for 
jailhouse [1].

I added some debug prints and I see the panic is caused when entry() 
function is called (in enter_hypervisor). The entry function lands into 
assembly code (entry.S). I dont have a JTAG to see which exact instruction 
is causing this issue.

[0] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
[1] https://github.com/siemens/jailhouse/tree/next

Cheers,
Prabhakar

On Tuesday, 10 May 2022 at 13:25:51 UTC+1 Prabhakar Lad wrote:

> Hi All,
>
> I am currently working on getting root cell up and running on Renesas 
> RZ/V2L SoC, which is equipped with 2 arm cortex A55.
>
> I have written a simple root cell configuration and verified against using 
> the "jailhouse config check", but as soon as I enable the root cell 
> configuration I get the below panic.
>
> root@smarc-rzg2l:~# insmod jailhouse.ko 
> [   17.327338] jailhouse: loading out-of-tree module taints kernel.
> root@smarc-rzg2l:~# 
> root@smarc-rzg2l:~# jailhouse config check -a arm64 
> renesas-r9a07g054l2.cell
> Reading configuration set:
>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing resource interceptions for architecture arm64: None
> root@smarc-rzg2l:~# 
> root@smarc-rzg2l:~#
>
> root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g054l2.cell
> [   32.430107] ------------[ cut here ]------------
> [   32.430111] ------------[ cut here ]------------
> [   32.430126] kernel BUG at arch/arm64/kernel/traps.c:407!
> [   32.434730] kernel BUG at arch/arm64/kernel/traps.c:407!
> [   32.439323] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [   32.455346] Modules linked in: jailhouse(O)
> [   32.459523] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O     
>  5.10.112-cip6+ #8
> [   32.467490] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> [   32.473990] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=--)
> [   32.479981] pc : do_undefinstr+0x26c/0x320
> [   32.484059] lr : do_undefinstr+0x1cc/0x320
> [   32.488134] sp : ffff80001128bd00
> [   32.491432] x29: ffff80001128bd00 x28: ffff800011102a80 
> [   32.496723] x27: ffff800011102a80 x26: ffff80001128c000 
> [   32.502018] x25: ffff800011288000 x24: ffff8000110fa344 
> [   32.507309] x23: 0000000020400085 x22: ffff800012004064 
> [   32.512600] x21: ffff80001128bee0 x20: ffff80001128bd90 
> [   32.517891] x19: ffff800010e4f000 x18: 0000000000000001 
> [   32.523181] x17: ffff800008b0180c x16: 0000000000000000 
> [   32.528473] x15: ffff800012004064 x14: 000000001004b800 
> [   32.533764] x13: 0000ffffc0200000 x12: 00000000b6f00000 
> [   32.539054] x11: ffff0000f6d00000 x10: ffff800011181580 
> [   32.544345] x9 : ffff800011181578 x8 : ffff000009c00270 
> [   32.549636] x7 : ffff800010e4f000 x6 : ffff80001128bd58 
> [   32.554927] x5 : 00000000d5300000 x4 : ffff800011104f50 
> [   32.560218] x3 : 00000000d4000000 x2 : 0000000000000000 
> [   32.565509] x1 : ffff800011102a80 x0 : 0000000020400085 
> [   32.570801] Call trace:
> [   32.573238]  do_undefinstr+0x26c/0x320
> [   32.576975]  el1_undef+0x30/0x50
> [   32.580189]  el1_sync_handler+0xc4/0xe0
> [   32.584007]  el1_sync+0x84/0x140
> [   32.587221]  0xffff800012004064
> [   32.590352]  flush_smp_call_function_queue+0xf8/0x268
> [   32.595381]  generic_smp_call_function_single_interrupt+0x14/0x20
> [   32.601449]  ipi_handler+0x8c/0x158
> [   32.604924]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
> [   32.610043]  generic_handle_irq+0x30/0x48
> [   32.614035]  __handle_domain_irq+0x60/0xb8
> [   32.618116]  gic_handle_irq+0x58/0x128
> [   32.621846]  el1_irq+0xc8/0x180
> [   32.624974]  arch_cpu_idle+0x18/0x28
> [   32.628534]  default_idle_call+0x24/0x5c
> [   32.632440]  do_idle+0x1ec/0x288
> [   32.635653]  cpu_startup_entry+0x24/0x68
> [   32.639557]  rest_init+0xd8/0xe8
> [   32.642772]  arch_call_rest_init+0x10/0x1c
> [   32.646850]  start_kernel+0x4b0/0x4e8
> [   32.650500] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210000) 
> [   32.656575] ---[ end trace 6f8e50d223964988 ]---
> [   32.661173] Kernel panic - not syncing: Oops - BUG: Fatal exception in 
> interrupt
> [   32.668537] SMP: stopping secondary CPUs
> [   33.756157] SMP: failed to stop secondary CPUs 0-1
> [   33.760926] Kernel Offset: disabled
> [   33.764399] CPU features: 0x0040026,2a00a238
> [   33.768648] Memory Limit: 750 MB
> [   33.771863] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal 
> exception in interrupt ]---
>
> Any pointers where I should be looking into for the above issue?
>
> Cheers,
> Prabhakar
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f0853228-55dd-465b-8db1-01f6d3f26d8fn%40googlegroups.com.

------=_Part_301_315490950.1652268054492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>To add further more details:</div><div><br></div><div>I am using jailh=
ouse-enabling/5.10 Linux branch [0] with -next branch for jailhouse [1].</d=
iv><div><br></div><div>I added some debug prints and I see the panic is cau=
sed when entry() function is called (in enter_hypervisor). The entry functi=
on lands into assembly code (entry.S). I dont have a JTAG to see which exac=
t instruction is causing this issue.<br></div><div><br></div><div>[0] https=
://github.com/siemens/linux/tree/jailhouse-enabling/5.10</div><div>[1] http=
s://github.com/siemens/jailhouse/tree/next</div><div><br></div><div>Cheers,=
</div><div>Prabhakar</div><div><br></div><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Tuesday, 10 May 2022 at 13:25:51 UTC+1 P=
rabhakar Lad wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: =
1ex;"><div>Hi All,</div><div><br></div><div>I am currently working on getti=
ng root cell up and running on Renesas RZ/V2L SoC, which is equipped with 2=
 arm cortex A55.<br></div><div><br></div><div>I have written a simple root =
cell configuration and verified against using the "jailhouse config check",=
 but as soon as I enable the root cell configuration I get the below panic.=
<br></div><div><br></div><div>root@smarc-rzg2l:~# insmod jailhouse.ko <br>[=
 &nbsp; 17.327338] jailhouse: loading out-of-tree module taints kernel.<br>=
root@smarc-rzg2l:~# <br>root@smarc-rzg2l:~# jailhouse config check -a arm64=
 renesas-r9a07g054l2.cell<br>Reading configuration set:<br>&nbsp; Root cell=
: &nbsp; &nbsp; Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)<br>Overlapp=
ing memory regions inside cell: None<br>Overlapping memory regions with hyp=
ervisor: None<br>Missing resource interceptions for architecture arm64: Non=
e<br>root@smarc-rzg2l:~# <br>root@smarc-rzg2l:~#</div><div><br></div><div>r=
oot@smarc-rzg2l:~# jailhouse enable renesas-r9a07g054l2.cell<br>[ &nbsp; 32=
.430107] ------------[ cut here ]------------<br>[ &nbsp; 32.430111] ------=
------[ cut here ]------------<br>[ &nbsp; 32.430126] kernel BUG at arch/ar=
m64/kernel/traps.c:407!<br>[ &nbsp; 32.434730] kernel BUG at arch/arm64/ker=
nel/traps.c:407!<br>[ &nbsp; 32.439323] Internal error: Oops - BUG: 0 [#1] =
PREEMPT SMP<br>[ &nbsp; 32.455346] Modules linked in: jailhouse(O)<br>[ &nb=
sp; 32.459523] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; O &nbsp; &nbsp; &nbsp;5.10.112-cip6+ #8<br>[ &nbsp; 32.4674=
90] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)<br>[ &nbsp; =
32.473990] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=3D--)<br>[ &nbs=
p; 32.479981] pc : do_undefinstr+0x26c/0x320<br>[ &nbsp; 32.484059] lr : do=
_undefinstr+0x1cc/0x320<br>[ &nbsp; 32.488134] sp : ffff80001128bd00<br>[ &=
nbsp; 32.491432] x29: ffff80001128bd00 x28: ffff800011102a80 <br>[ &nbsp; 3=
2.496723] x27: ffff800011102a80 x26: ffff80001128c000 <br>[ &nbsp; 32.50201=
8] x25: ffff800011288000 x24: ffff8000110fa344 <br>[ &nbsp; 32.507309] x23:=
 0000000020400085 x22: ffff800012004064 <br>[ &nbsp; 32.512600] x21: ffff80=
001128bee0 x20: ffff80001128bd90 <br>[ &nbsp; 32.517891] x19: ffff800010e4f=
000 x18: 0000000000000001 <br>[ &nbsp; 32.523181] x17: ffff800008b0180c x16=
: 0000000000000000 <br>[ &nbsp; 32.528473] x15: ffff800012004064 x14: 00000=
0001004b800 <br>[ &nbsp; 32.533764] x13: 0000ffffc0200000 x12: 00000000b6f0=
0000 <br>[ &nbsp; 32.539054] x11: ffff0000f6d00000 x10: ffff800011181580 <b=
r>[ &nbsp; 32.544345] x9 : ffff800011181578 x8 : ffff000009c00270 <br>[ &nb=
sp; 32.549636] x7 : ffff800010e4f000 x6 : ffff80001128bd58 <br>[ &nbsp; 32.=
554927] x5 : 00000000d5300000 x4 : ffff800011104f50 <br>[ &nbsp; 32.560218]=
 x3 : 00000000d4000000 x2 : 0000000000000000 <br>[ &nbsp; 32.565509] x1 : f=
fff800011102a80 x0 : 0000000020400085 <br>[ &nbsp; 32.570801] Call trace:<b=
r>[ &nbsp; 32.573238] &nbsp;do_undefinstr+0x26c/0x320<br>[ &nbsp; 32.576975=
] &nbsp;el1_undef+0x30/0x50<br>[ &nbsp; 32.580189] &nbsp;el1_sync_handler+0=
xc4/0xe0<br>[ &nbsp; 32.584007] &nbsp;el1_sync+0x84/0x140<br>[ &nbsp; 32.58=
7221] &nbsp;0xffff800012004064<br>[ &nbsp; 32.590352] &nbsp;flush_smp_call_=
function_queue+0xf8/0x268<br>[ &nbsp; 32.595381] &nbsp;generic_smp_call_fun=
ction_single_interrupt+0x14/0x20<br>[ &nbsp; 32.601449] &nbsp;ipi_handler+0=
x8c/0x158<br>[ &nbsp; 32.604924] &nbsp;handle_percpu_devid_fasteoi_ipi+0x74=
/0x88<br>[ &nbsp; 32.610043] &nbsp;generic_handle_irq+0x30/0x48<br>[ &nbsp;=
 32.614035] &nbsp;__handle_domain_irq+0x60/0xb8<br>[ &nbsp; 32.618116] &nbs=
p;gic_handle_irq+0x58/0x128<br>[ &nbsp; 32.621846] &nbsp;el1_irq+0xc8/0x180=
<br>[ &nbsp; 32.624974] &nbsp;arch_cpu_idle+0x18/0x28<br>[ &nbsp; 32.628534=
] &nbsp;default_idle_call+0x24/0x5c<br>[ &nbsp; 32.632440] &nbsp;do_idle+0x=
1ec/0x288<br>[ &nbsp; 32.635653] &nbsp;cpu_startup_entry+0x24/0x68<br>[ &nb=
sp; 32.639557] &nbsp;rest_init+0xd8/0xe8<br>[ &nbsp; 32.642772] &nbsp;arch_=
call_rest_init+0x10/0x1c<br>[ &nbsp; 32.646850] &nbsp;start_kernel+0x4b0/0x=
4e8<br>[ &nbsp; 32.650500] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210=
000) <br>[ &nbsp; 32.656575] ---[ end trace 6f8e50d223964988 ]---<br>[ &nbs=
p; 32.661173] Kernel panic - not syncing: Oops - BUG: Fatal exception in in=
terrupt<br>[ &nbsp; 32.668537] SMP: stopping secondary CPUs<br>[ &nbsp; 33.=
756157] SMP: failed to stop secondary CPUs 0-1<br>[ &nbsp; 33.760926] Kerne=
l Offset: disabled<br>[ &nbsp; 33.764399] CPU features: 0x0040026,2a00a238<=
br>[ &nbsp; 33.768648] Memory Limit: 750 MB<br>[ &nbsp; 33.771863] ---[ end=
 Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt ]---<=
br></div><div><br></div><div>Any pointers where I should be looking into fo=
r the above issue?</div><div><br></div><div>Cheers,</div><div>Prabhakar</di=
v><div><br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f0853228-55dd-465b-8db1-01f6d3f26d8fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f0853228-55dd-465b-8db1-01f6d3f26d8fn%40googlegroups.co=
m</a>.<br />

------=_Part_301_315490950.1652268054492--

------=_Part_300_980936734.1652268054492--
