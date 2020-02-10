Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4FSQ3ZAKGQEANQACKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD161581DB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Feb 2020 18:57:05 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id dd24sf6896581edb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Feb 2020 09:57:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581357425; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ki/9vB26v/Am0PQ3Y9Lf8yf3xrVeOBCjaZJ19Aohd8sZKz7/6zXROD8tHNy2FMZq+8
         lIfuRbbz/7zM84n8wtE5YuLnS7GgDpconVgOkdGoimQss5/18Mo3o/iOeeiDnpjPiLoV
         xTPFShSaz6+dxUPIwi9fojiQ6vV4x4aGzOQFwL+rv9CKCCCHz+bUR9STbAg8jaczK6go
         IwoaCQP+V5F5pdoYo1zn9lXTE5L/LEUMht7XPyMN4teMa+uUrU6rhKSZGI+ceebfZZFq
         jNgAPBwZJltNxeo2RfvE5Llxv00HeZo4rHQzmzVGc5AgRWNa8NxE2NerIr49XdnpGW6k
         SfKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=LydReAmF2UCF5Nc+EQQHooxT1xlio0NDSM/TAsQe7QY=;
        b=mAb5Z2OaCTnTzPWW2339QmER1qB1/fMLKfij58cVL76qfmhKqv7JXYu68w31EYZMx3
         Lsl6JsEs7bnmC/rkxSL0aQ7Sd3jeD5C/7+sWnVH8VnLjdxuX9xBLa8MPex66ONI3py3h
         8cHlreE6kf3Gn8e15umyCxuSTxgluVr27zTmguD/Wm/JHvZjMSKKc0NVOdf074VnSxAc
         dL/y+jj+2PJk8ERvHsASKBttE859tEx4u/pQ5U2j4BHf/NBuBCtIy3xiqJavNHUhHp3m
         X+ehBFt4y0JrbBpwpUeBFA1JdBz6LFtS1nME9zFujUyRH+Ui1Yyn4UP1tHHgWgIzqLT+
         68JA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LydReAmF2UCF5Nc+EQQHooxT1xlio0NDSM/TAsQe7QY=;
        b=aR3XNX+Tvrytq6bZA9I9ECn4rBdMPoUw/eETwov/ZAd4iBpNwpK8Urw6pxU1THEueh
         Dz8keSkn2Jn6tEN7AtFbxaPu9tirZucv//LRbITYAcOACCEEdcetW0240oB9bhj/lD7Z
         kHNeZirsCbauVT8asJEFzPJDDwIFuEOONER1oeo6PU0Qk3ITRy/Kt6v55HyiD5zuuooS
         wLFqw/oAYN34rLY8JZv8HZiN9rgs2dUg8KC13oL92I+B3LYqSC6TVa6MXZ9KG+sbv/C+
         VfFNQ83XJ0XhS+FN84Ow9GwjCBB9c178ntfA30eNE6TC1Bb5aj+KljhZO3zeIZ9tJzta
         fa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LydReAmF2UCF5Nc+EQQHooxT1xlio0NDSM/TAsQe7QY=;
        b=AUB27tcfgwrAEyzctbwNYX38JoyxFJr7YqiF6K9jAHN0YNX5HluV9NNXeE1tpMRN/M
         Fei+YMHkqb139+L1Tye8LVK2cx0fo//qoGOHrQfd77t+69f+Tz+alAhCC8Qp/lWAr/6/
         hRVWf1Z/c42jgyYSaG6fWSG64ctFnPSvdD80c0xkLXWplGwOXoo0GyjVlYrzLKyO6c4a
         JRIn5uyZ4WFn2oGyhzLMpgc4cNxf9dyp8atiGa/QXmG27UUBvXNZUK1vNFm8bdcTfMMY
         7cAR/SOC8AufFbv4TSB6Esjnc7AiwtIM9RcUBaY2g6CcMpJuza157quCc5vUn1by95q1
         3NSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV+FK+syE9R3PAps4l7jE33ksNRwjYnb+bYcNbI4sintcm/Xnqt
	aT/E9nePkPIAq1PIMgbRdbw=
X-Google-Smtp-Source: APXvYqxwKwVI+z6E4P/mHUzOOAE7/rGut2tVL+FAhwXYNRjeHhTCJUr4kpx0gF/4ISecxwxDEIyv5A==
X-Received: by 2002:a50:d59b:: with SMTP id v27mr2147699edi.169.1581357425080;
        Mon, 10 Feb 2020 09:57:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:584f:: with SMTP id h15ls4665824ejs.9.gmail; Mon, 10
 Feb 2020 09:57:04 -0800 (PST)
