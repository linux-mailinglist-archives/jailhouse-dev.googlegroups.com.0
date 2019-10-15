Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJXMS7WQKGQE2V6B5LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E1D7BF5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:39:03 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h4sf4613043wrx.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:39:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571157542; cv=pass;
        d=google.com; s=arc-20160816;
        b=o6+VoDcshAcSkL8eHtV54rqRaEjm1b44txmKRho4HsybsTyraio/u2pas4ckIc3sd6
         FkAWfgC2fxbaRuAtpE04xpsGcIFn0GEie8yYZNPkKgZkYX0fE+gW8/dq0Cs/z5gt910s
         wQCV8/Gd3/83NG6pSuswX3TThz/sz7rQRscEfhv5siRp/JuuLmVhadfwl6CLKvxjUgfb
         Q1aa0yj6BJRDdivdPD2vxWeNhhTlCbHXKN157Rd6z8PpTr/AAd0j2+TMw5OLZHnZd4Mf
         9gGdxZ+cgdoXEPM2cmlEoMAN9ml4dFu2W2CaBXISQgcEtbui2fmAVZ6hwZu9oQhq/cPv
         zjOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=jenSQmvcisz6jd02xVnTa0yD7Pgs7AJzDsNhsxmav5E=;
        b=f66ylCgdQsAmVLqO5+N/WvQo0RELFiylaCTc6ikZoo9iqfNHnRr1gHaoDLvoxnSrco
         uIlg6h4vpAoCe1OxFGPQry3Pakx+eT+R+7Tlc4gB1OwDxULRlxwfWfbHmswUQY0xSswj
         yl67br57vfED5+IofgO/o0S0tH8td+bSt3nrGrwfWX3JALELVof7j9VvWPpZVMZ1VUe3
         vDsW7E+AIREYHGfuJzl6nUjJvWKEhRItlWQhZ7lq5COnSafwfDUAd4bqBdWytiqJvR0p
         bJPFb4IeXhXqk2jKVtPV1aEdWgMF/G1vYoP/Z6wFCf7zAZ+9AgrT87oXjnrKEQBLPxWX
         pAuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TGSZN1Nl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jenSQmvcisz6jd02xVnTa0yD7Pgs7AJzDsNhsxmav5E=;
        b=UjMAVjT/8pN+lok7bL60cFD3fUTulUV8+aP2uvTxkOQ7nw+HUOBiKbS4QfiDzy7Jhz
         xwiu8uVN1NPvbRSCaFxX0/dS1o7stUFt9cGVvbwMIE2w2YqucxKn4JCbbKrdxExRufgz
         fs4mo71seksVqOU7A7ZXE08G1R8+3EIA2LgfL0ANncZTjL3241V3TKEsdU96CGb2KW41
         EU4azL8UXrRxhh6duejbPX9NCFEjP4QSY9+XX3VUgUDNnBBxnwjq0t6n4dfA0htlsFg5
         lwIWRyrnCr27giNnxJ1o6p5RYsJfoVLWPDJ5OEBDjDrZxIMbbcJbCyLNLOIonoIVjtxk
         jn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jenSQmvcisz6jd02xVnTa0yD7Pgs7AJzDsNhsxmav5E=;
        b=OOs1KYi895ACLWa6iwen4+ko884/CIW7WHNtcI3LB70OFhF7YfL2RLHJvVJbVe5seg
         3QFDheroMhSyNomL3WRaYZen+uqkcYDtxWRWLUsZ+wjmyU43gLD5avLR7Rww5dzbPP3d
         z2e4JDxvP6E4uYFuRkV4xvh1zJAG5psIFLlCAm061LQbqQQkfe73HqrrbCJQd2Z06sWU
         ZJfLKJqvgxqp9vCf7nXeBlSyTYBxHVlfdl9CFqQEfjroBo6ukPU+TldcUWCfBOEtGbD3
         tZ7xUfdGE6WWu88nKQ98XPxlk2ZuP3WIomdJZYOlZpe3g+opRKR8s22qSdHOGfOpT47r
         CJwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVXtrb4Gk0CL7jKI7VRyOBNAFYdYhjtosviEDFQMCiE/s30EzYj
	FI8FNPcDNqr1VlQ3gCsC1K8=
X-Google-Smtp-Source: APXvYqyK0tw5M9h81CS5iFnVoU53W8+P13s87rAD91nuldEOeZ3jXgBCvKw4OCCVEtrumNo8wFqxsg==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr19687570wmc.157.1571157542744;
        Tue, 15 Oct 2019 09:39:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9e01:: with SMTP id u1ls7148668wre.15.gmail; Tue, 15 Oct
 2019 09:39:02 -0700 (PDT)
