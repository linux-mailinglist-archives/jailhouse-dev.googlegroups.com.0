Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDVOU36AKGQERGFXQLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BE290589
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Oct 2020 14:50:23 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id m20sf1376225wrb.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Oct 2020 05:50:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602852623; cv=pass;
        d=google.com; s=arc-20160816;
        b=fvLmJaoX9eH6qim5n4Rn4gIBA982ljWnVyMOpa4CVaFuBjVg4atHnYL8mvwf6etaRj
         mfYh3ig75aeDhX+ZiUHXo48HxPK+eYH/IPw8L1M3vM4Cz4qOhq+3atNjH46R0TZIuefF
         qIu9kUqLc2ZAYH6chzuJWY5S/146An9wV4vBHVNGtgr8+CiUf1wlhWAEaXyRZgd3711K
         EGWlzzwQQWgCrHq2/FaQGcX09FlNB6Y9jRkPOqSHIAf7zqbbhzQ+4SGI4lMoZbpiQVfl
         qubWowwlb1lUURjou2c/H6oJEZHjHFJRBOv/1X7NWdD7fQjIgk0lLxAMllOmoB1Oy2fc
         G0rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=A2GtLVRvKqXqUYhMpN8xwWGXxZWfcQQeLvpxJHizS3Q=;
        b=GSKaxAs6bvEu8pxEa0625qCNP/p5dhRQEiSYSb7jwAOmWQhmIsl3yZBk5vPqXFDcS2
         CUFJy5QVCyJol3Vk1SSgPWDC0Ci0VmD56VEho6gL7aq2p7I1l2nV3Ra3ffGe5gmAw7Hy
         Wcjf8ngMWB4pIwrNRjSCb2vrLxR6s2Ho8Hk3d6e6pxM8XCovy/QbuwjGBFU4g/KfEfEk
         TuA41MB6mKyJnuclww61UoJtz404Nfxje95TjEO5NaaF+v/Y4MnjMPtKpM+TQgD/YBjY
         XqkauqKJ0RLDdpoQt9Fi1dmAEfhB4Ao9umZogHXkygu24+IiUvC0s5kJqPF04AzEgF8x
         sPHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A2GtLVRvKqXqUYhMpN8xwWGXxZWfcQQeLvpxJHizS3Q=;
        b=P7nfQjbFVwP1edPKJjqnkd/n6WP8755IsLHMPv1ktCHPk2gNGNSuEMFqnUa+XR4z/P
         YYUk9lYTPaD20gECOyObDT6tfTelCh3Pb8WxMhy1BgP29XRE6CvxrLuPw6/iHKfm/eou
         HzPnROyWih+DQlQpw7gv9/AeK5CCIqxbVBi96rs34rDKrXoHva2hD7EEIgKn5+8Evdk6
         Mtkgofca0IUSW9wmKUzVvvucuo5xRUs1I2XAsAKfMOasfSAILQM84E8hZJwuuoovGrTz
         mr9V1neH2p0QKbzqtogA/P/rzj3np2RB6rSuMY054ZpMPyHNckM48OIN7/G3CrfZtpgP
         kEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A2GtLVRvKqXqUYhMpN8xwWGXxZWfcQQeLvpxJHizS3Q=;
        b=S2Jg4Qdq8G4cXJlu7u1a1O3p3S7iyBOn+juU+z1w8vNWbR5/4E5Pwn39AnslgFNctX
         oZGl3Eyb/CTm0tSV0aMRONniStL8JvWA3qlupypoSa4G0vgX/j2Q286u47xYH/7jurWD
         7WTPSSM+O6FwmUvivExUfJBv8RUD01pHM44laqsrI6dhcmBgFDkluGNj0xSp/NoTHvGR
         bMKWcM3o5j7Y1mpDXaOtXPsvljbfP4c6PC0ca8ZVvO5ppX0VSWGEEYYpRex56coS3iDY
         CIbq095YwaEHiNOZyVjAJ+c45Qwn8+WOkAH2+ymTw8P5wLKKcBx80XiftIHw0EM6cW7f
         F2TA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530tpu8CLARVXyNAxk+oBoWVYaa0p2s86rnXbzCNjg3MxlRwwge4
	ZwAsLnFmSs6K1DaOF2N2lJ0=
