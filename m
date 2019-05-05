Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD7NXLTAKGQEHTAIH6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405813EB7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:10:23 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id h13sf6393731wmb.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:10:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557051023; cv=pass;
        d=google.com; s=arc-20160816;
        b=rNJ7y7jhOMcrzD2ZbDfzH2GWABP8tiXLC5ieDM0zwyRt8kMqxFNYN3X43cDkzyQpLV
         6RIJcDe6BV1iEhZIEK1FKckHwf7xH7269VG2JZzGphXfvKOVzw4Na2dwWskxSroMvA6o
         BNJJRpvNtfnY5efMA9Nfa6UxAtn1GJ1N+btrZk39B/fO7ezMbojksCXWwt6b8hUuJh+U
         Xhfy1Ua/fg2nGmAOBufccgraxJKcywCLr0emS0IykaNFDQaLY7e0GlkKU/r9dY9FN724
         cLBa1gPfZfaAk5au9j3ciN6aMCHoiQSwTup1O/+hECn02afJIP8UKLJLANuTulEeheau
         ehRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=k68fDGsijR9hBIjvuAUzBVzxZtca2ezUPmq9+0jOBig=;
        b=SQwR1Ye93IRekdZLcVOGJ66mVimaeC4yIRzf0ffJXXobo1EKPLMcokZvBYRJnkE1ia
         I+peTIemu8u/6Kvv9kCcA/Eh+svxRJL3bMY9neYBJhFfEmcIXqdF18pkE+GQbKeCUUSe
         j8zPyBPMYCKXXQ6Txzq7rda3masVCsZnj6+wJ8e1VNTkdPJOnQAo/4khljAUv2AsXMJp
         wZhq+TFCB8kyQS1Q/JCeGJJuD6zRgT5vWlXqxODJHjFAktEQcbUmVBDKoi9ozlwmJ+mU
         2yZzUeM5XeZo7kcNc9RejL4pbO1XcCAMEnpNMiXWwFT3BNQ8DMyo6HmIDn11648o4MKb
         ACTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=U0IJSw7F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k68fDGsijR9hBIjvuAUzBVzxZtca2ezUPmq9+0jOBig=;
        b=KfrLJufcBSU03IVdKT6OXegxqVSUkg4y/wEcBtIwy7jrIzS7FDEkcR/pwz0gjk26G0
         Br2Q0wTXXH+rKfSu1mJZME3+++Krpc42eOyQxmJvTnbKhjpIaCzP6LoZKdC0Yr4ixGTR
         EN6vRmjXs8XiEsHZjsYDsdrssOi9tq+WO2uXPIbazjMD4IrssYRGfMQoW/FGwr/7JfaS
         29LNmULw56rMqNO655NtX7/gmEL9Bxa6YF+tOs2Hy75I8wsqlCs3qcy3wrPDjatY2cFR
         54Bd7vpRLzqFTswJUvistUJqB/n9zob1543WOzyTfI9EZejVjXfaKfzOvaanddr5EZ9D
         vQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=k68fDGsijR9hBIjvuAUzBVzxZtca2ezUPmq9+0jOBig=;
        b=lnigG1zsWXoZgJwuyZifXo2aAUNQZFGAHugdYrHg/zGV6f/G8rgKsjmcCliPG2Tzc1
         5yKamDmZ+YhmxyYVw4eDQhK7tPemO8m8b4hriJlcAJ3cQK1F3bCYkfs5isUN/aZ7tAXd
         7ldxpVceBpmA6mCsjVroo5HsWv2GY+xOZ6eq2kJPD51rL1peU/vTcxoKiR2Cosh92zDX
         VnyWf5DSPI+GBFURttmHu36qMjA9ngH3+r0cq14BPKrJkgg3eED+OvD5CaoydEDaVIJY
         iBwn6QI/sCFMUZMG+v7/ZXlhVzk00906xy8m265/T6BSJMTFQZlsZR9N/JUJtd75UfAY
         0nig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVq0MVRmYvFru5qrQ5K38ur+/N1V0pJbw13CW4pa5vS8Kn85hKf
	LIPHFWD2bXJE4EqZlVUXWpA=
X-Google-Smtp-Source: APXvYqwCIAr9zqD2XQpb21E0Vk/uNbPYbs8zzpWxB5nYipJ+uzlHk2ZISlkoQFU1FRrc00N5m+YuBw==
X-Received: by 2002:a5d:4348:: with SMTP id u8mr14654732wrr.129.1557051023235;
        Sun, 05 May 2019 03:10:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2318:: with SMTP id 24ls1097545wmo.1.canary-gmail;
 Sun, 05 May 2019 03:10:22 -0700 (PDT)
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr12598185wmb.85.1557051022752;
        Sun, 05 May 2019 03:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557051022; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMssgAgrYMv4NutuBY4EvXkC1Tu9+lfVxEe36adh9/LUzi8xyvHZCteILs5PP+21bD
         xZO0hXjDBlfwy2ATQOWiQkM8dZhZ1WrhfFBX3bLM4iz73xqoM7nTepX4npFgmAteTe0v
         BxXDhmBxR69cFizKI6wyzHu92FJfEObFJCPviPxgOfipKJQWJW9GYG902h4QuleLYBOb
         ctsR5kHf5AsH/07m9buzepe8W4dL2VPj8zjHUtYgdMFFHcfgpV2+8UagZ3CxxGOFqe4H
         AXkA3hh1PgPHwIxG74+DrjHW8AjBn07HEh3sunG01ytCwEOH0iNuVb6fv696Kqrc914i
         lFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=bcfHNcO00/5TLA2pPpEH92Pt/xWVpGFOrt8HS4t25/E=;
        b=KoI1n5g80EKNeu0agKa8Xy9ChRwEfG6Ymr3/LZrUUh9dCcUdcHMwCiqUeUs3aqee5x
         HrxpH4AvpLzP3fe4WGrX3m50stFgY3xbY+nzXv28ZQh96yZiM1XFV3/fFEO7hMpAoNu/
         lxa0pZEVJ0A66O9qCfbyp1mFalV+Pa68O+i/4sbQzavMHRSZLuqCch4Fq21EeNnu/azj
         Dkq+xvG6LBhrWz6kGx9NYR5AmIR0L7s+5zC/aGYvwaD8680F2yHHBsgaw2qMJK1Wpcfx
         pxyc0m+apDU+OLxpn4E4IStXwenIcmgiza5COXxHnC/np++QDwpwu+g8s2ColbSgG/Dc
         m/qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=U0IJSw7F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id n21si780764wmh.4.2019.05.05.03.10.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MgOQQ-1h8QH20z9q-00Nlgz; Sun, 05
 May 2019 12:10:22 +0200
