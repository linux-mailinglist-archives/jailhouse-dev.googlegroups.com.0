Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBR4537TAKGQEEY5QXYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCC1AB17
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:44:08 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id x9sf6835068wrw.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:44:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557647047; cv=pass;
        d=google.com; s=arc-20160816;
        b=l4np/qRBIaWpRqKukSYXEuG5AojcIhDYTrY60aVQrIBLwvYf2ZwCV6Dxa+WrxUDzBr
         atQcefiym3OaW3vXnBp1H+F2wcrb5l6D3NUdorV4GMATTdYpeW1c1TCxkJLFzgbuGXru
         T9lnbip85TUzGFjU1iV44oMh/ULNfo6dcTy0cs+PxJNsy6/8mvtStfNiOYDMpXzlSJ8l
         AHIVO8phEt8JEk7YTqF86TiZ58q1FeFivolo/RwwS73I48dStW8o9mcWFRaM+a2eEVUo
         43X67tbeZx9SmqmbWmJX96pJQDwieR6tRHsos0WKjtM4GPxdLthkAAmw+6qdFQrd5SbO
         55Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=MlpjVOZuDefy/bB9pDlGG4nZBA9vG+6fx+H5uw92XYQ=;
        b=cMXhrafds4wIAsTV/epQgMcn3b1fpbYz57AnINs9XuiMtu4BRYdWu0vpcz+du0h/uJ
         x2jYrYBWiKNOPcaBTz7K5qY+ZRyKr+HHvb7n9Jl5QbhgbSxX9gLYCurPN8vVUQotNpsY
         OcPU2UAoP3ON2BvB7+dHRbsafx+Vco0rpd21reM/xq/enIgDV5vk+vr1ORK+TEQY0os1
         hAaRnfhPmqfQUFhtzKB9KF511Nkkrn5PaAPsZIIukWxC/jq1/mKY7VqGs5zuWVRWqiq7
         lK4IU1fESuukCggYCXLTz2wh6E9gu3aSxx3rFFicON0i9dLjaw1VcPzY2oDvPJyMFYEH
         ICmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QR3Jc30q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MlpjVOZuDefy/bB9pDlGG4nZBA9vG+6fx+H5uw92XYQ=;
        b=SxYTlbtrHmi9qkhBPaX/TEliFSJkax1L31rTJ5LhaIrFiCSFXNr3rFQucl4gFF1IzQ
         jquz9UsZFK+v+/J7fLiO6Mway+0SY7dd5B9+RavknRJYyh0QYBcEh5AWl8OPyQj/vdAL
         g9VVD5BJrwHo2enJvhuaB/ghlzT85ZG/RgbCnK4t8F8lTxOdWAjZzeFrbas7svyAHeCP
         /0LIBkLwDNmrfXbuNoDE7btZW/+HBy1+CNL2S8FDVXQGuR9xKnoPU/Z3F+CUqq5A12zu
         tyJ22NHlL9EwYm3+Xe4v1L8CXjfQkIhEpTfP7Em8pLLGLneX62JVkJVhkSXYdpee+eu8
         Dovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MlpjVOZuDefy/bB9pDlGG4nZBA9vG+6fx+H5uw92XYQ=;
        b=rMv14BCzvF1DVhFkdM77app5+pVFQmzlr7hir3XFxul3UFK1ABRhkF3caaNA1XLRxb
         pH7NTlQGURuJTkkLy1V0UYqaP5X5KWOW9cvsiCLoW+XPUQsWnzW3M3xumaMSgkv1bTTW
         k5GdfgQdyNe2QYjiqqHYozJpu7KCzQvbKX7pWMhLGXEV/BPDnYLl+UP65St6ArpnoexN
         2TZN6XNGgEparmPT/oV0A3YtRIv+ZiLjNLDJZCkiJXeXaQ2cYBExX1v3U0dy0FuSitF2
         5tuUQJbhg/2Py8HwDSFEaWKouHow3pERvqKHI2BPRuZz+2uU6XJeAinMz5S5reoP4iBL
         gPRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPSqZCJfk1wki82QxBSIlnuDyVTYa4bZCCqBtc+wRQ8BsI2Dwr
	SGoVDiqS37JtWfnAV7Kboqg=
