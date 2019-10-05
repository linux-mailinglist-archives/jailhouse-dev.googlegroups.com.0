Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRMT4HWAKGQEY2FNXHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B26CC8A0
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Oct 2019 09:44:05 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id y25sf5544329edv.20
        for <lists+jailhouse-dev@lfdr.de>; Sat, 05 Oct 2019 00:44:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570261445; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mi7gsBxvD5xZ3kgofnPE1nOAGApndUMbPdv6YgFOF0ryu6FBxStGsZmmitEopifvqI
         i5AbISNRLa4N8GEUB1SlQjqnC42Z2YpXM8qSNoEltl8AVsi5AEySCvYcCfep7Ohh85RX
         CeLDCDBXz0Z6rbwB/7n+kPgKQKWLd7nzvF5O2V5omCkAC5uRx8J6LORj7NZ46cJCRcbq
         UXvEraWnxDx4Ri/i2kyFIKD7Fldi3HD7OlDUGpGRP7QMmHpjqKwgH6vpoDg98tje6OXw
         kL8iDsJ6U2/yo3R9APlbdDWL3V72c0MHDpoF2eRHpkDwjTodwij/naB1chToie4YiRA+
         vnDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ICd6PSYCHdyv76+/6nR+1GrcmpXJ71/NjKsKqqYkzCQ=;
        b=h+sKpjNbtKRmqOlgM0VUacfFPbRlrLivRNHfCtEys+Xt2xeMvA1TOcnZ3gqVVRG+/g
         4781lVvmas+xRQSRY9/+G+cKGENK8uQj3vpM8+rjB53BB2p02YCAQv6v6orPON5oBWNf
         ZhS7d+A+FJqw1Ipb+2G2wd8QY0zZfNd8bKfjjdnepH62VgucxEKU1T9rfoqNE7wyr9fP
         LQy0wVzhkaDWaVJEtmyZcmPTMFZGOOjYsuE0LtVSlyL3WUeGlw+NgdANqwu2ZFxo6e2L
         haVodp43K0EYtYXC+zW7i2z2t2Lf2WKgFdE17wYrsdV01zaKYSXgeDzpJ4SgwNov90wo
         Y03g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sQtQA8rD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ICd6PSYCHdyv76+/6nR+1GrcmpXJ71/NjKsKqqYkzCQ=;
        b=KU5a+Ep6moSM+sFjBuLkNvUwxPUBcwQdXthTiQ/OyQeCTmi23aFpI6yHepQirXzxdc
         F7KsibJZcTqDqh9BU+5GohLy3IIzwyjXCI8jbJk0/ZvD/9q1AxBBdUaqJJ45LYKJ6ayy
         Of8ZzUTbb8iWy/zlpfcDFVOhdpug7Kt/7Dv32Vsig172C9fKFLXP0JZne2dyKNdg0SBU
         FNnl6klD+U2yowReqKXM9PX/nIYkvxC3btCHnSeslpe2mAdcZ2tAKCQr/oTudx/yoORl
         m6JNbRVBzbQkkk6ydDVgOl3YdkFomATWhJ3aAMBxeOWGVdW1u0axmKO5Fs1oaswaQjM1
         RzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ICd6PSYCHdyv76+/6nR+1GrcmpXJ71/NjKsKqqYkzCQ=;
        b=YaWpqFmDILT32GK/wEh0CCCxihUwjkEsWzoegq9jtmZOBY2JM8jbgth+HVDUWdIWNf
         LGGwBTtZ09gu/DFUe0yNVcTHFsQ5B/ndKjq0om2o8MsG08UZLbvYAfca9fKGJvb18M8A
         MKPQkTwK2RsyEJV7cQrfmytk4CIKoFxE6Md9EDXM0JZ58L1JWkyWntTsMeJTp3HqnzRI
         RSeczeye9ho8m13T+WCXyNZAS78mLK2T5Oru3WnAIMxgT/lqN3hm0mD76i2XvrShFj9j
         nmdFbSNAuZZ7bmhmClq0MZKUJHXZW/BXeo3V3QVx3h1cE9mG0fyoZbx/HDig7J0gN6Xo
         ymuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUHdUhb4HpPsU7/G7cCpTU4oJnAyVoS4P4Vh7op29DoPnW6aQpG
	7iP8BwP7qnFk2kXFFGWC9vo=
