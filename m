Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ5Z7XUQKGQEJUKW25A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3F79A59
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:53:59 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id i44sf38977110eda.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 13:53:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564433639; cv=pass;
        d=google.com; s=arc-20160816;
        b=SoyDN88UBjkg3QglwnqfZuVuZNcbZ6oLIclwKgr1JYzgyNdqwlJc62N23QARrglLoc
         l/Gt5FSJPJbRrSYuACQJtr4KIWSKrgIeOry6aG2ug9dt5G+nOohbANxaooyEB1O2fq+C
         6yI6/Ltv3v11WcmNun6frbNvaDxVZRLIDyHnLQFb24eMdBIrUySRwVilothRYjSdl6ta
         8GE6UHwoxyVPZ0h9zB4tFtauJ1DtmhKYOjXjUZiFMMuyr2/okeYHgBrGWSPD+o84frZg
         9lZXNlRTSmZRHRexDW6355IdnvKCtGwTwKmGDedlWwJCGshxVtAAzhumFbjXvhqRQX1e
         XZgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ok6CFvyV1zLk4w3rUosyQhWZ5jr3acEdtq9mEpeoqzQ=;
        b=gZNLbsW2sQ69SuNLRmcC/eI7PULZnizoJK6U+lSD38UzDPyF1V3pns/tohykcV4NL3
         3BIwI9sIWPDKCBbao8HGKO0Xs/CFg4guhz9iqQWlh4uRQlZMvfPYjMO+FnAhX4TfS/HR
         5DyDrVP0eS22O6wx4zH9oJSGLLOX+ac5mnLhi3nWLunZAP6cnaUKE2JvCfZlMVRsYjwR
         zfbPw+9W4sDWLjGYiQt+Iqc/wtyVy8WfuP9TMDjIwQ8wRzAmMvD+ZvQ7L2c9Z5xzwVlz
         HHlHk/zR24RMTYFznR8Q7P9R39ryYTJhKvV7e7tfEdSRAP7BJwlWrf7ybgBZawQifwLr
         ZAqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ok6CFvyV1zLk4w3rUosyQhWZ5jr3acEdtq9mEpeoqzQ=;
        b=qUDQbuNifuBxNVJlrDJQs9VGN3lx5GA4KsDos7asZHoAMy6OWJ0kZCe/cqNuzLRrJi
         e90ojkn4dommvQZQUI3CpoLtrRWNqVKe3TS94DQIH0+Ox/4i58ZI8ggldVkh6KhK5TtX
         kf/EyVRbrAPqD1kviy6XrAQkUM3SOZhzvH7npMVqM+C7+JK30amjHRehRXx/+RCpvSWB
         HyKoBrPDZkE+WIPS6Ugw4rSSMbBIgWQ+irJbrBl2vAXkOe4ZDsK1utGZEG8Jv4Sie8hY
         jD1t/+F0JG/FdKBgYr8zC067Rvxj2jjd4476xL8aUNO63n+DuWf9Z7aaRAHpd/7uIpvW
         Ayxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ok6CFvyV1zLk4w3rUosyQhWZ5jr3acEdtq9mEpeoqzQ=;
        b=HU9NEBVflkew6QkbC7MJ1dBIeOpAByKOw9q8cD1DJ+CaLlFA84i4MP4RpcBw2Diyh2
         r/kGVmwdEmvzM59ZqB2NBfNmuW44ejS7W3G1ZHNAn+d37XIL8CFXN2jsaipcZ894ZRwP
         duT3CrZOc80X5ldSOdkra3XNyqXgJwptWxGsj6XO2cIAbz/SlbV8Txbxr0SX4HtQD4fV
         Oaku0xf9X9mRrS0EsSXsEm/f7NZeoE5OpRyt1I3ZiBGl5sK27aExpvNbzwUsxky9hUTX
         jqSI5Sgyw/tykisDtfdan7KCpFtc4+oGHqtOGZcwSzATH+GjY3G2+1y0OjUjYSgi47ci
         siUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWQhynPj1o56lpVUfbslvvyQZ870OR7J3yn9sJn9LmmhCwSvPJK
	BhNgE5L7vGxq77jd1avQZWc=
X-Google-Smtp-Source: APXvYqxQT1d5T1wEsR0vU9EtkehcKw/dlhUA3pExAnxN4y8ZZrE/YPtJRIzkbMVFje/41h5SipLHZQ==
X-Received: by 2002:aa7:d68e:: with SMTP id d14mr98155423edr.253.1564433639331;
        Mon, 29 Jul 2019 13:53:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:61c5:: with SMTP id t5ls13167555ejl.11.gmail; Mon,
 29 Jul 2019 13:53:58 -0700 (PDT)
