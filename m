Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBV7B42RQMGQEPNZXKLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483F71FD10
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 11:05:29 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2af1eda690asf16630691fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 02:05:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685696729; cv=pass;
        d=google.com; s=arc-20160816;
        b=Is06Ot9IBpvRz+Lw3fFUavp9sZHXOxpxPngON1Mr5YwLULTTePRn7ZnlcgcEPNiHWy
         vBANmejauF7HlpxHeNnjoQ8rRjWmxobxG3goAbAWdygtxv9kCi6InpCVUQPtaf9xGwwr
         hA8nfE4ym8EgUIeBl4ElrPWPNyl0d0cfG5KK8sKF6KxiBJCnnjzNWm7EBjwSRb/pnnue
         H+vtBb/vXfUDkO81PGlTajOvKqHhNmipYQanHGScMeEkWIzJOdYAJ+gZMGSYex1u+wHX
         cMmBSOIhFNqqImcyfXSS9skWZ3aemvGN2ORFrbwk3lt7OxEw9eK7p6Klf73v7ZuNKMui
         Uv1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:ui-outboundreport:to:references
         :message-id:content-transfer-encoding:cc:date:in-reply-to:from
         :subject:mime-version:sender:dkim-signature;
        bh=xlrDzJlbgSB228gmteo/STypb9I7yQ+qUNWF70HwAjw=;
        b=HkRRIMWy1nHz+Znzr6GL+ddOeLzSyf5/UkLpE7G1bjE0z733XjJbQ2h8hT42x2XlRQ
         x6YJjomNUbvQ/sAZyDCkMxmiH1rOmhWw6fs4k0Zq8ar26Rdpz20u/D2xkwd/MgPcxxXO
         i6H1vtPAwRDY8bwcsDd+BDBI9GSxLV+yGuqHiriE2MInw3wTqN/262L4X4qbNvp7cF9t
         hjOyCGh+rRIlB8S8kg9Vni2au5xO3dw6uCPtW5ACS9EA1kYArGs4mFjAJvqyDhtZb5f4
         AHxoSR9DzV7BjdL87cKQ3woanIKggVpFfaKzO1ybK52Jjf0HHBGu4NLjOLrzgRmSB4bw
         ReZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=W8h4ucZ2;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685696729; x=1688288729;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xlrDzJlbgSB228gmteo/STypb9I7yQ+qUNWF70HwAjw=;
        b=e5MI09Lj4MWaoziE6l2ZTXT+ii2bk6DLVLtQ+iAIdg6gtIhKLW4FpfokruVA99rCZl
         um+ixz0/BPJeoCS6hyiID/LC3ioSH3K4S7LwgsjeJUbCYOOyOyeekd4riONtIjjAlrM2
         JaIPVLHg/3djWFf7shzzq+/ULcza6xO6X7L2+TbF43IRyDlah1zlIYVH9KRtzzRBqGK2
         IBWQBbvtCXYy1+kz3kcKRPxm4ZIerCTkxGaSWGJezpn5zsjwcGYK1QZOxrsQDVNwBy/K
         Q9CM8jBYzSQCvCvdJ2zP1nmnb/d08RfPR4Ndg6pBnrTwyoHNuzcuGy3DOXB6AkGv6Tot
         Y3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696729; x=1688288729;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlrDzJlbgSB228gmteo/STypb9I7yQ+qUNWF70HwAjw=;
        b=AwfhMBbsYtxSlGfwVTstCxJL1l9w7MTbQX81pukjW9y6lnr6FDX28kuyMK63TOi+ch
         g/noR0FfiZ/tUjd27nrRd3ePY+6QSXkCRNmtZqRMdFeU5vbu70eqratsdt04ezQ0Er3F
         GlZiR546TmEAtrjvD92n960pqE8XvyF5e41iOHw9d9V54QRGxdGMf20qaRaxqiII1EeA
         D5ZIB3XRv+xssHyVWUDAoIC7C2rbHyHiQB9BlFd5fkPs+znX7jXpTY/Mj5EHwBeWV0ql
         tym7nbABM9d+itx2fnOPbKFUjc2q3kM/2wst3rMUGsC3Nf6SsgKJ3EMNKWssq6FA5Ybf
         hLJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzeKwShS/OaLexHJ9o4Rn58fSnlY3t5ctykFvCv7kyEhKAgRPCC
	UNhTTZNyEWKyzvVugcJPSXk=