X-Google-Smtp-Source: APXvYqySt2zwQKfytdO0zkzmVIjPKttD2RXX77hW1Qo7htqIIvcPPCatTDLdIZXrK8pQtE55noeW1w==
X-Received: by 2002:a05:600c:54e:: with SMTP id k14mr581292wmc.17.1557647047759;
        Sun, 12 May 2019 00:44:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8083:: with SMTP id 3ls2369438wrl.9.gmail; Sun, 12 May
 2019 00:44:07 -0700 (PDT)
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr13760438wrw.152.1557647047231;
        Sun, 12 May 2019 00:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557647047; cv=none;
        d=google.com; s=arc-20160816;
        b=VgpFX4RBx67iGwoCh+uXH4yLmHP8rnIXQ/9libYeapsTKWUKTLa85RZ2lwZSE6Ap1t
         T3L5DQlP3kdFtwnHVUPEtBCec7xMnnB266j7K1dLmfJghtgHG512rjA6QpoASU3J/6og
         x5NLllkzW75YMUW7QgiufBBV+jRvi2ywpdjIpLqhEdDa5dz4g53CZmzn7KCx6GGaBsi9
         5nR+mi+43Bh4U3BRBsdIvFnBVUGcJe1WwCGiwEo0ht3IjZaitfGIz6Amd36xBfzuyWGD
         RygjA/SwrT6D+ZbmNEtW5wuP2/OEfH9uF/qVVCUpMd/CxL6bg2oe9lE6CDrgBzt2nDCB
         zJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=9pbmzX0OaUvg2O1B4+rhCy5OCPV9FQi/XzGivoqukzs=;
        b=DfffWsuD9Sf7UtyBTHHljChBLlPTp8tg1yRQ80Vwquno2wHIZ701uZaV5pripqhtTH
         b5vw1NPl44mJ58J8YkvLAI0oFyAxIt2jRMCVG7YOLsx/a/uJwi/LbBVI+7fUMIru+1l6
         YXlrPto9+xJFBCn/XQs5XFoaEntfsjxd3PSRd8/pAyITSI79YgNg1/IBiWWKvKUWLQnT
         mYZlNOehd6p2yccmUJ9bEhmDgZ/1LWoSPHebSNAU4ZWaPYcsAbpupAL0XkxwY9l3lkKM
         VWd/GVGW0ymEz5edRZUPUfGO4Ara5wdpnBpsw44lhacZfYuePWzC3KtHi9Dgt/K4rJxv
         vFQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QR3Jc30q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id p18si493402wmh.1.2019.05.12.00.44.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MVpJg-1hEhaw1ZGK-00X8ON; Sun, 12
 May 2019 09:44:06 +0200
Subject: Re: [PATCH] x86: amd: fix comment in MSR bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com,
 Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
