Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQXBXDZAKGQE5OTW6QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id F133D16583B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 08:09:55 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id b19sf948721lfb.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 23:09:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582182595; cv=pass;
        d=google.com; s=arc-20160816;
        b=RwbCQNXL+n3fu3FDCAxw3PzGJHslrO2pVcO6LMRL3lXsHcIYGNjkwxIQZVunqtA3Hx
         CeEcQlYNULniViEv9gCl8rPJfp4oDbmY7WESiSJnO7sYWsty5lr/dzK/GaHrIcIKA+8O
         EIfXunJM44joi3I0ggrrpGzeyMK1AyGKImhSRis36DtST77udC4LrSoB27x4Wo5KoWG6
         kVWurt19r+o2iw/1h5bkOAVe5EU03KRi5iY1iFrSuuRnUo728aoThXxK7/u6dPya/Ory
         xbxfEgRiR2JDaXfkMZ+p8m/sBbVdqn8ZeHMdvp4lpc7gdsDvyu6BmZ0OUH6hidwtolBH
         mb+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=1BDLyBlwr1xCNwQrN+5mcVHyBE+41n8kKoe0A6qo5kg=;
        b=OQbEHxn5HRVib4+/rLOWZQ+N1YMz7XNcyqjuvfiq91z8riW93LhW3pIpT9KoZzvtMP
         cCxMJTH9w4+wrZ116eZAOENl/QLYBwvDE4G2L/zVGs6BDs3xr7GwLM5m3J/yvU+5z0rN
         g6t36BpHQ113cQyJT8X3uweU/r6mdiJvILNqf6/BPQUjDMXsf49iDztkxDznJdh1Y+oi
         PGCpWlKZ41KFYCmYI+Q9mxtgRXv9iEn02gDcCH8nDeNWedsfwVagxsuNTYDcmgiScySd
         U2LCwBGE7nMSpiGufkFygOGk+w59zf/EGlubDCOSMBQAtqJYTHpPBsdX59Pp/AJieOxM
         GgWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1BDLyBlwr1xCNwQrN+5mcVHyBE+41n8kKoe0A6qo5kg=;
        b=WByaSpMSckb+Ki5jhtd+WslOtgxScOVwhrAbP6VRv60xLt4y4mCWjV0rjLct9xPs/z
         DknxSCD6uH165soQf9mcv+ikGXvE2EidqyPDJnA/3Ypv9I/Lxy7l9T1GjwiHkzdc60EC
         wwsQgKdyan0WXG0LdYZdQLO+bgQCVrzWCd1WYREQi1wJlBDw352zKmnejXksin4O9yLI
         gGXLxzUfeJvOjmp3dW+DdA4ZSDUDTKiOyOxufl8iv4eYkbtCuEUM/Urk3pY9iUZG21sG
         KdoR5S19IyK8m71FxXvywyWkWbJpJVgCBVSpWt/E8jG/Wh1Kd15mGhqDRt7DvSrOoEch
         sE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1BDLyBlwr1xCNwQrN+5mcVHyBE+41n8kKoe0A6qo5kg=;
        b=Agcbz7RI86+P+1a1zT/OiOCzNkstGcFH5xSwszdF6/FDV6V2O7DCQw2zahURKoc7Hv
         zCq7v/+S7dMd5STmFCoowdjI3Qh32YzXraL9RPHVfOlFYZiItYZuJ5SAkYTOOSO2eQxj
         9sJd15TryEmNYRkPcepYP9U9V4YtOQV+GA8rm5gR30h4PjTmIO4UnILu7Qb/aLyZuTK7
         7lPY+w6fXWZzY+dVtpr+A6hSonhnpuyyYqCmCh+X093Gsnt65FrIKixCNBIplvGViAJW
         //5rPqzFsW+6cE9O520wlXgzphBwp46KDVmvpqURjFdU9/mQMaLt/bIXf7PQRZP2pOku
         c5IA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9MI2ehYgmDAVnEbZ2QVi7rQ6cOfEyVPWbA+3MqdWtjX1ENz/0
	01qbKRlQ6nTFjvxeTZV7VrA=
X-Google-Smtp-Source: APXvYqzTd+hyNzU0t9dS1GHMyGOLhEb20+1/yLdqDJx5x228JLWpbGRv8AM0WVJt0LuVP55nErdrfg==
X-Received: by 2002:a05:651c:1032:: with SMTP id w18mr17751608ljm.61.1582182595442;
        Wed, 19 Feb 2020 23:09:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls4162001lji.4.gmail; Wed, 19 Feb
 2020 23:09:54 -0800 (PST)
