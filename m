Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTFR5PVAKGQEG6KJVDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4194B68
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 19:13:48 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id e21sf647676lfn.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 10:13:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566234828; cv=pass;
        d=google.com; s=arc-20160816;
        b=Le8gM3AOS9wR4goUiuRE80pw8R9G3Fn4grSCQB5a39Ehd1rY5j3A8VsIAH8AqB/RUt
         RtkBZPRWV8QNo7CZbIw917Q0sztr5Bq1BJDAI0FUYcMtIIbIMNNAQNAn7jkM3GHEA73J
         uoj7I7E6Jx5w1zDT2AZrncxOI7bWXvXEGZ702pN1NeJjBd0TfgaHXdBeH6wmNnhObjMV
         l80I+CJm1dm465JgeGaEIoi+FeYDmwXGRwDd+h9vW7wqKLRtX9i7xypc79sK+EupGJI/
         9OpedJ4gquy0UhHhuu/rOxl+5sKSb5773Gh6KjbK0iqbGmAc51ycRNT6fI6Q1Ijjzi2h
         XP7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+elVkVavQqWdMUHJ28EgfJBgO6V5uJPgtD38r1O8q/c=;
        b=hKhEl6drB6+DHRr8F9CApcCEEtXEtcc+tUwaOLgvETK6ZJfXwz35OPqzq35HKg0SSu
         lnDe4yioFwNhIXopauG7DKq0RHj2XG5Jq7E9mfXaei1U2jDNw8jZjSeAtDu2i68xkT1Y
         T1t/fwJDMKkh5/Y1g4yO/eLpgEXIFTU7xTgPIHRC9MLvKppu/JjxH+NIuElOQ8Ozu0dJ
         zwljbC5Jfe1CbDOPtokrFnedcTHb5M9E9XD0c8oQGnX2OgKbS2QL0DjKKWKtxWnqGmG3
         gtWdLHhxFDRn+brAQcwOejEtX6GbOubBTazPPDsQFjRDLFGHEApFgN+3BzgXO1huWzn3
         ug/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+elVkVavQqWdMUHJ28EgfJBgO6V5uJPgtD38r1O8q/c=;
        b=XP27b/DPc9G9HFDnXafXqenD2tB9rd6dO218ZNFOKbqZGnhF8Z2nd4/8Gr7Mdu4NPI
         w/jasiv68A3u/8+zSuTv6S0jvHTVavqph3x4GYlV6Ld2t8t4dGLRuXNvZPFbvB93lkqr
         odTJQEIxJMFM53sLDfX6n3mH/w652yiaILa/4Kf120Mu9w1N8+8TTM+wHa8AMw1QhtVf
         P4mT3EG4ia1rDocZKNLDQPr9qeGxT23t12lSgHIxOTPy3Ae350VF3W++N/q0xz77yKCV
         63CQz+6G/7Cmb3WRUN5Mubd1n4jTrQAEJAwaSlMJrdm9y2UMLiHkLj+BiAGXZBuCzd8S
         ITig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+elVkVavQqWdMUHJ28EgfJBgO6V5uJPgtD38r1O8q/c=;
        b=hh5rLNyfaOqoNX7UzhwFkX8ZrHQ8hpdKQCZ9lMo2aygWh3MslyqbkTFf+I/WikPzl4
         1jV21VWWija6uMdNq0EyM/Clkzu3dVQGttHt80/+2SZ/2lnyHH2OF2U3Oeeulv4/A2hE
         i3ONKJEaHtm/c0RJ3VXcYhpf0JhXy80+DMEdh1hl6zMnmBWwjbznRnN/mFQLoArSn/GL
         UjDhOq0Cb5yFasjz6th1oolYeny8cl0V01cDZfGA3+/zhMEBhje5zxm6HVq6RRfgPk9C
         lhvo9SliwubdTe1yWP38ylLDHfR0boCgmAEgE/yjDXefDUYCQRbG97Q0WLuaW1IkEufC
         Cb4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuW95EmKYaZI0MsZ05AfV068hJ2b+Ojso9dAkduNj4PJ6eJOpY
	b9XHRqPowyABW5k9HTSooTg=
