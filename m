Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSUZW35QKGQEBJG2LSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFBB27807F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 08:23:07 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id l1sf657808ljj.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Sep 2020 23:23:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601014986; cv=pass;
        d=google.com; s=arc-20160816;
        b=sqpD9X8V2LOQy8O4KwVBYdadytaxG+djQNVD0IKjPMxiF/0NZI/lXB83KAwbEhiq0d
         jutEo62DkJNraYJz0Rr54yytVdPZzFWiAMMN4uz3BTRxJzJEnBEwlM2yXOT1EJT6s4s2
         aMzfDKhGG1YxYqq29K1+ufS4h6n/dqM21SCxjDWr5ghjP55oC+w1gYVTitEFligsCm3h
         0GsasWxOx5cNGZZ00aAdBEoTT5omYtei7zqBmeBDaVTwWGLH6JSRkMXkp1ytYPU7EDEH
         w7zMWmunQRg9FrZnk+y+B5Pb0jMMvL7x5Tmf/wsRoNOUObw2ID5AzJbJ6TPKMHUAXjGf
         PSPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=zICi+fObH4bKCH3bZuvxHA5AphBdBQQn1brj2yR4RFo=;
        b=Fd34Vqe6t1aXL3oE+bfhZM0lhHB3FCYFSquWYEWFcANXEZBg7v4H/ENryW4Q3FUAoH
         O2Dq9prEAcTBQ0u5v4GnPYbpZbyzE91USw/bzhjQUP8NIymJh6J01i7jFilQnobHawZA
         MjmgCsry2SKOIQv2MKTYKTQ0k+8krpeu6ZCwnRFflTTvRJz+u1cS0j27tpWK508a0645
         5XoZWjgEGJ81ygJdlw97hXi8fL3AsmKeqA2WYCXR5d9TobkyAhVD0rW4XyZrDf63awQ7
         kj9w8IyqJ5B5vnbJvm2aE2O9wqgOIviXJGN2VglmyaRB/64B8ZD65iKE9voc35SER5VB
         4NNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zICi+fObH4bKCH3bZuvxHA5AphBdBQQn1brj2yR4RFo=;
        b=mUG04Mx8LsMoWe9QIY7GwBArx7fiuNYK6+m30foFm4LQWlz/v6cIBegeieG6wm/7rc
         m53v1jwD7TqsB34Q5tXkhSsYnxJAzpZnzB9CgZ10d2UcuPPaJWqWhu48XXb5iGlpRDPZ
         BsoygNK0RsTEknSySDJt7ZBS34K0Eqr1dchAgl8aWHaniuFFRZpGLwwucDMwwODYDeBZ
         F4EiVd9atdN+IMpBkoEfv3NgQCdsY2jB59D96JLNbat61nCoC8urTkYWB/xm2TxhEp5Q
         +LfpiYhXcanfe3s4bs25Y6lxcvCeayWNDm/JixC1pvKLFeGGr+m7Jc6c5L49JtNxWQGB
         FB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zICi+fObH4bKCH3bZuvxHA5AphBdBQQn1brj2yR4RFo=;
        b=oQR5eRncPhjmRYX9ZWZ4ajDj9cPDlJmsmDt3dofTIaPWy7pgbj/b96AJdiDgUX2LFb
         h8FVLXtn78skHRqWk2LnGwVwsKBoGEjodAMCoDze6akMdtIfcODVIuYZbbS5jkTUcqc1
         O0bH/m4hSs7Bkiq0w7qeuC7i7XXIIlv+Ug3V+DqC4mQczDFFw8p+/Mrq9/kVH4CjrTVA
         vPBvZS6v1M/0sGBalFzz1JIcMV9H8VjmhOHIeYR3CyTl8XcSNz5GY/yaUXxpE36lpqYE
         Z+jB2Ik4duu+yC89mzCetjj28vCwqvfJM3fWyF+UUlRlt/SvQVOtUdRtXzrVg2quaPjC
         t0GA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532vdBU511iCv2TD8LrWh6jiSYKFOqM7KW2LAqaUbhgtFvVfnJ+b
	9nvppnmxCXmCdOtk0kRIM2g=
X-Google-Smtp-Source: ABdhPJzBS3wVhURd5RWuszF+ipKiM7/5gwtnqKHVYvQq+dHs08mUHg/AqXsOfdJWwGV4tyQhY4/p/w==
X-Received: by 2002:a2e:b80f:: with SMTP id u15mr880898ljo.453.1601014986755;
        Thu, 24 Sep 2020 23:23:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls695075lff.0.gmail; Thu, 24 Sep
 2020 23:23:05 -0700 (PDT)
