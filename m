Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6G3VHUAKGQEDVOCSII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id B60784BF6F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 19:16:40 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id o20sf24820lfb.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 10:16:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560964600; cv=pass;
        d=google.com; s=arc-20160816;
        b=dY1GuhSAEvekq51xXsFkuI7L3SJqcMYRQVQTuJnfkYkoJ4lKfmUk9SV9TlleI/E6tW
         ECzLsJkHJ/xHZrtl6lpDmsQJQOcEGmYZu1N1+s9VQ1bYDpHoh1R80meIwAYL1YQDXXHa
         F85u2CRwCTo84Lk9D45ESIDbiwRFFsr/10TiyNSKr+jGnFwfD068Vpcv5fR8TzTGGnEY
         BSHK+88RYCBNJKiQ9KfHKmp/K2hHDJEwq0FF5w+BzdLiuCToWlFxgCkksnk89hFvIG9Q
         /IIGcKGFrm4JmQvZeCYTZvinLgy+BfVj2HuiRZfUDV2WFbDIMplBBuN/p0pLmRqnc9N4
         jJ1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=UA4Ap7WttW/optulvyuqM5R3h8kr97jFf1XN1P7aU/4=;
        b=QaeNBzrgY3fAsPCyVfbk8M7eHEyolVJeq/BG4ajE0froEno6TReJLQeXPP9BUnrnO9
         Zfv6Sevr2uUZJ7sFOAWygpW+dsLNXApAoCXyiFxrUf+jFUVSeDYjtjS9cRMScFvatTVY
         qv0MacXsR85MAr2BVaNBZ1A6gTVwpvMTBy7/7fLJDVLE1/CFviOSe/S7ialuvp5MCIUG
         VpZc7W4Re7L4wijIb0triBepeH08pAFkTGVJWkF+YDFZJJ/00GRy5eKC1F9O2Bfnr+Tk
         UVNlA7AVuFMbhsgn5VbPbx4PmFisiTrh4VuZFEx/TkqPwx3BYHdR9qKCp0URY4r7JZBv
         gHeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LEPhb0md;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UA4Ap7WttW/optulvyuqM5R3h8kr97jFf1XN1P7aU/4=;
        b=C324jMZUBmjy1j4G/wnYAXeN2hY05OxD4Z/YYisSCd2XE3MkBSIRgHKXlIGk8Treh6
         CY3/igTGiynTW2XiOBocxB0QVtWmrLWjGOJmHYV6sQSCB7fE+CW08mrLzDLYic7Kaz9z
         sKA/Y+jg54weoxRhBVy7StsrqLj/B5pTGEJiSCtxfsprsHjKPJDB46LYkZXfRQ1gLsZc
         WYrprJbvOB61GfDiCmLADxXScMlj1uZOc3b/Nw7RhdgTETc3SAjwAhiNvB1ZZnV+jzdj
         GUobKJr3dLHaahSp921//4+NJaOM2DpddO87JfLBcUDvUuvI08t7nB79vfI3MbnrMbOm
         2p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UA4Ap7WttW/optulvyuqM5R3h8kr97jFf1XN1P7aU/4=;
        b=HbC86BT2o74vRpOVbLU1F8MI4D/v5wehSsE1CtWnBQ+lRK/8nm8xnJaJ1YJLtDn+xZ
         yiQeLyx3rJ190jKj433xzkCwjBUZn6fHvZyeI+4AfC7M/v/7EvDmuoIo5mARqa0E7P3x
         T3M2xrY58Ph62YBTf9KpU4DkmEWO7j7VPDEGw3uHDWUpG7rNX4RDDHc1sy5pw2ehB2Yv
         JEoMiJcQ2G32iZMTsI24VO4hpTOr+hiHzHjDhYyk5xFKQipzJrus2tXKxK9paTDeLThr
         kquUkTF671oXTv3hRYw7xL+yXVKkh34KXu1+a+B3Qn5EjyigxA6c5+J0oDqYzst/svsL
         AVxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWnNj+1Em0q3okIu0ZfxNsSF6N4RPfgbbfmJ/CIjBcR+1krTdaY
	qIFr8JhAXP98co43RVrC+TE=
