Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBOG6S3YQKGQEGDLTWMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A7142C79
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 14:46:38 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id v5sf21951828edq.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 05:46:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579527992; cv=pass;
        d=google.com; s=arc-20160816;
        b=z2f/0cQopxRJ1szJwPabjUpD3hO7B312AkwcMma8s+wqQxUL9dWmBgqnmP+NEdCkcE
         gpxpdMyxHYjndlg0vr2yRbl6KhlYYQxT7mdYNT7bhp0aYc+TeREYVJGjwDom27VE6/aM
         cQZnGQH5/SK6RpJbfnb+eQ6jVZ1lcudPttDi/+V1fCKWFBjdzsD8hNudqOWdVMm4qies
         nwVgD7/QicVEdi8oKmRt9kjDMzbGUqdutIawnm0Z8jv6vfpRKACpYM1lVjggRaDeaeLv
         SSd8xlZTBPULZATcqDIi6MPF8pOrz27yvE2/M8/VPNu3s5zPIOIlEWN//WNJ3cHP7zW/
         QhbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=PpPzW00IbwNkOpe7nim1TYW0krpfLw1MhdourPb06tU=;
        b=DTkaAYoCV3CUB6hNbL9AGQ/A3E8eowVJPtAgv+q8SeWTT2D1a1kFG2qkWHRD+1mJpp
         pkyhfn7U0Foi610r3jmttmfQ156/nMhB7BVFecugqO7J79n+WcdLqwb1tbzrEf26DwME
         yfkBDz3Lt9ikng0Pfvp9lQaKq4fUwUnS1voREbybPIT64aJgbgHzBXi+KQUkVorEymoz
         necTejRZBn5NDBv8ZRyQxhpqXDZBddeB+sCjJe4XpmhIIj9UhGTyK9JWSFS1YAboxx3M
         bRPiA9RMeOJ/cacY9Kieny43sLWjMCfvtq3Gr4mbteIAQzqnOAwtejEU8BQs19W58W74
         YXfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PpPzW00IbwNkOpe7nim1TYW0krpfLw1MhdourPb06tU=;
        b=eGX1ThfqMGKJAtDM8VjA5v98qUoXoFe7P72xHXtsuMvIxlyh98+NFqV8+YGUr4cpfN
         6NUWqIvvyMKZ/xnpsrh+TOjjppTLw2AWK5fkCVXcw8wIZWQvhULPoGlwOeDZs38xpUSD
         XGtRPNI+HaHzhE8U3bK7FDXHpoKkshliwNU0vVMyFrdn7pvZvMIOtOiNQcml4PJ+RLX9
         SwWQWRMiNfbMT2Jkklb/xhE1bkWfH/o5YJURVQMBl6lcLnJrHLegRdzFxLy9msep/RnY
         iTWbHI2g+moA4xg3kojlerCdeDWqB7LMMYeRYp76fiee5gpmqAPkg8rAWZeN+dWPccqi
         dm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PpPzW00IbwNkOpe7nim1TYW0krpfLw1MhdourPb06tU=;
        b=IzmhpWraYpR7QXozmN6R8fjLs1DAT6/QIw4Vrvr/Gmj7NSjgCccBdsPsr/Rk1G0etF
         ozRGHi7q0srgFhFcDoUwyRkq1f8qQxNnw35xJ77LzmU3r4dvNF5xJUbqTG2epzwOFjfu
         q9MJ+0xl2rgn0BODMXMSkVGBAaSsqR4NgFlVF8p9xom7mLvrheHlzFJ7lVGMeqrVnDaA
         lPiAhZRtTgFNjTx3CaH+kYKVsddG+1X9TfMrSif8TtW0evctJGALrkIzABV7MdFwMelb
         512OMjlcGLXGZWyn3BFjBduNK4PA7v68WzPxO9AAJ+lWCQ/EVR7m32XX8fFK1+6lp+5b
         OF7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVTbD/i0it/GbsNf6HblASemfUVAHFTNM4z/DgFGq9cGqOsI6Aq
	D2k50DX0MX+WWeo/gswvRzg=
