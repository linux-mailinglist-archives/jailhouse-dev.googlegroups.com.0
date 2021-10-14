Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG77T6FQMGQEUQIOL3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC642D6A4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 11:59:56 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h99-20020adf906c000000b001644add8925sf964343wrh.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 02:59:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634205596; cv=pass;
        d=google.com; s=arc-20160816;
        b=TB0nri/56dx+p9SMz8J0SzfoaJGGAPv8lMTcQ5gJ6+F2LY45HfOnuiVi8BbkK53QTf
         TYFaE+CpUnUQJec/sEUp6FnMkHY1+JfqSL0Oa69GWdHjqNvf580sTeD1gUqe/HmDRI1i
         N3ocUr5fGxY62lqtptQsFx/CpjDVGF8d2upCkdEs2I+x3sl4x/svgWYWpGOuNpNaf43k
         sWsEZPAz9EF3z5+DMFc0/ojE3j4mxp/i7iZHTHxZ3P7kFs4o/1dduKvr9eAZMb/2S546
         Gpd+dsLLjgviHgd9s6/VDW+tyZaMcw0FIX9kU8NjCAVOCDLMnO/9o7dvdKfrXOze+cuu
         IUFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LTfE2K+LE2rk8Ohkkg1q1e32rYqOppiopwOJczRrcsE=;
        b=hr+ia/L4ZoZzkh1XoPBIsJ3q/WXwfelFAkDVodAl5i6YrJrX3koqSSGWwFXrfBE5oO
         x5Me31IHDLGXBmG+vTp8i3CxcnureEZAV6YBTf2dk5Ec7v4fZ5ksqIuU36hwl+Zdw698
         VlmEBYIJMK7y/XfHfsGqWQfWOy+HAfawqLYw0A2NTz/NStr3Hyq8ejENbIaKfESwoREk
         DMGSHATlOsumUdAM/m69M8ajWCaT+K1dP9GPEm20LzRniHyXe+a8JHuXtd54VpBC46Zq
         4g30pHm6zGU8K3ElRgP2uCxjsPRl5p1YA9LKFPpC9xHAi6woKzZmZJFmkn3cquRn9A2+
         P7rQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTfE2K+LE2rk8Ohkkg1q1e32rYqOppiopwOJczRrcsE=;
        b=dF4MY1BFMm14lLylZNdyVTJ1EC/Jdq/9TL+uIWnn7d+yLvIvA31Rk5WkfBFa/+WXfg
         IrAyMC5uYbHiq2jtc8K1D+quWus7QWXQdUObCNOxZ5xcoo1HNUoVHkIDy3IQb46Ntgx0
         /kQYSrBhej5JZGyv0BMl5lKMyUh92lYGC8MzhQn6pwLyRmO2TWvEkamwaqUHnBCzXhd1
         g9FP0+u+NdiMiTyFhDqc9UzrPFgj81NPbrp18huFsJQ7T0g+l3xgGIb6M70hjBKcQcUq
         LKQkI6CVbxepnYAhgMXZiGxu4KD0Xs07IMUT4Jj8F7n6bt/4tjikMom+Oq9lQ+P5Csx2
         WMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTfE2K+LE2rk8Ohkkg1q1e32rYqOppiopwOJczRrcsE=;
        b=5g1MjMX7dieyu/QuOgdOL+u4JDQujjLiD4XRG8yMDNuRo4b705T6oIt/x9c3Ydb/Ni
         Hc8jy2akMBL4ILg89kYAl5s2wVE9SCx8m5acEpb+lTS4J4mzp2p4NE8hz7+fBxsldOjW
         7mKXPUt7kz9wgEIAnO5VTtJh9a/BERWko3C07bidNi2Gvzg1PLqYYv0G8Act/F7OSf+7
         p+nwwLkTTvCLp5Mh1ieSm5CcZaFd+zohHjwVRjRaPlaZS9jZXrJ9bWICoiLpszmdD05b
         Bh/lNe4kLv++lgN0JnSEsgUUv/SsvdmPoyvZDnckMXvhREIh52+HDe8JzXU/Kwi0htgT
         EtPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YIpcVAdJOb9osyQzIhdX4TNJ7UXBBrhV/u+ev3KlM0WZE31qt
	k1e8eIcuyKsHIQMwQDDs1t0=
X-Google-Smtp-Source: ABdhPJxyWZ8FQ0O5QhzFFTA1Ojk8GG89cGKjoJ/QaSf+gqCz79riViEYFj9z2ZxNrNPpnWj/4gJg3Q==
X-Received: by 2002:a05:600c:b41:: with SMTP id k1mr18482545wmr.4.1634205596011;
        Thu, 14 Oct 2021 02:59:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c3:: with SMTP id g3ls2574723wmk.0.gmail; Thu, 14 Oct
 2021 02:59:55 -0700 (PDT)