X-Google-Smtp-Source: ABdhPJyQ+Ak6zLflRaxa0kqlOS/Uz3PQAm9IH8fWt9ikKOyPCEA7DyL5qvabiJ3m+Na87VGCaH8BDw==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr4086462wrc.105.1602852622995;
        Fri, 16 Oct 2020 05:50:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls911538wrc.1.gmail; Fri, 16 Oct
 2020 05:50:21 -0700 (PDT)
X-Received: by 2002:adf:c5c3:: with SMTP id v3mr3915824wrg.205.1602852621921;
        Fri, 16 Oct 2020 05:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602852621; cv=none;
        d=google.com; s=arc-20160816;
        b=q3MJv91+qzc/cRuinZAy5VHMNFJuUdG8LjG2PfVQfV/mJAKcuTCBjnzy6yz6FfJJRa
         KFCGU4ZhcOhoVhLN7luGGEtNugJuuuiwM/zOspSZEZ8SSzCvJTm/2qRXr/dFaIW+dJie
         S3Kg8HvRKcAvIgpWH2sHrFrobhsgi3aWJuTWu+zkqfh2/VDQ5aPC+EBB5CigbFIbJvjg
         Kc0ItVUB/sDw6F+YbofAE7T/N0PZ/fEOWsuvTD25ZkVpMT5zkWEut/9LHrA3WuQz1Gif
         mCasAdW8sD6irFrRiw+CS9h4Y9s1+hxf2OE3L9YpQl2uTnIB4tjEejuele94Dyyjv9ZM
         TSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WfV/bet8KRjCHRnTU1HjGOZjo2WDR0eK7+kV7dF5B8k=;
        b=JEcjKlE2HblgyL8MR7XaDXXmOqiVK65I9+vtFIxFv8+rDMxBC3DoPw7DYFVuN9tK3+
         C3q7PmZ1cUhHwmV3SggI7Qjwpj4RwU0U+giFKHzeuyzSE5IO38ngOkRRsRD05jPlKbXX
         ImAprSFcXfUt2vTeTfhGfZmcor04R7ONlzADGAK/jjjcJo44KxTWIwiuE4AmD9DhQ0Sv
         ZoF0HzhkIQKaadna7bfal06BFyeAggI7VTvXSUOyxxN0UYCA/54BPPiklQ7du8xPfJZa
         z8FBuQlOyN6aSr9u25P8VtT2pq9R8CiLKebr9hjMSZrwWsrATT7vDEqxB69aAE9h3PL6
         Ot9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z11si68363wrp.4.2020.10.16.05.50.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 05:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09GCoL07011420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2020 14:50:21 +0200
Received: from [139.22.112.51] ([139.22.112.51])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09GCoItl022600;
	Fri, 16 Oct 2020 14:50:20 +0200
Subject: Re: try virtio
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM5PR0402MB27560A658B44370DE004B4A888030@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d0ac37b3-a1f4-56f1-e15a-f53a345f143f@siemens.com>
Date: Fri, 16 Oct 2020 14:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB27560A658B44370DE004B4A888030@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 16.10.20 12:14, Peng Fan wrote:
> Jan,
> 
> I am trying virtio on i.MX8QM, but I not able to see hvc0 in inmate Linux.
> 
> I am using next branch, 5.9 kernel with jailhouse patches added.
> 
> I also executed the two instruction before start inmate.
> echo "110a 4106 110a 4106 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
> ./virtio-ivshmem-console /dev/uio0
> 
> Any suggestions?

What's the output of virtio-ivshmem-console? None? What's reported by
the cell that is supposed to see hvc0? Use the jailhouse debug console
or a regular serial console in parallel.

How do your cell configurations look like? I suppose you derived them
from qemu-x86.c and linux-x86-demo.c, right?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0ac37b3-a1f4-56f1-e15a-f53a345f143f%40siemens.com.
