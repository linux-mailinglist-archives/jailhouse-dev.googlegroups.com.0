Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ4CYL6AKGQEMZ5ULAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A2295261
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 20:43:16 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id h14sf2049132ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 11:43:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603305796; cv=pass;
        d=google.com; s=arc-20160816;
        b=pTItp3j6w1lC2JJ3GujzUbvBfKsnnfVR/4xetjSXdYz90KLherc6TapaYqaR0Nz3n5
         G/opvFZlvrGkx6x43R6Tg2MsESYyl2K8nvYhJdUwUv4eAzHqUziB/wWPYgp6bcRSMUAy
         8haNCZLrd3di9aMQocxwX9UkwVI+n/iHtg77cT5+9g9VcOQ4CMCR05PwSqGbBj9KfKAu
         j4MEsnjTCY8oJzJ0S6SweP2zjutOR1hDIP4RzWFfTXJ4FOYF/wIXEHz63YKKQXqPvQhn
         Zv54TCJ9mqBSs4ywMguxgJ/oNqHpOd3vCmPu5oZZeLxx+I+QzvUlVZcC3hOzlsFDyQjt
         0cdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=nqYzGis7drIVnnKJXOcGDIbugif3EdPaHlc7KZuROH4=;
        b=xmbS47KgzraIriMCmd4ZRWNs7kCn44VudROuAdkFXe2XPXLt0EYjplRiXddNQzkjrr
         na02zrNmpxdkyTGcJ/1zwtYs9kAFryCdbQ3uokAcDteiCsmVyandOt5wHWCDx6zEVsI0
         dTfuByEdij4TLNEDcRtI3/sIaVhNE0UWNgdNmK9zt8oejsaHS2ay6FfL7YuoCrrrUltP
         STwRBEELRXQWITnNzt5Q0g3ksJV5sb1skNzlliyeWeC0WbbYRCxua626X9N/Mrw+9Rfe
         OH2oL9TBDq3kiT9MH9uPVtrCTSI63sm9TqXnn9QJkosF9OIPetu4vwnVo1k+p+oClewi
         muxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nqYzGis7drIVnnKJXOcGDIbugif3EdPaHlc7KZuROH4=;
        b=MAn+QLefXXXN0IGhZ1X9V9SBM5gTnMNAClOvlErg0OnGgtHTRDpnjBLWiyr/FeMcr5
         e57HQ58CrQ07L9wbvICGsSsdyvHQqEVOEBYncCiWLbgXoHVcS8VgajmsmSg315kNx8c8
         IhXI2wsY3NvJBd2BY1BgSYdujdlI08qmQJs0NPSP0zicFmfwj59V974L7UHFs7dGei1Y
         xGTbC+7OQOROlIoQODlG8W1pT2K1DR7xYIvn6D/Z2DOZNLFCnCeZ7iDsc4yUf/QtpIze
         rMvV9dgPVEpYcMZon6QRyMRBzi5sZdHeYXDYJQNGLeCdub9qGz4VGN9vIrHvgr6V9mUn
         JSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nqYzGis7drIVnnKJXOcGDIbugif3EdPaHlc7KZuROH4=;
        b=WEGazz7RLZ/XioIPcuzDvoOxHt89fs6E1Ylw+d/FTjzdjBJKDc4ySs/0aDQbMjweuM
         si9Z9svHGlN8nxNxTZTCKzrnRHHYU5wXol1ObsLpbZeZHcXU4gUjUbG0tjyw0E7FEnUw
         8hP37obACRgnConYDu/fSXZq1rl5ngntXi9iBrbKKx8maKbhPoazgCwn5/yHmWatdfqB
         E2vWxoW8caQke5wwaYVa05I97gwl0OU6K8ysHZKj9Jd+gHrkEcCANb7JsC1NHAj0x3UK
         6tuR6rti3t3h696PpWtx7xaFqStClY9CtaXBOyl1X7PGlLB8Q9P2vDDS+W9cAN84n40i
         CPSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XM8F7jYbUFEZ3eOx8KKLVEqTKRUjUBdTKsZdC13NL6nP5yZ6V
	1JNNYTeAhDjl4BamZ3CuQGw=
