Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2WD6DXAKGQEHFQ7CSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD721093B0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 19:48:10 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id c17sf3242356ljn.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 10:48:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574707690; cv=pass;
        d=google.com; s=arc-20160816;
        b=BR3N6E2SgQXNB7sm39ixNfAokyGMo97kEVTE2ybmmfy6anr+OWnNqOZ9/MM1REW6+r
         xP7Jfxp/kQ+GjA45TYTW23eM30WMeVis8DoKWD2KWAk6qFxOLEfkYpB5O6vQi2yQ4Iq7
         vlA0LCVGLmjkfeupjzYBkYJh37I78v/889EMa1WsjnTzcO6Xmp8NV9v+lqETkrGvWVjR
         PMKZeB8YnSdqt4FORUlXAdQIMWDaPVoPUgZMTmmuqVNJQwhmE2iAQm1Kpi5/rrN0fUQu
         kbhItnt6ecS7bQ732/Vu1/lh1VAOH39Kxoaet6ot9klmAOVdBHp9+mjzgeRWi4WYufEM
         02FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=P0FGIkZ0WAM8LxNMZqorNrtArxUHK3nzeOJpMADKWnI=;
        b=prZx8qOIwGyNvzHnu1ozdkRTXAqG6U9p/loXtBe6xBD4RWrqWI07TwXYZqMHpIwtzW
         3ypjSblDUiw0LcMl5HtAMs7tQI5nglos5QyYmD0QB/HI+vC7D0UJ07xg0BkTh+zi0R7s
         5CQM/rJe9w2jR3/H+9rxCG7c4xiJPTAmJDnpdaDtRq9EkJLcvfkgNBbAcr5By7KJKPAP
         FnbvovZRJPkd1ajZtIDZEayV8wiFlPTM7FBBXHRnC/adk8YtkZuVW68v+hAYvP04oiME
         2cE1ezvhkHmPc4nLQP2tE8YdXZjzEa7jhlBL87evEdp+KVlSz8HB9G9h6gPqReOXvlFg
         1Tgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=P0FGIkZ0WAM8LxNMZqorNrtArxUHK3nzeOJpMADKWnI=;
        b=f2zWw3D6OjvPFhMfoOPWxIQR2UX3Tbll+0IHqCeoM4caAtrt7ZiPBxxAx3IFIinrW5
         L+CFVVXdCGXyU7a/6tylI20xZAc/9erhwph4vbbfJkTm0hsacmWjpb23jcUtTJWr3bUo
         f3yui2L4bvEZPt0AG/CJlWNdmFwvBQV3HLUTs09OKGlM2L/18Xrc+AKRy1aOQ5+NfAnu
         jo/VXcMfKzZ/dPVph2o3M8cI9G1uLTz4Z2h7Vy1oMf5F6lJ+E+RQXcXVl3hLQbPfYAov
         QcDwXWZjYdt2Es2VnrTaqgAs7Hk3RdaR4Ht+0Tt3XZNHHBJcQg+c1HagYoQIITGOneP5
         HI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=P0FGIkZ0WAM8LxNMZqorNrtArxUHK3nzeOJpMADKWnI=;
        b=OldTnRWDzgn6Kmp1tdPJb/W0ouULm19SzV5FluzFRfrs2XluTRJSRjqqHZHrRj7fyA
         K/K5DSKpXI3O+0mY7ATjGuegTPu+N8zQ7txTx9DPQIcRHeUUB3wiedvYNSIsRagIsmHG
         BDLNgd2QtDMhYeFJtMllqj40pmnlG2b2oifg09nmQ/xZOxpw82iNOo3ugVlOv8uc9+jc
         5UY6b3kckUz7Ahv+NU0vRVResXe+6JkMuomn30g4CgeDHEgau2p0XTpyGvcboocxWwCg
         3xPePK4WuY7P3yvWYxoLlcFpi4JrMUp/7FZFjRl9+0CQDismYYSkAOdPsItP+92tVDJ3
         wj3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVTQsyxXKzlZyr7eOO3vcu0kvWx6vzRf5Xh60L/y5nyjlmqYM8d
	GyucEopw+KX4ed15/YuPDkk=
X-Google-Smtp-Source: APXvYqzoSupuUJ4XhmKgb7w7tKQN33C+F3gUXN09m1ACpkWxGO1RUu6VJO3Ar3Uct1d4ozcx9KHhNg==
X-Received: by 2002:a2e:900e:: with SMTP id h14mr24181535ljg.27.1574707690420;
        Mon, 25 Nov 2019 10:48:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:289:: with SMTP id b9ls2538871ljo.10.gmail; Mon, 25
 Nov 2019 10:48:09 -0800 (PST)
