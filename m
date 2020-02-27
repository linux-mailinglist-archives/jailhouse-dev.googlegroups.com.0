Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB45M37ZAKGQEVYUYB4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id B82571720FB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 15:47:15 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id f13sf2286348edy.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 06:47:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582814835; cv=pass;
        d=google.com; s=arc-20160816;
        b=xf662Bwka03r0LWLVTJZi0MHBQWWrZbF+7mqzo+r5yQDxgxt8S3y7XAEpHZP18+1wB
         t0NGl4CwJhLsny5c8sW3DgpatYHVqM7TJrpgfJFS4vaUt0D6V8gRofi9ya+OZLKJa011
         3Z5sMiT1ZFOCaaQbDiTustrr/iZmFRsro4VI9grk4C1Fm9pCddjTg94EIEi2IgMfUtP1
         DYOu9oU2ksthgxqHovLl0vx9P9kWnaZB8DkdKp/cP1Oypz/R6IVGpgFYyKaOVJ752LgL
         zoljgzu7oISQhYgSaeXYkA4OOKhuQFVTpkS7E0XiB0CBjUxmkPTBU1PfIi1w7TYcJpkp
         TIgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=v3Pp3OA/Y6J67ZcA0KQkRPWUiXZeR7JFGbVOvbk7gkA=;
        b=nz8I2HzQEy97tWIG3GvQXhRoQ7WLRZN8HnK9TRD5+n6K9MZ9giMJTmsbWFnHxdzEuU
         A+9fZ4zjDU/84+MkVFsmYGVQHszpHD4+ZBT0QkLWuuwdnEUDh6dAeQ1saQ//5YaQxZ2r
         7/GVXPQ8owjNauhYBQoey47y9Fc8eVOaRh5n52DUvIvicqpwHMBy3WLMtH/0qoyDpKPn
         jUeM8Gdxd6crqn19y3LD68+LTLVPvqN/gbIkVdWoD3/Dd8ydJ9k0Zz/ObBectMaxrKbB
         mK+YHUbb8GUxuw4mviP+lsW7uY8/T0as7l33HhLRuiQU/5+c79hz/27Se+RAmVbTlXUx
         19Pg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YVKK4Lhd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v3Pp3OA/Y6J67ZcA0KQkRPWUiXZeR7JFGbVOvbk7gkA=;
        b=tBeQ/PyUCC0/4rfoKpFoiKqSYtND4tg+GhS1+yZh1jAU/hqZtZU+tXT7eZk+hACmFf
         fXHamUMCoirAFFP/yiYAuWRn6xwd4/V1R/3gW3d0C8gaZWsCpXkfpKUTjbqp8YFoeLQH
         O3ZoHnKiU5Yg+z0No7vqXB+DQGI7GAF4QbbjjchtlKECkHtFQ7e3g8/sTpWrH4ukKulB
         cv/ypAFSCdvUwW8CgoLP+1skr9dbuTNHCv0fMCoSa6Y6P7+hW6wgR8CZIe3g1fCDD+sv
         SJfYk+eKtfZOMTkTjkOhOo4/lWhs9CGziA0GFMX4aem4h6wGsao/e3SL7si6gGSDj4Bp
         lFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v3Pp3OA/Y6J67ZcA0KQkRPWUiXZeR7JFGbVOvbk7gkA=;
        b=Qf4byiHVY70ubUdMRFAzWTv26E6mbAUQtYnqUsSBRJDHEHbl6P8YXBSUUm37vJsO8u
         ozNUSGf1oYHH+95HArUl7rxXyc62pNlC8i3rtubxmSiquuMosAjg7FDh4oNDKfzFUZlL
         dZpH+N1j3iUjJemmcVidykrvfLOaoBPIPtC41XBPSz9UKT32RC2ew8pePI+MajxEmyEE
         c6WFhG5tQBI6nqHesL513EVM53zSPYdD9KpDydCko7MPZS9u0sdTjU3X9m+QzPlNdIc1
         hWZkGGmNnlxEdq6DrLASaUKqMZEx1uSLdpBfExO2Q0V61ibGtgjULGIZ6aLaRqGEMFfW
         pBFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAULDMZa1rIRgwktSGavC+bxxVB9p7dlgFyJktITqNaHztIkaJbY
	Dc3N+UYkdHUiJndC4AOBSmU=
