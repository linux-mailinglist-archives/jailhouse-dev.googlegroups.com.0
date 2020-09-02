Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCVVXX5AKGQEXLVGLFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F525A7E4
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Sep 2020 10:40:42 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id n4sf1845951edo.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Sep 2020 01:40:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599036042; cv=pass;
        d=google.com; s=arc-20160816;
        b=F6wQlaJpkkd1GK2ebKzcvdg7GRNh30GkuJ3yAidSOJLPmY2TTR8xZCUJIvUdktirnQ
         y2gfZt3SHYryp3GOYHa5kuiz0mw8Dx6/aZ5yjcyo25C01rqaquGb+mXGcU1TX6bwXqKH
         oTJ3LNLXFu38dlaK2AsQ3nKkuO4eKtah9Gdqi+0q47BkGPZvqt0eOJhSCkaKziO+mqj4
         QiYEdA3Z0RIY/4lEmTMsbAZCQGH21LrGOUv9TD3f3qeJP+ms6rbHXVP6tPjFx6jp6V6C
         rR3X8aZPlBQUxgcPY2qQxIicqqWSXhzfobgCvTQA9UinS5I15ZqxBNvUOOmAmZGb5UT2
         xNVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=4Y95xMX9dN0SVgulLJj/9Hu+OShDYsGokGmsbCNghZg=;
        b=tTfADuWBSlTS5Yhe4jQEXagzwen6++YB89XDMuvVKiV6MckLVxtEPa7C2oTQaKyb3W
         4oKa27ynzduiuW8zKJixmyA167vYnD2bCvrFUYCbcU+Lg3uWdMfaSeFHgSPuTF/mqmPE
         RI7AByRtCaZjb/A4NrdAUO9MnpMYabwRhS/0MeJWZOlHgvgR6yhTAzkox14tKXxrCyr2
         nSu9m2uHDC0Kk9cnBTXVVmffaCd1icY7LSuuTB1eruFacsEsWjE66KgYzrZCbLmrRTpQ
         woSKdQnFd9TdH4QH1wStHK2Grt1Rbvvldh64liw7k8cyTCg6Nsvk74hdjHDL+mfLT6eZ
         5rGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4Y95xMX9dN0SVgulLJj/9Hu+OShDYsGokGmsbCNghZg=;
        b=U82LcvT2rVE44loC1uordciea4xHCJlMCHmaET1KlLA6CCZd1hj8hXpy9sNkNiavKi
         80oYWPuTX6gYa6Rwm0Oduy5R6N4MN/RfXI9xFli2Nv3FevrIhJd448api5H2ffhlhO10
         41piN6wIsWMn1EhmlQYFVsPa9jozfLGQBxeRwNH4qErTKuqDEstIrrEKodBm+xPECMHQ
         hcorRfAFdR+ab6U2w0IhwcombWpddFY3TorlFahjn7DAPbjPLKzP8n90WwyU430ok5Es
         a1yWWC8RGg3AyksbyxvX4nw1NXYyx1AV59jga0t/ejvalq0jfhI2zoG1skRLGLzzgF1X
         /HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4Y95xMX9dN0SVgulLJj/9Hu+OShDYsGokGmsbCNghZg=;
        b=Cqs2wDapqwjjoA09Yne7WA+LZiYC1cp9imrLNuC1KyGqBvvp4qMZR16M23w4LQe9d6
         oZlAfp0DVAAAwE0oeo/D4kInFbYHXCtLu3IThMSmnOOWRc+1RewP5XpEIIkCfZJHxUN9
         GFpuAdTbmBsqGNWcDxf6yyutZ95MztxcMUt0Ulx2lwRpsNnrgkZgxWFneUgB+Fjwite6
         0SmxkJzEP2hVd8d7IRHFbsYZpXEGEdGoxl5eF4Icsbjatf1OySlrZPrpm42TyppzLTKe
         B9aXi9/COnT9n+ES1YWe5GPLn1uyysf/1ZunBCdQjGUYlY039bDfmIT7id0K9KHsbtBi
         sysQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530CZrr+1IjooD0EzGMV3IEApY8PvM3a3FsC98idP2lVPdiEaWnw
	xmnM7TqD9ScUP2+wTS4q8v8=
