Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBA4UZXXQKGQEWI5BH2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3A11DF41
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 09:21:24 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id q17sf1029788edr.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 00:21:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576225283; cv=pass;
        d=google.com; s=arc-20160816;
        b=KzKWW9CeNmMFjP32gm6ZD1fKL2LzCjLYgj3nOccbS5corQtCbgauFWc97AjLewLoV/
         rzgPGV43koRPc3QJ3ub+w/82To+REumnOFHnhfz9xXNFqLpEPeeochXz7juAFwF6H9Uj
         tKJ0wRiD+4GDkaAfcSM7+WxMFbNXo59vMGYHbscjiLvacOAvhJdNihdOuoGDsCwQ3f1Z
         CQNnGceA5cvnDeTDKhHs5s9v+j7wi/W8FLhGS9xawAMR/Fy3aOhYc7xunJ3wuDTuEidZ
         qZp/HwPV1NeELEDGROtE1bc7t2AH+VfkjqEcblgXtDvLCSnhb2B7P9pL+ETXP8y7iXUJ
         Ml7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=Da2EStazSyCSK6WcZKuML9TV5s3Oeb4dR3KiFm0FnnU=;
        b=l6CuMsMBTtgOcime4K3pY0H03MUd1SK4uzSMlu1v9qNS8+qVgb53HK8L7FFeeI6BYN
         MPI7YeWsb7h1jWsMlZbw2HsMPFQ8mFHruM7iGaAqxHuc+FYzhZ0NrSBcwRpnwp+SllpB
         FsQGu8E9PBZC17COhltuZNs5IwgIFzr/etTmzEoLm0MeteCzzBE+9mj11SZykoQHkKYG
         pRdjZdcvo6JnjXUE3xSU3dPiJ31q2HuoK8WvufMRftzjKRL83iyaJ/PFwnnT851fnGEf
         CNtXNZ3US5IWYmMBtfufs/AjmjADR25xMr1h3qEMrc38RIp1ej3xJtV3+4rV0F3BsHMo
         iKkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Da2EStazSyCSK6WcZKuML9TV5s3Oeb4dR3KiFm0FnnU=;
        b=F50jbnQUlDtRqkfQ5F+XGlCEu7g/l+WLX2niqilPbUhJIcFxvH0J81Phnh0SrgSYKl
         f2wvK7m3937UnmqbNs+sYw+tRxhKFqiS3/ru/vb/8vSEb8aPTgMq+gI7WbpjavrpyR69
         Iy42WtWnTF9lLLhmyqHLpIcUuaJdv/19M3Z6/jC6OJp3VZffTv4A6GXppXo7iR6o7mdB
         AyP8y8A/oj/iomJME/Ec/dwZzuK83jV2K+2QhmvPePfeHO7GTFA+qUKMn9IR7GG0JoXI
         bkSLCLibGrrDG++kQ4iea+w9qeZHeA8sWYn8MFYhqx1OVc3Avf1xOrj8CUUTwD+mZhmT
         p01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Da2EStazSyCSK6WcZKuML9TV5s3Oeb4dR3KiFm0FnnU=;
        b=b6XnEpFEDoRBaxJlpN5Ivf/z2cGWsKTcY8Nj/3jFkcPjl3na/zsnUAw7ivk51G00Ly
         2XjKaTIszevQe09fcVJqkXenSHwPQ6MhRn3H48O3d3ogqNCVkK061jpTx8zo73gDqA3Z
         H+5OPWr2M8beeIeSW01h7/bYXwUh3nWra0xyi25b2PW/3+vEqtfvUhrbpv6Ga/x715bC
         dBfakdAbF4+LbVT5kLnQfCxkcc1fuez4orMcJHHjQ/BjnLAk9oZajV14o3I+9PIvmOHC
         J47TOBpJFe11AXG3PVcdP2BwQmiDLUESsEs52PbGrQtnF6w9CWXEfx02rHCybdG370hj
         gWpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUQEpuAT2vCUfDtMmDCTpBSyrrt5L/F69AHgwANbcefRox0P4Y
	fS5/MBhd3DFK6wY9Ko/Io98=