X-Google-Smtp-Source: APXvYqyaUvqb61GCkriBgkSAW/sy1HHcryIZulmJYjyGis230dhM4Hlg9mSmw8q3j6NeXHkXN4LVPA==
X-Received: by 2002:a19:e008:: with SMTP id x8mr23031412lfg.103.1560964600322;
        Wed, 19 Jun 2019 10:16:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:868a:: with SMTP id l10ls364093lji.3.gmail; Wed, 19 Jun
 2019 10:16:39 -0700 (PDT)
X-Received: by 2002:a2e:900c:: with SMTP id h12mr38923817ljg.197.1560964599607;
        Wed, 19 Jun 2019 10:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560964599; cv=none;
        d=google.com; s=arc-20160816;
        b=0nUlhfkdNH+V3Ag3nNp/nVyjupvTwlb18tgoXXfbp+jTqgJ3ZVz50DwC2EenqdR9LU
         tbm4jzotSfF5eoLNLfrS22wLi96oFCw5m+bi7Lg2ypIJFP030uYVAB8BiphVW+WXtMrW
         eec4+4CmV8vshVaAtR1azGs3n0aHfJ6ZvWdxEBN3Dr8lgHxLJEgdatAMzODB9hPiw3fO
         0cVvd6Hwtn8wLFIUiSO4hiVWgDB4FDMyJuHBGFL2abP8cW9BKCOgxiectxOxok9oV1JV
         SW3uTI2nf3k96jhyT3Y5az4aO36dq3ylsyZ5VjEjuuBz3g3seIJ9g4U0kjJXRRA5eBeb
         qXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=7AyWvS9D6emJSZlRjA4xG29gtTPnfYs32UlWhshkphE=;
        b=xfM8IeiTq1iBzuvmQxF7adbWXJn7dpMCX3F2RVZ1BC1sHYIOTGTIEqDWHtsKM+JK+G
         E4pm3iJk93IolUXwxYAjldKtxM+5NFYOF3l5awfBX5KDl3P08MgD5buz6n2NQuTsXoOR
         0351dK0UDuKvIcD3cICZOtjfO7zsRUr8RKzCndphkazkgvKzHlCGlqp75vvvL4gf51B4
         rYCJP43zlx5fmN0m3Y7TMwSyH35TgVpyMznoEckkF0kQGQwjVCLIAo8ofnamARngI12G
         iejsEct3W+wVOuhaf3hv/KEZg7Rlca0QMgt6bvu/WQD2kFmQmvCA7Oqnu4Tivsr7xU2e
         LWmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LEPhb0md;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id c15si731534lfi.5.2019.06.19.10.16.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 10:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45TWny44dnzyKl;
	Wed, 19 Jun 2019 19:16:38 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 19 Jun
 2019 19:16:38 +0200
Subject: Re: [PATCH] pci: Replace mmio_write64 with mmio_write64_split
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <jeanne.romefort@gmail.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?=
	<hkurumahmut84@hotmail.com>
