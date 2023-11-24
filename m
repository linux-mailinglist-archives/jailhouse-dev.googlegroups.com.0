Return-Path: <jailhouse-dev+bncBCZ5RDPSVIPRBY5YQGVQMGQEBGHVW5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0617F6DEA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 09:18:45 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-da03390793fsf1772411276.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700813924; x=1701418724; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YkMdKCSklrOmy7Co1VrD1tQw+/K9k2XfW9s23yguL/w=;
        b=YDH3p8pGOC01qoS6lp8GnXjRXOOrR9a+soG8WVZv5TIDXzWPKKsAdWShnmUBFtWJBQ
         3zjtT/g3y8L5tvQSjTdF95nktrO+b7lbp3zNOg4dxqIJhx6e7ANsTbk1kMpMOMCX3QUn
         333rB+HizgsPRvay9No+y3Q7QkxIhTQ0bEO72S5besYUweXgpmdYV1gr/nUJRRQ4Zza4
         rvzFQnw1AO19/wy0EKZ3TajHtDmVReSuVO1svZ+zg5LP2QFWhMT1ydZ3Bsby1JTQ/2Zg
         EMwAHQichPoL+FvHsvHR2nL1lULNUWx+1XeeCl3PN8xI7ZlD11LeaWB4MZ1f5wCUNuBH
         aVHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700813924; x=1701418724; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkMdKCSklrOmy7Co1VrD1tQw+/K9k2XfW9s23yguL/w=;
        b=PTDTQzGxNHVh6+h4gX6OAJQ10aLcCOwX4JxGSeMtkthd8nW9XUlfcDmjJjpCxhCCwd
         nTebUQTl7JU7DskZto05b+rhe3qTxO9NyxVOAoekpTKjBoZ/kZXpP3jzolj7Uwc2F2Hq
         Iql0EkG8brm3ARZDwq+aHB3w1ldr8hUILbkrY+1dQeo0tLGA3wm08f+aCO0Yfwe8innN
         zkVpnA1CrnYswCIAkJUEnxMWc32KtE2dQhWBNuult5eTPh/1Ti0FyuG0Yfw8QC1+vidy
         6hnWTDN+hTJou1w6Q+gJbQtMXtkTxNwsqLawt3lvj3l0xrYAHzDCrK00zz28f42RQppj
         IvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700813924; x=1701418724;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YkMdKCSklrOmy7Co1VrD1tQw+/K9k2XfW9s23yguL/w=;
        b=sKDDmiotX2IrbhrjxnMCFcVpstUIY3CpsT2mt1gS7uqLy8Lj7za6E1DnbbcGNnZksd
         w1WvXtbZ9OOBplR9wIPYOFpTgdRh6QcRh+TrS3S3xvp/6GmYnpPGBfMlP4i5T+9rM3cT
         cZVtetdtpFCLdQvCMoXb+L/QDI7i8setvTf/J4Mxc+aAzOqOJZHzMIaNc7OTBoo+1rQe
         nudWEottHvNSu0F9l7hi8yeFNnwqXiOPU8pfITdq4auvAkLAyPeMtCO9tlRSRRnvYG/b
         2IY772OJYWjhpIK41fVnwLmvjj2/pi/IdeoCUzOaoZaVv9TErok8C8Z0KJdhBZu2/iw/
         Podw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxS1IC/ffJrbzPiSgfG67fE01VQ2ht2kJPbOF8TbuMpwx7GaiPc
	WKEh4/mUMCPzliZQhFaALpI=
X-Google-Smtp-Source: AGHT+IGj9Aim36CrvRC2qz+bFvR9MPWkEA6RNhIh3cDPlWVf4eSXMsyCtl7SBs9DDE0hlJScRCBuYw==
X-Received: by 2002:a25:abb2:0:b0:daf:7704:3f60 with SMTP id v47-20020a25abb2000000b00daf77043f60mr1420310ybi.24.1700813923893;
        Fri, 24 Nov 2023 00:18:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3385:0:b0:d7b:3e9d:f12b with SMTP id z127-20020a253385000000b00d7b3e9df12bls74063ybz.1.-pod-prod-01-us;
 Fri, 24 Nov 2023 00:18:42 -0800 (PST)
X-Received: by 2002:a25:3383:0:b0:d9a:efcc:42af with SMTP id z125-20020a253383000000b00d9aefcc42afmr58236ybz.2.1700813922623;
        Fri, 24 Nov 2023 00:18:42 -0800 (PST)
