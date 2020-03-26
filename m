Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5VA6HZQKGQEJIMHPKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9781938E2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Mar 2020 07:49:27 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id w12sf2532688wrl.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 23:49:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585205367; cv=pass;
        d=google.com; s=arc-20160816;
        b=SflETjK4jsGEt0w68bInLcm7ZNUC+plbKh9JMKlURSXUQIE7UvkOmjuk7F7P8KNk13
         xJDJvKB6nvjCGsJP1C9t2nNQSrMkaWogEM1IeS0bd77oxibr9MtA5vxqD2wqh03yChR/
         CdWbd0hLRL/lpct2DQjmtsRIMyYxGlCzZABrBnpvXph99DfsOtS/cy5Ha6ov5HEAJ7Su
         zUk0qi+vfHRsKLUatBxd57oI0eKAyL5H2VVr44On/QALiKS4J4Is+fB7z7l5zWUkiHVX
         /pQFkqZIyeFuLQOyZSro/q+TscUsFCFyYN1ZkYlxqZQKMvMLaVupGUUZ+secQJsNO6ya
         boSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=hJ0e0yen98/wi8fFg8rzr4ruD3FlLkzHLTqPtJ/YFe4=;
        b=R0ZBbKwc36HAgII1jqnYJdgFG72eqU6119nOXv0iliuCJxQHkX5XCStb2R6ejmnPhY
         q6XGLzFOZbMA4p6RhMimhD1272bSLSvhOC6vGmi2MTqutlF/+smS9bzhh9XMqnBFlRKS
         q9PuBF0iX3yaNtZcH4Z9EjlMn9Ho82ZtPpiId0iEXIdOIULTzvvNveELFuEWqNXmkZzS
         VKdVHmi4wJffGkHYxqA8j29U5VIsPvDXEf2P4WpMyMM20v0VLlU09Ao1jvbRylTrS/GT
         ziCgV3SC+ha0V5zm6CxDqlMonIGfU4kNT/GQBVsfvX/e5kWLExa0kt+caDpitAKFDJPs
         Sx5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Zdc5X9L8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hJ0e0yen98/wi8fFg8rzr4ruD3FlLkzHLTqPtJ/YFe4=;
        b=B1F7w2SpN1rFQ+BfHH7nCB0nmudbXYQp/PspLwghAjSCQPzCKo14p/8j+ng6/JF4Em
         WRmNu91foz8PoaBxTQ1AGPkIAiPh1xQ2BsxGhzxyy/MjRWVZm/heOXZr1gY2v4OLBtm0
         Q2enItT+LoQy+KS83arxwb4aAG6VJTHhu9NwlE4JkzMxgirSp2kUsRcg0mqCsLkvZDZc
         N1LaOIBHq0+tJV9sVZpnBoyO7zpadZ5jC07LfM+mKgfYa6sMK/0PBM1oSb3Zytb+eoaP
         ba469pzxnhVIt3a8CWQdP3L4q/pKz0Q2tIvP/ft4o15uc+gn7s6eVIBtVjFpI3fnip6b
         CETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hJ0e0yen98/wi8fFg8rzr4ruD3FlLkzHLTqPtJ/YFe4=;
        b=nXjywXINoZBJboTSg1YnL7ARamo09Emr31nr5dPz8ssdTVChaKE4vOV+w9Rwc3KaAK
         GBMnNVurgqobJcPpb71chI+nCP1gvCNZ4IwPPBQdGrp+e+D/qMhpaPHPmNdbOboXwCJ/
         tfFkiBRCjMW0nYSJfLW+X/rUWhaUGxupS96vPWqfLMnY6ITonWvkii5u2EiCTvLXNVe8
         WF8bilsU99bhuxMzfPcWX7sOQ5wtNq1Ngy8qiNyLTOrTO0DZyQH5OtZTrTGQ0sOH9J4E
         Qqy3/DU2dS/sj91WO6dPCMYLMO3wF/C/9JTrh0dfw8rOiDpbst2EqqRwOZIqNT64mQsY
         oJkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0eST0sUvpPLDOIUSxRiDB0RkvVsDH4cOCtd+IHNeDYE6tXq8cj
	X+It+Rgm+DCn9w5ATQ9nFt8=
