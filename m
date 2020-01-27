Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTFBXTYQKGQE35OUYPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85914A823
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 17:33:16 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id j1sf1744417lja.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 08:33:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580142796; cv=pass;
        d=google.com; s=arc-20160816;
        b=g3wUT2zxZq9oPfwea94aaYY0li6+PveLFrIGXHWfRmezXY+VQN8D7fSnf4eMx0gjXQ
         0grR7V+ywIpT72JDv87rfl3IOh2wCjF0Q0lM0hfvR+nUZcb37DBy1bQ7rhej+An90ZHQ
         +KYjuwzqHew1cpu7SY9AbDiXOHP9cGR+1wCJJCSVlo65xSn1Yd4747C2p8ShKqlPfb8J
         O+qeWkGbtAhsy1XFiKQBwdpeDKvga79NsOm24iV4U5651Du4GaH34jdr69R+cE/ez5Z6
         ny/zg0GaCndB0TbCHQ29/ICFTb180niACxsP/KVAgBtTsDG9cDhL1IX2CaWxM5fr/aP4
         Sdww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yVOcoIDYjYIsf7gSovq+1LWxc7lGyiE0mwgqQzJeY8I=;
        b=QjaKiae76vzCeQdcSxsIGMdA6n3c5FVQmdA5cyfdsZ3ca/XSKrLQgQ1zX3mkTqJ1v1
         rdaj6dIPgtbaebPyW1wODwVsJanFWb6sxUJ1y/KsRtD+6MKzEO3e9OuZf5Ej+73tNrGY
         n4g4IcZUcb0jshyw7uDGZWRLMOYQx7EcZhX5dSl7K92Ln62qM3gOeL8KvsB7rlrcbPX2
         7nf7781egALBc+JLwefoJ5R69Ay15FK1W5tR6gogbYXd/wx5lYwg2dtDT2JG2L1E4PVS
         YHZDUaFKRUkli83M2jPQrZHJSnnQHKjGuDy5ahfF3JQzeT8GUb2ferjiQEh/h7vqOqky
         9JAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ktwT03Qa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yVOcoIDYjYIsf7gSovq+1LWxc7lGyiE0mwgqQzJeY8I=;
        b=NqFdYNrhdwpkPuFldAo8p5KJpPKDWo34m+nbZIRBCs9X8/ky+HgJWoevZXGnQpT6Ok
         L1H3vBtAaDz9QCYtlpHozIuK+8n5mEsIP8NKpIkZBrsrsZzc8xAmqWrbPLq7zSTLkuue
         HJ8gzmUKEqpkesCEypYqEsV8TEQVSA7pCNV5WWyvaHubU1zJjH7zvy5+5XTelAY7Crr9
         a8KumdAWHmjTnRFRTzyum6Vw0+2YWad6H7Z+vG3S5ZzCaex/IL36Y5A4FkrR5Vm+rf/Y
         49tmlQ4RRN40riEKr8ClvXvYceaNQqYJqMuak0xw1ML2keeAvqkyDxPrbbfJt91xik2p
         NAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yVOcoIDYjYIsf7gSovq+1LWxc7lGyiE0mwgqQzJeY8I=;
        b=XiYErcae3/822T+wu1rC4e4m1VsCkldlvn7n8+0K925w7nO9iwfPPeR/bJTFhCUxs3
         F1Ijkb65Ex8Eq8CulPYfrWNL/9WRt8eNMxSmiboUI+f//TdPT/k+lDadr1JvqMCn/lXw
         P786eOeQpdNk9qW3PXyrat8KU2tQCg1LJwBOH2dbwlNjL5Y2mdND9RpMjXH2l/RZFM7H
         vii7dlMjBHIK2VnRbO4lgAThQ+rOzgyW3LvT7WRn/R5FfNQAB9A1T3oxBtlRON950wID
         ATWlJ7OR6jS1ZMBaZUBPZ8UIHW5ufy9OPfeiXaf3r7Kk33YPyVyp13p6UIPc0ep1Zjeq
         qcjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHFSc6TKZl8MHX8SslNKqpZyLp4CUn+bkvjPhmTdQScQRJr6Va
	uc569kTVdfyY5+1x1Tok5jY=
X-Google-Smtp-Source: APXvYqwGag1x09ov2YD7+SmH0GscqbVIenQQf0QiUym5c4gthPUePPXC0St7aPsuCvDm7JlqDA2xIA==
X-Received: by 2002:a19:3f07:: with SMTP id m7mr8541628lfa.61.1580142796287;
        Mon, 27 Jan 2020 08:33:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:518f:: with SMTP id u15ls1174277lfi.3.gmail; Mon, 27 Jan
 2020 08:33:15 -0800 (PST)