X-Google-Smtp-Source: APXvYqyGgZPpOc706SytiI0zWgQ36RYUyASslNHekoGe5V5FDDnwrGGBDRhSfUIr2GJDUOcHGOFG7g==
X-Received: by 2002:a17:906:e251:: with SMTP id gq17mr15599440ejb.85.1570261445582;
        Sat, 05 Oct 2019 00:44:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:498a:: with SMTP id p10ls1434531eju.14.gmail; Sat,
 05 Oct 2019 00:44:04 -0700 (PDT)
X-Received: by 2002:a17:906:d797:: with SMTP id pj23mr15737982ejb.70.1570261444967;
        Sat, 05 Oct 2019 00:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570261444; cv=none;
        d=google.com; s=arc-20160816;
        b=Znopef3HpSsaCkiEbpAXjXsZ0QZnRi/A66T1/r9Hizgpqj6E9dyJ8xShixuSrmWR9L
         yh1OgQO41+3KeNua3SDzxQFCUlgQZ9W2+nGzP0T0JiS9gKhQMVaz1/h2QoFjc25kjElX
         6HFyZbkRnBBAnHF9rYm5RqMCeJwzMN9MH+X6+NMm2F5fUlIfP8wpwbmWLAfzWNgrEqhN
         BvbBvPyqWPs3YYvC0WXWOERCx/lv+/cLuyP/EbHdQgn5oPUolFGGvkfc1HrATYy3zB3z
         6JWg6dq3s7KsxDtuPA+gDgTyJyIc4qJBhcEiaV6MvapPejGIErWchAFdpf5iKIS6eWbO
         AlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=LvXloyqhCAaXqIo2SSI7V/+Spds8lzNAxC5dUOurOsY=;
        b=ipF1GP6DnElWuoABm9BwuK08mB66LHzG62OwhH48dTyQk31b1MZH9ZYoAO7/45v2rA
         QUvM8suQbHV4z9SBf++uH2AbotdUFf+/Qk0vWbSPSmXW01JNZSEcjUFcBwKzApqia19e
         L51p2llymA59qp8erNBEhgDbeKaljcugnEZ6msLZQ6OsMXlTQQ9HTNL7YtwWK05U2WwK
         j8/xAHlDhcnoyzKqG/ViwzLa1vKIeW+RVau4lgK3PApDS8IyN6WI15xmDWVnCMN1HzEZ
         aA4L34GktTY9J2wEFzGv/YwHfxaRpkUO5jBNGNjLIc8K6wWAFfTI2Pa2y2IqrN5gziGY
         HIpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sQtQA8rD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id c31si577263edb.0.2019.10.05.00.44.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 00:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LqUPN-1hdUEX0FDl-00e7NG; Sat, 05
 Oct 2019 09:44:04 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
 <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
 <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
 <48835bb9-5fe5-852b-e538-00c7b6fb6498@oth-regensburg.de>
 <b4b63fc4-87fc-909f-6b96-fe8f413a198c@siemens.com>
 <e9bea12a-1524-6289-db95-f25edc3a3074@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e635cd48-5a0f-183f-6f4d-00c017e40479@web.de>