Date: Fri, 24 Nov 2023 00:18:41 -0800 (PST)
From: Laurent Corbin <laucorbin78@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ce75d57a-5bf7-44b7-95ae-2a494d6a9132n@googlegroups.com>
In-Reply-To: <b3eeb148-9b47-4798-9201-043f3e258ccd@oth-regensburg.de>
References: <18173bdd-0873-4774-a664-ba03be4bd7a3n@googlegroups.com>
 <b3eeb148-9b47-4798-9201-043f3e258ccd@oth-regensburg.de>
Subject: Re: Jailhouse on LX2160ardb
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1044_1369954485.1700813921799"
X-Original-Sender: laucorbin78@gmail.com
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

------=_Part_1044_1369954485.1700813921799
Content-Type: multipart/alternative; 
	boundary="----=_Part_1045_1420426320.1700813921799"

------=_Part_1045_1420426320.1700813921799
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Thanks for your responsiveness. Unfortunately, I have not any output when I
apply your patch. With more traces, I can see that only PSCI for CPU=20
suspend is
used. I'm continuing my research to find out more about this kernel panic.
Do you have any new suggestions or hypotheses ?

Thanks in advance,

Le mercredi 22 novembre 2023 =C3=A0 16:34:10 UTC+1, Ralf Ramsauer a =C3=A9c=
rit :