X-Google-Smtp-Source: APXvYqxwn585NsPEB2RicB8sdxpVjQ04IPw0S5FKB57DnQ/Ygy+ULsAPf7x8ibvUpey8SgIqw7zg+w==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr486426lji.200.1566234828422;
        Mon, 19 Aug 2019 10:13:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls1415847lfl.3.gmail; Mon, 19 Aug
 2019 10:13:47 -0700 (PDT)
X-Received: by 2002:a05:6512:288:: with SMTP id j8mr14021424lfp.181.1566234827655;
        Mon, 19 Aug 2019 10:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566234827; cv=none;
        d=google.com; s=arc-20160816;
        b=Efcrvqo2o8Am8Fb0mArJD9+HQb2mb3PU7cSgmIjpOj5xxRHMXzTFHQpRmgJ/s3juTL
         gAXWhTTJaF0ijY+B8KYvQa3rlEopsigJHYs8fHK2kQEgKhf/VZjt0Bg5u4mOIwyWRkhy
         n3acGi4X0RYBRKExSWYRMl+Jhur6BIN+9sYzxJPfa5AcxeJ40uxSzOt382ZKKe2gvKoI
         aR0h+DChKGKGD7MUg6y9qKrGI66G0/bxcFQjvmY5aYnvKCtaLQuAb8X92s9eslBXBIOV
         XU1USxuteDmFjyNPk/j6AVzA3mrNdRnUylvBG+SazkhFoPUtbV2fYCEk+wDZ2fg2uD/s
         ek3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=kfEcF0lknrtYioqtA48hRNqek5BsY0MncWS5uqCV838=;
        b=nNwepy0CUJRKjLi/kCE6UJJwWV9bV/Aj4AYhy+ald5UUGTO88Dz5jBwMI8rQ3ZZJkj
         pXuj8PgwANkuqYXOMEXbHsx/hADpxaHbRt1PawoCplOA04XYGt8SEBeqjjXmv+qWfHcZ
         GuFE84B2m+Mx45kRNqdnD/s2JzHe1osP5FGBAyKk4CqUrtgsSjISm9oOKRFk4O2VAP8e
         OBBDGRwTVLB+/R3cqebo0jhhpCIrkR0Smxpawe5rearPqbvlKKumZzF0ceHTqscTN6z8
         BRPTf5bSmgu8hHLRzT+r+gCwZ0Mp+1mFVA3RqFPeHtHtyCDTKld56DJ5uiYXjbOo+Vmk
         7p4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f26si607645lfp.5.2019.08.19.10.13.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 10:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7JHDk06026744
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 19:13:47 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7JHDkxL008452;
	Mon, 19 Aug 2019 19:13:46 +0200
Subject: Re: [PATCH v2 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        jailhouse-dev@googlegroups.com
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
 <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
 <d6ca6575-4173-b462-0123-23a93566a7f5@siemens.com>
 <f05e09f3-9858-ea1b-fa29-aa9c6e8b99c9@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d43f7fd8-8484-53b2-661c-8cf267f91917@siemens.com>
Date: Mon, 19 Aug 2019 19:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f05e09f3-9858-ea1b-fa29-aa9c6e8b99c9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 19.08.19 19:10, Lokesh Vutla wrote:
> 
> 
> On 19/08/19 10:29 PM, Jan Kiszka wrote:
>> On 19.08.19 18:50, Lokesh Vutla wrote:
>>>
>>>
>>> On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
>>>> Add the linux demo cell config for j721e-evm board.
>>>> Also add the required device tree for booting Linux kernel
>>>> in the inmate cell.
>>>>
>>>> This cell config acts as a reference for partitioning
>>>> devices across the 2 Linux cells.
>>>> This will be updated as support for more devices get added.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>> ---
>>>> Changes from v1:
>>>> * Split up the peripheral mem_region to match with kernel dts
>>>> * Add GPU, multimedia decoder and display devices
>>>
>>> Upstream Linux doesn't support this node. Do not add un-used nodes.
>>
>> Well, if it's real hardware that won't be moved around by Linux eventually
>> supporting it, we can already include that.
> 
> Bindings are not finalized and not yet posted for review. Is it okay to add such
> nodes in Jailhouse?
> 

Ah, dt bindings - I thought this was about Jailhouse configs only. I agree that 
it makes no sense to have unstable bindings in our inmate dts.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d43f7fd8-8484-53b2-661c-8cf267f91917%40siemens.com.
