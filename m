Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBMUD2T3QKGQEDGKQTJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5320A63D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jun 2020 21:57:39 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id ga24sf3807079ejb.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jun 2020 12:57:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593115059; cv=pass;
        d=google.com; s=arc-20160816;
        b=g1qjobV5vpIhLZP86BjbHbgiZrHSUMNmXfnj142fCLVqXbpx9SK/uh62J4DfjWi9Dz
         taL6cOQSItNoacKNpdrlP3VTWpG1Wzc2kQiMCLwE7pKKrzSkZlacDXj+qRRiKjCB7dik
         0dHHJhTZEmNed9yh7FWe9LsuvqJno8EdziP/MB127zlMoF9ElD3Bhpoiwp0UBZeWWZhm
         EEbL8K1Z9siEQycIwByG3uGCqMCpRVjLQ3kziEbuT0UT5yjUMQOyu7tcroKcw6YK7Ysn
         1HbX6ZC2BHDwyKHDbwlkBE+NX2AG8rvTSXnHL6dteQHbBVYPeeTp7VHyxiysH/gbO3Gm
         7mQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=0L4jvypxY2M97NhP0PzVnSrkZc3AQWovuxur2JdzmsI=;
        b=iFAaDXmTpMf59fwnZFxG87pweFM5tIK4KK5Tn3nkQbGPCh7lTOLPP5xektsvDVZ1Rb
         HlEGhDWuk8fXB3yPTZRR6jKEe1d/3APzCgiepMiUBZEGPeQi1/J7WnJtXCs6DFoh/3DW
         W5tuuF3NulAh545Nac5JOVIDfJgY6ppDkAzWg6Gao6nyR6abs9Il3VakmnQdRcCdmMfG
         qX9UacWoOM2a0RivPQ/IrIJAU6XtRUkFOTIT6F+SToawT5WBdOLXpd5m/SAf7eicZbGk
         BZm+QxLdE8ibDT7kCCZCLAQmD9S7zYhBmOf623TDa6b5jCUtTtJa8VNpzpMkO48gOZsG
         dEmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0L4jvypxY2M97NhP0PzVnSrkZc3AQWovuxur2JdzmsI=;
        b=GQ9Rmr5gQ+BfGdfF1Rb1Wsrhor8MGdsB8Q9fqVk24QOOw+XgylsS5eh+lu/5o5lYDg
         sTdpTndGfanMpnugyYHBR+WOYOAsnsySFXf1+C+CKViN+puQhJGLGLE9H0DMGH5L+9hk
         P2JNzJDiZnRErebAG1aDkBFGkpkRWjtXBQNyDSxx+yeJzGqFavWuhEBeBZLZRxHzNPqo
         nml6phrgXKWD3Fc5BXrwhuqOEiiZrhHXuGH3uJ/gbf7xwp6TQqtxuoWCMYD/3HlrPisg
         ug2U5rHEdeMaPFXnLgikhrhOdJTCPXqN/gSKzOUddX6e7TxiH88Du7G/0ZEkW4xxJm1Z
         sgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0L4jvypxY2M97NhP0PzVnSrkZc3AQWovuxur2JdzmsI=;
        b=DoZAOm6pdlLbSc1JVEwYV/vzj1mt9T9OL58Y2Q0JWD4JV3rYfrO0t3BzxEPI+JKTLf
         NmFvtVasrHEGkM9rIGf4vHUlBQY4uKSZ8shY6hDoYEq4gvLyJsVRG6n/lZKCpbXWwmyu
         ENRhj4NdvhSKNrS3Qm9Zcc/SZRW7O/1j/b+bODN+djIy7O/FUahBazRzUAkwBMt62SDe
         5y5PC7Y5NAZOyryZKkobVmivcPJ0wgK9rBbbGdrW+VNaTS4gxX2/zAlZi+SppoOsRgI4
         uD5wmM+UcUjSvNu0wdvfu0HSedxrfzzWXwtJlLOX8bnU/hxOqYHiVFWmdjpIedTzYphD
         Lo7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5324/pdF+zW8q1N+Jps42GkXT76rzHsPihDCDV3SmZoY8Fviib4q
	MIHMTn0IkyQ5fiuj+cpsxx4=