X-Google-Smtp-Source: APXvYqyaJF8Zbj6qNXVqYG5GD+bjCkiMyu/7v1GlUzbIcVBLbVHr7rfHqwmX3LveYb5L4HO4G8qayg==
X-Received: by 2002:a50:ed94:: with SMTP id h20mr17473321edr.17.1579527992199;
        Mon, 20 Jan 2020 05:46:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:bfe7:: with SMTP id vr7ls8914196ejb.1.gmail; Mon, 20
 Jan 2020 05:46:31 -0800 (PST)
X-Received: by 2002:a17:906:84d7:: with SMTP id f23mr21155899ejy.106.1579527991573;
        Mon, 20 Jan 2020 05:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579527991; cv=none;
        d=google.com; s=arc-20160816;
        b=k0Ytm0bGgs3rr31QbohvXfxIpO6T4/HzJqnQoFdr4wSAWzEudjUfiXpmZxcBiAGlmx
         AuyoggzXiSqC1cf0icsgQPTKU01gG624Sk7YHKcoqcwMHc+FJ+fDBIjcYskRu+SeBqQb
         1b6JzkTt93Rq7ujEiAnEr0gYknHkIt63WJ3B1vW3sBdGj97M5WZ3PNcMne5I1O1GfYfa
         fmJ+mZTgy+VVL1ldqaZzMYSt/KSAh/PF45tPWoM4AVGabFSGk4gheeYKvExz+O1vTvHf
         N6HYIigxyaJpLIP+OaKPtp/EohEwMA5rVZGB7mOTd7ceNhog9vcA8smFkZhnOnOv2Rg7
         x91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=0poJtxbK8AEKkiOmq3gGd/MnQU2zQUTH9vS11rydl3w=;
        b=ga6Qt8/QgcE3HA01p3jBzH/LRO/Mmz5tDcwkUo+yvIWXTbDF/tXT+GlV3Sper4Ohuk
         Y/AYFe6U+iHQ43ETT3ymdS2BO6nT/fjorATA0PECrteXZJZiHjZCVJqRdBkJOOsY49S2
         amlp8B3EBR4MejFvNH5L4+zdhCk7ji67LdlKX+XHeOSQb17BeykSKyD5b5pwFrYfXSCe
         DgfZrXNEPQpYq2vcL5aYjXwWg5PoqPCFviW77xl2KI2C/YxxVvnYjQbEd+63nfz1bnX9
         Eu17OcvFMWAXGx7iIeX//HgmmlEPefBrVHm9p5R6VyQipGBC6eYUuIU1Q9UdwaY9wO5u
         iNzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k9si1249976edq.4.2020.01.20.05.46.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 05:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00KDkUPP023890
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2020 14:46:30 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.69.125])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00KDkUV5009966;
	Mon, 20 Jan 2020 14:46:30 +0100
Date: Mon, 20 Jan 2020 14:46:29 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
In-Reply-To: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
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

On Sun, 19 Jan 2020 23:45:46 -0800
Michael Hinton <michael.g.hinton@gmail.com> wrote:

> Hello,
>=20
> I have found that running code in an inmate is a lot slower than
> running that same code in the root cell on my x86 machine. I am not
> sure why.

Can you elaborate on "code" and "a lot"? Maybe roughly tell us what
your testcase does and how severe your slowdown is. Synthetic
microbenchmark to measure context switching ?

As Ralf already said, anything causing "exits" can be subject to
slowdown. But that should be roughly the same for the root cell or any
non-root cell, is it truly the "same" code?

And of cause anything accessing shared resources can be slowed down by
the sharing. Caches/buses ... but i would not expect "a lot".

regards,
Henning

> Am I correct in assuming that when `jailhouse enable <root_cell>` is=20
> called, everything that runs after that in the Linux root cell is
> running under the hypervisor, even when the inmate hasn=E2=80=99t started
> yet? Both the inmate and the Linux root cell should both be equally
> subjected to the same hypervisor performance penalty, right?
>=20
> Are there any high-level differences between the root and the inmate
> that could account for this large discrepancy? I know that Turbo
> Boost is likely not happening in my inmate while it is happening in
> the root cell, but I don=E2=80=99t believe that can account for the huge =
gap
> in execution duration that I see.
>=20
>=20
> I'm not expecting anyone to debug this in depth for me, but I would=20
> appreciate any ideas I could look into.
>=20
> Thanks,
>=20
> Michael
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200120144629.201f3081%40md1za8fc.ad001.siemens.net.