X-Google-Smtp-Source: ABdhPJy3rOw6P3mbmQ+hQT+btFoSOB/E2esfXP9JVzs5aHdtQl6ckC3ij98SdcsNiDCvhSWVRLsiVA==
X-Received: by 2002:ac2:5451:: with SMTP id d17mr1855360lfn.480.1603305796177;
        Wed, 21 Oct 2020 11:43:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b6d4:: with SMTP id m20ls75317ljo.1.gmail; Wed, 21 Oct
 2020 11:43:14 -0700 (PDT)
X-Received: by 2002:a2e:9652:: with SMTP id z18mr1939858ljh.410.1603305794761;
        Wed, 21 Oct 2020 11:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603305794; cv=none;
        d=google.com; s=arc-20160816;
        b=HfV3t4T9UtR/ypJA8h8/aXS34bH5zPnxm3F+5/QUV7Zl0aBm8Xh0AqdFZiRVpJTZ6w
         NVGpkAbOzt0VX/HLC5nierkWtZefJvL7YBz9yCQwHtw4xP3S8fDZ9ATFWhRx5Qsqvb52
         MhD7eTshIU1P92gqa2o4B3zQsssW9f2XEI0+VomWaUwOXfIuVWlR+UuqBH1QwV6NTQ4B
         pa2saemPjWZSpfmi+p5EG/oCTj9pkZt5x6jgtX+C4WKeINtndjyiHqJShrAPTO5VfDCJ
         TSiW3NNOhNsEcnFUVZ8/MV7uZY5B7eH9UWySY9hIEyU4dZ7sbM93JdglpjaN1lrNalPb
         FQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OM9oAwrNg6EUpYOzMw7jlDUOogUODDbEAD3c7K92SJM=;
        b=mM85rr5u/0JPAidwwDoIsjnIDzSsspEz3uOjAzIXDxccGtMQypdI56HhD/A3UWZmjc
         S7yCXG7Jt3zPp+uUzHk8FQBdLvAksIVfH2xzMYXshwHIr77JvZD1Z1zg+zdsoQroUoTO
         YNDdaSbBsbjKyvgHq6Vs2O4v8qiB6rzVm9XzE6qr9GcBpFiTMjaUJ8aK3REoDBmHS8gR
         2UJpmfYsmQ7VcMkEoi1sHKbo3fs+RGuptSjvSk8UdxDt1TlfTY/iuvcv5we5U+QtQewh
         qqFZzjYmNZsAJoaaWm3fZYa4MP1iCt3EiKb+U2eURPE7wWNhI9zq5pF8/PmOVmiimbfU
         lgAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 8si108446lfm.7.2020.10.21.11.43.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 11:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09LIhDJ4011506
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Oct 2020 20:43:13 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09LIh9an013346;
	Wed, 21 Oct 2020 20:43:10 +0200
Subject: Re: [PATCH 01/26] hypervisor: add extra warning flags
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-2-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
Date: Wed, 21 Oct 2020 20:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201021145404.100463-2-andrea.bastoni@tum.de>
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

On 21.10.20 16:53, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>   hypervisor/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index 5322b5aa..41bf99f3 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -31,6 +31,10 @@ KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
>   		 -fno-strict-aliasing -fno-pic -fno-common \
>   		 -fno-stack-protector -fno-builtin-ffsl \
>   		 -D__LINUX_COMPILER_TYPES_H
> +# Nice to have: -Wcast-qual -Wpointer-arith

Shouldn't got here as comment.

> +KBUILD_CFLAGS += -Wextra -Wundef \
> +		 -Wnested-externs -Wshadow -Wredundant-decls \
> +		 -Wdeprecated

Should be merged into the assignment above, no need for splitting it up.

However, this must come last as we have -Werror, and you are now 
breaking the build.

Jan

>   
>   include $(src)/arch/$(SRCARCH)/Makefile
>   
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3ed6ecf9-900c-6dc5-9a16-900bfeef891b%40siemens.com.
