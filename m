Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJNA2KBAMGQESWMO6MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F9341BC5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 12:51:01 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id k8sf22663559edn.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 04:51:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616154661; cv=pass;
        d=google.com; s=arc-20160816;
        b=ATOXl3zul+C+VrYMc9Osv5PRfpfgR522VGgKPHqdzcKY60v1OdUf3XGSNlEfvD+n6/
         PMWzCk7L2iNYyTM+bC/3JCnmiTsclEwu7j4BnYo3ffOn2Mzqdpy8ozPRUDqLq2KWZbJr
         QK7feVxpXhyGu2d4/Zm9kFOb/NvKNAEGhnFlycRtVejMWAfcAZllFSbdfEmcZG7UXZoU
         HbFxWRaCcTtuV41WppzR0C8eEV8LLfhiAQzxcPGkXFXeUx4ZTKq03oxYGFgS7JEG2I5f
         1H0XncaCeWXqCWjn2gH3JdxSNiSa/1w0pYsSjyjmlnSvK0nDBq1EPARTIY7SavogODWR
         WGrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rgLgp19iNFO/WvbmG65nHLNmYzsv1qfI2+OWOQvgW6s=;
        b=GnkFSny/BIw6lfSlZDXiwWuGB/D+ZoVjNteaJQcnAaxVK1j9FPJHlLOzUDiDd4HwB1
         Zv4SLSDIxGCq2cokCQpwrWttNxDAFge1KCXe+rDfZVaBGDll5uTchjdLgQ18Qg+ZEmI6
         qLeDkJbRsxRWj1kTp7ePOEHawaOLmVrFOFcEJc46bxMozDJAt2GO7FKCzkOdmL5NT7m+
         0RG6qxYENIjZbnJi7FxWtQ03S0lrvfjhXmBwDaPUb4gGBH79qWdMOqhXjZT5ARBFuzGx
         +hhmF9hjkhP3q7l0MKffQ1uzzeZUVY6jPLG3LhlWhyJi1tgDPECCinBfZsC0zZUR6bOc
         OFEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rgLgp19iNFO/WvbmG65nHLNmYzsv1qfI2+OWOQvgW6s=;
        b=iZAR747+KHbB1Iz4ceyQRz5CjxeDa+oETCQq5DT1W5gmFL3RvuQFH66JQ9cD7Lwmhy
         vli91xqAtEhWqMJIQFR8kUtfqzAYunJ7VlvkNkuusiOUE/ULjYhrjnPNE1LKkEhCsfQV
         M54xxGSUMkKezy91m7JOh37du5U6IDqQb1fLvcHwXdYIR46gPiqjqSqU/LiqkxJossR8
         7ff1Wj1zZ81kGkVMeV8mEQnzPlpnhPNJL4NY6cjLEjMYm5WyvQGcmxgAGsY3AKYxuwFL
         azwifMeq0vjML4nf6PUsGyL2EvFSUi5TZpq+gst7xGWQTDtmhYG/E5ChDSbtBD4ntQRM
         ZT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rgLgp19iNFO/WvbmG65nHLNmYzsv1qfI2+OWOQvgW6s=;
        b=CeDfPAmmAO4sr07smF+lD+v4+5dYLKGPNc6YY0UN5Lk9UbqB8tOrgHQr7PsczLyEGJ
         NpxnP5tCGAHkbNt+KC7O7WphSv0gm1dpEOIGQuOWFJ3MysZbbM7n0Adbl8UIY7x8gZBi
         9Q2cpj8l2qGUNKLSXgjBsyctEly8PYYr3Nzvdb0ExD7uEDrgsrt4FSMFZ/7nltNR84hX
         s7hv439B6l/0/w7WIvLN6SnFaD5m4X5jHTw8VU9e2AJ5bQIwlTGUatoNc4igvhgzpxc5
         fP3lbYUtqx/2GJO/LPGJXvo9qZ3/DrcxEgvFri6RW+rUeC4Y92Nuu1jbSQ27iw0DzWP5
         m4Mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530DY85N166ykkXwx9js8TiboQT2gkrD3ljpO7Er9aqRrqxizBds
	mp3dpN9cwJWLvPmIdFLVReY=