References: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
 <7ff27074-8628-cf0c-3812-2c5810f58307@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFsT8OUBEADEz1dVva7HkfpQUsAH71/4RzV23kannVpJhTOhy9wLEJclj0cGMvvWFyaw
 9lTRxKfmWgDNThCvNziuPgJdaZ3KMlCuF9QOsW/e2ZKvP5N1GoIperljb3+DW3FFGC8mzCDa
 x6rVeY0MtSa9rdKbWKIwtSOPBgPk7Yg+QkF0gMHyDMjKrNPolnCZjypAIj81MQfG0s6hIwMB
 5LXZPl9WL2NwcBWxU71NBhyTvtVMy6eCPTDIT+rDIaIjdqXUbL8QBzaApxSLAgb7Nbatkx7k
 3LjqflPMmtQfQ67O1qS/ILe5DrYjGbwZWYb2xmXNwJvEENIDou9Wnusxphh1P1acnn+9DIjQ
 9/A+/zCiube3tgCpv5sq8++knQChn2NLMrHlVsRCgGApciO7/0hCvcS9mGE1JM3Nmwfs2wqW
 vG9vhv3uBJHjH4C8s5UCvF/44E22+bBqsrLUlr5d+YRNtY+LCH1rwNIrzNtfZraq0hPiI8pv
 P4GpvHDmrsGTyG9YbD33XiI7DD8IaAtwld7wSkMmt07NRhyxVsPc1ZIBQMyS28VvuLbDK4f6
 WyjQMJmA8EQspEmNcTFG6LnmW+7PGad2Nt7RhHRs4e4JkT8WckWzTCRzlRusyr13SbiFWznt
 +29Q47elnVUG3nB2h1VGZofX+myYJS0uX4BQ2G7sO+LrBY4HXQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPhYhBMAttVrc
 MMGXiLwkKnP5TRHIUlLMBQJbE/EnAhsDBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 AAoJEHP5TRHIUlLMICYQALEBOS5+OegeYvi/8qwcXWTtSPu6/L6z2kgh6XCii8zH8Rn9T1mB
 xzA5h1sBku1wIH+xloRxNNmZlxNyJOML5zMng8cLw/PRTDZ3JdzIFFw7bssAgDiLzr8F0gTq
 bRrAwFCDuZMNCJgJhxRrPRNSrZovqUeaSUAxw10Dea3NgcvJ1SLtClBaU2+U7dHQdBINBLXm
 UAg54P6voe/MhkPEwESRHWKsiEWBp4BBPv8AjXnYAth6F9LZksugF4KZMPWnEgXNjw6ObD6C
 T7qA46/ETXBcxI05lQFs3G9P6YpeOmH1V5pRWb2pS/f9vDudU52QRcAIUir0yjR45tmgJMLV
 oRR7xRyj/BXqBHbzjilg3GDZMiUtfjg6skr++du79b7xnoEgzHR/ByHW67MCbjcuTmpTeXBK
 Iq61He/l2NETfy+2ZnWOUNC7/lZHdfrEyHR3Q3S7TQbkm80TXE05Cfb5NXtZxlbCNxFEMtCT
 UeaUX0NtsHfRDNBzFY6pKSpg8EXDtEFe8+utLekEZ6lFgQ5ZJ1c9NfaOiRJ/NrnQfqAEXUyo
 uILPmXK+3UiFlWtmIIzSQ/Wd+4pJtM291zt0umnxboOZc1mOU9B2wKT3mnA3HxQ1LiRIT9j8
 l8iT6TwRB/aiiXa51hN4R7rfSQMxK6a93EAyUZSoWFpZiBo1/5PynB4zuQINBFsT8OUBEAC9
 HeOKJ/KJ861Q/5C1qwHRK95nJiwCCpASxip68e3ZW9vPTV3VmcQ3tPNRBLPZW1S+IV6DL8/j
 HnopXyyrFBkSJYEAtKkBI5xO6olYglCJqhJ5GdE2WIxvFfTkKwXf3gYc7zuif/5tS7D4XeEH
 wScrncFHCxDSUCXyGM/lnLhu3HfQbK49whpel67uteHrXC4tCMzaTy1SOwlXQi4nufxfARBe
 PT2udi+aZCs4a5bTqvEllPsWRsab4JjTsd831VLYCeRM6siKkzzv9nUjBjTri2cPm0FDS80X
 vQVHEw4bP+V4EvcrarNh/9VmCypuH23qRsAX33mLhB94aBoE6afCkWG5G2m24pj3NCkdA0MG
 IleuuD4/I+6+31Dip53AMvx5EDepMrA2b7gsQOKidgDe1fz/j1qkszmQlxlcb/LruXMWWY7L
 3NcwGUjNRfH0KiSyQ6GMtU5ECu8/o4fecOee76fHTviI6h7jSL3O0AKJadUXekAfhyVS/zUD
 iZTv2zI4wAyxIWj3AFVXXeb1T4UG+k4Ea+M7+jtgGUz/K3/mDYXWWRHkT5CMZLiU8BCdfewg
 Zp94L5KOWDYCeX5LWworOwtkoePd9h5g7L2EBbeINk8Ru018FkEiqALN03vPI8KYNXb6epUg
 xhdvhaPoSD3aCnQttvU8lN70cKBGMwTZYwARAQABiQI8BBgBCAAmFiEEwC21WtwwwZeIvCQq
 c/lNEchSUswFAlsT8OUCGwwFCQWjmoAACgkQc/lNEchSUswevA//RM2YQI1Z3QMBRMr/5As0
 2zXcJFp+j07wkO9avm8U7GwjPjLHGVvs44rTSc0IKSsIKCJDSqNod9jd2iR39lr5/FpRiRk/
 7A1ACZUagASNC+PiyCCjlg34bWulzVmb5ozjqKQqgYww4c6D0P44JDUtedVbKd7HdwjjzP0P
 cubSgAohnXzrkp3gtVg07KeoQyiZctJqJu9Z84MiXMIQ+G75mFkIJEL4WYIkcJ9pamUHX71Y
 T1s6qtrqXemn25w87TioHUMcW4wRXhHHJ4gDbe/P9wb9XKS41ks0kiTia1ZcFsf6QQzoCoK1
 R8ahGzsqvCRHMR7fU5w25qXAPfS5ENZgH0KcAVi1bDjwDyhQk3PfPiraiHmtEz2IlthAPpRD
 Drr0lqCvDFNtqaC+ZI0eOmTvy6/zfVh7ODmaDq1KqMu5EB9ojHXM7N6XXN8OubY+lNx+q0T5
 STssqr8EKkrHp6rw2OQHCX7uaEQri2GEJW4HowVvlashmxC4bxR8B4gbm+EB8gR8PD7BSZQG
 k5NkPOqUZJXq1HO+d5Udk1WdT+mkFGwIMN/U9t3gJNWkab+aAYg1mKwdz7B+10j51vbQbFgY
 2/n9jtl/AFgfYQocbJta5+0fOwIJObNFpLAotvtFNF+Q164Bc3E7Njh230nFduU/9BnmCpOQ
 RncIIYr0LjXAAzY=
