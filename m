Return-Path: <jailhouse-dev+bncBCZ5RDPSVIPRBJ7MQKVQMGQE2HWKO5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1137.google.com (mail-yw1-x1137.google.com [IPv6:2607:f8b0:4864:20::1137])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A017F7694
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 15:41:45 +0100 (CET)
Received: by mail-yw1-x1137.google.com with SMTP id 00721157ae682-5cd6fe9a25fsf17666337b3.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700836904; x=1701441704; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mgkHBqV4Jxi3yIq1B9vyfMoAJHo7D0BjowZLPhIdzQ=;
        b=VfnV/ECsiNrJBO3yB2NoTczAPQoLDRugRNr3r7jzWNkZyvVaEw0QOLQU3fBOF0PRfm
         6UC7TyOKu5+jCj6rwQNiXpI2+tIKATqTJPfBf718SbFZI+XQk3Oo0XoW2yqZy7nUg36W
         fNTEHyALgxLBhaeiFTPZ6txnxWUtNJ+4oB7J2JxPokAtHwBrWWcYSdCwlD5QH1+o/bI2
         6QD3pyVspuezaMr8PS4Y4IfC4uu074ZLUB7Gckesx/xqr0fge6pmCk2CnmXGhG+wosbO
         nBoQ8LvNy6VLAZ2H2lc2nykmSj+OzpZ8gClviWQ/w7eVBzwmGvf5Ccbt+O2ruueOqR4h
         Qafg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700836904; x=1701441704; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mgkHBqV4Jxi3yIq1B9vyfMoAJHo7D0BjowZLPhIdzQ=;
        b=XFgeUfVS+/SydhjXrGWUZKTtJ4u1CscEZHLhAFW21LCcf0HyFgR33d3z4u751Z/LWK
         iX1HXkCxeaQhf3FCgAzwk3p5um3SaFsLLTRvP396pI53HQSkLbmEFlHGqQ2RqVij1RUc
         7c+SJm0Y/ofKsyBv/FYxkb2yYcb4fo1fLTGqI2ufiNUcGre1DgXNm/Yoik++YmldmhRy
         AV+lyDVgz/WEW0F3kk5fQtO8+ySgiy09XI5vWmFJttRCYD0BtBIEyMsCrT8w/0a3WMjz
         rn74scfmbsTPHM+X50RHV4nZ1bPJpWj8iY2m1MsbkE/o+5l/buwodPicTDjBrxklElyq
         iNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836904; x=1701441704;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mgkHBqV4Jxi3yIq1B9vyfMoAJHo7D0BjowZLPhIdzQ=;
        b=NcnUcO+BofUjvfe7jn08MSRzSbEHeB+zoOwCvllUSABETbG5N60wBmBQW828eVFd+H
         +c2hBfoGB4GmmThHKOWvLYL1heykav+wl9uIy2sjC4r9N+/iPDbGSD+UNS08uN5Z4Jy2
         shlX/m5IV9Qe5nHH6PdQme4u2rApUVmsMY0qdyvt9GzQq2cd77O0juWl8IBy28UzLkZn
         Pfs1daiGSAh29g30ZVxVhNwhF0++bRUSdU04S1gW+GSKIKIw/iPWQOgkhZb4Y+ImleMw
         o/WzhUQFAduXorZE2WTSDQAFL3GBadTPDi7AS8URoA+DOoehge9GMrUrbsSrzqz4K6vH
         8d4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzFELH3PN4c00xe6bVp9bgjdZO2NsHDuOzdIFJ0/zS4c/wEQ4na
	xuz6NDjjTtx4SELxUgLkPXA=
X-Google-Smtp-Source: AGHT+IHcwtwZ5r/llpehQzA0EygQAAfdvMUgqo4D1ZEI0bX26NycG9nUV6efY2HoUaLuRRfW+NVzvA==
X-Received: by 2002:a25:854b:0:b0:d9a:55e5:9a0c with SMTP id f11-20020a25854b000000b00d9a55e59a0cmr2287716ybn.26.1700836903996;
        Fri, 24 Nov 2023 06:41:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3343:0:b0:daf:4e72:d175 with SMTP id z64-20020a253343000000b00daf4e72d175ls38502ybz.1.-pod-prod-00-us;
 Fri, 24 Nov 2023 06:41:42 -0800 (PST)
X-Received: by 2002:a81:b657:0:b0:5cc:8e9a:6f7a with SMTP id h23-20020a81b657000000b005cc8e9a6f7amr237410ywk.3.1700836902420;
        Fri, 24 Nov 2023 06:41:42 -0800 (PST)
Date: Fri, 24 Nov 2023 06:41:41 -0800 (PST)
From: Laurent Corbin <laucorbin78@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <762f7922-e547-460f-a5d8-4a3ef2dd85e4n@googlegroups.com>
In-Reply-To: <ff542993-b385-432a-8000-6d4c6e193f84@oth-regensburg.de>
References: <18173bdd-0873-4774-a664-ba03be4bd7a3n@googlegroups.com>
 <b3eeb148-9b47-4798-9201-043f3e258ccd@oth-regensburg.de>
 <ce75d57a-5bf7-44b7-95ae-2a494d6a9132n@googlegroups.com>
 <ff542993-b385-432a-8000-6d4c6e193f84@oth-regensburg.de>
Subject: Re: Jailhouse on LX2160ardb
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_26562_1645529662.1700836901633"
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

