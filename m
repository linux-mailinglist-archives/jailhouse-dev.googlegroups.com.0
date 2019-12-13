Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBJMJZXXQKGQEC3IY5KY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4B11DEFB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 08:58:30 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id g26sf1556078wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 23:58:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576223909; cv=pass;
        d=google.com; s=arc-20160816;
        b=HLuTQjCjgpMCox0KxKUs0/OkJ2vgXnzH81ODFhlqp16YgUiO8A3bYujHmigJbHPlx4
         TCGXH0cLWDPx+TKO4sUnv+AiQL1Wy5oQlDqXI8Cyv6qQY/KVm1Zs4LO/3RstiHCYfvdU
         W0slTNUfN3MwaPPKp1CMkB7d5AxzPh9Heplegtz9ZJ56lwHI4fS0zlfAGX0tQRVlJLtH
         vzzZqFMb1R7URXH9p96Ddj9iVscbL/k4tpUOHCQlcWukIBch2t0ycCIo2l5jqLa1HXjY
         c/8e6wm5sRRPxiiBsP3vY2upUn3RSx0W1pp2eeMLSLWyRQjmHUY2l7H2D8UHAnbITHny
         /GDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=nZNyN53lcFidT+XtC5Dz0omIyQXvkwIEBTEcSufF6zs=;
        b=KNbEP0U9h65N/Jcbmx/8SglL2qqQcyst3NmTWmnp9zNS94DzpLliPZVwmErsaic0yt
         ASAzKwruBiO5rzVtLT+N0XxRncBO7cxpq7tisPaiBy6mAFF378eFc8kGKFnqI3ILmjIB
         2Tt36pBBS9itKjrUKlKHGxAnalbDDMObMyTSLHVHlZk7cqFDM2S6B7sB+HIx4EQzZIP/
         OLRR8xbpPISn9nG3yTmU7/amNutInxj5voWS97zGaw3Tc4xL0aodWTWel5b2sxGTGoP0
         71zweyQgvLkpVGfDAVpl+QgPEsBHeJWCiBLktk42BBaNkPrwVzo6joust0dtG5ZDq+TI
         dx6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nZNyN53lcFidT+XtC5Dz0omIyQXvkwIEBTEcSufF6zs=;
        b=DTDTMrnyGXddfwCuJF0Z8kNgrRKWa7it9NEOyVHluhdgd6ZuiW5L4IbttvY74ayl2J
         BfqJOTh1H5APhjmJe3BuCacZbKB5Zuriuf86rbsRNiJkzWNJrsemfDYJKdkyA+KxwwcO
         LRA5eVytx4NwVF36pAW8DLVxTPD3vnlYmnCrCUeB6ujr/arDNKw29GsVsDIzerw7HT5m
         1znNLvwzpNegAupUgiit+AAwVMR8yBuEsErEB7mE8HnPVXqeFebxoVuOgdiRZ9ve62qr
         +T8U7FqIqqltgqI+6aFyGpW+Hq8QkwwQkkdAHncNWvv1VuvhTB+10ksxm0PYpT9XE/Dd
         qJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nZNyN53lcFidT+XtC5Dz0omIyQXvkwIEBTEcSufF6zs=;
        b=Fw0v/fJ6myG/mvNXVazJNzXt+qi5J8tta62jnMC7dVc2FQ+3N/EXtdcyBZjreSPF8u
         IKBcSHjI5Gu9/sv2uW0PbqLjTV90OpDmoHEBOv5FkyPl7DEXJsirbRMR49SxTOfnMsBl
         JgNM6eC2sh0+U4r/dYA63o9/UUPcPImEayR+Q+5I5fI/MX4fTyGBrlu2KOHm3czmaCh/
         rQJmhhNWoAU+50RttRKbI6qB/QIrSMpLKO++I1/Hd7xbJbQy8NLKvfpVDhpPLWvqE2eA
         0drZ+0q9YRQeTU+81fhnelADW6iCOs3jTWs8VsWXqXwxB5Wc1x0J+LYWD5Dm3MPNoCcz
         +z8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0j1inYrHH9YZcV6xIsVLh3sp5u/B187/ebwEfp2kg/crRpStN
	mNRvbT86ZrNzmXfnzJhy8Ek=
