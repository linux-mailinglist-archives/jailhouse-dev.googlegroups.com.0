Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBPGZXPYQKGQEKP3DXRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id E400614A594
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:59:25 +0100 (CET)
Received: by mail-yb1-xb3b.google.com with SMTP id f75sf7554164ybg.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:59:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133565; cv=pass;
        d=google.com; s=arc-20160816;
        b=XNelC5ntbbuk/HygfscB/5m1MavnvyyxIrapKf8hBMOqKTwV1aTANWPEm0AE4EL6rw
         ratYjDH5hEr2zac21qe1cFxBVA82ypkapOw2z+EHeNBU1H957ieQqLq4Vm+UmFm+JxGX
         32lPxh6dtB8nvi5ilNeCT93iLiCQJeSSQ04YCjO3Z/Mp1uxrtk0HlViW2l5ojiawT3BZ
         FmehlruqBDXn2gv3rQs+4FkNjQSGrxcScZ2D4RbyoEwC5jujgkTX4txBIWhrxOLesIGf
         pCQiiCbKmLTAYL6kSbnxBq/L8H82SclUZIXq6W8e1Y2H6RVgBfkxr3pvfSFGCWmb5rsH
         SvbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=k3TGnZlo+JnT0y8MZXaXHprRLwtJ0lr9onH9m2BwZI8=;
        b=0cZ6pR2B6n8bxhQ95oJBLIWI/MtlJcXQT42aHEz8YY5T5L6cibEybRlyC8vHPnvkWw
         ed+tD0YaS5ZU+6VjH+Yiz5zMlA0gRY7viOzLyULjzJHEByUCJ5/LPEAidmciRMaltilq
         GG1ezd7n58UkDnmcJK2yfct6YJe6YdJKzAsMZzpwLWBbFTrLoqTX+g/QPdRO1ZnYm17B
         TEqmgQrR4G5VvIEc4vOSaVgzcqbdArS1PtcjpW9qGwRtWjIlnVO+yvTgzjFB8wGCb1DX
         +lFPIkIMEQXJj/4aTA6ymU1m5gZggK0HNvysVPzwsFNKya6h4MCqMMyEX/JNIJmu/42s
         paBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sHl6LxDU;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=k3TGnZlo+JnT0y8MZXaXHprRLwtJ0lr9onH9m2BwZI8=;
        b=ahn2xMdC8rsGshL2iQw0N3To7b76y40Ty2sSei+226tEzp/QJz+tq7kgdnmcr44f3N
         VGq40SL4mERn9ALDWQTJLUxIghvvYJ9oiZikUwQZ4My9OzA1arilfJN+syWNSyG1iIM+
         wQ3qVdPvDsqyxeJrGN1ZhOWq3Js4feDmoXzF6OInVkbYcu6XfmRNBFT9vXTJyI+KFh27
         eVANfOM7w+sUC3Vb2KAyulz/et1vQE8r1vuF/P47TkejWG86NL7A6u0OioselgX07nWn
         IK9T5jlI8F9dGzVwxRlvmlpbk4hihLYYzHWRiVIiwMuooiXLcxnPERY33xaB/jzeA6H7
         rf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k3TGnZlo+JnT0y8MZXaXHprRLwtJ0lr9onH9m2BwZI8=;
        b=t+WXnIsztyRdqeLiIVnWUhLewYaIbwjgIpZaEmmLDPVUDjo7nGXHEf9kepKXyT6rWX
         qcx7VxIZsPcrW6gdP2B1damCtTYX0bXWqu5ch0+EgGeIPVpM0dCnM9lFRKTEJyKe44yt
         t8WyXfXZntOqQsNgfe/jEeYDHUItjpv29XDLqPTaPEkjvEJ5kTwepmDWwvuiHv4EVuBY
         6rW04reUqKKwrRPK6AomJkYbtIpZane360A1v9469B5Oxcmw0eOQN5k4ucDKwliOTxeD
         BWLJOcTtyCp3D4XC6mgh7HZ4onLlMrfrKGlF8ah6gXu9yTCsOJISYwLzngg37yHesfWy
         r7GA==
X-Gm-Message-State: APjAAAUyUSpW/vldg1UnaCAZRj1QFTPWf8LSnHZiLIEsCGAv+xifvExW
	T+7NJgVGok6WV/WyZYCj8Jg=
X-Google-Smtp-Source: APXvYqyz0VJDhediOJreP+0vsTD4GziQPPw6pVVJ2qje97+Ie+YXSwrsm7s/qRhd1E50gSRNfryDnw==
X-Received: by 2002:a25:d1d1:: with SMTP id i200mr13120055ybg.146.1580133564964;
        Mon, 27 Jan 2020 05:59:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:d883:: with SMTP id a125ls1937611ywe.0.gmail; Mon, 27
 Jan 2020 05:59:24 -0800 (PST)
