Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE5I3L4AKGQE6SONEYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561E227930
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 09:07:00 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id i12sf12663625wrx.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 00:07:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595315219; cv=pass;
        d=google.com; s=arc-20160816;
        b=hAV3lw7WZj/jSVKRagUqNLDSJYCiJbs/ssVfoHoFnrQiCpzfz4Y5z4rNaVKqQBSKQs
         YONvFEqGdf4kMTC2Y+QP8m+WK63VlC00W8qFqVRoy7lq8QTwJK3gmr0gLuA5NnTwYhpf
         9ymtMEdwtwD6TYPiJ+EPM86MpiDOgTl+/0WHkAWoqFrXBffmL8Iao2t58Hz+vT9YW+4T
         ARpvfI0Lrr4TTYjwafXvsgq+O6WtNNMahf8dty4MaMcHX/s7O6YmKPMDlWZnULO+rb7Q
         RG1C+Y3X+mqTATAAvkYui74IhfBdbidVdl74Ri5NuDJ1tjoo76If/scSM6ZhWeQ2Xi18
         6VRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=CEXr+V5d4V5dBXzr1iChyePn0IaAwtX3YvKU4wwS8Lw=;
        b=My5Lcqh0wcOowlajqELUocbxiK2RJ2h6GE13cEyQxby8EWQAHtCFQVU7ixKSPAjF8f
         aVZAsd0ZqIZZZt3bgNEM6RkRt6OIPVgH1haqElFzprJQe99T8hfs30SWK3/6F5s1gX+z
         zpW6Syc1Hiz+e0CtAHfEAarZOl5G6BeOv3RZqDIEuSGfMH9L+J1AkZhxOLxqEh30Rt7Y
         KO6nbmeoLe3pt1kH/nul0Oejwk3zM0EAO5dFuhOx+nkfyhonEEX+thxs6Pb/FsuZmBHk
         zqMs2AL6l1TFmQVixZXch/CKcvQof7Htn14REYDAXDurZJ1zNuPVfDDlFRxCoi1QOdDh
         JVBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CEXr+V5d4V5dBXzr1iChyePn0IaAwtX3YvKU4wwS8Lw=;
        b=Tfk6YU6tQJXIL7TKe91/yb5muk+sCxy3EdE8Er9i4WV/sveMpNKYTtetKnTno9U+4f
         LxFH4f2sFWHcRgllffuMmKDS7la1PO3sB16TGxNp357P7vTXbol08OaKFiOifS+YlSdV
         QKTEjziVkpCX9vUW0QdIquQejtmuF/4YzqrkVC3yB84bPrmCeeu7d/oEGS9BffeLdAfK
         eER0Tss1WlDO5iwFp/VEE2knN3pu8Q4DrgjLkPmsZQv0r4In9ysyKigmFEHASeXkzQ28
         AWJcKxGnIC69XAsdrqb/At7YhD7vC54pwJU76BLoEnSTYj7W0h2RExcs+KLsnYcZW1KS
         ivZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CEXr+V5d4V5dBXzr1iChyePn0IaAwtX3YvKU4wwS8Lw=;
        b=UQjBKdlPlySnuxuJ0hiWJ5/FtgAvjJCU5i+sy2tgXOLGa0Otft3XV33LRS1GL5NdAd
         nBR2wGNqTeyK/ExnyjxtaAD4fuP0rF6+GGvi00bZyYp4UCW0sRGcuspp2bgu6PPB1+ly
         tzSfnO6G5xn326dF+EiMjbzuGN5SFbfSVEkAwtqifbxHekZVmd2g6PROmwHilf3Hbzi7
         L3sPdpiGsyBy6Kuywq7jHd8KwOyHTgNerwQ3wgJUNCBHGg45y+gVzBzU1kDlMMDVgM7j
         MYnXk3Zd61Jiu5GtyIgD1Pgc5rQWo+JCHCjnokzUNvF9g27rbaLP7jI4Db4KSRpfn0/S
         MsVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dz7YvdZgNLcwrg1uHaxgbxWrPJY3cZKtkZ4KmGoNaWX9mBLcm
	2f1s0JVcbK/1DrymQglfkHg=
X-Google-Smtp-Source: ABdhPJywoPMCgLmCbPnqEakv4HBY+5yGXRCVlXoktjOpM0501ErX7pt+BpvW/TrAeB6NWwIuVc8OPg==
X-Received: by 2002:a1c:e908:: with SMTP id q8mr2809236wmc.59.1595315219692;
        Tue, 21 Jul 2020 00:06:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls252222wru.0.gmail; Tue, 21 Jul
 2020 00:06:59 -0700 (PDT)