X-Google-Smtp-Source: ADFU+vs9s5mL6SW06fuAPGAYHk0fAINF5U9I9gPXHGqvLcwdnAxbHy8Qj+jyUpULc7Xjpfo9xz1rHA==
X-Received: by 2002:a7b:caf2:: with SMTP id t18mr1543211wml.80.1585205367118;
        Wed, 25 Mar 2020 23:49:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6402:: with SMTP id y2ls2538863wmb.1.canary-gmail; Wed,
 25 Mar 2020 23:49:26 -0700 (PDT)
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr1578804wme.49.1585205366468;
        Wed, 25 Mar 2020 23:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585205366; cv=none;
        d=google.com; s=arc-20160816;
        b=FSEbt9r8DYbDTWGAeSkZQpAuVtPiPkB9M3yU3YfIgbLUKAn7mDSxA6ZDHw/wkWOG4j
         ReCXmDIA3RnoKQSKYrJrWh0k0s3TqbHD2mQLIAX6OWgF53cHR9rk7nh3iaOS7rpS304S
         l3nQCP5HQIfiE+ntqwNveTwNC/i1PXOvKbA6LTr90yp6hu2a/xdQqgZoHmMpLUQUQLZy
         L3a4sLXXLYeW2Vd9nDc4V2+ziDIULHd8LnMXFZkjS3SzSJUAvXs1s5aRuddKQuwGNnf5
         q1Y6L9eFhhcaSxagQOmfELGMAQDHjd6wFQCtVK4EtjANFxrnR55lJvlydSTY+9jOfLC4
         fN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Gn6RGvJ2Vqo39ELMUz+UNQvLNm41mwA1ZX2XH1eCpbE=;
        b=D6TgLRZO/hH90Im5l5HWgUQADDIbSOvXMAr7u6+AAiyg0DBZrdYfZ8UHW2ZAM661Jt
         005Z9i2NR4XPSHXe9q4nA89kPlRMQ0Lxk8AAN/q71IICuJwesTL8OCE31eyV5ISOSKa/
         NcZHpwvUp342sCbF8Lqo6+dzro1YwZ5jL3rU8O3aBDDJtjyCeTbscO/rACoTnCjhmTFn
         pGjAWaDyhrcQKcfNifn4mo0RB6ljUKvU/cvEzr3KLMJ90li9AOD1fhD8DVK32EnYxWVN
         zOSXLoSyTKhL/IgwDzOZKM1FPfWkO0/GBPbq8k6URyYa1L9C8kP4y64qsGxTn3ughMPq
         UyQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Zdc5X9L8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id b81si51284wmc.2.2020.03.25.23.49.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 23:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M4Hqd-1jZr5K32eZ-00rpdR; Thu, 26
 Mar 2020 07:49:25 +0100
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse
 Hypervisor
To: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Cc: jailhouse-dev@googlegroups.com,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
 <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de>