X-Google-Smtp-Source: APXvYqxMfvjf1txrIbcW1Z94Wp/9PEW+K3EDPf2onK3M/QhMqqcjLZFxVjfDHhaFYmrGSXOVzozaHQ==
X-Received: by 2002:a05:6402:1350:: with SMTP id y16mr14542974edw.176.1576225283764;
        Fri, 13 Dec 2019 00:21:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2044:: with SMTP id bc4ls1973248edb.3.gmail; Fri,
 13 Dec 2019 00:21:23 -0800 (PST)
X-Received: by 2002:aa7:df09:: with SMTP id c9mr14512863edy.133.1576225283150;
        Fri, 13 Dec 2019 00:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576225283; cv=none;
        d=google.com; s=arc-20160816;
        b=nUqeEDXyNuLsP0mbrCtkA+gabOEBxPJqbeZ3LKUGWX7KYEtH9Yjtx7gMglkUnIdish
         F2Vz/UIvUbwfg0N+3KjZSp8IY4tzxXCAi0rXyr/CIjbZ+xDX0Oksy0CXskWG7TWE/RIX
         hEruQ0O14vvFi7LSdxKzOVdc+fHfDexgFCLRNxlB1umy63nfJ2vuqSOVqTfdTpvhAEnt
         R+mLAJE8RQjG5nUrS03rWNWdxP0VJNRZfuD1A2GUdrs9+SN9/7ck7xCIxetK+c8hoHaa
         dBfWWvHv+Xvh2ZAbzLzr5aopkReTV9JCpvUvqW21U0baLawFjnr1ZmYV6KIPHyCOY/Rt
         +WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=wC/FjsXPK5DFXeSHHuqbkxIPjjhvxGsfuLBKHeo74O0=;
        b=okwNWc3D8eHjW0rGyMP4rS1oof+8iPUzVmTDOFNtDNm3kIU9oyaJmcDoSLNQUmN97m
         tLT8vDX87jSYTWWG80d/Qqek58CJAwL+AD72Kj5/QGgwo0Lr+JVcFTJEJnEqHyMaTxfE
         qif710JSjWWshppTxZMePBj6baDjh2CRDr/YHablXH7PhWPC3fGj1d1pbDsGGNlZ0J5v
         hVrFGts6sEE2FwHAh+WOwASMSptNTKYrnmXeQd+8HEbUrp9+5qB4jbiMZuzxLVBRn+pH
         kTU8owRgguv94UaLuTnICx+D9YOmGNSOn+Rg4LYlvDXMOdK3TnI9CdRm0HUQJIRanTY+
         GYyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h11si297102edv.1.2019.12.13.00.21.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Dec 2019 00:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xBD8LMQ0022536
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2019 09:21:22 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.28.239])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xBD8LLVl030746;
	Fri, 13 Dec 2019 09:21:21 +0100
Date: Fri, 13 Dec 2019 09:21:18 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Guido Roncarolo <guido.roncarolo@gmail.com>,
        <jailhouse-dev@googlegroups.com>
Subject: Re: Adding a shared tracing mechanism
Message-ID: <20191213092118.11df7309@md1za8fc.ad001.siemens.net>
In-Reply-To: <20191213085825.1d37128d@md1za8fc.ad001.siemens.net>
References: <AM0PR04MB71223156702DE74066C2511BE2550@AM0PR04MB7122.eurprd04.prod.outlook.com>
	<CADVdfxh4=ZmDpzHHh1H+8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw@mail.gmail.com>
	<76ed1186-e38f-32e8-e0a8-c3768d44fe3e@siemens.com>
	<20191213085825.1d37128d@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi,

i think (hope) that ftrace of the Linux kernel has some sort of
networking support. A mechanism to send the trace data to a remote host
over TCP or UDP and read the trace on the remote machine.

If you really just want to trace the RTOS i would look into such
network tracing, where Linux would be the consumer of the trace. You
would just have to establish a network link (ivshmem or device
assignment) and write the trace in a format that Linux will understand,
given you have drivers and an IP stack in your RTOS.

The benefit for you would be to not having to deal with jailhouse
shared memory. And you would have an abstraction that should work on
any hypervisor and even bare-metal. So it would be more sustainable for
your RTOS and would allow for comparisons, i.e. jailhouse vs.
bare-metal.

regards,
Henning

Am Fri, 13 Dec 2019 08:58:25 +0100
schrieb "[ext] Henning Schild" <henning.schild@siemens.com>:

> Am Fri, 13 Dec 2019 08:08:32 +0100
> schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>=20
> > On 12.12.19 16:43, Guido Roncarolo wrote: =20
> > > Hello All,
> > >=20
> > > I am trying to add a small tracing mechanism developed for a RTOS
> > > inside jailhouse.   =20
> >=20
> > Henning started to look into such a feature as well, but those were
> > only early stages. The idea is similar: export a memory region to a
> > cell for trace pickup. Events could come from function tracing (gcc
> > -pg). =20
>=20
> Well i never actually wrote any code. The idea was similar but the
> goal was a different one. We wanted to trace the hypervisor and
> process the traces in the root-cell. As far as i understand Guido
> might want to trace the RTOS.=20
>=20
> > > It is a simple circular buffer where in constant time access you
> > > can insert events, then from Linux
> > > you can dump the shared memory and translate the circular buffer
> > > content into babletrace format =20
>=20
> Time was not too much in the focus of the idea, rather control-flow.
> The reason to not think about time in the first place is the lack of a
> clock in the hypervisor and the wish to keep the mechanism
> light-weight.
>=20
> On x86 TSC could be used and core correlation of possibly out of sync
> TSCs could have been done on Linux later. Note that recent kernels
> (afaik 4.10+) and modern x86 cores (X86_FEATURE_TSC_ADJUST) support
> TSC synchronization at boot-time. Not sure what to do on arm and
> aarch64.
>=20
> And the "constant time" suggests you want to do sampling with i.e.
> performance counters. We though about instrumentation (gcc -gc).
>=20
> But the underlying memory channel and maybe trace format could
> probably used for both "hypervisor instrumentation" tracing and "cell
> sampling".
>=20
> Sorry there nothing more than the prosa description. Happy hacking and
> looking forward to contributions ;).
>=20
> Henning
>=20
> > > To achieve this I
> > > 1) added a memory region inside the cell config
> > > 2) initialize the tracer struct in init_early() hypervisor/setup.c
> > > 3) try to insert a test event -> OK
> > > 3.1) dump mem from linux -> OK record is there
> > > 4) try to insert an event inside=C2=A0 entry()=C2=A0 or after -> NOT =
good
> > >=20
> > >=20
> > > FATAL: Unhandled HYP exception: synchronous abort from EL2
> > > =C2=A0pc: 0000ffffc020bf68 =C2=A0 lr: 0000ffffc02024d4 spsr: 800003c9
> > > EL2 sp: 0000ff0000010e90 =C2=A0esr: 25 1 0000006
> > > =C2=A0x0: 000000000000002b =C2=A0 x1: 000000000000001e =C2=A0 x2:
> > > 0000ffffc021d000 x3: 00000000b7e00000 =C2=A0 x4: 0000ffffc021d030
> > > x5: 0000000000000000 x6: 0000000000000000 =C2=A0 x7: 0000000000000000
> > >  x8: 0000000000000000 x9: 0000000000000000 =C2=A0x10: 000000000000000=
0
> > > =C2=A0x11: 0000000000000000 x12: 0000000000000000 =C2=A0x13:
> > > 0000000000000000 =C2=A0x14: 0000000000000000 x15: 0000000000000000
> > > x16: 0000000000000000 =C2=A0x17: 0000000000000000 x18:
> > > 0000000000000000 =C2=A0x19: 000000000000001e =C2=A0x20: 0000ffffc0219=
038
> > > x21: 0000000000000001 =C2=A0x22: 0000000000000001 =C2=A0x23:
> > > 0000000000000002 x24: ffff00000969c000 =C2=A0x25: ffff000008010000
> > > x26: ffff000008014000 x27: 0000000000000000 =C2=A0x28:
> > > ffff8000283ea880 =C2=A0x29: 0000ff0000010e90
> > >=20
> > >=20
> > > I tried to to understand from memory-layout.txt if sharing memory
> > > like this is legal:what I would need a "Common memory region"
> > > that stays visible to all contexts but I'm unsure if this is
> > > feasible or allowed   =20
> >=20
> > Well, for filling the region, the step that fails after early_init,
> > you need a valid mapping inside the hypervisor at any point. Study
> > what happens to make the console page work. That is just the same
> > use case as tracing.
> >=20
> > Jan
> >  =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191213092118.11df7309%40md1za8fc.ad001.siemens.net.