X-Google-Smtp-Source: APXvYqxm4enl4+MtJpGzLKo+Nhtms32mt5JB/wHi+5SH1fXQ+LnbjfymFtx8NJsD/u70JDBrWHj6hA==
X-Received: by 2002:a17:906:3796:: with SMTP id n22mr4564083ejc.222.1582814835391;
        Thu, 27 Feb 2020 06:47:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c98d:: with SMTP id c13ls1401926edt.0.gmail; Thu, 27 Feb
 2020 06:47:14 -0800 (PST)
X-Received: by 2002:a50:d70f:: with SMTP id t15mr4699810edi.141.1582814834760;
        Thu, 27 Feb 2020 06:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582814834; cv=none;
        d=google.com; s=arc-20160816;
        b=tP5HYWNQ1Ee/jFeXe+rEx45JsALNpa1Tyb+vi2nrr8ihuoELX1vrxsISEKQX7kZ7Y7
         bkJGZWY1AVf1XU5UdmbCqptSQWV43D58+SSaEF5tUXwqOXYwtG+0vREqsrXRsJVPDLcL
         zqPZHT03i3Y/iqEzw+A/I+92Jcum2/pA4Bn3xuByX/fqNBzRwBPWIzIqUNczWrRbL26f
         cvJmoK9SdidsOWslu4KRy+h739+j5VFDp7MBqFVcWTAXq/J68/5QAASO3okP2YMfYrhs
         hbSdC7aCO7whj9wfpTmjLAggbaeTQ98hsEaQwGFD6lCk55ha/zkMx9rP1wPMIqHdOnCX
         659g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=J8tH1xfNCl6/6IZXaXaXo64WvhbUjhMiVw1ized+rv4=;
        b=H7epBFhQOSuavVRgkQf1y8te6B6TWU04v0Spr7BSYpYu6HH4hTUaaPYjTunh5Ny0Tr
         3cRZf+w7KObbXtLQoKsDoT5vaZFy/A+cV2o3kiSqxWafjHOqF7GVnDxsrlMXAz+jKji1
         WTkilTTMu6shcHMDaHFvnaUQQpmDjnmiNo9T/H8/xXmNL5arp+iOaQTZuAo5pIeeGyA0
         O5T+YVNG2BhbHftNYxtUyrG1AONYeEgJPJHV4DdU8NmJyvvzs0FWnJMjUVo3QZjuxmMD
         YFltXsxFBwMJpwSzlVSyoqGRy0UqOc2q83UWPBPqpCgBHly9j27s2sV0srNGbOgn63/S
         hjCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YVKK4Lhd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z20si223349ejx.1.2020.02.27.06.47.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 06:47:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 48SwVp21Jjzy7t;
	Thu, 27 Feb 2020 15:47:14 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 27 Feb
 2020 15:47:14 +0100
Subject: Re: AMD: non-root linux inmates
To: <raymanfx@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>, Andrej
 Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
 <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
Date: Thu, 27 Feb 2020 15:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YVKK4Lhd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 27/02/2020 15:24, raymanfx@gmail.com wrote:
> Hi all,
> 
> I'd just like to add that I am experiencing the exact same issue as
> described by Ralf on an AMD EPYC 7351P.

aah, 'good' to hear!

> The stacktrace is the same as well:
> 
> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700
> 
> However, on my side I cannot get past this by just handing over the
> xAPIC enabled; I get the same trace..
> I added the printk's from Ralf's diff and get the same output:
> ...
> Before disabling: 10000
> After disabling: 0
> After reenabling: 0

Great. So we definitely have a systematic hardware bug that doesn't only
affect our CPU.

... Did I already post my local hacky workaround?

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index de691329..7f51b062 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -340,7 +340,7 @@ void apic_clear(void)

        /* Finally, reset the TPR again and disable the APIC */
        apic_ops.write(APIC_REG_TPR, 0);
-       apic_ops.write(APIC_REG_SVR, 0xff);
+       //apic_ops.write(APIC_REG_SVR, 0xff);
 }

 static bool apic_valid_ipi_mode(u32 lo_val)


Maybe we could try to reach out to AMD via some kernel mailing list?

> ...
> 
> I presume that by "hand over the xAPIC enabled" you mean disabling the
> write to APIC_REG_SVR? That's what I did but it did not do the trick
> unfortunately.

Yep. Andrej, did we have to adjust anything else?

It's been a while that we've been working on that issue, and I don't
have the exact details in mind.

However, Andrej wanted to pick up the topic again soon.

Thanks,

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b434f550-5700-ba44-e88f-ea76c84a6d0d%40oth-regensburg.de.