------=_Part_26562_1645529662.1700836901633
Content-Type: multipart/alternative; 
	boundary="----=_Part_26563_475266964.1700836901633"

------=_Part_26563_475266964.1700836901633
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Le vendredi 24 novembre 2023 =C3=A0 13:35:29 UTC+1, Ralf Ramsauer a =C3=A9c=
rit :



On 24/11/2023 09:18, Laurent Corbin wrote:=20
> Hi,=20
>=20
>=20
> Thanks for your responsiveness. Unfortunately, I have not any output when=
=20
I=20
> apply your patch. With more traces, I can see that only PSCI for CPU=20
> suspend is=20
> used. I'm continuing my research to find out more about this kernel=20
panic.=20
> Do you have any new suggestions or hypotheses ?=20

One further thought, see below.=20

>=20
> Thanks in advance,=20
>=20
> Le mercredi 22 novembre 2023 =C3=A0 16:34:10 UTC+1, Ralf Ramsauer a =C3=
=A9crit :=20
>=20
> Hi,=20
>=20
> On 22/11/2023 16:14, Laurent Corbin wrote:=20
> > Hi all,=20
> >=20
> > I'm trying to run jailhouse on LX2160ardb (NXP board). To do that,=20
> > 1. I wrote a cell file for my root cell.=20
> > 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.36_2.1.0=20
> from nxp=20
> > mirror) with yocto.=20
> > 3. I loaded the jailhouse driver as a kernel module.=20
> >=20
> > But when I try to "enable" jailhouse I get this error :=20
>=20
> okay, I think i have seen a similar error before. Would you please try=20
> to apply this patch, and see if there is some output on the console:=20
>=20
> diff --git a/hypervisor/arch/arm-common/smccc.c=20
> b/hypervisor/arch/arm-common/smccc.c=20
> index 65639b59..afa26e53 100644=20
> --- a/hypervisor/arch/arm-common/smccc.c=20
> +++ b/hypervisor/arch/arm-common/smccc.c=20
> @@ -83,6 +83,7 @@ static inline long handle_arch_features(u32 id)=20
> return this_cpu_data()->smccc_feat_workaround_2;=20
>=20
> default:=20
> + printk("Unknown SMCCC!\n");=20
> return ARM_SMCCC_NOT_SUPPORTED;=20
> }=20
> }=20
> @@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_context=20
> *ctx)=20
> case ARM_SMCCC_OWNER_SIP:=20
> stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;=20
> regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;=20
> + printk("Unknown SMCCC (SIP)!\n");=20
> break;=20
>=20
> case ARM_SMCCC_OWNER_STANDARD:=20
>=20
>=20
> If you get an output here, then we need to probably forward those=20
> calls.=20
> Please get back to me in that case.=20
>=20
> Thanks=20
> Ralf=20
>=20
> >=20
> >=20
> >=20
> > root@lx2160ardb-rev2:~# insmod jailhouse.ko=20
> > root@lx2160ardb-rev2:~#=20
> > root@lx2160ardb-rev2:~#=20
> > root@lx2160ardb-rev2:~#=20
> > root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sections/.text=20
> > 0xffffc45e1113e000=20
> > root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.cell=20
> >=20
> > Initializing Jailhouse hypervisor v0.12 (369-g6a87b739) on CPU 0=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 151/993, remap 0/131072=20
> > Initializing processors:=20
> >  CPU 0... OK=20
> >  CPU 1... OK=20
> >  CPU 5... OK=20
> >  CPU 4... OK=20
> >  CPU 2... OK=20
> >  CPU 3... OK=20
> >  CPU 9... OK=20
> >  CPU 8... OK=20
> >  CPU 15... OK=20
> >  CPU 13... OK=20
> >  CPU 12... OK=20
> >  CPU 7... OK=20
> >  CPU 10... OK=20
> >  CPU 11... OK=20
> >  CPU 6... OK=20
> >  CPU 14... OK=20
> > Initializing unit: irqchip=20
> > Initializing unit: ARM SMMU v3=20
> > Initializing unit: ARM SMMU=20
> > ARM MMU500 at 0x5000000 with:=20
> >  stream matching with 128 SMR groups=20
> >  64 context banks (0 stage-2 only)=20
> > Initializing unit: PVU IOMMU=20
> > Initializing unit: PCI=20
> > Adding virtual PCI device 00:00.0 to cell "lx2160a"=20
> > Adding virtual PCI device 00:01.0 to cell "lx2160a"=20
> > Page pool usage after late setup: mem 228/993, remap 2576/131072=20
> > Activating hypervisor=20
> > [  173.577969] SError Interrupt on CPU0, code 0x00000000bf000000=20
> -- SError=20

SError is a "System Error". See [1] what triggers a SError. I wonder why=20
this happens behind address 0xbf000000, right after enabling Jailhouse=20
(which works correctly). What is behind that physical address? Is this=20
the Jailhouse physical location?=20

Thanks for the document reference.

For me, 0xbf000000 is not an adress but the value of the register esr_el1
(Exception Syndrome Register EL1) as you can see in linux kernel code :
- arm64_serror_panic(struct pt_regs *regs, unsigned long esr) in=20
arch/arm64/kernel/traps.c which display this trace,
- el1h_64_error_handler() function in arch/arm64/kernel/entry-common.c=20
which read the register.