X-Received: by 2002:a2e:7609:: with SMTP id r9mr18014615ljc.238.1582182594075;
        Wed, 19 Feb 2020 23:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582182594; cv=none;
        d=google.com; s=arc-20160816;
        b=VRpFDDK5O4aHKWjb0IqRvmDlXgZTnuBWFXps1dazLIxyC5olhz63y5C9j5jI5sMlbu
         qHhu7Asqz2l2xXCt1kmrV6BQFE7uc5FlkmIWtx7iDbCcJlNmnUquCmV1LTiya0wviaCg
         SUz4tPFVES+ESkqxIsB/CgqJBs1fNXhz/OLJLoNWpAJ7exQ4pZPjDeYhmgy61ksAxUW9
         BOkRr6zB3t8NomNORUlo/Fk8Dkw4fOWsvevM57P+gY8x5NDCad4tWSNiRG68JchCBTc4
         BmO6t1G18zR7dT1pbKM5l7EeQhSq9//jjp7W8+2W7queJiUYF5Gblh1g2z/4KdKX3xe7
         +XPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=POVTpdVjIuXErB6feo2vbyomdcVNBxMT105LRj1KJOE=;
        b=dwzMA09HYPSuxKO73uIgoarrSelXe/MJbQn5yW8V8yOGMog9j4JWfBGTmmGGVTrpUS
         wpEbbTIrfLFuqD2ZUWntgXnqMigzVPDi8ziSXxIM3C0HReoiAkl6Zhl397VICnIGKyll
         6BAbyY03IScqkE0XmW7IevSXwDLplb5W3paLBV88LGkTw1zQIRb14uftY4CzWB7WZvF+
         ykV/DT1v5Lzgpe8tgZHhBjqdaU723PgBmZ96QReHdNSwwzP2b8Y5mJLX/1VDXSt7xQbe
         q42s8c+dLI9ztXMKZBqyZ3iE0ryh0o3olLP0QneQ1lwRd6A2I2L3M3TiZrwylDHaPW1h
         S7Rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h8si106114ljj.3.2020.02.19.23.09.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 23:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 01K79rg6007338
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2020 08:09:53 +0100
Received: from [167.87.7.122] ([167.87.7.122])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01K79pNX027400;
	Thu, 20 Feb 2020 08:09:52 +0100
Subject: Re: [ANNOUNCE] Jailhouse 0.12 released
To: Peng Fan <peng.fan@nxp.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
References: <dd4344b9-ca04-0ef2-0810-6b98e30f68b4@siemens.com>
 <AM0PR04MB4481C65800CCE42E448B7D2788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9bdd0eae-dbaf-f5a3-d067-81b0ae88522f@siemens.com>
Date: Thu, 20 Feb 2020 08:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481C65800CCE42E448B7D2788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
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

On 20.02.20 03:39, Peng Fan wrote:
>> Subject: [ANNOUNCE] Jailhouse 0.12 released
>>
>> This release is an important milestone for Jailhouse because it comes with a
>> reworked inter-cell communication device with better driver support and
>> even an experimental virtio transport model for this.
> 
> Great to know this.

If there is interest, please provide feedback, ideally also in the 
circle where I started spec discussions and QEMU implementation.

> 
>>
>> While this shared memory device model is still in discussion with virtio and
>> QEMU communities, thus may undergo some further smaller changes, it was
>> important to move forward with it because there is an increasing demand for
>> it on the Jailhouse side. We now support multi-peer connection, have a secure
>> (unprivileged) and efficient UIO driver and can even start working on virtio
>> integration - without having to touch the hypervisor any further. More
>> information also in [1].
> 
> Do we need to use qemu for virtio backend?
> 

Nope, in fact there are only primitive demo backends for block and 
console available that make use of UIO, see

http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-block.c;h=c97aa5076a6d22ccd01862f3e4db0e12641825c3;hb=refs/heads/queues/ivshmem2

and

http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-console.c;h=c79be22c6a7aa4c2eb49561e8c0d7c9a052e393d;hb=refs/heads/queues/ivshmem2

I was hoping to find something useful in ACRN but didn't succeed. So I 
hacked up these two (basically in two evenings, that's why these two are 
copy&paste). For the future, when the transport is more stable, looking 
into a vhost mapping could be beneficial, specifically for networking. 
Another direction could be https://github.com/rust-vmm/vm-virtio.

>>
>> The release has another important new, and that is SMMUv3 for ARM64
>> target, as well as the TI-specific MPU-like Peripheral Virtualization Unit (PVU).
>> SMMUv2 support is unfortunately still waiting in some NXP downstream
>> branch for being pushed upstream.
> 
> Alice in Cc is doing this effort together with i.MX8QM upstreaming.
> 

Great, looking forward!

>>
>> Note that there are several changes to the configuration format that require
>> adjustments of own configs. Please study related changes in our reference
>> configurations or, on x86, re-generate the system configuration.
>>
>> Due to all these significant changes, statistics for this release look about more
>> heavyweight than usual:
>> 195 files changed, 7185 insertions(+), 2612 deletions(-)
> 
> Yeah!! Besides this, any people still interested in booting jailhouse before Linux?
> I have achieved this on i.MX8MM with Linux + gic-demo cell, with a baremetal
> program and using U-Boot FIT to load all images.

Yes, there is definitely interest, for various reasons. One can be cache 
coloring. We are also considering to look into this boot mode in the 
context of the just started RISC-V port. And there might be a case on 
x86 again, but the boot environment is still not clear to me there 
(likely not UEFI).

If you have a prototype for ARM64 and U-Boot, that would be great to see 
it, maybe let more people play with it. Eventually, I want to start 
discussing requirements and potentially required new interfaces.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9bdd0eae-dbaf-f5a3-d067-81b0ae88522f%40siemens.com.