X-Google-Smtp-Source: ACHHUZ5KUnSUDqN5l3y//sOr7H/heOSe7kVGeqs5J9rVoN7ADLh1QvZZDBafITiGwAMj/PKVJt/jRg==
X-Received: by 2002:a2e:a0d7:0:b0:2af:1561:a73e with SMTP id f23-20020a2ea0d7000000b002af1561a73emr1035258ljm.52.1685696728195;
        Fri, 02 Jun 2023 02:05:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b634:0:b0:2ac:8284:e51 with SMTP id s20-20020a2eb634000000b002ac82840e51ls192294ljn.1.-pod-prod-07-eu;
 Fri, 02 Jun 2023 02:05:25 -0700 (PDT)
X-Received: by 2002:a05:651c:219:b0:2ad:8f4a:1e52 with SMTP id y25-20020a05651c021900b002ad8f4a1e52mr1253923ljn.30.1685696725826;
        Fri, 02 Jun 2023 02:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685696725; cv=none;
        d=google.com; s=arc-20160816;
        b=0FlP6KLgEBCCySqpB7EKOydi88/CclI/rSaRY92kwY+1mwPjL540NtbcqPfBg4V/71
         bm8Lw0g9FnD5zrBW2N8N7gf2tGV3JQ1yRgExq6HBekhOli4ei6YZB1LqfD4HGovLgQoX
         Swh2LmfOZwNmfWKGy+/I+01w1zVAgelY8RTqHdzTFIiyk9hBLOsF8lCLvfYM7R6w+lHG
         +6NknX7CfPzBB2TDuJ6AonLtKkd5cWYWG55CayMe2Dww73dl/FhF5sEPHzYCqB1W9jYK
         w2Yst4nK7liXsKS41VYZp7x24EpeTTmtvTFXdxp4JVJqbpzSKko2KYbKt9DbU3EwgwAe
         oBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=GqVBjDQ/H7zDmX0pvXRf/Gim14UEw1HNinbxUzzehCs=;
        b=XbRy8b0PyhiKSlAk0TvM2n+O8A89UAWeBYXnwVTQeOf0PUrDh5P7d9yY+gYeNl+Zu6
         tpE+en/D4JsOGgHC/4JR8baFyPKhhiFrpFbBe8K7bcUbsl0IA1m5oW3CQdA/KcvVgSpH
         rfVxBdfTnU7S+XYB0TRXru4kTmYdS0+91l/aghbmzUkYU4Tw/rfurEYWn+hZiYnMinMN
         bRiAt2AHdsLMQ2nic2xcNUQxjV5eDTKcw2pUQ6TI6akZxvFqYSOtAXeAyELhUURhTtuF
         vCbp37p2sOHPLAijzRts+xm4DAQz3bZOU1VTr32xliD7lLOHmBG+8yYjxjMVlNmE4uso
         Tc9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=W8h4ucZ2;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.18])
        by gmr-mx.google.com with ESMTPS id k14-20020a05651c0a0e00b002af15d1ad3asi68507ljq.8.2023.06.02.02.05.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) client-ip=212.227.15.18;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from smtpclient.apple ([5.149.24.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1qDQs13UlV-0104z8; Fri, 02
 Jun 2023 11:05:24 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <20230602074808.1383333-1-bigeasy@linutronix.de>
Date: Fri, 2 Jun 2023 11:05:23 +0200
Cc: jailhouse-dev@googlegroups.com,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Martin Kaistra <martin.kaistra@linutronix.de>,
 Ulrich Wulff <ulrich.wulff@kumkeo.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD7FE16F-42F5-4D5C-9182-2AFC442B43BC@gmx.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Provags-ID: V03:K1:6retPjZVhUPs+dcykHANlA2VySXZ3gWrc/KqUBKqscsgAfUgvbr
 yxLBceO3bgmkgT9YQwuchoxg8O5JBD56olw+igCfbbsnMzIFmRuN6/PEPXdYfCVaNlIwD8W
 cZrEqr9yW84lUR471jBnzMSSNvF9ZxlcqBmfDILgoo4yiCy2ssui/KG8nHFefr+gI7hQcjn
 XAR+LQ1sq4lP66C1PqN8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GMDtMFttCLE=;cfPy/7UomUMrex1X0XTiQB0oVQs
 RaiLLMV1lPjVUYMzzCSZ/wDP8MUcdQ7tMcE814tdtAxhPOiFVTh/qMxtj012V66gW9FDHSM4G
 oFbK45TKzGEcwd+QQzTXD3WuBIS6TN9rvIcgNDVbsyPDJQpBZqt87AWiF2/HQNMyw2NvcT6sD
 eY26lu8phh6uYtIoiknc/I/5HkS+spNrge84UB2EDnjzMQQ4ahyg0PQzUerLtJVUFH/1Q0JG5
 W+rvpXywatfHfnHUCxNhQHiEaR3XVuSmHYLZKSdjfSBMhxMnohpL4nRG+Gv/pQQQ4AWNCc23J
 goefaqj7fkJitCNylRt7oWs0Dzdf78WNydfHVGRa9ZZ7aHYM2SgWsJimt017DwthlLsbRFIUE
 mqSfrGdFFB9dKjDceXWhLRlFB7+W5Sed1KRcSJkmRWYWkhEEAoqnOKcK3JNRqSRm84ipOJO/N
 kBnzwHrGdh8vJfliVcBPK3pdhISMGLqKvgLPO1h/d3sbMOAVja8sga7V4f3Gvdk8MpV20CnQh
 1pe6qxksqyCEGG3D3gn3Ty1L3CuNkWS+Vl07W3d/eJMVT0umA6XO0URAcBput3POQ1S/gOBDg
 d6XDLsfzymrHeTZlz9nK5ETZlFQ+iNM4/C7RMniapp2XEHwij/9zpMP9ouzS8to0r9CxlGo9V
 DQJNYg7N48+0jaSJFnQJ1lDN5+3Bb8MKsh3GigSe2sF8c6CmF96YelNRoEVaoGr3V6h8pY/2S
 2b+iLddL0E7/gD7sW5fEZ/Ky4P8CBTVignO3XOcQnJ3oWt2BR+n9ix1Q5UuWj4gdopXgm7PoY
 EkzOvZn7VfXXY2h5HbrdWnSDGQTJZpwptNvU2gQfX1XlIL3OM0kgs0y+29IiAQiRhbQSKYBeh
 wp92D/cSAWB6hQIuXtKHadO5AJ3M92+ruHKnvSPX/6pzWTanCuJVCKMTqtqnCVezLS7qVAFfR
 W0YOvUFYtSNn/zOQ+F5NIbmsv7Q=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.de header.s=s31663417 header.b=W8h4ucZ2;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=gmx.de
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

> The problem is the cache flush/ invalidation which is performed locally
> and signal to the other CPUs in the same cacheable domain. This is
> required on SMP systems where the memory is shared between CPUs but can
> be omitted in setup where each CPU has exclusive memory.

You might want to take a look at the patches in this thread:=20
https://lore.kernel.org/linux-arm-kernel/20200223192520.20808-1-aarcange@re=
dhat.com/t/#u

They address the same problem but offer a kernel-only solution (rough summa=
ry: tlbi broadcast instructions are only issued if more than one CPU is onl=
ine in Linux). The obvious advantage is that it doesn=E2=80=99t rely on the=
 cooperation of Linux and the hypervisor. There may even be a chance that t=
hey make it into mainline.

Oliver



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/BD7FE16F-42F5-4D5C-9182-2AFC442B43BC%40gmx.de.