> Hi,
>
> On 22/11/2023 16:14, Laurent Corbin wrote:
> > Hi all,
> >=20
> > I'm trying to run jailhouse on LX2160ardb (NXP board). To do that,
> > 1. I wrote a cell file for my root cell.
> > 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.36_2.1.0 from nxp=
=20
> > mirror) with yocto.
> > 3. I loaded the jailhouse driver as a kernel module.
> >=20
> > But when I try to "enable" jailhouse I get this error :
>
> okay, I think i have seen a similar error before. Would you please try=20
> to apply this patch, and see if there is some output on the console:
>
> diff --git a/hypervisor/arch/arm-common/smccc.c=20
> b/hypervisor/arch/arm-common/smccc.c
> index 65639b59..afa26e53 100644
> --- a/hypervisor/arch/arm-common/smccc.c
> +++ b/hypervisor/arch/arm-common/smccc.c
> @@ -83,6 +83,7 @@ static inline long handle_arch_features(u32 id)
> return this_cpu_data()->smccc_feat_workaround_2;
>
> default:
> + printk("Unknown SMCCC!\n");
> return ARM_SMCCC_NOT_SUPPORTED;
> }
> }
> @@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_context *ctx)
> case ARM_SMCCC_OWNER_SIP:
> stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
> regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
> + printk("Unknown SMCCC (SIP)!\n");
> break;
>
> case ARM_SMCCC_OWNER_STANDARD:
>
>
> If you get an output here, then we need to probably forward those calls.=
=20
> Please get back to me in that case.
>
> Thanks
> Ralf
>
> >=20
> >=20
> >=20
> > root@lx2160ardb-rev2:~# insmod jailhouse.ko
> > root@lx2160ardb-rev2:~#
> > root@lx2160ardb-rev2:~#
> > root@lx2160ardb-rev2:~#
> > root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sections/.text
> > 0xffffc45e1113e000
> > root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.cell
> >=20
> > Initializing Jailhouse hypervisor v0.12 (369-g6a87b739) on CPU 0
> > Code location: 0x0000ffffc0200800
> > Page pool usage after early setup: mem 151/993, remap 0/131072
> > Initializing processors:
> >  CPU 0... OK
> >  CPU 1... OK
> >  CPU 5... OK
> >  CPU 4... OK
> >  CPU 2... OK
> >  CPU 3... OK
> >  CPU 9... OK
> >  CPU 8... OK
> >  CPU 15... OK
> >  CPU 13... OK
> >  CPU 12... OK
> >  CPU 7... OK
> >  CPU 10... OK
> >  CPU 11... OK
> >  CPU 6... OK
> >  CPU 14... OK
> > Initializing unit: irqchip
> > Initializing unit: ARM SMMU v3
> > Initializing unit: ARM SMMU
> > ARM MMU500 at 0x5000000 with:
> >  stream matching with 128 SMR groups
> >  64 context banks (0 stage-2 only)
> > Initializing unit: PVU IOMMU
> > Initializing unit: PCI
> > Adding virtual PCI device 00:00.0 to cell "lx2160a"
> > Adding virtual PCI device 00:01.0 to cell "lx2160a"
> > Page pool usage after late setup: mem 228/993, remap 2576/131072
> > Activating hypervisor
> > [  173.577969] SError Interrupt on CPU0, code 0x00000000bf000000 --=20
> SError
> > [  173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O=20
> >   6.1.22+g66e442bc7fdc #1
> > [  173.577993] Hardware name: NXP Layerscape LX2160ARDB (DT)
> > [  173.577996] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS=20
> > BTYPE=3D--)
> > [  173.578002] pc : enter_hypervisor+0x44/0xa4 [jailhouse]
> > [  173.578025] lr : enter_hypervisor+0x44/0xa4 [jailhouse]
> > [  173.578040] sp : ffff800008003f10
> > [  173.578042] x29: ffff800008003f10 x28: ffffc45e51736c40 x27:=20
> > 00000000fbd0ea70
> > [  173.578052] x26: 0000000000000001 x25: 00000028652e0c1e x24:=20
> > 00000028652b7617
> > [  173.578060] x23: 0000000000000000 x22: 0000000000000000 x21:=20
> > 0000000000000000
> > [  173.578067] x20: 0000000000000000 x19: ffffc45e11144000 x18:=20
> > 0000000000000000
> > [  173.578074] x17: 0000000000000000 x16: 0000000000000000 x15:=20
> > 0000000000000000
> > [  173.578080] x14: 0000000000000000 x13: 0000000000000000 x12:=20
> > 0000000000000000
> > [  173.578086] x11: 0000000000000000 x10: 0000000000000000 x9 :=20
> > 0000000000000000
> > [  173.578092] x8 : 0000000000000000 x7 : 0000000000000000 x6 :=20
> > 0000000000000000
> > [  173.578098] x5 : 0000000000000000 x4 : 0000000000000000 x3 :=20
> > 0000000000000000
> > [  173.578104] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
> > 0000000000000000
> > [  173.578111] Kernel panic - not syncing: Asynchronous SError Interrup=
t
> > [  173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O=20
> >   6.1.22+g66e442bc7fdc #1
> > [  173.578120] Hardware name: NXP Layerscape LX2160ARDB (DT)
> > [  173.578122] Call trace:
> > [  173.578124]  dump_backtrace.part.0+0xe0/0xf0
> > [  173.578140]  show_stack+0x18/0x30
> > [  173.578148]  dump_stack_lvl+0x64/0x80
> > [  173.578158]  dump_stack+0x18/0x34
> > [  173.578166]  panic+0x188/0x340
> > [  173.578173]  nmi_panic+0xac/0xb0
> > [  173.578179]  arm64_serror_panic+0x6c/0x7c
> > [  173.578184]  do_serror+0x58/0x5c
> > [  173.578188]  el1h_64_error_handler+0x30/0x4c
> > [  173.578193]  el1h_64_error+0x64/0x68
> > [  173.578198]  enter_hypervisor+0x44/0xa4 [jailhouse]
> > [  173.578213]  __flush_smp_call_function_queue+0xd0/0x250
> > [  173.578223]  generic_smp_call_function_single_interrupt+0x14/0x20
> > [  173.578232]  ipi_handler+0x98/0x160
> > [  173.578239]  handle_percpu_devid_irq+0x84/0x130
> > [  173.578245]  generic_handle_domain_irq+0x2c/0x4c
> > [  173.578251]  gic_handle_irq+0x50/0x130
> > [  173.578258]  call_on_irq_stack+0x2c/0x5c
> > [  173.578263]  do_interrupt_handler+0x80/0x84
> > [  173.578270]  el1_interrupt+0x34/0x6c
> > [  173.578278]  el1h_64_irq_handler+0x18/0x2c
> > [  173.578283]  el1h_64_irq+0x64/0x68
> > [  173.578287]  cpuidle_enter_state+0x130/0x2fc
> > [  173.578296]  cpuidle_enter+0x38/0x50
> > [  173.578302]  do_idle+0x22c/0x2c0
> > [  173.578308]  cpu_startup_entry+0x28/0x30
> > [  173.578313]  kernel_init+0x0/0x12c
> > [  173.578319]  arch_post_acpi_subsys_init+0x0/0x18
> > [  173.578326]  start_kernel+0x668/0x6a8
> > [  173.578331]  __primary_switched+0xbc/0xc4
> > [  173.578337] SMP: stopping secondary CPUs
> > [  173.578370] Kernel Offset: 0x445e47000000 from 0xffff800008000000
> > [  173.578373] PHYS_OFFSET: 0xffffd3bc00000000
> > [  173.578376] CPU features: 0x20000,2012c084,0000421b
> > [  173.578380] Memory Limit: none
> > [  173.853682] ---[ end Kernel panic - not syncing: Asynchronous SError=
=20
> > Interrupt ]---
> >=20
> >=20
> > It seems that my Linux panic when it has to jump from the hypervisor to=
=20
> the
> > driver (in arch_cpu_activate_vmm function in=20
> > hypervisor/arch/arm64/setup.c file).
> >=20
> > Do you have any idea why my Linux panic ?
> >=20
> > Thanks in advance,
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-b=
a03be4bd7a3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-b=
a03be4bd7a3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegroups.com.

------=_Part_1045_1420426320.1700813921799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br /><br />Thanks for your responsiveness. Unfortunately, I have =
not any output when I<br />apply your patch. With more traces, I can see th=
at only PSCI for CPU suspend is<br />used. I'm continuing my research to fi=
nd out more about this kernel panic.<br />Do you have any new suggestions o=
r hypotheses ?<br /><br />Thanks in advance,<br /><br /><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">Le mercredi 22 novembre 2023=
 =C3=A0 16:34:10 UTC+1, Ralf Ramsauer a =C3=A9crit=C2=A0:<br/></div><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>On 22/11/2023 16:14, Laurent Corbin wrote:
<br>&gt; Hi all,
<br>&gt;=20
<br>&gt; I&#39;m trying to run jailhouse on LX2160ardb (NXP board). To do t=
hat,
<br>&gt; 1. I wrote a cell file for my root cell.
<br>&gt; 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.36_2.1.0 fro=
m nxp=20
<br>&gt; mirror) with yocto.
<br>&gt; 3. I loaded the jailhouse driver as a kernel module.
<br>&gt;=20
<br>&gt; But when I try to &quot;enable&quot; jailhouse I get this error :
<br>
<br>okay, I think i have seen a similar error before. Would you please try=
=20
<br>to apply this patch, and see if there is some output on the console:
<br>
<br>diff --git a/hypervisor/arch/arm-common/smccc.c=20
<br>b/hypervisor/arch/arm-common/smccc.c
<br>index 65639b59..afa26e53 100644
<br>--- a/hypervisor/arch/arm-common/smccc.c
<br>+++ b/hypervisor/arch/arm-common/smccc.c
<br>@@ -83,6 +83,7 @@ static inline long handle_arch_features(u32 id)
<br>                 return this_cpu_data()-&gt;smccc_feat_workaround_2;
<br>
<br>         default:
<br>+               printk(&quot;Unknown SMCCC!\n&quot;);
<br>                 return ARM_SMCCC_NOT_SUPPORTED;
<br>         }
<br>  }
<br>@@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_context *ct=
x)
<br>         case ARM_SMCCC_OWNER_SIP:
<br>                 stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
<br>                 regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
<br>+               printk(&quot;Unknown SMCCC (SIP)!\n&quot;);
<br>                 break;
<br>
<br>         case ARM_SMCCC_OWNER_STANDARD:
<br>
<br>
<br>If you get an output here, then we need to probably forward those calls=
.=20
<br>Please get back to me in that case.
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; root@lx2160ardb-rev2:~# insmod jailhouse.ko
<br>&gt; root@lx2160ardb-rev2:~#
<br>&gt; root@lx2160ardb-rev2:~#
<br>&gt; root@lx2160ardb-rev2:~#
<br>&gt; root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sections/.text
<br>&gt; 0xffffc45e1113e000
<br>&gt; root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.cell
<br>&gt;=20
<br>&gt; Initializing Jailhouse hypervisor v0.12 (369-g6a87b739) on CPU 0
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 151/993, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt;  =C2=A0CPU 0... OK
<br>&gt;  =C2=A0CPU 1... OK
<br>&gt;  =C2=A0CPU 5... OK
<br>&gt;  =C2=A0CPU 4... OK
<br>&gt;  =C2=A0CPU 2... OK
<br>&gt;  =C2=A0CPU 3... OK
<br>&gt;  =C2=A0CPU 9... OK
<br>&gt;  =C2=A0CPU 8... OK
<br>&gt;  =C2=A0CPU 15... OK
<br>&gt;  =C2=A0CPU 13... OK
<br>&gt;  =C2=A0CPU 12... OK
<br>&gt;  =C2=A0CPU 7... OK
<br>&gt;  =C2=A0CPU 10... OK
<br>&gt;  =C2=A0CPU 11... OK
<br>&gt;  =C2=A0CPU 6... OK
<br>&gt;  =C2=A0CPU 14... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: ARM SMMU v3
<br>&gt; Initializing unit: ARM SMMU
<br>&gt; ARM MMU500 at 0x5000000 with:
<br>&gt;  =C2=A0stream matching with 128 SMR groups
<br>&gt;  =C2=A064 context banks (0 stage-2 only)
<br>&gt; Initializing unit: PVU IOMMU
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;lx2160a&quot;
<br>&gt; Adding virtual PCI device 00:01.0 to cell &quot;lx2160a&quot;
<br>&gt; Page pool usage after late setup: mem 228/993, remap 2576/131072
<br>&gt; Activating hypervisor
<br>&gt; [ =C2=A0173.577969] SError Interrupt on CPU0, code 0x00000000bf000=
000 -- SError
<br>&gt; [ =C2=A0173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O    =20
<br>&gt;  =C2=A0 6.1.22+g66e442bc7fdc #1
<br>&gt; [ =C2=A0173.577993] Hardware name: NXP Layerscape LX2160ARDB (DT)
<br>&gt; [ =C2=A0173.577996] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DI=
T -SSBS=20
<br>&gt; BTYPE=3D--)
<br>&gt; [ =C2=A0173.578002] pc : enter_hypervisor+0x44/0xa4 [jailhouse]
<br>&gt; [ =C2=A0173.578025] lr : enter_hypervisor+0x44/0xa4 [jailhouse]
<br>&gt; [ =C2=A0173.578040] sp : ffff800008003f10
<br>&gt; [ =C2=A0173.578042] x29: ffff800008003f10 x28: ffffc45e51736c40 x2=
7:=20
<br>&gt; 00000000fbd0ea70
<br>&gt; [ =C2=A0173.578052] x26: 0000000000000001 x25: 00000028652e0c1e x2=
4:=20
<br>&gt; 00000028652b7617
<br>&gt; [ =C2=A0173.578060] x23: 0000000000000000 x22: 0000000000000000 x2=
1:=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578067] x20: 0000000000000000 x19: ffffc45e11144000 x1=
8:=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578074] x17: 0000000000000000 x16: 0000000000000000 x1=
5:=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578080] x14: 0000000000000000 x13: 0000000000000000 x1=
2:=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578086] x11: 0000000000000000 x10: 0000000000000000 x9=
 :=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578092] x8 : 0000000000000000 x7 : 0000000000000000 x6=
 :=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578098] x5 : 0000000000000000 x4 : 0000000000000000 x3=
 :=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578104] x2 : 0000000000000000 x1 : 0000000000000000 x0=
 :=20