Message-ID: <1cecd49c-d04d-de5d-110c-5396c233c6e1@oth-regensburg.de>
Date: Wed, 19 Jun 2019 19:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <7ff27074-8628-cf0c-3812-2c5810f58307@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LEPhb0md;
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

On 6/19/19 7:09 PM, Jan Kiszka wrote:
> On 19.06.19 18:52, Ralf Ramsauer wrote:
>> MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
>> set them.
>>
>> This conforms the PCI specification: "For all accesses to MSI-X Table
>> and MSI-X
>> PBA fields, software must use aligned full DWORD or aligned full QWORD
>> transactions; otherwise the result is undefined" (PCI Local Bus
>> Specification
>> Rev 3.0, chapter 8.1.2).
>=20
> Chapter 6.8.2.
>=20
>>
>> Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom
>> ethernet
>> cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.
>>
>> Replace mmio_write64 with a wrapper mmio_write64_split that
>> substitutes the
>> 64-bit write with two 32-bit write operations. This accessor first
>> writes the
>> upper 32 bits and then the lower 32 bits.
>>
>> Credits go to Jan, the root cause of this bug was found in a private
>> off-list
>> discussion.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>
>> Only tested on x86, untested on ARM. I lack PCI devices with MSI-X
>> suppport.
>=20
> I will throw this on our Seattle eventually.
>=20
>>
>> =C2=A0 hypervisor/arch/arm-common/pci.c=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 hypervisor/arch/x86/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
>> =C2=A0 hypervisor/include/jailhouse/mmio.h | 15 +++++++++++++++
>> =C2=A0 3 files changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm-common/pci.c
>> b/hypervisor/arch/arm-common/pci.c
>> index 60ffabb8..4f35175f 100644
>> --- a/hypervisor/arch/arm-common/pci.c
>> +++ b/hypervisor/arch/arm-common/pci.c
>> @@ -58,8 +58,8 @@ int arch_pci_update_msi(struct pci_device *device,
>> =C2=A0 int arch_pci_update_msix_vector(struct pci_device *device, unsign=
ed
>> int index)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NOTE: See arch_pci_update_msi. */
>> -=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_table[index].address,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 device->msix_vectors[index].address);
>> +=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device->msix_table[index].addres=
s,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 device->msix_vectors[index].address);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&device->msix_table[index].d=
ata,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 device->msix_vectors[index].data);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
>> index 492e9859..560c5697 100644
>> --- a/hypervisor/arch/x86/pci.c
>> +++ b/hypervisor/arch/x86/pci.c
>> @@ -393,8 +393,8 @@ int arch_pci_update_msix_vector(struct pci_device
>> *device, unsigned int index)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_msg);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // HACK for QEMU
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result =3D=3D -ENOSYS) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_t=
able[index].address,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].address);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device->=
msix_table[index].address,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].address=
);
>=20
> Unlikely that QEMU shares this problem, but let's be consistent. Hope we
> can remove that path one day...
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&dev=
ice->msix_table[index].data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].data);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> @@ -402,8 +402,8 @@ int arch_pci_update_msix_vector(struct pci_device
>> *device, unsigned int index)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return result;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_table[index].addre=
ss,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pci_get_x86_msi_remap_address(result));
>> +=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device->msix_table[index].addres=
s,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pci_get_x86_msi_remap_address(result));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&device->msix_table[index].d=
ata, 0);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> diff --git a/hypervisor/include/jailhouse/mmio.h
>> b/hypervisor/include/jailhouse/mmio.h
>> index 61b4647e..567901d0 100644
>> --- a/hypervisor/include/jailhouse/mmio.h
>> +++ b/hypervisor/include/jailhouse/mmio.h
>> @@ -73,6 +73,21 @@ DEFINE_MMIO_WRITE(32)
>> =C2=A0 DEFINE_MMIO_WRITE(64)
>> =C2=A0 /** @} */
>> =C2=A0 +/**
>> + * Write a 64-bit value to a memory-mapper I/O register. Perform two
>> 32-bit
>> + * write operations instead of one 64-bit write operation.
>> + *
>> + * @param address=C2=A0=C2=A0=C2=A0 Virtual address of the register.
>> + * @param value=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value to writ=
e.
>> + * @{
>> + */
>> +static inline void mmio_write64_split(void *address, u64 value)
>> +{
>> +=C2=A0=C2=A0=C2=A0 mmio_write32(address + sizeof(u32), (u32)(value >> (=
sizeof(u32) *
>> 8)));
>=20
> Why do we need to that dance around the hot pot? u32 says in its name
> that it's 32 bits.

mmio_write32(address + 4, (u32)(value >> 32));

Fair enough. You can fix that up during merge, if there are no other
open issues. Otherwise I'll submit a V2.

  Ralf

>=20
>> +=C2=A0=C2=A0=C2=A0 mmio_write32(address, (u32)value);
>> +}
>> +/** @} */
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * Read value from 32 or 64-bit MMIO register field.
>> =C2=A0=C2=A0 * @param address=C2=A0=C2=A0=C2=A0 Virtual address of the r=
egister.
>>
>=20
> Thanks,
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1cecd49c-d04d-de5d-110c-5396c233c6e1%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