X-Google-Smtp-Source: ABdhPJxMCdWuTxz1pAbq35Pp6PnI5iSwjxZ9gAoxvAworvEIfBVr0N9DtOYx3sXbK/I3tqNCeOn7WA==
X-Received: by 2002:a17:906:c8d2:: with SMTP id gc18mr3508138ejb.467.1599036042461;
        Wed, 02 Sep 2020 01:40:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c545:: with SMTP id s5ls1233170edr.3.gmail; Wed, 02 Sep
 2020 01:40:41 -0700 (PDT)
X-Received: by 2002:a05:6402:1515:: with SMTP id f21mr75385edw.175.1599036041382;
        Wed, 02 Sep 2020 01:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599036041; cv=none;
        d=google.com; s=arc-20160816;
        b=QOTP6qNWi/pGokauvbrlVry7TVqh26RGxPhry3TOlD1aoiTBZcsP+AxlCsAPd5jjsY
         rRzHQf2WRDI6yO4E5B2RrULvKnOc248CQi2Yx5+Liq3CphNmGu+tmfJju+kWN0YlJu/0
         h/GVWFGcTWKvhqTBAKM2f4kH/f2oqEY2eM2G6e6QHklQnN1fiMWo2g7+h05atapgnHsK
         ZAnQ5V81I/YIFTd4u7SUnzmYMl0k8ZaUwIRyWOPLDaPkHUhaN8/KBbbNuOd6A6km9PVI
         PlP4ajNW6lUsF1B/WUhNIl2ffmbx1CXJBHAeVYub0e3LJeZnACLAx/suum06rwR0aZme
         BI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=jrHsBSVlJ6LefXXXdPcVgZaV3mdAbcp99g+loH9pun8=;
        b=S+dh+Kc5XXdM6tVcdF9pOxLu6sYcL945v6wTcx/qc5orkEAUCjVIDU2+44qsR+7cqA
         7PppDbzfIfV9fMAkICMBXDLDz2EqIY3hTxk1ewJcfgOT4K1WaLY0Mih0eo+wXMrCt8sj
         fbhZZzAkW6o5z2C+AvJFsVen8iG7GdpelGDb6tuYEBGN5AH7+ybDZGXCtbxP3EMVatSo
         ffI3lu5UrYo08i+nJUyPiIW4/RcDi286KFXMQ3Ia2aH1Ye4jn2EIkv4Wb8MUqY4n1KTf
         tDV8pKfubf91BGEcDL+H11wO3FegBHp8sVfiG42f6wRzTNr0DFozJ09CpzqkJAocFhNU
         xK5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id dk15si191790edb.2.2020.09.02.01.40.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Sep 2020 01:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0828ee3V021245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2020 10:40:40 +0200
Received: from [167.87.75.188] ([167.87.75.188])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0828edKM025044;
	Wed, 2 Sep 2020 10:40:40 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
Date: Wed, 2 Sep 2020 10:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 02.09.20 09:57, Jan-Marc Stranz wrote:
> Hi Jan!
> 
> Many thanks for your response.
> 
> It is true that the CPU we are using (Intel E38xx) does not support "VT-d".
> 
> In your presentation "Bootstrapping the Partitioning Hypervisor
> Jailhouese" (as of October 2016), however, the point "Host-side
> requirements" still says "Intel host with VT-x (no VT-d required)".
> From which version of "jailhouse" was this requirement changed?

Oh, that was long ago: 6ebd111c8640, predating the v0.6 release early
2017. Not recommended to go back in time that far.

We still have a hack in hypervisor/arch/x86/amd_iommu.c to make the
IOMMU optional there. You could look up what we used to have in vtd.c
and restore that for experiments. Due to AMD, the rest is still prepared
for that. But likely not much longer.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6aaac5b2-1c88-699a-6568-0642e4a1a4a7%40siemens.com.