X-Received: by 2002:a17:906:4a12:: with SMTP id w18mr2309147eju.321.1581357424230;
        Mon, 10 Feb 2020 09:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581357424; cv=none;
        d=google.com; s=arc-20160816;
        b=NeIpUJ56WYI6zlnsZc8lN2R8MBhzIrbI/VwShHxn78BhXv2Pt5AKHeb9ex+YUaMW3W
         hEthyxDWJgGY7JbG2MA87BvPJQnNSCTOxbeH+8hmT1BVGWP5AO4zMpS0VV5OR3BGzSwv
         xgMQ4Dem64DnVF29CafEagb47p8qmLZ6yW2JfF5a1UH6fhikCzshtYF1cWOudlhpfBR8
         Sqvkxi5ME5IvssQnsYVJruZRCKw664ufQL1i+VVeGSqcb5YkLm6ZW4e4ro7keW5/gsBU
         I2f+OXxmcHFqmkr2gRwPUWpyYz7fxLPk3Fc+Vc5grUjbeJZ9idw4zuZAHkOCH39J2sec
         UwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=RubEo2+Dft1IxFprm9RKTHjNWVubszZl4+GPaohLmNc=;
        b=ia9kY9ZvKNJoXkpV74Iu0Vt73mQLhaGuuSyVpycT22bvKEIt7VD1A4RswRavK/mzzN
         gh15Z1uQSYw5DcKYgpekFqEWAvImhYyTsGAEBhlq+IuqXwuZDO8u4I8f4KUkA/b+qHK0
         4GD6MdGKJPSBBYmh7cIo9X+i9rZlkNDjQbU4DgO6IvR720ANrmvjNe6N0m1gHdHtA6dd
         ABnS+5MdwraoLj68d4MAlUMTyzrC/bi5VAhs/421prYwYYr9Aw0x+k0mdLOP7iYLRUuZ
         SPNJCFg6945iN1a2bV5Caapx+hE5XbnIRw1I0FbPotqZS9JmyYJqQ5AoTRTEGZGV673x
         r2Kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id df10si72335edb.1.2020.02.10.09.57.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01AHv3Dh030634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2020 18:57:03 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 01AHv3dJ001939;
	Mon, 10 Feb 2020 18:57:03 +0100
Subject: Re: State and maintenance of supported hardware
To: Patrick Uven <patrick.uven@offis.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <5671a634-b728-b0d2-5702-1cbdcb41b7a5@offis.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4cd52364-9c2f-8766-4898-5512a9211217@siemens.com>
Date: Mon, 10 Feb 2020 18:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5671a634-b728-b0d2-5702-1cbdcb41b7a5@offis.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.02.20 18:08, Patrick Uven wrote:
> Hi all,
> 
> I'm currently evaluating the usage of Jailhouse in a project using the
> Nvidia Jetson TX1/2 as well as the Xilinx ZCU102. Seeing both in the
> list of supported ARM64 boards, I had high hopes to get them running
> quite easy.
> 
> Using the guide in the Documentation folder I was able to set up the
> ZCU102 with Petalinux 2019.2 and Jailhouse 0.12 (and two patches, [0]
> and [1]), but can't get any output from the inmates via UART. There was
> another person with this problem on the list, but his workaround isn't
> working for me.

Not sure which workaround you tried, but of those UARTs work with 
non-root Linux but not with bare-metal, it's related to Linux disabling 
unused ports and the inmates not having the logic and/or the privileges 
to reenable those. "cat /dev/ttyXXX" under root Linux may help then, but 
the issue actually requires more proper fixing.

> 
> With the Nvidia I'm unable to build the latest versions of Jailhouse and
> Linux for Tegra with the problem Saroj Sapkota mentioned a few days ago
> on this list. I have a running system with the
> "evidence/linux-jailhouse-jetson" fork and kernel 4.4.159, but only on
> the TX2 (the TX1 kernel is crashing when enabling jailhouse).
> 
> Is there more documentation for possible solutions to these problems? Is
> anyone maintaining those targets? I think I can get both setups running
> (and possibly provide some updated setup guides), but it would be
> interesting if there is still anyone "officially" working on them.

Unfortunately, the above boards are not part of any regular testing, 
thus the enablement can indeed regress without being noticed. We test 
frequently images generated via jailhouse-images, but even that lacks 
automation at this stage (on the to-do list, but that list is lengthy).

Therefore, we depend on contributors doing tests, sending fixes or at 
least reporting issues. Obvious issues can then be resolved remotely, 
trickier ones are usually not a beginner task, though.

For the boards you mentioned: I don't have any TX1/2 in direct reach, 
thus more complications with those. The ZCU102 is in our lab, just no 
one here found the time so far to add it to jailhouse-images - which 
shouldn't be too hard, given that we support the Ultra96, but it remains 
work.

To that comes the desire of some users to take a downstream vendor 
kernel. We only support that when really unavoidable (RPi4 for the time 
being), but generally only test against latest LTS mainline. Due to 
that, some resources may not be properly modeled in the existing configs 
because mainline, at the time of enabling, didn't support them yet.

Well, it all boils down to a constantly growing test matrix. In a 
community project like this, it's the community that should help filling 
unavoidable gaps.

Jan

> 
> Regards, Patrick
> 
> [0]http://git.kiszka.org/?p=linux.git;a=commitdiff;h=70b17485a56b6ff27f44c531ea382c11194327e2;hp=4be84b9b39b16493e1577544387e0fccc43cc344
> [1]http://git.kiszka.org/?p=linux.git;a=commitdiff;h=70b17485a56b6ff27f44c531ea382c11194327e2;hp=4be84b9b39b16493e1577544387e0fccc43cc344
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4cd52364-9c2f-8766-4898-5512a9211217%40siemens.com.