X-Received: by 2002:a19:ca59:: with SMTP id h25mr876380lfj.396.1601014985341;
        Thu, 24 Sep 2020 23:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601014985; cv=none;
        d=google.com; s=arc-20160816;
        b=mwFq1UcnbA1hw4Xt3Ox8WnxIOVE8VwQzzaZD1zeLl3JlHjamiamwDsB1zret/hC3z6
         KE9rElZui/KsCPyvkuI6ZCTDJK60LKp9s7aSBCl7fF3ZnXf5tQbjkL/PC3N+xx7CQg8+
         dcj490fswcU55IS5pMlyPdrJHf9GrMR1/rhvFKN2h0rYCgN1RqYMrsKNhNGx7abIptQC
         8dtAIwHb4b9TUdATiLlB0ZWDJV0TgcWwKnZCX8/bdUWTPFu2Oy3f/lhhPHv3Vj4P83S9
         zqtYY1MxKA3GL3E99GJJcGu3dJt7tIcyQTSOzoib/EANTfS0p8xhShD27CmHR2JNcStN
         KpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uKNIsRplqHkOrFidKYU8fmeae2TuThDf88CAQ4sK+ro=;
        b=eIkvpjSOwwxp5qrbdY4H1UiK0weO3C6tCI9TIWrsPbPPZPLpYrnTBLgw4ugOAvIFGW
         oEoLzRbjUBORkCdxqbZhgt/P05vTsvKjwgqwIHb4cUADfbHkazljPqR4h3QKdubJTYtT
         vpDbw+ZKHCd3TQQet8xOhL5Uo/6dNy8YnsphuU6HVCdH4AL+cqfCBAQpECALSlKFtOyp
         GRU3vhxLHr/W7OSylZrFcUDPYPnIOEicrryyZFFo8PRuronpFbr5pqCiKEEZLWeZqXnx
         tpFQMF5phCWRdD65xflJvUABKDk+r5ml0OD67KbdXVXDAwEpSZdrmnSxJ3QRtK8MHQET
         hXNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j75si52213lfj.5.2020.09.24.23.23.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 23:23:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P6N4gW022999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 08:23:04 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P6N3gb016501;
	Fri, 25 Sep 2020 08:23:03 +0200
Subject: Re: [PATCH V5 1/5] include: add macros of different sizes
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200922064542.26274-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d7d4ca06-fd24-51eb-bf70-1a342e9fcf96@siemens.com>
Date: Fri, 25 Sep 2020 08:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922064542.26274-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 22.09.20 08:45, Alice Guo wrote:
> Using macros of different sizes makes code easy to understand.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   include/jailhouse/sizes.h | 47 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 include/jailhouse/sizes.h
> 
> diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h
> new file mode 100644
> index 00000000..ce3e8150
> --- /dev/null
> +++ b/include/jailhouse/sizes.h
> @@ -0,0 +1,47 @@
> +/*
> + * include/linux/sizes.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#ifndef __LINUX_SIZES_H__
> +#define __LINUX_SIZES_H__
> +
> +#define SZ_1				0x00000001
> +#define SZ_2				0x00000002
> +#define SZ_4				0x00000004
> +#define SZ_8				0x00000008
> +#define SZ_16				0x00000010
> +#define SZ_32				0x00000020
> +#define SZ_64				0x00000040
> +#define SZ_128				0x00000080
> +#define SZ_256				0x00000100
> +#define SZ_512				0x00000200
> +
> +#define SZ_1K				0x00000400
> +#define SZ_2K				0x00000800
> +#define SZ_4K				0x00001000
> +#define SZ_8K				0x00002000
> +#define SZ_16K				0x00004000
> +#define SZ_32K				0x00008000
> +#define SZ_64K				0x00010000
> +#define SZ_128K				0x00020000
> +#define SZ_256K				0x00040000
> +#define SZ_512K				0x00080000
> +
> +#define SZ_1M				0x00100000
> +#define SZ_2M				0x00200000
> +#define SZ_4M				0x00400000
> +#define SZ_8M				0x00800000
> +#define SZ_16M				0x01000000
> +#define SZ_32M				0x02000000
> +#define SZ_64M				0x04000000
> +#define SZ_128M				0x08000000
> +#define SZ_256M				0x10000000
> +#define SZ_512M				0x20000000
> +
> +#define SZ_1G				0x40000000
> +#define SZ_2G				0x80000000
> +
> +#endif /* __LINUX_SIZES_H__ */
> 

Sorry, missed this detail so far: Everything under include/jailhouse is 
supposed to be dual-licensed GPL/BSD. Headers in this folder could be 
used by inmate or configs as well, and those should be permissively 
licensed.

Please provide an own, dual-licensed version of the size constants or 
clarify the licensing for the given one. For now, I'm moving the used 
ones into hypervisor/arch/arm64/smmu.c.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d7d4ca06-fd24-51eb-bf70-1a342e9fcf96%40siemens.com.
