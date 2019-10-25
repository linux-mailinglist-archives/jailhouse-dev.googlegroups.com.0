Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBBN5ZLWQKGQEPLXG3IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964DE43F7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 09:04:39 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id x187sf115190oia.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 00:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F8WPYSKsHP/ykVGc99bDv6+I7stKDAJO1pZX8S7hcyU=;
        b=YvGhcgzoYcOAffpMeyRLlR/HDI/BYPOEVUXh6ldZ/IpG7jrLhqm0efMiAWwUSThwgM
         SDf5LF1PH9h8S1Kb2A0d9JWOFYXSVAQj8qHN1PnGwxcyeFYYv9E2jWMBCKDW+2+MY6F4
         MoHqnQ5+UcUM/Dl3t9iQlT9xvzzW30sV5ufr5WB+iISFmzUZc/N1oPmpGP7DyXilRfFJ
         NMv299DLzcJdWa+rssw2+EAfFNevfSfOH9evmrkEfuXHg3OWbUGNZTAbdwNU6/MB+pN/
         dHwAZ207ummqWmscsRIKrLlCHBG8dHLVU8wYN8twWPEHnW+DBh8ZKKtDFgVLN0Sh1I6t
         PV7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F8WPYSKsHP/ykVGc99bDv6+I7stKDAJO1pZX8S7hcyU=;
        b=HhNM3tLGHFuNQouhoreBFVT7HCoWiDEhpfITvzxYLKYy4+MuO+IY0iaLoTSgFYNqQ8
         uT9VunzUcKVDgs+wJGLu9p9MwWvP+u9hHm49S8flHhHDMkKZ7vYOy8basy9UoXj60bp4
         lpF/XrlHRhxejrm+HmRCdYzzHBaEoY07zrwno8cdgyIgUOhZNlSvIGbd0luiZlgvVMfe
         emLRA2sn4pSy3CFJfSkOF7TL43nKecktScOQ/OdSkEkUKJbGOG6g9R/+vcBqTN4ioXjH
         KStgi3SOkcJEuzw93OKpnZUWMwiLb/Hm0QmgENfD9SUxmWHFvGXgH/XDgL8ymVNIuodS
         0Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F8WPYSKsHP/ykVGc99bDv6+I7stKDAJO1pZX8S7hcyU=;
        b=rDh2dR4jN+kF5k9ZYRQ0nfw8Q63PorpH7oVGAncgV1Xnrudight/VHx3GHqfXkascF
         9LAKij77r2lVjfa22mbTnArpZuT7qxjx2r7OXT0tMXXWuK0xtr5aAb+daQKiMBaL/wA7
         p1JKeasQeE2f3KD390RUs0xxd8zY7j1Mr+zlFs51DASv0tNn7BwjW0MTDGwO5zS4zQy4
         oR8fiTcJPOMJaY9igmwZHFEzlogvVfZJWczm2V8mKHqHTMNmxHADMj+6es3wZSxzn4/x
         +MJT7k7pTzgGfvdBinnJZnz2inwQ3yT4jrIUrFmiOCIj+TJ0grhuKWs7zIY0LXi5cRsd
         Br2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXcZS8TlDz1LML9TjzX48TqZw7Mk2q3J1/v7S6x78e9WBpoAc9/
	x368wr9c8MIpdhM0smtn63E=
X-Google-Smtp-Source: APXvYqykWjrHZp69zQ6FwnRNbgcDnikaseUSpuEYnMWYbzVbiz4LxCfXdNUecSOT/4q1A+vKFC2DEg==
X-Received: by 2002:a9d:5c15:: with SMTP id o21mr1384628otk.115.1571987077548;
        Fri, 25 Oct 2019 00:04:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:7549:: with SMTP id q70ls141421oic.9.gmail; Fri, 25 Oct
 2019 00:04:37 -0700 (PDT)
X-Received: by 2002:a54:4402:: with SMTP id k2mr1589374oiw.66.1571987076838;
        Fri, 25 Oct 2019 00:04:36 -0700 (PDT)
Date: Fri, 25 Oct 2019 00:04:36 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
In-Reply-To: <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_211_232376171.1571987076199"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_211_232376171.1571987076199
Content-Type: multipart/alternative; 
	boundary="----=_Part_212_2028547967.1571987076199"

------=_Part_212_2028547967.1571987076199
Content-Type: text/plain; charset="UTF-8"

Alright, I have test the latency from HW IRQ to application response.

I found out that there aren't any additional VM-Exit or IRQ, nor RTOS 
scheduling and house-keeping.

It feels like the processor is generally slower as everything takes longer 
to run.

The IRQ epilogue takes ~7.8us and iretq ~2.x us. In addition, the libc and 
syscall interface also have slow downed a bit.

I do notice after upgrading, even with CAT, my RTOS latency are prone to be 
influenced by the Linux side applications.
This was not observed during v0.9.1.

It's strange.


Yang.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43%40googlegroups.com.

------=_Part_212_2028547967.1571987076199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Alright, I have test the latency from HW IRQ to appli=
cation response.</div><div><br></div><div>I found out that there aren&#39;t=
 any additional VM-Exit or IRQ, nor RTOS scheduling and house-keeping.</div=
><div><br></div><div>It feels like the processor is generally slower as eve=
rything takes longer to run.</div><div><br></div><div>The IRQ epilogue take=
s ~7.8us and iretq ~2.x us. In addition, the libc and syscall interface als=
o have slow downed a bit.</div><div><br></div><div>I do notice after upgrad=
ing, even with CAT, my RTOS latency are prone to be influenced by the Linux=
 side applications.<br></div><div>This was not observed during v0.9.1.</div=
><div><br></div><div>It&#39;s strange.</div><div><br></div><div><br></div><=
div>Yang.<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43%40googlegroups.com<=
/a>.<br />

------=_Part_212_2028547967.1571987076199--

------=_Part_211_232376171.1571987076199--