X-Received: by 2002:a17:906:9609:: with SMTP id s9mr87824552ejx.233.1564433638655;
        Mon, 29 Jul 2019 13:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564433638; cv=none;
        d=google.com; s=arc-20160816;
        b=nE0jGB4xNuln29sYFlGrQuvP8plLCBEYRPoGqxfQj+pZ6sg1g6t1P3J3Z6WNwOcSvW
         EW4MG1KhBJcWndlQlLamJD8Tt2kIeFFA2p1+iUL8OjeCOuXQkvYLq+4v/Z85nUTe0LDF
         Nrsh6RG0/ymjrpCcR9qxVz033ySe+qmQZ8IbqjpegxcpBh06Gqd6EULTPJTbm++dWew5
         pz+pzmg8V9FyBfve9mKBXdOLR4hwhjxVHG+/QFu9opo35FgMQaKojLynmdrYJDo2OdnF
         bWDqKYqvV2T2x9Gr/MGRevuDTps649Rra1o8tCQ+dChoyX4QPHyZrCLU1rDP80loIKWg
         uEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Agn1b7ZKnEbHCmDuVDA9vrdd4j8IIY7KlXQhXVGcIp0=;
        b=me8/19JpwOMgm5IOiBGkB7EgKcrtIeZN5vAXKkenEK1myIUQIdeN/Fnp9GABpnGkUU
         Unx4k22ZOHNkvFnXtXx2MpWiA2EbRjXSCvyFqZb4Uji9c2sFcBtcMoowxQg946Gxt2rz
         N3xAJZrAipK/PU4Jxgi5yKyKiV7icaYhxiMOXoxm+AFOvMcvokptSfuDjVb74Dh9Qqvs
         KAxlNcK6gvp4VcgvpIvPogEG2H0zDsCX79vIMsMbJFhU1Bv53qx4Wavd/vnD2XhC06IG
         nAfXTDu0bRhK02+KS9kmWYEXIKRYEkLevO64n1fXjmT2djpXmMVsV7aOEfulDgDLbI25
         qUTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b39si3414008edb.1.2019.07.29.13.53.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6TKrv6f012267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2019 22:53:57 +0200
Received: from [167.87.1.139] ([167.87.1.139])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6TKruNm009519;
	Mon, 29 Jul 2019 22:53:57 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
Date: Mon, 29 Jul 2019 22:53:56 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 29.07.19 21:51, Jo=C3=A3o Reis wrote:
> Yeah, i forgot to set the flag and the .dtb file i was using wasn't the r=
ight
> one (now i am using inmate-zynqmp.dts). But even when i set the flag, it =
still
> gives me the same error.
> Send here the output of /proc/iomem:
>=20
> 00000000-3ecfffff : System RAM
> =C2=A0 00080000-00deffff : Kernel code
> =C2=A0 00e70000-01134fff : Kernel data
> 3ed00000-3ed3ffff : 3ed00000.ddr
> 3fd00000-5fffffff : System RAM
> 7c000000-7c3fffff : Jailhouse hypervisor
> fc000000-fc0fffff : PCI ECAM
> fc100000-fc101fff : //pci@0
> =C2=A0 fc100000-fc1000ff : 0000:00:00.0
>=20
> And the config as it is now in attachment.

If you look at tools/jailhouse-cell-linux, you can see the conditions
for considering a region as loadable RAM:

class ARMCommon:
    def setup(self, args, config):
        [...]
        for region in config.memory_regions:
            # Filter out non-RAM regions and small ones at the start of the
            # cell address space that is used for the loader.
            if region.is_ram() and \
               (region.virt_start > 0 or region.size > 0x10000):


class MemoryRegion:
    [...]
    def is_ram(self):
        return ((self.flags & (MemoryRegion.JAILHOUSE_MEM_READ |
                               MemoryRegion.JAILHOUSE_MEM_WRITE |
                               MemoryRegion.JAILHOUSE_MEM_EXECUTE |
                               MemoryRegion.JAILHOUSE_MEM_DMA |
                               MemoryRegion.JAILHOUSE_MEM_IO |
                               MemoryRegion.JAILHOUSE_MEM_COMM_REGION |
                               MemoryRegion.JAILHOUSE_MEM_ROOTSHARED)) =3D=
=3D
                (MemoryRegion.JAILHOUSE_MEM_READ |
                 MemoryRegion.JAILHOUSE_MEM_WRITE |
                 MemoryRegion.JAILHOUSE_MEM_EXECUTE |
                 MemoryRegion.JAILHOUSE_MEM_DMA))

Means, you are missing "MEM_DMA".

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4f76dc91-7542-40b8-a0d9-eea52e1dd92a%40siemens.com.