X-Received: by 2002:adf:dc44:: with SMTP id m4mr4535146wrj.203.1571157542069;
        Tue, 15 Oct 2019 09:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571157542; cv=none;
        d=google.com; s=arc-20160816;
        b=sD9A46dVRDnjdVXWeWJy2vTaNRsf1oLXuxxPNvUlH4KjyxsUmpzDnr0Dbgt6jFYMK0
         kD/plX+ZcKqtbKSyzjt7PNfHeb8w250evWzbVsJjQe4TM5NvzmCKU7s6BQuS02Bwr6fa
         gHSZOH3qJKiK7rJOJM0MTvKBFZhM1FjTreCzCyMci2rjMPeRXd31/se8zVemqajVrpnQ
         5/ZZ6gGDRlMsaCPqqenEWqSe3DNungZTjtRm9WodThvEUW/kLNUsaU4u3HJpNrgTQuyv
         RgsyKedH5OjExChvqi0VrJ7/u+SbK5gfvsDqvSO1Elvk6RskCyfCFNZc4ZIIOYjTidjw
         +RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=snmu4O6ItIqzc2vo5hyF8X0Wpm0peOi6qD8JO0T+J0s=;
        b=dFsLGBQ3o7hiff6HiLu5TwqQHLR5yGgN+GmkqmiYeKEMqwe043/lp4A/+AgP+CzaTE
         FsbX4/eTbIWN5+GO5zDMf4z7UAHY7oQA4OmCYp9IOA1L8tNEJ9zjrszht95U40vhb0nB
         2FOpnt65H88I4LKPZBF40EYF8ti8qkFRIb2pWkFBtvkWWLykl4/WPVFv3vXhnlnq51s7
         qKcnmhXYmULLvuAJ2Xq3cweuNWI9DSUZqKxemMb6MQIgPazCuqlp72v0XRtQzaqv5EEw
         MnK6ax1LGAmBtQuh+sh8wPDihy7T+oiar00PqhV3/z4A9ji75Vfj2iuAaWKpCxYaPgkG
         Xu1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TGSZN1Nl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id q137si216690wme.3.2019.10.15.09.39.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46t1N54pqnzyCp;
	Tue, 15 Oct 2019 18:39:01 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 15 Oct
 2019 18:39:01 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Jan Kiszka <jan.kiszka@siemens.com>, Vitaly Andrianov <vitalya@ti.com>,
	<jailhouse-dev@googlegroups.com>
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <0b78bf24-b7d2-dd23-b2cc-b3f6ebf367c4@oth-regensburg.de>
Date: Tue, 15 Oct 2019 18:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TGSZN1Nl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 10/14/19 6:36 PM, Jan Kiszka wrote:
> On 14.10.19 18:22, Vitaly Andrianov wrote:
>> On 10/14/2019 12:02 PM, Jan Kiszka wrote:
>>> On 14.10.19 18:01, Jan Kiszka wrote:
>>>> On 14.10.19 16:31, Vitaly Andrianov wrote:
>>>>> Jan and Ralf,
>>>>>
>>>>> A while back I tried unmodified hypervisor by just adding
>>>>> am572x-evm.cell config.
>>>>> Basically everything worked except cell destroy. I repeated this
>>>>> experiment today.
>>>>> When I issued the cell destroy command I got:
>>>>>
>>>>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>>>>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>>>>> [=C2=A0 187.112795] CPU1: failed to come online
>>>>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>>>>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>>>>
>>>>> After that Linux is running on ARM0 core only. Basically I can create
>>>>> another cell for gic-demo.bin, I can run it and shutdown. I cannot ju=
st
>>>>> destroy the cell with getting ARM1 running Linux again.
>>>>
>>>> Yeah, this is a familiar pattern when things go wrong during
>>>> cpu-hotplug.
>>>>
>>>>>
>>>>> As far as I know when we issue cpu_down() the CPU is calling WFI
>>>>> instruction (Linux kernel page) and waiting for event. When we create=
 a
>>>>> cell the hypervisor switches the page and runs the ARM1 at the same W=
FI
>>>>> loop at virtual address 0x0. I guess when we destroy the cell,
>>>>> hypervisor shall return ARM1 kernel page and cpu_up() should continue
>>>>> from that point.
>>>>
>>>> Yes, basically save-restore of the CPU state, at least /wrt its releva=
nt
>>>> parts.
>>
>> I thought that is hypervisor responsibility when it executes the "cell
>> destroy"
>> to restore the cpu1 virtual memory to the point when it was on the "cell
>> create"
>> state. As I understood hypervisor calls cpu_down() and after that
>> creates the cell.
>> On cell destroy it restore cpu1 state and calls cpu_up().
>> Looks like my understanding was wrong.
>=20
> No, the model so far is that the hypervisor emulates PSCI CPU up/down,
> and that implies a (virtual) CPU reset. On x86, there is an
> architecturally defined mechanism that works via IPIs but it otherwise
> identical.
>=20
>>
>> So, how to resolve this issue? You said I need to add the "soft cpu_down=
".
>> To where? kernel? or hypervisor?
>=20
> For the am57xx, this needs "only" hypervisor changes. The kernel already
> has to support for soft-offline/online. I would say: let's make the
> save/restore working on that device, and then we can think about if we
> make that a root cell property that controls whether to emulate PSCI or
> use save/restore for the root cell CPU control.
>=20
> To reuse a generic control on the RPi4, it would take also kernel
> patches. But that would be the task of someone else, later.

So we have this (or at least similar) issues on any platform that does
not implement PSCI, and looks like there some. AFAIR, the Jetson TK1
also didn't have PSCI support until Jan patched u-boot. :-)

For the RPi4, e.g., we would need yet another workaround in the hypervisor.

But guests actually do have PSCI available once Jailhouse is enabled, we
emulate it. Just thinking loudly, but couldn't we somehow switch the
Kernel's enable-method to PSCI after Jailhouse is enabled? That would
only require some(tm) changes to the kernel and I agree that those might
be too complex and/or invasive, but this could /maybe/ provide a general
solution, ease enabling of non-PSCI platforms and prevent extra
procedures in the hypervisor.

Just for the records that there potentially might be an alternative
other than implementing workarounds in the hypervisor.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b78bf24-b7d2-dd23-b2cc-b3f6ebf367c4%40oth-regensburg.de.