X-Received: by 2002:a19:4cc6:: with SMTP id z189mr8362036lfa.171.1580142795315;
        Mon, 27 Jan 2020 08:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580142795; cv=none;
        d=google.com; s=arc-20160816;
        b=e5+YOu6+HtdjtmCVVhuitKbqZlkFJAsPVHcdCP8wVH2HakIcBUpnHMRk7p/6hPs+Lu
         gb/48aMssjzRMDi8G3wSYfB48HkS+yvdtCeCi1y+2283Ft/DWZYrCIXLbsJYMx6yx6fU
         /PJLK/3zXASP1nOS/otdTbGrlM674yk23JDU0nSZVkIkWH27nqSKRQPB827M9Q+kIl2U
         VMkAmUKLUc8/eZkSUoxg4rdHt7+I8ZKcYhkjtzFF34pBhAy9YIpxE0Ki2jLDwLmZ//EM
         kc5Jvx27kjuARTfU6TaOg030FxMy0opK6G2vTXhlHZwbR2t2cpACPv6fRGiPFt0+x7W9
         vD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Hzczq7+uVjnM+157yilgraa1ZrH/DKpEPicSFwf3/0Q=;
        b=qYKat66pP2RP4TP0dhoGr4RAgeIITlQML2dKvQgEoJ1ZmQOHGTqFUIaZ2+xXtQhF+K
         cHxJfC5V7CfCFYrj/NEy9An+0bXChRgfrsdLeShenURSa4dllijU6a4E9poh7wQ90oY/
         /2NyEuwTEmS7jtCyxbVHFcO6fWhjyHbDwdO4VaR56mrNmqCD9RIm6XyjnfsjeTPNOoE9
         stKZuEyPq/FhmBbVYrs8g4NTk07FbtSymXWJOA6uWMpJq3E4IoOs1IgBa3sj0hvaHK5M
         2SOqWjxlsaQM9TVpsjE1K2wyN7Nrnq9lwTFcYhBKPfxlzIyjzRueK49Keg779D6D1Mj/
         90OA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ktwT03Qa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id u5si744208lfm.0.2020.01.27.08.33.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 08:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LzsKN-1jhunZ1MZf-0151uu; Mon, 27
 Jan 2020 17:33:14 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7222df54-40c7-6958-570e-9eb50365e905@web.de>
Date: Mon, 27 Jan 2020 17:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/x+15zXo0rxYT8Z6YujhGUavjBccLhyI9HwmgANdqeksLyVQGdi
 g8T/w7bonkuyCfuOWNa1c2nfM0kpRWcN60IPvrH/nYLS08serG6cWEQFKC9FC6jGREC6UIC
 OlLaijrBB+jLD2+cUsUbuWWezFHq4AT60L3OywHq2G7NlBvQqlgaGBkaotR7yJTknlk4LTr
 6FRmBPA+lB6UAO70eIL/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7LfFJbrurTo=:f/JH1KgKnAJxwp2OlfBEI+
 GVAMRSHQhwJWBQtpakpbNY6UMPajkYxC+gnScxQwBAlQL+KXCM/Rs6mez7uS1xTRQovKP0g9w
 NZKr0SFHC84YiK9vGJbPFqd5jV2d+Sya1g3Mt+C4zqmRva4Xg/E8RTGFHK6uKqjgdRwY2OZ/y
 TLIJwi3RF0JX4CV1E8Xp+JeHWfTxqca4mFw6L9bMg0CFcu4t9T6ZRwDNYRUlWByYPdSPeCWL2
 eMx9FVwNRR0D4N6ExGxui3pfevNZQF/OqNqQI6xxxNxYQHjwNykqs8MC1vTdFl4LwtSLpozo9
 SFQVyU7j6KVyJyv8Vd26H27jC1zPGpVpQlHj0VpJD4EWwm4fgfaJEnKG2vaOmI9MJBpc35fym
 Qx5Jf+/Gr3+THT01Xfmavw/W8PTAH+ggpBNXpp9l6+povkn8OBD4HorDG/e+qu7z2cQXbL9R8
 TAx/P13m0RUwdpcQRVEZJZvz2HriETycejde5pKd+pRebH/zI4o44E9f0s3/lHOsk0i/kf3ML
 ZrNomtcvMCmHyAZRbZFEl6diuhl64aCe6lhmHvdVFC4lPKsQ02fuCwAHoGEQMt2EplmZoSfsz
 ckLHqbl2L71Fdu1iXAxgAswgKsaE8+evPg+p8KqPNqnyxpWKeLIXoMv08hlNWZLwqx9nb9xTT
 BJEpAOrPDMHpN5C/7QpevcHpylnNv3QTmLwwb3N5a7ZvWOQtM5gBRIPRllve51O0SqvKajCwZ
 HOqSBBMaLLRVAz2gG4jWTs5Ap8BOTHdE0YVdBrTCsU+srFQhyauMuXtymPRZzTBEPH4QwtGBe
 7Vjw8HrYM3KF1/GWvv6DYRswSkujTQzZPqTh2a6sE03xzBgYMGxRp/Wt1AWbGUtzE8ZUiRD0A
 jBbYGjsZ26LPegnuifWuBKwu/O1Ja+sHhDM21zxIuas1wQAp1BWoTDhuwnYyBIvSGvCQogt48
 iZ0B92exkHf+xdd7VzhHcKNpjPfT4XBUK4vZP8gLB+gSb/vnG7F2XMSB8bBX19gDItPYW9zZf
 RcN6SiEnxa0RDuZJuNJ2MXhF02rUIYTOSIJifGQKpv7ywPtzLz/V52zyfX/3mcCNkPen0y08T
 M2bzTcCGKMl/qGu0tf89Vh+d/leyiHoP66glepM6bcggX1HmvGHu17ihrPtpNsMVZsGG4t6/9
 jYiay70nfvTX4Ypeu1/duIetBnKmpVlRM/NUCT4w8XkqzjTK1zWwD+qP/u49izBRdkN0bPICG
 cpNqKPMkjeL31b4MRWDe+YLG4kxRGpRwjd8O+M/3CyCJ3r4e9OWErsEfUoH5L51ZwzEW3jOsV
 f9L8Vj3CHYTS7dcS04rhH9RCeivgTnED0ZrcIEgXAnAAthwlm34lLAfVBWACffk3d08rQxdYy
 5LpqeCnNjt5OrSWQzV7jA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ktwT03Qa;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 27.01.20 17:13, Nikhil Devshatwar wrote:
>
>
> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>
>>>> This series adds support for partitioning registers across different
>>>> cells
>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>> where it uses
>>>> MMU mapping for page aligned regions and subpage handler for non
>>>> aligned regions.
>>>>
>>>> However, most of the embedded platforms will have common set of
>>>> registers which
>>>> need to be partitioned at the granularity of single register. One such
>>>> example is
>>>> the pinmux registers avaialble in many platforms including K3 J721e.
>>>>
>>>> This series implements a regmap unit which allows to describe the
>>>> ownerhip of the
>>>> registers using a simple bitmap. This scales well when you have to
>>>> partition
>>>> hundreds of control module or pinmux registers.
>>>>
>>>> Nikhil Devshatwar (4):
>>>>  =C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_regions
>>>>  =C2=A0=C2=A0 core: Introduce regmaps in cell config for partitioning =
registers
>>>>  =C2=A0=C2=A0 core: Implement regmap unit for partitioning registers
>>>>  =C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG registers
>>>>
>>>>  =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++-
>>>>  =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>  =C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
>>>>  =C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
>>>>  =C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=A0 47 +=
++++
>>>>  =C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 258 ++++++++++++++++++++++++
>>>>  =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>  =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>  =C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>  =C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>  =C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap.h
>>>>  =C2=A0 create mode 100644 hypervisor/regmap.c
>>>>
>>> Worthwhile to discuss, indeed. The key question for me is how well it
>>> could map on other SoCs. Ralf, do you think it could be that simple,
>>> based on your experiments? Or could we also face scenarios where we
>> The question is what you try to achieve:
>>
>> Jan, when you introduced subpaging, the goal was to allow to assign
>> devices to different domains, if multiple devices are located on the
>> same page. We can observe that pattern on many platforms, and subpaging
>> provides a "generic" solution.
>>
>> So what do you try to achieve with subpaging on a byte-wise/bit-wise
>> granularity? Make a non-partitionable device partitionable? That will
>> only work for some rare cases.
> The main intention here was not to partition peripheral devices, but
> just the registers
> which are not really related to any device.
>
> Most SoCs will have something like this where pinmux registers,
> efuse registers, internal muxes, MAC addresses, and other config options
> are provided.

Can you point out another SoC that we support which would benefit from
this description method?

>
> This series was intended to solve these kind of register partitioning.

So, subpaging does not scale when we have a scattered access map, right?
But can we use this description method to replace subpaging? The latter
registers an contiguous mmio dispatch region, your approach additionally
checks within that region a bitmap. A subpage entry can handle up to
PAGE_SIZE-1, a regmap currently only 256 bytes. I wonder if we can
combine both, maybe expand the memory region to optionally refer to a
bitmap for finer-grained access control.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7222df54-40c7-6958-570e-9eb50365e905%40web.de.