Date: Sat, 5 Oct 2019 09:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9bea12a-1524-6289-db95-f25edc3a3074@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fYu6l0VCPZHQI3Awpwos0lkmmEpBoWKVaMFFOlvOIN+3knOBGeC
 G0utLWCueoq8qhT4zJkh2WH9lYLPOMfBC9dsbdj4UMS18Qf8Jnm/sYao75inmrCCNIBCMK3
 E2R+GJGVfVKdNsJPi2JyVEtoxc7jqeYqQUkqlx1mN5uI/0AxuplgUjUOC4ud7tNQiZI37ws
 ynHgVMIfcmoFnT0kUiOGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qNZtK0goBWY=:HxAbMYsQ0Z1AG/pMaUYN+K
 D+YY1VAB7igoX5wUIIff6G2d3naGnVJMVKBzsEy6hYhMdOYw/78iLxtcsNp5Yfje6hfhPTaNO
 FXXgSYLZ80dvVh86/Om8n8wMaDrAVcJm9L57PGNVYl1RD6cFqa0KzSvrm2p3U4o2dA4NJsurr
 bROF4A0CJxexsL6LvzV05lCipG10DsSIHMxfXE2NwsdzbHB/GCbGVPdsBGq+kAXIWJmYnBBgK
 ACkznySUtvP6soArDEJVlgWq2G4MNhvE1VyCO1egoynNXIQHCBWIIMU4BOdLXSzlDkmOK/kP+
 bMf6TmbDKNApUVTFaAdiiJoi3uYtxR+mnlQXhnRV9zXgdU1TmtXMEbE/nrA3DdlXPVcpd21V8
 MPYxhL8jzF9DJLI6hJWSaN94iiSh55OWpN0EUz/xxQGrRVBNQn1AHPOS7AMyP4k7OicJJpdLm
 zjKMq9e4xc9DyR34vKFbdhOvPTScowSaR3LWB2d5zEx1lgTrYvsw58jjTnKC+9qofFkCRorRz
 r8nP5y+EY4ll+q/rvIyM21FD7PNutOClm/97EhFspXDGJppDEMKfDB01wJIkhwZ8X9e+0SEo2
 t9K6sf9o5DPxLz/92K+QZjJfYTDvvx+LiOvQ4ibCkUB5LM18yQlj061r3y/llv82I6W+DtUXZ
 5Ap5ZXgDS2onBDLLheLoBXmmVZWN7M/etFBsp3+FoXrwjXSZgf0MHrrNqOgwRJztuVVT8QSwz
 MpdUjzE0Lyf0vF2jPQ2nSuR6qojuPWQxkG08U6lk3FjIMd2YqyknjFZpmq8jXAgmg+daqHkkW
 xUDoUYh0KZ9koXscgzT4mNZ+Ftnk8g0MuLVyGhAGvjhxPTUPVszNTA6kxxACF19eJaakT02Ij
 Ipq62UO6NHZRpjoKt3SVPBitSj+vLg0QVIJgAEInjx+Im/NsgFepDTq/zeN2DZ5THRtR2bc9k
 hOO1EavfbO44NZQQETMUprZon/4Yz8PABPq5P2/VlHi195axv6AftEd7TxpyoGNzZ/hCim9QF
 Xk7YuuCGRaPca8cSDMrUiq7mBLxrOqMjQmPl3dW+CHwQykq0uV/ISH0nMbrGbG2UglWDuh9f5
 xkOeEhWhvtTf1Jn/1oekyZxq1jFNAXj3rPayYG3A/H7qKorUeaf+M4qCXx4sYafqM1TBAdu/o
 idgK050cSsTHoI96AsNGT2vzwpzXRhRmila+rWVKKf7v71lXwGfcMsbVHeOPHky7E0+nuf0Tb
 cliZQmRASywIPn1VSEESqackKZaR8FA80QNmg4lL1cKxXSgzh+t3yX3A8O3A=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sQtQA8rD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 04.10.19 16:41, Ralf Ramsauer wrote:
> On 10/4/19 9:15 AM, Jan Kiszka wrote:
>>
>> On 02.10.19 16:14, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 10/1/19 5:34 PM, Jan Kiszka wrote:
>>>> On 01.10.19 17:23, Ralf Ramsauer wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>>>>>> On 30.09.19 21:25, Andrej Utz wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>>>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>>>>>> This patch series eases configuration of port I/O devices for x86
>>>>>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>>>>>> previous
>>>>>>>>> behavior, most entries are disabled (commented out). Only whiteli=
sted
>>>>>>>>> device ports are allowed. This includes the peripheral PCI port
>>>>>>>>> space.
>>>>>>>>
>>>>>>>> Did you also try what explodes when enforcing the generated list? =
I
>>>>>>>> mean, if there is no mess like with hidden memory regions, things
>>>>>>>> just Just Work (TM).
>>>>>>>
>>>>>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>>>>>
>>>>>> We probably need a mixture: white-listing know-harmless thing that a=
re
>>>>>> requested in the legacy range, combined with permitting the PCI
>>>>>> device-related regions.
>>>>>
>>>>> Ack. With a little luck we can rely on entries in /proc/ioports, at
>>>>> least for PCI ports above 0xd00.
>>>>>
>>>>> I just compared lspci vs. ioports on some machines: Looks like ioport=
s
>>>>> contains everything that can be found in PCI config space. But ioport=
s
>>>>> contains even more.
>>>>>
>>>>> What are those pnp entries good for? E.g.:
>>>>>   =C2=A0=C2=A0 f800-f87f : pnp 00:01
>>>>>   =C2=A0=C2=A0 f880-f8ff : pnp 00:01
>>>>>   =C2=A0=C2=A0 [...]
>>>>>
>>>>> Are these reserved areas for PCI devices?
>>>>
>>>> pnp, ACPI, some further platform resources.
>>>
>>> Will the root cell touch those ports? So far, it looks like it doesn't.
>>>
>>>>
>>>>>
>>>>> And on my laptop, I can also find ACPI stuff above 0xd00:
>>>>>
>>>>> 0d00-ffff : PCI Bus 0000:00
>>>>>   =C2=A0=C2=A0 1640-164f : pnp 00:01
>>>>>   =C2=A0=C2=A0 1800-187f : pnp 00:01
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1800-1803 : ACPI PM1a_EVT_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1804-1805 : ACPI PM1a_CNT_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1808-180b : ACPI PM_TMR
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1820-182f : ACPI GPE0_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1850-1850 : ACPI PM2_CNT_BLK
>>>>>
>>>>> How should we deal with that?
>>>>
>>>> PM_TMR is passed through anyway, at least to non-root cells. The rest =
is
>>>> more dangerous, potentially. But a "works by default" setting may have
>>>> to include them.
>>>>
>>>>>
>>>>> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn'=
t
>>>>> VGA be listed in ioports if present? At least for qemu that's the cas=
e.
>>>>> If we can rely on that, then we wouldn't even have to whitelist VGA. =
[1]
>>>>
>>>> Yes. VGA, if it shall be with the root cell (common case), should be
>>>> listed.
>>>
>>> Alright.
>>>
>>> So here you can find a WIP version of this series that comes with
>>> support for selective whitelisting PCI devices:
>>>
>>> https://github.com/lfd/jailhouse/tree/ioports-ralf-v2
>>>
>>> So far, I successfully tested this approach on Qemu and on a real
>>> machine. No crashes so far. (which I didn't expect, to be honest ;-) )
>>>
>>> Jan, could you please test this approach? Just run it on your local
>>> machine, look at the output, and compare it with /proc/ioports. If this
>>> is the way to go, I'll make a clean series out of it. The head commit i=
s
>>> probably the most interesting one.
>>>
>>
>> Something is broken:
>>
>> $ jailhouse config create config.c
>> Traceback (most recent call last):
>>    File "~/jailhouse/tools/jailhouse-config-create", line 260, in <modul=
e>
>>      mem_regions, dmar_regions =3D sysfs_parser.parse_iomem(pcidevices)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 102, in=
 parse_iomem
>>      tree =3D IORegionTree.parse_io_file('/proc/iomem', MemRegion)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 976, in=
 parse_io_file
>>      level, r =3D IORegionTree.parse_io_line(line, TargetClass)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 967, in=
 parse_io_line
>>      return level, TargetClass(int(region[0], 16), int(region[1], 16), t=
ype)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 869, in=
 __init__
>>      super(MemRegion, self).__init__(start, stop, typestr)
>> TypeError: super() argument 1 must be type, not classobj
>
> Argh, seems that's a python2 compat issue, doesn't happen with python3.
> Please pull again, should be fixed now.
>

This now basically works, except where it can't. This is what I had to re-a=
dd
manually:

		PIO_RANGE(0x61, 0x1), /* pc speaker */
		PIO_RANGE(0x1ce, 0x3), /* vbe */
		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
		PIO_RANGE(0x5658, 0x4), /* vmport */

None of these are listed by /proc/ioports or elsewhere in the kernel. Some
because the drivers do not claim the resource, some because they are likely
driven by userspace (X server). But that's the normal set of platform quirk=
s, I
would say.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e635cd48-5a0f-183f-6f4d-00c017e40479%40web.de.