X-Received: by 2002:a81:710b:: with SMTP id m11mr13102461ywc.384.1580133564439;
        Mon, 27 Jan 2020 05:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133564; cv=none;
        d=google.com; s=arc-20160816;
        b=OhXjFk30jsWBbdh4J517WT4TD8u24ke3CE5BXEnjeYxA80ma1aqXLp8GuLDqsUqxNb
         EExFooktzbbFa4W62nHkPyRy3N9eTOQE/IBHfugDaQEuWYDfQ33qyvVG7jvSCy5KNm04
         cSFGucfpRMtRpOV/ds8VZT7QF80TPGnLKChWFkNqPkhKhYO9Pta+1n7TblaocDupzWJH
         JVjYTxN4DA8ocFghCqgJwH6K94kTUuZlgGKzGgL/anOHpuYfrv5UUlYI8gSJE6uyZFfB
         oulfTjruAdBTQyNzVRV3Yyc3efe55myuUZ0M8fzNyP/Tj6wE20PrHWXKFvgenUj7qh/8
         IzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=fpWoe18e9r42o1QtjxdULxQe1S4/OX8zTEiz1Sr7Nnw=;
        b=IDgKjHoiwxeUOI1uca277xQEA+UFIUI2+Ud0LAA88PbrmsfT9KoI1Fv2DKjHCt+LV6
         oyZLQGYF72KR2MFhe/WS/MHgMVWVyMNQYhjVbI+vBAmH+2cpAnBtjzVOIf+E+eU+BTPh
         YDL/CnOPsbj3xGIQ4gjoyLjzwLUnPdbC9SWdXixnkU1YaXlNXQf0OC0HzVqAVa2nlaKy
         SsljuhtpKMKeEnKP15wcNSiEbVqYIlAGgXywLg0r6plpVEOWx9HTtryiSdk79rO5Qf9U
         SzUmMaFgEcfl/nthIDMxEl16etlXGLKOu1Xt5N8UOSbA7OpgFyAY7FPAdSUBJkpx2qks
         FW8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sHl6LxDU;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id r194si898931ywe.2.2020.01.27.05.59.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDxOg7020806;
	Mon, 27 Jan 2020 07:59:24 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDxOp8015503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:59:24 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:59:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:59:23 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDxMVc093725;
	Mon, 27 Jan 2020 07:59:22 -0600
Subject: Re: [RFC PATCH v1 1/4] configs: arm64: k3-j721e-linux: Add USB
 mem_regions
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <20200127135611.21302-2-nikhil.nd@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5d72c911-432e-d7b2-79d1-d9946f48df71@ti.com>
Date: Mon, 27 Jan 2020 19:28:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127135611.21302-2-nikhil.nd@ti.com>
Content-Type: multipart/alternative;
	boundary="------------06FCE1254A879269642A2D50"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=sHl6LxDU;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------06FCE1254A879269642A2D50
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 27/01/20 7:26 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Ignore this patch, sent by mistake in the regmap series.
I will send this separately with proper commit message

Nikhil D

> ---
>   configs/arm64/k3-j721e-evm-linux-demo.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index 9a853e9a..47ad32ea 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -24,7 +24,7 @@
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[25];
> +	struct jailhouse_memory mem_regions[27];
>   	struct jailhouse_irqchip irqchips[4];
>   	struct jailhouse_pci_device pci_devices[1];
>   	__u32 stream_ids[2];
> @@ -86,6 +86,20 @@ struct {
>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>   				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>   		},
> +		/* USBSS1 */ {
> +			.phys_start = 0x04114000,
> +			.virt_start = 0x04114000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* USB1.USB3 */ {
> +			.phys_start = 0x06400000,
> +			.virt_start = 0x06400000,
> +			.size = 0x30000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
>   		/* main_gpio2 */ {
>   			.phys_start = 0x00610000,
>   			.virt_start = 0x00610000,

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5d72c911-432e-d7b2-79d1-d9946f48df71%40ti.com.

--------------06FCE1254A879269642A2D50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 27/01/20 7:26 pm, <a class=3D"moz-txt=
-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200127135611.21302-2-nikhil.nd@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd=
@ti.com&gt;</a>

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
</pre>
    </blockquote>
    <br>
    Ignore this patch, sent by mistake in the regmap series.<br>
    I will send this separately with proper commit message<br>
    <br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:20200127135611.21302-2-nikhil.nd@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">---
 configs/arm64/k3-j721e-evm-linux-demo.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j72=
1e-evm-linux-demo.c
index 9a853e9a..47ad32ea 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[25];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -86,6 +86,20 @@ struct {
 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+		/* USBSS1 */ {
+			.phys_start =3D 0x04114000,
+			.virt_start =3D 0x04114000,
+			.size =3D 0x1000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* USB1.USB3 */ {
+			.phys_start =3D 0x06400000,
+			.virt_start =3D 0x06400000,
+			.size =3D 0x30000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* main_gpio2 */ {
 			.phys_start =3D 0x00610000,
 			.virt_start =3D 0x00610000,
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5d72c911-432e-d7b2-79d1-d9946f48df71%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/5d72c911-432e-d7b2-79d1-d9946f48df71%40ti.com</a>.<br />

--------------06FCE1254A879269642A2D50--