<br>&gt; 0000000000000000
<br>&gt; [ =C2=A0173.578111] Kernel panic - not syncing: Asynchronous SErro=
r Interrupt
<br>&gt; [ =C2=A0173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O    =20
<br>&gt;  =C2=A0 6.1.22+g66e442bc7fdc #1
<br>&gt; [ =C2=A0173.578120] Hardware name: NXP Layerscape LX2160ARDB (DT)
<br>&gt; [ =C2=A0173.578122] Call trace:
<br>&gt; [ =C2=A0173.578124] =C2=A0dump_backtrace.part.0+0xe0/0xf0
<br>&gt; [ =C2=A0173.578140] =C2=A0show_stack+0x18/0x30
<br>&gt; [ =C2=A0173.578148] =C2=A0dump_stack_lvl+0x64/0x80
<br>&gt; [ =C2=A0173.578158] =C2=A0dump_stack+0x18/0x34
<br>&gt; [ =C2=A0173.578166] =C2=A0panic+0x188/0x340
<br>&gt; [ =C2=A0173.578173] =C2=A0nmi_panic+0xac/0xb0
<br>&gt; [ =C2=A0173.578179] =C2=A0arm64_serror_panic+0x6c/0x7c
<br>&gt; [ =C2=A0173.578184] =C2=A0do_serror+0x58/0x5c
<br>&gt; [ =C2=A0173.578188] =C2=A0el1h_64_error_handler+0x30/0x4c
<br>&gt; [ =C2=A0173.578193] =C2=A0el1h_64_error+0x64/0x68
<br>&gt; [ =C2=A0173.578198] =C2=A0enter_hypervisor+0x44/0xa4 [jailhouse]
<br>&gt; [ =C2=A0173.578213] =C2=A0__flush_smp_call_function_queue+0xd0/0x2=
50
<br>&gt; [ =C2=A0173.578223] =C2=A0generic_smp_call_function_single_interru=
pt+0x14/0x20
<br>&gt; [ =C2=A0173.578232] =C2=A0ipi_handler+0x98/0x160
<br>&gt; [ =C2=A0173.578239] =C2=A0handle_percpu_devid_irq+0x84/0x130
<br>&gt; [ =C2=A0173.578245] =C2=A0generic_handle_domain_irq+0x2c/0x4c
<br>&gt; [ =C2=A0173.578251] =C2=A0gic_handle_irq+0x50/0x130
<br>&gt; [ =C2=A0173.578258] =C2=A0call_on_irq_stack+0x2c/0x5c
<br>&gt; [ =C2=A0173.578263] =C2=A0do_interrupt_handler+0x80/0x84
<br>&gt; [ =C2=A0173.578270] =C2=A0el1_interrupt+0x34/0x6c
<br>&gt; [ =C2=A0173.578278] =C2=A0el1h_64_irq_handler+0x18/0x2c
<br>&gt; [ =C2=A0173.578283] =C2=A0el1h_64_irq+0x64/0x68
<br>&gt; [ =C2=A0173.578287] =C2=A0cpuidle_enter_state+0x130/0x2fc
<br>&gt; [ =C2=A0173.578296] =C2=A0cpuidle_enter+0x38/0x50
<br>&gt; [ =C2=A0173.578302] =C2=A0do_idle+0x22c/0x2c0
<br>&gt; [ =C2=A0173.578308] =C2=A0cpu_startup_entry+0x28/0x30
<br>&gt; [ =C2=A0173.578313] =C2=A0kernel_init+0x0/0x12c
<br>&gt; [ =C2=A0173.578319] =C2=A0arch_post_acpi_subsys_init+0x0/0x18
<br>&gt; [ =C2=A0173.578326] =C2=A0start_kernel+0x668/0x6a8
<br>&gt; [ =C2=A0173.578331] =C2=A0__primary_switched+0xbc/0xc4
<br>&gt; [ =C2=A0173.578337] SMP: stopping secondary CPUs
<br>&gt; [ =C2=A0173.578370] Kernel Offset: 0x445e47000000 from 0xffff80000=
8000000
<br>&gt; [ =C2=A0173.578373] PHYS_OFFSET: 0xffffd3bc00000000
<br>&gt; [ =C2=A0173.578376] CPU features: 0x20000,2012c084,0000421b
<br>&gt; [ =C2=A0173.578380] Memory Limit: none
<br>&gt; [ =C2=A0173.853682] ---[ end Kernel panic - not syncing: Asynchron=
ous SError=20
<br>&gt; Interrupt ]---
<br>&gt;=20
<br>&gt;=20
<br>&gt; It seems that my Linux panic when it has to jump from the hypervis=
or to the
<br>&gt; driver (in arch_cpu_activate_vmm function in=20
<br>&gt; hypervisor/arch/arm64/setup.c file).
<br>&gt;=20
<br>&gt; Do you have any idea why my Linux panic ?
<br>&gt;=20
<br>&gt; Thanks in advance,
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/18173bd=
d-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dfr&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-=
ba03be4bd7a3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17008988529=
71000&amp;usg=3DAOvVaw0uxyp1GqRGfK8A9UxAWdVN">https://groups.google.com/d/m=
sgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/18173bd=
d-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
700898852971000&amp;usg=3DAOvVaw2VL_qhAnNWzb_trIdZZYbC">https://groups.goog=
le.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegroups.co=
m</a>.<br />

------=_Part_1045_1420426320.1700813921799--

------=_Part_1044_1369954485.1700813921799--