Date: Thu, 26 Mar 2020 07:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8LKCKfbp8nclMhu64N6c23bMayBIXg7QFYeDCiFa2dyb3xhyFbF
 MZ/0OYTWYojY5kOxRKYEAg2kMs9kuT6S/whgt78TVk+c7vyvsakolD3J3C9b4b/IgwkFf9g
 y1iGl8cwULvn2EZnlMjIc3cx/kMe3ZA7OW7xQAtcGRSO8bQ6pc7eSV/0+vHrIqkZnh1XB2f
 2/7IBY7AC4XpiOSVnsGZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y8ixvcnPJd4=:hE3AWaw8yI64JBuFKg+/sj
 W5xCXt9tUjeFmxMji2+h6Kzdiz0IkP7JxE1A0Z/Xmo5tkLtBh+vlQa8YH6r5peXvOn9Zcemdj
 dN1O66DO7XUelmazEue0CUcKxrXZ1H3sV3gmrz3ZtxNz2yHy3bgAHMEjPH4JAr0ZHb7hUrCdM
 9rmVsJW/CrG1WQDxmw7jmQ4IIBUz7wVXjsi/03WHxwnnSJ2HsXetUKT6kbwKFhB3lDv+CbrzK
 sh5WMqm7VmQOj+2SHItyKVettSf3MNP6kWeaT9ETFFShlC6htWDvUAlqfd2/4p8y73yqxrzF8
 OtMYthgPrYXdpUspbjjtR2WOmzcx8ndwnjs+m4GXLVYhgNrlcu5PDsHitVa5XXUArZMp6RYN/
 672JKcQkeQhBCTtWuA4AF/59s1oQoehcGgXKdLHNMABwgjYVXdThspcEBkDlQHj1ZTV84IL0o
 fjIQhQXagjZuoGh7xyzNubZJRnZWGeKtMgcggfa9aBNkwWBdOHAqcimzpmnyRif+R8/Hykt0X
 5EzjTZHNLzMLeZpeXV9vCg+J48RbHdlIHTVpWdrQewBoxemoGfs367gRvx9zIwy1y1VXHwET4
 559ipZBNhIw2SYchejVj6KLq/AygTCDlu3eBrdKTHLVE2Ui47ukh6sBUQJMzNodF9ejffJKpM
 4iWo2s6YdorKV6K9kkL9QHRJlV/199TL1ZKQtjEWbsAiWiIW28ZOlJrZbbjAOttIi7+FlZ82r
 xIAij6KvvQj2B0tRHjv6B55Joz+U3Ob28USIogT/3EsMCeCWDZZAaXn9XnbLBwWCsyoBzizIh
 tz9lgZkIcUnce6Lk6QCQsIrqwj9/NyW0BoXkPZtu0HCck9HjnEJI8AJt2KZJ+jPps/V3Ay/IP
 uVGUusBUYus6AvtLYTIPef+uTEx760f7277x9eY0zXBVooDYIBVJaUnwiICxXubz7kj+PmRuc
 jYmG1h9ot45sVw7VGSZ+suLJIp/xx4gGd6SiMLrj6LxlFlCs1CWoPZDr4z0Zp4WMTyrKmby4+
 m1OuIkg8u5daBXeZstHXPrttvbpcD2LM3LJSwsKw6TDQZ6xIW9sjB1uJzvMXgHXWv+EyE/zpy
 HO2prnvXA7Oa3jTfqT7VDU4UgUfO2mY0tdgx4NgqP4YJIbMi9pGPokGk6F8zw3Fs+eYPVFlYq
 DnSqhO0UQ0uHte35Buy8F5R0efanO7G3xhj8RvZBZaonc9AMXylc0HFD5bvpOtOSaxz/rWonC
 OxK33U8xRYYRHtQQI
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Zdc5X9L8;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

Hi Prakhar,

On 25.03.20 05:36, PRAKHAR BANSAL wrote:
> Hi Jan,
>
> Thanks for the reply. I looked deeper into the libvirt and Jailhouse
> source code and found following two things that seem relevant to the
> project I am interested in.
>
> - Libvirt driver interface at [libvirt.git]
> <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD>=C2=A0/ src
> <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD>=C2=
=A0/ driver.h
> <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc/driver.h=
;hb=3DHEAD>
> - Jailhouse tool, which is using the ioctl API of the Jailhouse,
> available at
> https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
>
> With the help of the above two, it looks like, a libvirt driver for the
> Jailhouse can be implemented. Let me know if I am moving in the right
> direction so far.

 From the Jailhouse perspective, it is important to not consider the
command line tool an interface anymore (like in the first prototype) but
build on top of the Linux driver API (ioctls, sysfs). There is already a
Python library which started to abstract this interface for
Jailhouse-internal use cases. However, I strongly suspect libvirt will
rather want a native binding.

>
> I have been looking at the other libvirt driver implementations for
> hypervisors like HyperV and VMware to understand their implementation
> and learn from there.

As Jailhouse is a static partitioning hypervisor without abstraction of
the underlying hardware, your starting point for the libvirt binding
should be a given set of Jailhouse cell configurations describing a
complete partitioned system. So rather than instantiating on demand a
domain (Jailhouse cell) with, say, a network adapter, the driver should
match a user request for a domain against the configuration set and use
what is there - or report the mismatch. What it could organize, though,
is interconnecting cells that have a (preconfigured) virtual network
link to the root cell.

Due to this different concept, there will be no 1:1 mapping for
commodity hypervisor drivers to the Jailhouse scenario. Still, studying
what they do is useful and needed in order to understand what "normally"
happens and find a reasonable translation. This is probably the most
challenging part of the project.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a0c156aa-f87d-e5ea-d3c3-7b7929c503c4%40web.de.