X-Received: by 2002:a2e:99c2:: with SMTP id l2mr23447467ljj.145.1574707689614;
        Mon, 25 Nov 2019 10:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574707689; cv=none;
        d=google.com; s=arc-20160816;
        b=oyosGENPWYJn//Aup1UOe+gM5rY4VcKEzkEXuRkwEwfRlpez8/v1puzNY96cbAvM6U
         x5MWvAPyHXWe/SO5ObqBQDWhyBHJIQodel+DkXCrcFWHCVPms/VfguYe6gPb7AXxkA+b
         p8DtQyxQBRi3BhAsCXNjd2DS0MXRl34teKwQeBHNeoPNvYpiO/zq6tHVfucpqngfhvLG
         2MLGt2MKQrqHNv+drE1033w076mIJTfTEacgAKUJgxlEGVRHCm1IUFIJ+SGtq6+FNcYr
         rIk4c7WR/zinyXfkQ+fAVnXoxSAJOPg3uXJ2amWdAk1OvsRz/W0DJH/Gw5UgaAsI7rR6
         X0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=02HbKn4Cq6a6mN/azvDKai40SG4o0FnxrAbevgGipx8=;
        b=XkbpwJw/1FEwNYBfoVbUsCmpb1M74EyZQUG2/IBeuveL5RWwCdXs3kPcZMXV0VnQEx
         CVglvFp1M3/J3GlblDK+60tZfsMT3EY0SSiLH2/7PWnfcKtbrACHIO4lS6WVYhbaBXBo
         GjFeG2/eSJon7wbu1UJmNO0Sp/1N9Ho9gd4lR0OQ6X5a8XEr9WMpQCKIu6q5XHWssOU/
         OZKJr7GcSlMuqS91kGkp/QGUPjg2US0FimH3Iv7/A0fL6GfxG9YpWRIpEmfjbsih1iIz
         ZxtLNFa1GTcU27P0y7oFoseMzZK0IofMbKaJc2ljzCK3fCOttenonmGcWanTM/nOP2k6
         1ODA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t3si254343ljj.1.2019.11.25.10.48.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 10:48:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xAPIm8CV024591
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2019 19:48:08 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xAPIm8Xs015131;
	Mon, 25 Nov 2019 19:48:08 +0100
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
 <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
 <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
 <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
 <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
 <0b78bf24-b7d2-dd23-b2cc-b3f6ebf367c4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b4874568-5093-f2d4-0fa5-d93618b9e0ab@siemens.com>
Date: Mon, 25 Nov 2019 19:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <0b78bf24-b7d2-dd23-b2cc-b3f6ebf367c4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 15.10.19 18:39, Ralf Ramsauer wrote:
> On 10/14/19 6:36 PM, Jan Kiszka wrote:
>> For the am57xx, this needs "only" hypervisor changes. The kernel already
>> has to support for soft-offline/online. I would say: let's make the
>> save/restore working on that device, and then we can think about if we
>> make that a root cell property that controls whether to emulate PSCI or
>> use save/restore for the root cell CPU control.
>>
>> To reuse a generic control on the RPi4, it would take also kernel
>> patches. But that would be the task of someone else, later.
> 
> So we have this (or at least similar) issues on any platform that does
> not implement PSCI, and looks like there some. AFAIR, the Jetson TK1
> also didn't have PSCI support until Jan patched u-boot. :-)
> 
> For the RPi4, e.g., we would need yet another workaround in the hypervisor.
> 
> But guests actually do have PSCI available once Jailhouse is enabled, we
> emulate it. Just thinking loudly, but couldn't we somehow switch the
> Kernel's enable-method to PSCI after Jailhouse is enabled? That would
> only require some(tm) changes to the kernel and I agree that those might
> be too complex and/or invasive, but this could /maybe/ provide a general
> solution, ease enabling of non-PSCI platforms and prevent extra
> procedures in the hypervisor.
> 
> Just for the records that there potentially might be an alternative
> other than implementing workarounds in the hypervisor.

Picking up this topic again, for two reasons:

  1. RPi4 will likely no longer be a second use case for workarounds: [1]
     I still need to find the time to build a 64-bit userland and test
     that with Jailhouse.

  2. Vitaly, I would still welcome an implementation in Jailhouse for the
     am57xx along what I sketched. Any plans? Or hurdles?

Jan

[1] 
https://lists.trustedfirmware.org/pipermail/tf-a/2019-November/000137.html

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b4874568-5093-f2d4-0fa5-d93618b9e0ab%40siemens.com.