X-Received: by 2002:a05:600c:ac2:: with SMTP id c2mr18341700wmr.118.1634205594921;
        Thu, 14 Oct 2021 02:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634205594; cv=none;
        d=google.com; s=arc-20160816;
        b=od/lIYrPS+dj+2agdNxD9VbNwfT1Onpwcf7UsPcFN0p0vLxDnspJNBIvkC6buViREI
         CT0/XwGGdq5IjjHtO0ZJnkatF0vD+NG8E3/e2Bt2sW6gBK9ZV+xjZFYazPZPH+4dy6n5
         0eqYrMDW03vxwxODdAZJjpZlrIx/zXXcaFjvpfooNnrqFFPHsGRfAs2/dudEEpxY2AO1
         Q9evpQE0cu3zLNqRlq0aBLE8ReQY3wV2YOA1WozhKoCxVs8Jn0enhyooeMmTV0cyG93Y
         VqAuQiLzmXKMmlwjJOiF4QVWz9niB6bfr7LmVuM8cwX015sOGk4uYI4CSmd9iLWhbc+4
         06HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3QqiHa6NE5dTzrNEFQPRnBt4iyqL48v4gb2PJeBGWX4=;
        b=Mh/o0ExomMe/g23udIUdzIKJjxJV05RN+bk5jLkPcMpImk+FLBt6E8KzKNnj8Mj/sH
         NGV0+WS117uI44F8iZLld61v4Q++kja2YXS2CWLlhgv2+YFR02Mb5v4gNJBx8fQd10OL
         GTZ4uA0jA+PqiZKDsVyaTkqhG2eckUsZ9Dm4lJP2OMOLXsGGId18ekZCfpHCpc7qmRHs
         JwocpkcZzURedJPZw9dLqxhVPliZAEt4VkCUhr/eTe12LT/nVpl3I/5/tsFFehRmtd7B
         w5h3nO+ZK/62xa/Vsy5lMf5vVqEv7u5kU9IuIs5amTXWL8ctuGp4pRTT1spdpxFRBGUX
         p5EA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l3si182420wml.2.2021.10.14.02.59.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19E9xriu015470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 11:59:53 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19E9xr70014506;
	Thu, 14 Oct 2021 11:59:53 +0200
Subject: Re: Root Cell crash in QEMU
To: jiajun huang <huangjiajun145041@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <56692931-19ec-4a1a-9df9-f7a44eaa1869n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <016d5fd0-be24-4dc4-0693-62c87622b768@siemens.com>
Date: Thu, 14 Oct 2021 11:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <56692931-19ec-4a1a-9df9-f7a44eaa1869n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 01.10.21 18:40, jiajun huang wrote:
> Dear Jailhouse community=EF=BC=8C
>=20
> I am currently running into an issue when trying boot jailhouse on QEMU.
> I follow the guidelines on
> https://github.com/siemens/jailhouse/tree/wip/kvm. When I use the
> sysconfig.c created by "jailhouse config create -c ttyS0 --mem-hv 128M
> --mem-inmates 1536M configs/x86/sysconfig.c" to enable root cell, the
> issue "FATAL: Invalid PIO read, port: 5658 size: 4" and "FATAL: Invalid
> MMIO/RAM read" happened. I solved these issues with the help of
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf.
> Attached is the modified sysconfig.c file. However, the root cell will
> still crash with no log a few minutes later.=C2=A0
>=20
> Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 0
> Code location: 0xfffffffff0000050
> Using x2APIC
> Page pool usage after early setup: mem 108/32207, remap 0/131072
> Initializing processors:
> =C2=A0CPU 0... (APIC ID 0) OK
> =C2=A0CPU 1... (APIC ID 1) OK
> =C2=A0CPU 3... (APIC ID 3) OK
> =C2=A0CPU 2... (APIC ID 2) OK
> Initializing unit: VT-d
> DMAR unit @0xfed90000/0x1000
> Reserving 24 interrupt(s) for device ff:00.0 at index 0
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:01.0 to cell "RootCell"
> Adding PCI device 00:02.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 00:02.0 at index 24
> Adding PCI device 00:1b.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1b.0 at index 29
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.2 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1f.2 at index 30
> Adding PCI device 00:1f.3 to cell "RootCell"
> Page pool usage after late setup: mem 333/32207, remap 65542/131072
> Activating hypervisor
>=20
>=20
> I want to know if I need to add all the missing PCI memory regions and
> PCI IO ports to sysconfig.c according to the results of /proc/iomem and
> /proc/ioports?

Did you see configs/x86/qemu-x86.c already? That is supposed to work for
the recommended command line and also the start-qemu.sh script from
jailhouse-images. There are likely some subtle differences to the config
the generator spits out, unfortunately. I haven't tried "config create"
on QEMU in a long while, simply because we have a reference config, but
maybe there is something that could be improved once you found the
relevant differences.

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
jailhouse-dev/016d5fd0-be24-4dc4-0693-62c87622b768%40siemens.com.