X-Google-Smtp-Source: APXvYqzjUxvkH+BdDOt9PG8lMb+4HYQ7VFQN/wXLghjvPf9btDddQMGdnBsJGNicLjd6ju0dXN1RAw==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr11881710wmo.13.1576223909731;
        Thu, 12 Dec 2019 23:58:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c7c2:: with SMTP id z2ls4629654wmk.2.canary-gmail; Thu,
 12 Dec 2019 23:58:29 -0800 (PST)
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr12484909wme.42.1576223909022;
        Thu, 12 Dec 2019 23:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576223909; cv=none;
        d=google.com; s=arc-20160816;
        b=r0A18teuSnAz1W0KFF4xoqTMm9dQtgLVcx19FcpGfcJiYGSrxqlNw/rKUOAHvV7Ndo
         GSr0hqfOvZtYLxYMCx+a4ku9DabPWOB/eGChTmA3fhCPfyj/IaeCzKok5WhwVw6t/I4I
         Tkb6RouDu87xdNafyRHZCuFchB7lKL59m7w4l61adprbXeygIlH8WVW3zaPPhz/hqF/O
         tyEfcnOEms2b4SWCDazwpmp1KXUbnxquJsrtQuby6Re1DKaD33ZX59sxf5GB7tnv9sVr
         /v9zMzHOHzsp9wGJyhuKQXpT4miHcCPSRdWCwJkekjTP0IYmAi+t6mVf9+GAiPxZleEv
         ObFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=hHig33hIY06YAdeEOXLpZlvJWlsfZXL3ZmCKqIBmfCw=;
        b=EAlJ5S+Yh5Zwv02rVV86wg8NGga4O1xrHXP8/JCLp/cQqWwXV4GAf/7/GspDFi2PcC
         S4a4Wmefb38CcIKkuBqMd77Xz5X9SxqSZ+8uEqDMfvkT4zzwG8UTHg7W9d5oN8lzuXv5
         kZUCpfNLigfU1lRotkriwV/6e9Tt8Xdqk3vpVpIokqJG+1HqoYOkFqHdT6FQlzIyI1Jl
         WoEXNBm9Uls31WKsA77Br4TecKOUz7fUPcn8cx94B/juABwbkgaVm6qE2DODFSIXqmMH
         D1CuRlbaziA8j9UJC7bgqUpoNwosLqLt0ij7hofjhIUsk8O8jbJCAy3aH5HfSL/Kdbzh
         gUhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m2si326053wmi.3.2019.12.12.23.58.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 23:58:29 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xBD7wSoC018680
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2019 08:58:28 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.28.239])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xBD7wRT5014717;
	Fri, 13 Dec 2019 08:58:27 +0100
Date: Fri, 13 Dec 2019 08:58:25 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Guido Roncarolo <guido.roncarolo@gmail.com>,
        <jailhouse-dev@googlegroups.com>
Subject: Re: Adding a shared tracing mechanism
Message-ID: <20191213085825.1d37128d@md1za8fc.ad001.siemens.net>
In-Reply-To: <76ed1186-e38f-32e8-e0a8-c3768d44fe3e@siemens.com>
References: <AM0PR04MB71223156702DE74066C2511BE2550@AM0PR04MB7122.eurprd04.prod.outlook.com>
	<CADVdfxh4=ZmDpzHHh1H+8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw@mail.gmail.com>
	<76ed1186-e38f-32e8-e0a8-c3768d44fe3e@siemens.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
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

Am Fri, 13 Dec 2019 08:08:32 +0100
schrieb Jan Kiszka <jan.kiszka@siemens.com>:

> On 12.12.19 16:43, Guido Roncarolo wrote:
> > Hello All,
> >=20
> > I am trying to add a small tracing mechanism developed for a RTOS
> > inside jailhouse. =20
>=20
> Henning started to look into such a feature as well, but those were
> only early stages. The idea is similar: export a memory region to a
> cell for trace pickup. Events could come from function tracing (gcc
> -pg).

Well i never actually wrote any code. The idea was similar but the goal
was a different one. We wanted to trace the hypervisor and process the
traces in the root-cell. As far as i understand Guido might want to
trace the RTOS.=20

> > It is a simple circular buffer where in constant time access you can
> > insert events, then from Linux
> > you can dump the shared memory and translate the circular buffer
> > content into babletrace format

Time was not too much in the focus of the idea, rather control-flow.
The reason to not think about time in the first place is the lack of a
clock in the hypervisor and the wish to keep the mechanism light-weight.

On x86 TSC could be used and core correlation of possibly out of sync
TSCs could have been done on Linux later. Note that recent kernels
(afaik 4.10+) and modern x86 cores (X86_FEATURE_TSC_ADJUST) support TSC
synchronization at boot-time. Not sure what to do on arm and aarch64.

And the "constant time" suggests you want to do sampling with i.e.
performance counters. We though about instrumentation (gcc -gc).

But the underlying memory channel and maybe trace format could probably
used for both "hypervisor instrumentation" tracing and "cell sampling".

Sorry there nothing more than the prosa description. Happy hacking and
looking forward to contributions ;).

Henning

> > To achieve this I
> > 1) added a memory region inside the cell config
> > 2) initialize the tracer struct in init_early() hypervisor/setup.c
> > 3) try to insert a test event -> OK
> > 3.1) dump mem from linux -> OK record is there
> > 4) try to insert an event inside=C2=A0 entry()=C2=A0 or after -> NOT go=
od
> >=20
> >=20
> > FATAL: Unhandled HYP exception: synchronous abort from EL2
> > =C2=A0pc: 0000ffffc020bf68 =C2=A0 lr: 0000ffffc02024d4 spsr: 800003c9 =
=C2=A0 =C2=A0 EL2
> > =C2=A0sp: 0000ff0000010e90 =C2=A0esr: 25 1 0000006
> > =C2=A0x0: 000000000000002b =C2=A0 x1: 000000000000001e =C2=A0 x2: 0000f=
fffc021d000
> > =C2=A0x3: 00000000b7e00000 =C2=A0 x4: 0000ffffc021d030 =C2=A0 x5: 00000=
00000000000
> > =C2=A0x6: 0000000000000000 =C2=A0 x7: 0000000000000000 =C2=A0 x8: 00000=
00000000000
> > =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 00000=
00000000000
> > x12: 0000000000000000 =C2=A0x13: 0000000000000000 =C2=A0x14: 0000000000=
000000
> > x15: 0000000000000000 =C2=A0x16: 0000000000000000 =C2=A0x17: 0000000000=
000000
> > x18: 0000000000000000 =C2=A0x19: 000000000000001e =C2=A0x20: 0000ffffc0=
219038
> > x21: 0000000000000001 =C2=A0x22: 0000000000000001 =C2=A0x23: 0000000000=
000002
> > x24: ffff00000969c000 =C2=A0x25: ffff000008010000 =C2=A0x26: ffff000008=
014000
> > x27: 0000000000000000 =C2=A0x28: ffff8000283ea880 =C2=A0x29: 0000ff0000=
010e90
> >=20
> >=20
> > I tried to to understand from memory-layout.txt if sharing memory
> > like this is legal:what I would need a "Common memory region"
> > that stays visible to all contexts but I'm unsure if this is
> > feasible or allowed =20
>=20
> Well, for filling the region, the step that fails after early_init,
> you need a valid mapping inside the hypervisor at any point. Study
> what happens to make the console page work. That is just the same use
> case as tracing.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191213085825.1d37128d%40md1za8fc.ad001.siemens.net.