When I decode this register (with https://esr.arm64.dev/?#0xbf000000), I=20
have
not any additional information about why the SError occurs.
=20

Do you have all Jailhouse patches applied on your kernel? Are memory=20
regions reserved (via mem=3D option or device tree)?=20


I used the NXP linux repo (https://github.com/nxp-qoriq/linux.git=20
branch=3Dlf-6.1.y) which
contains Jailhouse patches.

About memory reservation, I add this node in my device tree :

reserved-memory {
#address-cells =3D <0x02>;
#size-cells =3D <0x02>;
ranges;

hypervisor@0 {
no-map;
reg =3D <0x00 0xa0000000 0x00 0x10000000>;
};
};

and the config.header in my cell file is :

.header =3D {
.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
.revision =3D JAILHOUSE_CONFIG_REVISION,
        .architecture =3D JAILHOUSE_ARM64,
.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
.hypervisor_memory =3D {
.phys_start =3D 0xa0000000,
.size =3D       0x00400000,
},
.debug_console =3D {
.address =3D 0x21c0000,
.size =3D 0x1000,
.type =3D JAILHOUSE_CON_TYPE_PL011,
.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
 JAILHOUSE_CON_REGDIST_4,
},
.platform_info =3D {
.pci_mmconfig_base =3D 0xfc000000,
.pci_mmconfig_end_bus =3D 0,
.pci_is_virtual =3D 1,
.pci_domain =3D -1,
            .iommu_units =3D {
{
.type =3D JAILHOUSE_IOMMU_ARM_MMU500,
.base =3D 0x5000000,
.size =3D 0x800000,
},
},
.arm =3D {
.gic_version =3D 3,
.gicd_base =3D 0x6000000,
.gicr_base =3D 0x6200000,
.gicc_base =3D 0xc0c0000,
.gich_base =3D 0xc0d0000,
.gicv_base =3D 0xc0e0000,
.maintenance_irq =3D 25,
},
},
.root_cell =3D {
.name =3D "lx2160a",
.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
.cpu_set_size =3D sizeof(config.cpus),
.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
.num_irqchips =3D ARRAY_SIZE(config.irqchips),
.vpci_irq_base =3D 160 - 32,
},
},

Is there an error in my configuration ?
=20

Ralf=20

[1]=20
https://developer.arm.com/documentation/102412/0103/Exception-types/Asynchr=
onous-exceptions=20

> > [  173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O=20
> >   6.1.22+g66e442bc7fdc #1=20
> > [  173.577993] Hardware name: NXP Layerscape LX2160ARDB (DT)=20
> > [  173.577996] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS=20
> > BTYPE=3D--)=20
> > [  173.578002] pc : enter_hypervisor+0x44/0xa4 [jailhouse]=20
> > [  173.578025] lr : enter_hypervisor+0x44/0xa4 [jailhouse]=20
> > [  173.578040] sp : ffff800008003f10=20
> > [  173.578042] x29: ffff800008003f10 x28: ffffc45e51736c40 x27:=20
> > 00000000fbd0ea70=20
> > [  173.578052] x26: 0000000000000001 x25: 00000028652e0c1e x24:=20
> > 00000028652b7617=20
> > [  173.578060] x23: 0000000000000000 x22: 0000000000000000 x21:=20
> > 0000000000000000=20
> > [  173.578067] x20: 0000000000000000 x19: ffffc45e11144000 x18:=20
> > 0000000000000000=20
> > [  173.578074] x17: 0000000000000000 x16: 0000000000000000 x15:=20
> > 0000000000000000=20
> > [  173.578080] x14: 0000000000000000 x13: 0000000000000000 x12:=20
> > 0000000000000000=20
> > [  173.578086] x11: 0000000000000000 x10: 0000000000000000 x9 :=20
> > 0000000000000000=20
> > [  173.578092] x8 : 0000000000000000 x7 : 0000000000000000 x6 :=20
> > 0000000000000000=20
> > [  173.578098] x5 : 0000000000000000 x4 : 0000000000000000 x3 :=20
> > 0000000000000000=20
> > [  173.578104] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
> > 0000000000000000=20
> > [  173.578111] Kernel panic - not syncing: Asynchronous SError=20
> Interrupt=20
> > [  173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O=20
> >   6.1.22+g66e442bc7fdc #1=20
> > [  173.578120] Hardware name: NXP Layerscape LX2160ARDB (DT)=20
> > [  173.578122] Call trace:=20
> > [  173.578124]  dump_backtrace.part.0+0xe0/0xf0=20
> > [  173.578140]  show_stack+0x18/0x30=20
> > [  173.578148]  dump_stack_lvl+0x64/0x80=20
> > [  173.578158]  dump_stack+0x18/0x34=20
> > [  173.578166]  panic+0x188/0x340=20
> > [  173.578173]  nmi_panic+0xac/0xb0=20
> > [  173.578179]  arm64_serror_panic+0x6c/0x7c=20
> > [  173.578184]  do_serror+0x58/0x5c=20
> > [  173.578188]  el1h_64_error_handler+0x30/0x4c=20
> > [  173.578193]  el1h_64_error+0x64/0x68=20
> > [  173.578198]  enter_hypervisor+0x44/0xa4 [jailhouse]=20
> > [  173.578213]  __flush_smp_call_function_queue+0xd0/0x250=20
> > [  173.578223]  generic_smp_call_function_single_interrupt+0x14/0x20=20
> > [  173.578232]  ipi_handler+0x98/0x160=20
> > [  173.578239]  handle_percpu_devid_irq+0x84/0x130=20
> > [  173.578245]  generic_handle_domain_irq+0x2c/0x4c=20
> > [  173.578251]  gic_handle_irq+0x50/0x130=20
> > [  173.578258]  call_on_irq_stack+0x2c/0x5c=20
> > [  173.578263]  do_interrupt_handler+0x80/0x84=20
> > [  173.578270]  el1_interrupt+0x34/0x6c=20
> > [  173.578278]  el1h_64_irq_handler+0x18/0x2c=20
> > [  173.578283]  el1h_64_irq+0x64/0x68=20
> > [  173.578287]  cpuidle_enter_state+0x130/0x2fc=20
> > [  173.578296]  cpuidle_enter+0x38/0x50=20
> > [  173.578302]  do_idle+0x22c/0x2c0=20
> > [  173.578308]  cpu_startup_entry+0x28/0x30=20
> > [  173.578313]  kernel_init+0x0/0x12c=20
> > [  173.578319]  arch_post_acpi_subsys_init+0x0/0x18=20
> > [  173.578326]  start_kernel+0x668/0x6a8=20
> > [  173.578331]  __primary_switched+0xbc/0xc4=20
> > [  173.578337] SMP: stopping secondary CPUs=20
> > [  173.578370] Kernel Offset: 0x445e47000000 from 0xffff800008000000=20
> > [  173.578373] PHYS_OFFSET: 0xffffd3bc00000000=20
> > [  173.578376] CPU features: 0x20000,2012c084,0000421b=20
> > [  173.578380] Memory Limit: none=20
> > [  173.853682] ---[ end Kernel panic - not syncing: Asynchronous=20
> SError=20
> > Interrupt ]---=20
> >=20
> >=20
> > It seems that my Linux panic when it has to jump from the=20
> hypervisor to the=20
> > driver (in arch_cpu_activate_vmm function in=20
> > hypervisor/arch/arm64/setup.c file).=20
> >=20
> > Do you have any idea why my Linux panic ?=20
> >=20
> > Thanks in advance,=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it,=20
> send=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.=20
> > To view this discussion on the web visit=20
> >=20
>=20
https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba0=
3be4bd7a3n%40googlegroups.com=20
<
https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba0=
3be4bd7a3n%40googlegroups.com>=20
<
https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba0=
3be4bd7a3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
<
https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba0=
3be4bd7a3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.=20

>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.=20
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-de...@googlegroups.com=20
> <mailto:jailhouse-de...@googlegroups.com>.=20
> To view this discussion on the web visit=20
>=20
https://groups.google.com/d/msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a4=
94d6a9132n%40googlegroups.com=20
<
https://groups.google.com/d/msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a4=
94d6a9132n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/762f7922-e547-460f-a5d8-4a3ef2dd85e4n%40googlegroups.com.

------=_Part_26563_475266964.1700836901633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br /><br /><div><div dir=3D"auto">Le vendredi 24 novembre 2023 =C3=A0 13:3=
5:29 UTC+1, Ralf Ramsauer a =C3=A9crit=C2=A0:<br /></div><blockquote style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<br />
<br />On 24/11/2023 09:18, Laurent Corbin wrote:
<br />&gt; Hi,
<br />&gt;=20
<br />&gt;=20
<br />&gt; Thanks for your responsiveness. Unfortunately, I have not any ou=
tput when I
<br />&gt; apply your patch. With more traces, I can see that only PSCI for=
 CPU=20
<br />&gt; suspend is
<br />&gt; used. I'm continuing my research to find out more about this ker=
nel panic.
<br />&gt; Do you have any new suggestions or hypotheses ?
<br />
<br />One further thought, see below.
<br />
<br />&gt;=20
<br />&gt; Thanks in advance,
<br />&gt;=20
<br />&gt; Le mercredi 22 novembre 2023 =C3=A0 16:34:10 UTC+1, Ralf Ramsaue=
r a =C3=A9crit=C2=A0:
<br />&gt;=20
<br />&gt;     Hi,
<br />&gt;=20
<br />&gt;     On 22/11/2023 16:14, Laurent Corbin wrote:
<br />&gt;      &gt; Hi all,
<br />&gt;      &gt;
<br />&gt;      &gt; I'm trying to run jailhouse on LX2160ardb (NXP board).=
 To do that,
<br />&gt;      &gt; 1. I wrote a cell file for my root cell.
<br />&gt;      &gt; 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.=
36_2.1.0
<br />&gt;     from nxp
<br />&gt;      &gt; mirror) with yocto.
<br />&gt;      &gt; 3. I loaded the jailhouse driver as a kernel module.
<br />&gt;      &gt;
<br />&gt;      &gt; But when I try to "enable" jailhouse I get this error =
:
<br />&gt;=20
<br />&gt;     okay, I think i have seen a similar error before. Would you =
please try
<br />&gt;     to apply this patch, and see if there is some output on the =
console:
<br />&gt;=20
<br />&gt;     diff --git a/hypervisor/arch/arm-common/smccc.c
<br />&gt;     b/hypervisor/arch/arm-common/smccc.c
<br />&gt;     index 65639b59..afa26e53 100644
<br />&gt;     --- a/hypervisor/arch/arm-common/smccc.c
<br />&gt;     +++ b/hypervisor/arch/arm-common/smccc.c
<br />&gt;     @@ -83,6 +83,7 @@ static inline long handle_arch_features(u3=
2 id)
<br />&gt;     return this_cpu_data()-&gt;smccc_feat_workaround_2;
<br />&gt;=20
<br />&gt;     default:
<br />&gt;     + printk("Unknown SMCCC!\n");
<br />&gt;     return ARM_SMCCC_NOT_SUPPORTED;
<br />&gt;     }
<br />&gt;     }
<br />&gt;     @@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_=
context
<br />&gt;     *ctx)
<br />&gt;     case ARM_SMCCC_OWNER_SIP:
<br />&gt;     stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
<br />&gt;     regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
<br />&gt;     + printk("Unknown SMCCC (SIP)!\n");
<br />&gt;     break;
<br />&gt;=20
<br />&gt;     case ARM_SMCCC_OWNER_STANDARD:
<br />&gt;=20
<br />&gt;=20
<br />&gt;     If you get an output here, then we need to probably forward =
those
<br />&gt;     calls.
<br />&gt;     Please get back to me in that case.
<br />&gt;=20
<br />&gt;     Thanks
<br />&gt;     Ralf
<br />&gt;=20
<br />&gt;      &gt;
<br />&gt;      &gt;
<br />&gt;      &gt;
<br />&gt;      &gt; root@lx2160ardb-rev2:~# insmod jailhouse.ko
<br />&gt;      &gt; root@lx2160ardb-rev2:~#
<br />&gt;      &gt; root@lx2160ardb-rev2:~#
<br />&gt;      &gt; root@lx2160ardb-rev2:~#
<br />&gt;      &gt; root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sect=
ions/.text
<br />&gt;      &gt; 0xffffc45e1113e000
<br />&gt;      &gt; root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.c=
ell
<br />&gt;      &gt;
<br />&gt;      &gt; Initializing Jailhouse hypervisor v0.12 (369-g6a87b739=
) on CPU 0
<br />&gt;      &gt; Code location: 0x0000ffffc0200800
<br />&gt;      &gt; Page pool usage after early setup: mem 151/993, remap =
0/131072
<br />&gt;      &gt; Initializing processors:
<br />&gt;      &gt; =C2=A0CPU 0... OK
<br />&gt;      &gt; =C2=A0CPU 1... OK
<br />&gt;      &gt; =C2=A0CPU 5... OK
<br />&gt;      &gt; =C2=A0CPU 4... OK
<br />&gt;      &gt; =C2=A0CPU 2... OK
<br />&gt;      &gt; =C2=A0CPU 3... OK
<br />&gt;      &gt; =C2=A0CPU 9... OK
<br />&gt;      &gt; =C2=A0CPU 8... OK
<br />&gt;      &gt; =C2=A0CPU 15... OK
<br />&gt;      &gt; =C2=A0CPU 13... OK
<br />&gt;      &gt; =C2=A0CPU 12... OK
<br />&gt;      &gt; =C2=A0CPU 7... OK
<br />&gt;      &gt; =C2=A0CPU 10... OK
<br />&gt;      &gt; =C2=A0CPU 11... OK
<br />&gt;      &gt; =C2=A0CPU 6... OK
<br />&gt;      &gt; =C2=A0CPU 14... OK
<br />&gt;      &gt; Initializing unit: irqchip
<br />&gt;      &gt; Initializing unit: ARM SMMU v3
<br />&gt;      &gt; Initializing unit: ARM SMMU
<br />&gt;      &gt; ARM MMU500 at 0x5000000 with:
<br />&gt;      &gt; =C2=A0stream matching with 128 SMR groups
<br />&gt;      &gt; =C2=A064 context banks (0 stage-2 only)
<br />&gt;      &gt; Initializing unit: PVU IOMMU
<br />&gt;      &gt; Initializing unit: PCI
<br />&gt;      &gt; Adding virtual PCI device 00:00.0 to cell "lx2160a"
<br />&gt;      &gt; Adding virtual PCI device 00:01.0 to cell "lx2160a"
<br />&gt;      &gt; Page pool usage after late setup: mem 228/993, remap 2=
576/131072
<br />&gt;      &gt; Activating hypervisor
<br />&gt;      &gt; [ =C2=A0173.577969] SError Interrupt on CPU0, code 0x0=
0000000bf000000
<br />&gt;     -- SError
<br />
<br />SError is a "System Error". See [1] what triggers a SError. I wonder =
why=20
<br />this happens behind address 0xbf000000, right after enabling Jailhous=
e=20
<br />(which works correctly). What is behind that physical address? Is thi=
s=20
<br />the Jailhouse physical location?
<br />
<br /></blockquote><div>Thanks for the document reference.<br /><br />For m=
e, 0xbf000000 is not an adress but the value of the register esr_el1<br />(=
Exception Syndrome Register EL1) as you can see in linux kernel code :<br /=
>- arm64_serror_panic(struct pt_regs *regs, unsigned long esr) in arch/arm6=
4/kernel/traps.c which display this trace,<br />- el1h_64_error_handler() f=
unction in arch/arm64/kernel/entry-common.c which read the register.<br /><=
br />When I decode this register (with https://esr.arm64.dev/?#0xbf000000),=
 I have<br />not any additional information about why the SError occurs.</d=
iv><div>=C2=A0</div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Do you have all Jai=
lhouse patches applied on your kernel? Are memory=20
<br />regions reserved (via mem=3D option or device tree)?
<br />
<br /></blockquote><div><br /></div><div>I used the NXP linux repo (https:/=
/github.com/nxp-qoriq/linux.git branch=3Dlf-6.1.y) which<br />contains Jail=
house patches.<br /><br />About memory reservation, I add this node in my d=
evice tree :<br /><br />reserved-memory {<br /><span style=3D"white-space: =
pre;">		</span>#address-cells =3D &lt;0x02&gt;;<br /><span style=3D"white-s=
pace: pre;">		</span>#size-cells =3D &lt;0x02&gt;;<br /><span style=3D"whit=
e-space: pre;">		</span>ranges;<br /><br /><span style=3D"white-space: pre;=
">		</span>hypervisor@0 {<br /><span style=3D"white-space: pre;">			</span>=
no-map;<br /><span style=3D"white-space: pre;">			</span>reg =3D &lt;0x00 0=
xa0000000 0x00 0x10000000&gt;;<br /><span style=3D"white-space: pre;">		</s=
pan>};<br /><span style=3D"white-space: pre;">	</span>};<br /><br />and the=
 config.header in my cell file is :<br /><br />.header =3D {<br /><span sty=
le=3D"white-space: pre;">		</span>.signature =3D JAILHOUSE_SYSTEM_SIGNATURE=
,<br /><span style=3D"white-space: pre;">		</span>.revision =3D JAILHOUSE_C=
ONFIG_REVISION,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 .architecture =3D JAILHOUS=
E_ARM64,<br /><span style=3D"white-space: pre;">		</span>.flags =3D JAILHOU=
SE_SYS_VIRTUAL_DEBUG_CONSOLE,<br /><span style=3D"white-space: pre;">		</sp=
an>.hypervisor_memory =3D {<br /><span style=3D"white-space: pre;">			</spa=
n>.phys_start =3D 0xa0000000,<br /><span style=3D"white-space: pre;">			</s=
pan>.size =3D =C2=A0 =C2=A0 =C2=A0 0x00400000,<br /><span style=3D"white-sp=
ace: pre;">		</span>},<br /><span style=3D"white-space: pre;">		</span>.deb=
ug_console =3D {<br /><span style=3D"white-space: pre;">			</span>.address =
=3D 0x21c0000,<br /><span style=3D"white-space: pre;">			</span>.size =3D 0=
x1000,<br /><span style=3D"white-space: pre;">			</span>.type =3D JAILHOUSE=
_CON_TYPE_PL011,<br /><span style=3D"white-space: pre;">			</span>.flags =
=3D JAILHOUSE_CON_ACCESS_MMIO |<br /><span style=3D"white-space: pre;">				=
</span>=C2=A0JAILHOUSE_CON_REGDIST_4,<br /><span style=3D"white-space: pre;=
">		</span>},<br /><span style=3D"white-space: pre;">		</span>.platform_inf=
o =3D {<br /><span style=3D"white-space: pre;">			</span>.pci_mmconfig_base=
 =3D 0xfc000000,<br /><span style=3D"white-space: pre;">			</span>.pci_mmco=
nfig_end_bus =3D 0,<br /><span style=3D"white-space: pre;">			</span>.pci_i=
s_virtual =3D 1,<br /><span style=3D"white-space: pre;">			</span>.pci_doma=
in =3D -1,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .iommu_units =3D =
{<br /><span style=3D"white-space: pre;">				</span>{<br /><span style=3D"w=
hite-space: pre;">					</span>.type =3D JAILHOUSE_IOMMU_ARM_MMU500,<br /><s=
pan style=3D"white-space: pre;">					</span>.base =3D 0x5000000,<br /><span=
 style=3D"white-space: pre;">					</span>.size =3D 0x800000,<br /><span sty=
le=3D"white-space: pre;">				</span>},<br /><span style=3D"white-space: pre=
;">			</span>},<br /><span style=3D"white-space: pre;">			</span>.arm =3D {=
<br /><span style=3D"white-space: pre;">				</span>.gic_version =3D 3,<br /=
><span style=3D"white-space: pre;">				</span>.gicd_base =3D 0x6000000,<br =
/><span style=3D"white-space: pre;">				</span>.gicr_base =3D 0x6200000,<br=
 /><span style=3D"white-space: pre;">				</span>.gicc_base =3D 0xc0c0000,<b=
r /><span style=3D"white-space: pre;">				</span>.gich_base =3D 0xc0d0000,<=
br /><span style=3D"white-space: pre;">				</span>.gicv_base =3D 0xc0e0000,=
<br /><span style=3D"white-space: pre;">				</span>.maintenance_irq =3D 25,=
<br /><span style=3D"white-space: pre;">			</span>},<br /><span style=3D"wh=
ite-space: pre;">		</span>},<br /><span style=3D"white-space: pre;">		</spa=
n>.root_cell =3D {<br /><span style=3D"white-space: pre;">			</span>.name =
=3D "lx2160a",<br /><span style=3D"white-space: pre;">			</span>.num_pci_de=
vices =3D ARRAY_SIZE(config.pci_devices),<br /><span style=3D"white-space: =
pre;">			</span>.cpu_set_size =3D sizeof(config.cpus),<br /><span style=3D"=
white-space: pre;">			</span>.num_memory_regions =3D ARRAY_SIZE(config.mem_=
regions),<br /><span style=3D"white-space: pre;">			</span>.num_irqchips =
=3D ARRAY_SIZE(config.irqchips),<br /><span style=3D"white-space: pre;">			=
</span>.vpci_irq_base =3D 160 - 32,<br /><span style=3D"white-space: pre;">=
		</span>},<br /><span style=3D"white-space: pre;">	</span>},<br /><br />Is=
 there an error in my configuration ?</div><div>=C2=A0</div><blockquote sty=
le=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">   Ralf
<br />
<br />[1]=20
<br /><a href=3D"https://developer.arm.com/documentation/102412/0103/Except=
ion-types/Asynchronous-exceptions" target=3D"_blank" rel=3D"nofollow">https=
://developer.arm.com/documentation/102412/0103/Exception-types/Asynchronous=
-exceptions</a>
<br />
<br />&gt;      &gt; [ =C2=A0173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tain=
ted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O
<br />&gt;      &gt; =C2=A0 6.1.22+g66e442bc7fdc #1
<br />&gt;      &gt; [ =C2=A0173.577993] Hardware name: NXP Layerscape LX21=
60ARDB (DT)
<br />&gt;      &gt; [ =C2=A0173.577996] pstate: 200000c5 (nzCv daIF -PAN -=
UAO -TCO -DIT -SSBS
<br />&gt;      &gt; BTYPE=3D--)
<br />&gt;      &gt; [ =C2=A0173.578002] pc : enter_hypervisor+0x44/0xa4 [j=
ailhouse]
<br />&gt;      &gt; [ =C2=A0173.578025] lr : enter_hypervisor+0x44/0xa4 [j=
ailhouse]
<br />&gt;      &gt; [ =C2=A0173.578040] sp : ffff800008003f10
<br />&gt;      &gt; [ =C2=A0173.578042] x29: ffff800008003f10 x28: ffffc45=
e51736c40 x27:
<br />&gt;      &gt; 00000000fbd0ea70
<br />&gt;      &gt; [ =C2=A0173.578052] x26: 0000000000000001 x25: 0000002=
8652e0c1e x24:
<br />&gt;      &gt; 00000028652b7617
<br />&gt;      &gt; [ =C2=A0173.578060] x23: 0000000000000000 x22: 0000000=
000000000 x21:
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578067] x20: 0000000000000000 x19: ffffc45=
e11144000 x18:
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578074] x17: 0000000000000000 x16: 0000000=
000000000 x15:
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578080] x14: 0000000000000000 x13: 0000000=
000000000 x12:
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578086] x11: 0000000000000000 x10: 0000000=
000000000 x9 :
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578092] x8 : 0000000000000000 x7 : 0000000=
000000000 x6 :
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578098] x5 : 0000000000000000 x4 : 0000000=
000000000 x3 :
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578104] x2 : 0000000000000000 x1 : 0000000=
000000000 x0 :
<br />&gt;      &gt; 0000000000000000
<br />&gt;      &gt; [ =C2=A0173.578111] Kernel panic - not syncing: Asynch=
ronous SError
<br />&gt;     Interrupt
<br />&gt;      &gt; [ =C2=A0173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tain=
ted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O
<br />&gt;      &gt; =C2=A0 6.1.22+g66e442bc7fdc #1
<br />&gt;      &gt; [ =C2=A0173.578120] Hardware name: NXP Layerscape LX21=
60ARDB (DT)
<br />&gt;      &gt; [ =C2=A0173.578122] Call trace:
<br />&gt;      &gt; [ =C2=A0173.578124] =C2=A0dump_backtrace.part.0+0xe0/0=
xf0
<br />&gt;      &gt; [ =C2=A0173.578140] =C2=A0show_stack+0x18/0x30
<br />&gt;      &gt; [ =C2=A0173.578148] =C2=A0dump_stack_lvl+0x64/0x80
<br />&gt;      &gt; [ =C2=A0173.578158] =C2=A0dump_stack+0x18/0x34
<br />&gt;      &gt; [ =C2=A0173.578166] =C2=A0panic+0x188/0x340
<br />&gt;      &gt; [ =C2=A0173.578173] =C2=A0nmi_panic+0xac/0xb0
<br />&gt;      &gt; [ =C2=A0173.578179] =C2=A0arm64_serror_panic+0x6c/0x7c
<br />&gt;      &gt; [ =C2=A0173.578184] =C2=A0do_serror+0x58/0x5c
<br />&gt;      &gt; [ =C2=A0173.578188] =C2=A0el1h_64_error_handler+0x30/0=
x4c
<br />&gt;      &gt; [ =C2=A0173.578193] =C2=A0el1h_64_error+0x64/0x68
<br />&gt;      &gt; [ =C2=A0173.578198] =C2=A0enter_hypervisor+0x44/0xa4 [=
jailhouse]
<br />&gt;      &gt; [ =C2=A0173.578213] =C2=A0__flush_smp_call_function_qu=
eue+0xd0/0x250
<br />&gt;      &gt; [ =C2=A0173.578223] =C2=A0generic_smp_call_function_si=
ngle_interrupt+0x14/0x20
<br />&gt;      &gt; [ =C2=A0173.578232] =C2=A0ipi_handler+0x98/0x160
<br />&gt;      &gt; [ =C2=A0173.578239] =C2=A0handle_percpu_devid_irq+0x84=
/0x130
<br />&gt;      &gt; [ =C2=A0173.578245] =C2=A0generic_handle_domain_irq+0x=
2c/0x4c
<br />&gt;      &gt; [ =C2=A0173.578251] =C2=A0gic_handle_irq+0x50/0x130
<br />&gt;      &gt; [ =C2=A0173.578258] =C2=A0call_on_irq_stack+0x2c/0x5c
<br />&gt;      &gt; [ =C2=A0173.578263] =C2=A0do_interrupt_handler+0x80/0x=
84
<br />&gt;      &gt; [ =C2=A0173.578270] =C2=A0el1_interrupt+0x34/0x6c
<br />&gt;      &gt; [ =C2=A0173.578278] =C2=A0el1h_64_irq_handler+0x18/0x2=
c
<br />&gt;      &gt; [ =C2=A0173.578283] =C2=A0el1h_64_irq+0x64/0x68
<br />&gt;      &gt; [ =C2=A0173.578287] =C2=A0cpuidle_enter_state+0x130/0x=
2fc
<br />&gt;      &gt; [ =C2=A0173.578296] =C2=A0cpuidle_enter+0x38/0x50
<br />&gt;      &gt; [ =C2=A0173.578302] =C2=A0do_idle+0x22c/0x2c0
<br />&gt;      &gt; [ =C2=A0173.578308] =C2=A0cpu_startup_entry+0x28/0x30
<br />&gt;      &gt; [ =C2=A0173.578313] =C2=A0kernel_init+0x0/0x12c
<br />&gt;      &gt; [ =C2=A0173.578319] =C2=A0arch_post_acpi_subsys_init+0=
x0/0x18
<br />&gt;      &gt; [ =C2=A0173.578326] =C2=A0start_kernel+0x668/0x6a8
<br />&gt;      &gt; [ =C2=A0173.578331] =C2=A0__primary_switched+0xbc/0xc4
<br />&gt;      &gt; [ =C2=A0173.578337] SMP: stopping secondary CPUs
<br />&gt;      &gt; [ =C2=A0173.578370] Kernel Offset: 0x445e47000000 from=
 0xffff800008000000
<br />&gt;      &gt; [ =C2=A0173.578373] PHYS_OFFSET: 0xffffd3bc00000000
<br />&gt;      &gt; [ =C2=A0173.578376] CPU features: 0x20000,2012c084,000=
0421b
<br />&gt;      &gt; [ =C2=A0173.578380] Memory Limit: none
<br />&gt;      &gt; [ =C2=A0173.853682] ---[ end Kernel panic - not syncin=
g: Asynchronous
<br />&gt;     SError
<br />&gt;      &gt; Interrupt ]---
<br />&gt;      &gt;
<br />&gt;      &gt;
<br />&gt;      &gt; It seems that my Linux panic when it has to jump from =
the
<br />&gt;     hypervisor to the
<br />&gt;      &gt; driver (in arch_cpu_activate_vmm function in
<br />&gt;      &gt; hypervisor/arch/arm64/setup.c file).
<br />&gt;      &gt;
<br />&gt;      &gt; Do you have any idea why my Linux panic ?
<br />&gt;      &gt;
<br />&gt;      &gt; Thanks in advance,
<br />&gt;      &gt;
<br />&gt;      &gt; --
<br />&gt;      &gt; You received this message because you are subscribed t=
o the Google
<br />&gt;      &gt; Groups "Jailhouse" group.
<br />&gt;      &gt; To unsubscribe from this group and stop receiving emai=
ls from it,
<br />&gt;     send
<br />&gt;      &gt; an email to <a href=3D"" rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>
<br />&gt;      &gt; &lt;mailto:<a href=3D"" rel=3D"nofollow">jailhouse-de.=
..@googlegroups.com</a>&gt;.
<br />&gt;      &gt; To view this discussion on the web visit
<br />&gt;      &gt;
<br />&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/1=
8173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com" target=3D"_blank" =
rel=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0=
873-4774-a664-ba03be4bd7a3n%40googlegroups.com</a> &lt;<a href=3D"https://g=
roups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3=
n%40googlegroups.com" target=3D"_blank" rel=3D"nofollow">https://groups.goo=
gle.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googl=
egroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailho=
use-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow">https:=
//groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd=
7a3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;=
<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-47=
74-a664-ba03be4bd7a3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" target=3D"_blank" rel=3D"nofollow">https://groups.google.com/d/m=
sgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br />&gt;=20
<br />&gt; --=20
<br />&gt; You received this message because you are subscribed to the Goog=
le=20
<br />&gt; Groups "Jailhouse" group.
<br />&gt; To unsubscribe from this group and stop receiving emails from it=
, send=20
<br />&gt; an email to <a href=3D"" rel=3D"nofollow">jailhouse-de...@google=
groups.com</a>=20
<br />&gt; &lt;mailto:<a href=3D"" rel=3D"nofollow">jailhouse-de...@googleg=
roups.com</a>&gt;.
<br />&gt; To view this discussion on the web visit=20
<br />&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ce75d=
57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegroups.com" target=3D"_blank" rel=
=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/ce75d57a-5bf7=
-44b7-95ae-2a494d6a9132n%40googlegroups.com</a> &lt;<a href=3D"https://grou=
ps.google.com/d/msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2a494d6a9132n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_bl=
ank" rel=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/ce75d=
57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegroups.com?utm_medium=3Demail&amp;=
utm_source=3Dfooter</a>&gt;.
<br /></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/762f7922-e547-460f-a5d8-4a3ef2dd85e4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/762f7922-e547-460f-a5d8-4a3ef2dd85e4n%40googlegroups.co=
m</a>.<br />

------=_Part_26563_475266964.1700836901633--

------=_Part_26562_1645529662.1700836901633--