Date: Sun, 12 May 2019 09:44:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:vnwh7c2ovXerGMDCPWYpOLTRV4P29yubWjKAJxuSRZBJIcQf1BM
 zwC2PbvDnGnkh2yhky6M+hGH4I6EWBXhUDulTEarCl9esvW1RrS3/d/Y947UYQwphaEyENo
 1wsE1NfrU9IfPzRQr/tkV+CZbxsRiik7gJjEy8nLb3FKSJx/IpVnSiDexGle2R+yF5p+9QV
 3NF/fszCGimP1evwH+GIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iEROqts6wMo=:FzqIoy5wMTWE4+ei4g2pSv
 aAEz014fkYCC5jm11k31W8YCZXRrqHJXcnUEsaNWuTf7pdUAQDvIBwKJ9aM+rahE9V+vWWC4Q
 P43JeyRPOV7IKvpIExOdL0ZN4keS/sfHHu0rFzkHFLYTIITGRQlUGJbOZXlpArG1PlTIBrZmS
 cWdvFmuSlHLs0yO7sJggMt9e5i2KiBFklNsuKqa3LGyomXaWr2yuvbo3EvUI+a3Kx+1Jl0LBf
 5Zqg8eqxgeYJaTeL8YrJGQ7sg/aFOXIt4jNz/f5w210FnP7p5l4wAliHMUX4XoTrGKFUnSzDL
 YbOEJKelus1LnSkt+bAyqgRZHuHzYYA+Rl/6zry1l74v/T0KZpcb1Y5H/0zAcGNrheRw1+Eoz
 gR/iexVWWa2bxGSk3qLPVZVyTcW/erLSVHB1TP0waAn2G7J/faZq9e+2tAI2iaRaUN2pk9Ffb
 eVfmKcOQ2mN4Z3CGDRgoNs5KxlFfHmqhHzN1HJf1R2wP2dyeSmIuROwNP369ktIjGscVLF6Ep
 lk1PMDga8KdRGrEhfBpsfvhxWcGUFwKZ0RoTMXQPLcLczStlkxa0eQtXNrblMzq7jg9rdsNYJ
 oo1/fHRGkTwF7CFlXGME9ygKqDdkzrvxx5xZyBiNyJ/VEjsRNpUBrluQz7IMvTbv3dSJgTz2S
 d/D3e+Tq2T5knGPrnVBX+uCMXHIj1zfrcBAVIeH6qWEUT3NqykatPaC86E3pSEnwLrya/NrCw
 waogBW0tDTKGk57A4JXSG110IGlZWfHy3nKtW8lpR+SMTN4pgic9Ki416DLWdneCcezxmIoo2
 EutJHfU7JhQQr3pDipftccJZ7QuoVK4AyFQPyWAvj5OaVGZZMHeCQrQWtsx9FLtacwuFTzoPe
 og6YxeT6tBMPjCT8Yh5ylDiQpEwWs1yqLFImRBh8mptSfxuf5DLZVZ2vu2i2UD8vmmr3at0/U
 OUCB80gV/LA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QR3Jc30q;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 10.05.19 15:10, Ralf Ramsauer wrote:
> Writes to MSR 0x803 are intercepted, and not reads (as the comment
> stated).
>
> The correctness of the rest of the list was checked with a short helper
> tool.
>
> There's also a read-intercepted area that can be zipped.
>
> No functional change.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   hypervisor/arch/x86/svm.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
> index 9c3e971b..60d236be 100644
> --- a/hypervisor/arch/x86/svm.c
> +++ b/hypervisor/arch/x86/svm.c
> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE))) msrpm[][0x2000/4] = {
>   		[  0x2fc/4 ...  0x2ff/4 ] = 0x80, /* 0x2ff (w) */
>   		[  0x300/4 ...  0x7ff/4 ] = 0,
>   		/* x2APIC MSRs - emulated if not present */
> -		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (r) */
> +		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (w) */

Then we rather have a bug here: 0x802 and 0x803 are both read-only registers. We
actually want to intercept 0x803 reads, in order to map them on xAPIC reads. And
writes just simple be allowed as they will cause #GP then.

>   		[  0x804/4 ...  0x807/4 ] = 0,
>   		[  0x808/4 ...  0x80b/4 ] = 0x93, /* 0x808 (rw), 0x80a (r), 0x80b (w) */
>   		[  0x80c/4 ...  0x80f/4 ] = 0xc8, /* 0x80d (w), 0x80f (rw) */
> -		[  0x810/4 ...  0x813/4 ] = 0x55, /* 0x810 - 0x813 (r) */
> -		[  0x814/4 ...  0x817/4 ] = 0x55, /* 0x814 - 0x817 (r) */
> -		[  0x818/4 ...  0x81b/4 ] = 0x55, /* 0x818 - 0x81b (r) */
> -		[  0x81c/4 ...  0x81f/4 ] = 0x55, /* 0x81c - 0x81f (r) */
> -		[  0x820/4 ...  0x823/4 ] = 0x55, /* 0x820 - 0x823 (r) */
> -		[  0x824/4 ...  0x827/4 ] = 0x55, /* 0x823 - 0x827 (r) */
> +		[  0x810/4 ...  0x827/4 ] = 0x55, /* 0x810 - 0x827 (r) */

That looks good.

>   		[  0x828/4 ...  0x82b/4 ] = 0x03, /* 0x828 (rw) */
>   		[  0x82c/4 ...  0x82f/4 ] = 0xc0, /* 0x82f (rw) */
>   		[  0x830/4 ...  0x833/4 ] = 0xf3, /* 0x830 (rw), 0x832 (rw), 0x833 (rw) */
>

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/536d98a0-cb55-1726-3ff3-d7de6d5cea46%40web.de.
For more options, visit https://groups.google.com/d/optout.