X-Received: by 2002:adf:ef92:: with SMTP id d18mr886201wro.71.1595315218974;
        Tue, 21 Jul 2020 00:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595315218; cv=none;
        d=google.com; s=arc-20160816;
        b=d1Vfa7p3sbZ1UmOO6KZlpDP1niGYhx1t8DevRdvzEgxXmqHN15DYS20MttxxpDID/o
         SY1JzEobZxDnYovHCgvdbzR0SXVqT3Y4PUSE3Zq3kTOr7LvTsLB3Ahr9wD2peTcksKin
         8GHqLS9tZj5kQEUb7gNmq0jOP2m38Wm0ape6DMU4ecAazZTyG9A+FUYTpo2oae8/zsrU
         NU9e3ulVSXCs5kT70UWKpucZRCvRjwSWpRsWDyBvGBEZ+DuBH514mnD8AWudYKcR1EfK
         96K+mUzlVkoDdKuIVhmXXfymo9w/SVnR0YjQmotJtEAnhLdNNJeSn5ohhfFXFlBHsF4b
         A1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EmByAR2SKFCwH1jjKaonMDuGDjsonhCDtzqPaAyyzRE=;
        b=KHZx+zrNdGgT+Vch28pTbMvYriXtJk2wpTr6f8b6SBFP2CXHZfz7DUPt3DCNXnnVcL
         ZUEGIOek5GZ0ftmed3dtpZzZX8OXFM0nJkGY9VVbJdhRgJnm+qTfqCMztvdbaiOJS7qj
         IgpPS+EKNsBGcfLFP96Pzv8KEq2J3dR3XtGOVMPlKrb946uVoroX+9QhSOozbe1Th9SP
         LEQUSzDDrAtYyckKmXGpegAE+gazkk0Stvew1ONyMpBObJwKFG0qTiNjJgKHD+ybFafe
         gtkRngi/BCLteHCNFwqc2+NNJilusf9P1Z19wUGwCLNAzugy+fDaOKPR4dNQyCSrkrdk
         yGsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 14si81415wmk.1.2020.07.21.00.06.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 00:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06L76mQE000475
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 09:06:48 +0200
Received: from [167.87.32.116] ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06L76lwN013172;
	Tue, 21 Jul 2020 09:06:47 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jose Martins <jose.martins@bao-project.org>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5aace319-3211-6b6f-81c0-30cc861bc13a@siemens.com>
Date: Tue, 21 Jul 2020 09:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 21.07.20 08:40, Peng Fan wrote:
>> Forgot to share:
>>
>> -
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
>> com%2Fsiemens%2Fjailhouse%2Fcommits%2Fwip%2Farm64-zero-exits&amp
>> ;data=02%7C01%7Cpeng.fan%40nxp.com%7C6ecf1e2eb2714099a5ae08d82c
>> f63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637308783
>> 336041620&amp;sdata=4WqAL3pvGByyvJjQH3%2BfiLUHCOLEXa569nSUwFT
>> QiTQ%3D&amp;reserved=0
>> -
>> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.kiszk
>> a.org%2F%3Fp%3Darm-trusted-firmware.git%3Ba%3Dshortlog%3Bh%3Drefs
>> %2Fheads%2Fqueue&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7C6ecf
>> 1e2eb2714099a5ae08d82cf63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635
>> %7C0%7C0%7C637308783336041620&amp;sdata=BlleBLfrVIlHQ6Gn8MHN%
>> 2BWv2v4C2GxBiTDjXzPLaDq8%3D&amp;reserved=0
>>
>> All a bit hacky still but apparently no longer exploding. And without runtime
>> exists of the gic-demo.
>>
>> SDEI turned out to be more effort than expected because it is enabled only in
>> very few ATF targets so far. The queue above adds it to QEMU
>> (arm64) and ZynqMP (tested on Ultra96). TI-K3, RPi4, ESPRESSO/
>> MACCHIATObin should be similarly extensible, and all that also in upstream -
>> at least as configurable feature of those platforms.
> 
> I'll check i.MX platforms.

That would be great! Also, any feedback regarding the open points 
mentioned in the Jailhouse commit would be appreciated.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5aace319-3211-6b6f-81c0-30cc861bc13a%40siemens.com.