X-Google-Smtp-Source: ABdhPJwaoxLMsR1B4VBRDMXBi0Lqp4IUyceYkxa/jiUnc3eU2tx0wWzY5Ib2p0v8PjQuCCbpd/gazQ==
X-Received: by 2002:a05:6402:b85:: with SMTP id cf5mr9206568edb.248.1616154661407;
        Fri, 19 Mar 2021 04:51:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f290:: with SMTP id gu16ls3104046ejb.11.gmail; Fri,
 19 Mar 2021 04:51:00 -0700 (PDT)
X-Received: by 2002:a17:906:58c9:: with SMTP id e9mr3731011ejs.26.1616154660359;
        Fri, 19 Mar 2021 04:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616154660; cv=none;
        d=google.com; s=arc-20160816;
        b=li71xNSpNyJt5n/+/OZuaxmmTKa0S3X+kr28Ekx4rFNA2Zna11HRz8tk/rWhzwpLkr
         ECqMz/4NzTmvTyBeUhiBs/mnC7CjvIevZFpM+Udv6rXPfzFU2KJHX/sZTuwp7yKZRkl8
         eLZqGQgv4zNJZ2mnPOx/mY0m1kDGg5rPybPugYXjKaye4YZFIhHg4N0i0W7N/0hkqXg7
         UyaSQmOMg45sZt1wZpocrIqjRR/FnTEnLHGQOx29LYm2/mc1Wyie8ocsja7usPJJMiHR
         i0oUmpUBBWHjNQIi3ATyNNlTSTm+QwIylXQzc/MMg/RGxZzbD/WGJwnNvqA52jUvphq8
         Cfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=5m5EoGSdn9jvOLG8Yu86VpNSS/rymd77RDR79pLmeqY=;
        b=tgD/3vUyKNQ6WN0OGJwUCcPK83sJbm1wnZelQodkFFAT7fua7Abn+4/wkRxDf0MUdi
         3II4L2OtR4Leo0jZRFX1I2NfnXtiU1MlUpGwDyH21jo02bMtLN/C2v6lV2ICdcA1a8LK
         zP5THkx6hrQwILNA2OFNr44/KhRKJqz0NnudZklCP2/hB4cI2SmUBkU8CAVM+r/+EKiQ
         GfwJ1M3PFf1dtChBK+3Yr6boamATYeXgYpXBPhg7loX4qIHY+higk7L3jO22uhm+NmdV
         E4Ey7pGxQhahkEUM6yU/MMKA82NcQhljzMAPr0y/xnI7gWce6j7qugizTWLb+Q6TSHgg
         p+aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m18si112981edd.5.2021.03.19.04.51.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 04:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12JBox8v016158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 12:50:59 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12JBZwR2013486;
	Fri, 19 Mar 2021 12:35:58 +0100
Subject: Re: jailhouse enable failed on nuc6cayH
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <e005673b-4a65-49ac-99db-6be233533fc5n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b514a116-d6c3-90ee-7da0-a801b3c20a1d@siemens.com>
Date: Fri, 19 Mar 2021 12:35:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e005673b-4a65-49ac-99db-6be233533fc5n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 19.03.21 12:05, Smith li wrote:
>=20
> my test jailhouse on=C2=A0nuc6cayH failed when enable jailhouse.
>=20
> ReadMe=C2=A0 says
> ```As the device comes without a UART connector, the output of Jailhouse
> can only be seen via the EFI framebuffer on a monitor or on the virtual
> Jailhouse console (jailhouse console).
> ```
> But=C2=A0 I find=C2=A0 my screen=C2=A0 is covered by a lot of green block=
s.
> no useful information.

There might be a mismatch in the resolution. The config that comes with
jailhouse-images uses JAILHOUSE_CON_FB_1920x1080. You may alternatively
try JAILHOUSE_CON_FB_1024x768. See
https://github.com/siemens/jailhouse-images/blob/master/recipes-jailhouse/j=
ailhouse/files/nuc6cay.c#L61

>=20
> What 's EFI framebuffer?=C2=A0 It 's shown on the screen or enable by som=
e set?

It will appear on the screen, like a Linux text console.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b514a116-d6c3-90ee-7da0-a801b3c20a1d%40siemens.com.