X-Google-Smtp-Source: ABdhPJwqedu6ELyxWYlOG5K2jF5UckXgOVuICJ+nNMzLQX64JmTwAUmSbVlJaRYgt3CiZR1ObJnxMw==
X-Received: by 2002:a05:6402:2d5:: with SMTP id b21mr35394457edx.293.1593115059493;
        Thu, 25 Jun 2020 12:57:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c302:: with SMTP id l2ls1502816edq.1.gmail; Thu, 25 Jun
 2020 12:57:38 -0700 (PDT)
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr5802179ede.385.1593115058515;
        Thu, 25 Jun 2020 12:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593115058; cv=none;
        d=google.com; s=arc-20160816;
        b=HJy1KQDsrEtlPsk76WthZ0pJj8o5NvzrH8i6xlrBmWN4adrNglZ+KDTdz8P4qZeIEd
         EPHNnn7o6h3aDE0dPnIgVIImZXJjb6tFwz1YS7ChXj4Fb5+u36crXb7v/nZzgeRxwsx/
         YUYABuJj+qLQZVQLhtOZaroj4dpc6hphKlPsYmNfxDD2+Gc+vsC0Q0zoLzb991GTEuiW
         4Rpu06Yd/iVwjnSS1xSXJJqLrmm1bNyWAJSBDH6G8n0tPw164PiJqyI7iFNBgUFs60LT
         mhoziLfe6N4GsT+BC5+TiZC2rNu1dxHRpboRGvTYI1DqAazJiEeD3/oLXmlY+HfgmYwl
         fNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=QHXT7njUjMUh31g7GqjO/yZpU8MdaNksbVdYfLfvJas=;
        b=m9Xta8mdinGFxUoL/7TM5Ya0eKYcw1QQ3YpZs+oQ+2n5Ssgr54RFOv4wYNEnigmRbm
         WpN2Tgcld7yQPvZWxCmhTIUIE3ondLMQpx6q/YR5Y3AtnZAfMkVHikxeN/xSx3wPCqxT
         4vOa9ozW+9KIx5PaFH4HOV0LCCNXkv/q1PIrog5brjZq8XT9t4AA1Peih9502FKYfIlG
         2IlNAT5mF3eBbg7AX/nwEOt9j2tEbWGFpZVGn0RD3t38bG3EiLoxiXfP13NW6eqhSK2q
         EnQJhIMVbJUYvesDNTr26FMxrE+mxshSWxedyFsYXiRfdzOiTugYpcioapBMg2TWsHwX
         TJsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x21si581280eju.0.2020.06.25.12.57.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 12:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05PJvbZm031027
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2020 21:57:37 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.33.82])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 05PJvasf025459;
	Thu, 25 Jun 2020 21:57:37 +0200
Date: Thu, 25 Jun 2020 21:57:35 +0200
From: Henning Schild <henning.schild@siemens.com>
To: "[ext] Jan Kiszka" <jan.kiszka@siemens.com>
Cc: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse
 <jailhouse-dev@googlegroups.com>
Subject: Re: jailhouse-config-create: creates many overlapping memory
 regions
Message-ID: <20200625215735.12848c5d@md1za8fc.ad001.siemens.net>
In-Reply-To: <e01e34d6-3be0-57f6-fd07-ad540aa5c4e0@siemens.com>
References: <785d19a7-5a7c-4157-9e45-f4ead7c37a08n@googlegroups.com>
	<e01e34d6-3be0-57f6-fd07-ad540aa5c4e0@siemens.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

Am Fri, 19 Jun 2020 13:22:12 +0200
schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:

> On 19.06.20 13:08, contact....@gmail.com wrote:
> > This issue may be in the works / known -- just to add another
> > example.
> > 
> > On the this x86 box (Edge Up-Squared, similar device class like the
> > existing nuc6cay), jailhouse-config-create finds ~100 memory
> > regions, of which many overlap and most probably are irrelevant to
> > actual use. jailhouse-config-check coughs them up again.  
> 
> Yes, the sysconfig parser has a problem with sub-page memory regions.
> Unfortunately, this usually requires manual cleanup (generally a
> consolidation of most sub-page resources).	

Is there anything that can be done about this or does the source of the
information simply not contain enough detail to fix this?

/proc/iomem ? Maybe in its different versions with different kernels?

Henning

> > 
> > Apart from this uncomfort, just for understanding:
> > 
> > What happens to resources *not* mentioned in the system-config? Do
> > they stay with the root-cell or become completely unavailable?  
> 
> The latter. Jailhouse denies access to everything not explicitly
> permitted.
> 
> > 
> > In theory, how would I make a resource inaccessible to the root-cell
> > (but available to non-root)?  
> 
> By listing it in the non-root cell. If it was listed in root as well,
> cell creation will take it away from there. If it wasn't listed, the
> root cell will not have access at all (as long as Jailhouse is up).
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200625215735.12848c5d%40md1za8fc.ad001.siemens.net.