Subject: [PATCH 2/2] inmates: apic-demo: Use polling idle to avoid latency
 spikes
From: Jan Kiszka <jan.kiszka@web.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <9e743f60-c26b-4576-44b8-3290be26a9df@web.de>
Message-ID: <6ee020bd-3bff-12db-3d8e-ac3430c040ad@web.de>
Date: Sun, 5 May 2019 12:10:21 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <9e743f60-c26b-4576-44b8-3290be26a9df@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:3XNY1e9Lj20ivPYBLVWxntnrkW5mheiqHXq3UmMA5amG1UfiWFP
 wqaTlAx3OHnmMLWnDg6zZ6iW41qetf1BZPrrA6+Aou12gBm0TsCntjN8gk1uihXrDCXhxPS
 BtsHwXMuozApyDSXbmXFB8ECIo9Rw27/Pl1u4dnZOvrMurvakC7wcN9yWdlank06xocbkVx
 NNMlVkM1BiW2JKyPAHMqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kThsamL/+6k=:nLXgIEti6ftmC3Ql3Xcqgv
 OEsgJzEe55l45bJS3fLepfA48F3Z9YpNTLVzFlS5Fm6Ngt9pR3oOw+t65+u3m58w8Ozv1n01z
 JV9gU0UIhNSr3tlvd8G1fnJ4xLCUhU/sWE3mG4AxiHE2PGW8DTjRSDC7u5pJ/kL2vP1MMwbls
 3bEcORHvAkfeT6YFbx4L5/My+B8GZWV5P4K8pncEW5hxDryeh6sY7Y9etRSvHHB+eN5nM40r1
 CQJIXHTYcpP0wTDJ3xtwowqasIUvJBXd+lvYpJCY6revsXnLT1pIQgxkvYoutpnpRFX2bBJFA
 U6iYkglDUBp02pSKGf8Xsiw39c4kgz8WdVIEPuvceAQBAwtAfyZUDV4gPjFVTy0LmCFMH1F/u
 cI8BXlt0WqemWA3+ZVPP14hp3IcehQpi/Gkhg9HxTSkoIKA+FhL2+/JIL1zyiG24nTnGpnSD3
 jixrg7hwk9v6A4iLL8Pabudo/cCFcH08jjGekRfMdHdxysvmjNdQdTs9mhm5zVtiSZPqMGB2h
 nwbafLVXOJSMDl8FsJrbY14+kr4JZY40jaBfXZFcEaD4Xucbtcn+61m/zpTH1a8BS/jgM5RoD
 GUwpxbAJP1kR/8+pzBwpZrhNBWGOLHpvLWWxPdaQed6myvZtf7awGtYSa/FKgZgDNUuZGGppv
 h97DpxEPz1jITJOcV+Zj5rxwSVSTrSoOjQhvO3rLosu+KA0XuT7J16CHljXtmLLc3CLPX/QeC
 ex6Ik4EBayI2hvxUrlNQT8ia9p3IMxGqMuCcPT4BsVlG/LiYS4P3crujOxkpTg3aO2FfxwRWc
 w9Fc8cFq2NrPcLga88V0Vcx6P/YsQcvgSbLOPVKWQn+PL3T/R3i9jyubTuqtmxvWhmodujufZ
 pG3mkmxnTWHJ0xl9UODtBPedmKkHdoOcGeMvXjnGiEQ9I2V68dTqMr3tIfsHS8/yTlh6wUC9k
 ADzVWJjYL3g==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=U0IJSw7F;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

It has been observed and also confirmed by Intel that hlt can cause
wake-up delay in the order of microseconds, although no particular power
management is requested this way. That's obviously because of
unpredictable decisions of the CPU how to react on that internally.

As the apic-demo is (also) about demonstrating the minimal possible
interrupt delay, switch to polling.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/x86/apic-demo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/inmates/demos/x86/apic-demo.c b/inmates/demos/x86/apic-demo.c
index 2f3a6070..5b88f2e0 100644
--- a/inmates/demos/x86/apic-demo.c
+++ b/inmates/demos/x86/apic-demo.c
@@ -131,7 +131,7 @@ void inmate_main(void)
 	init_apic();

 	while (!terminate) {
-		asm volatile("hlt");
+		cpu_relax();

 		if (cache_pollution)
 			pollute_cache(mem);
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
