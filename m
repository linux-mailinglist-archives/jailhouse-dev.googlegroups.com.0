Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHORZPYQKGQE6WTYWLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A31E14DCCC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 15:30:54 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id v10sf566651lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 06:30:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580394654; cv=pass;
        d=google.com; s=arc-20160816;
        b=RnBR9Hk7iJsYHKcGcRoaz9a/DAjwKAj41qt530jA+YFxb8D3hYnZj/CqYWba2myXup
         ApG+7ZE4WNTMLNS8Ab+6t3chIpgdUMlccbi3zMubAgvZWwI2YuyYW7MeL4dje4lsbUbo
         n8QO1Zvqdy2Te1MPRrRxXevomNt7FHsJj0mHBXpQOO1e2T27xgeEdL1ThGSUJ4YWcHi0
         vHkxu++UwBkP3FoG4pNaHHiYg74dpHX4s0xSMGJw5Ohlq7E5TergZgB2JQYG4+QS5Ol6
         mxwY14u7SHeTGpuP304xx8akJ7VIgKCUQ8SQ0fXJeBphXcZ/5AzQ8uLe/RydjREj9EBd
         1LRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=wXFY+LIZnF/vjaq0D6eaOExZj94wCzthozKQsqYvY8s=;
        b=NPHh+pKKSf1jFPYirrDfkuWnP3EsOowLEVjzGoPy6ZtcprvkCib5RrkPKJ8Zi11+k7
         XmfuVzv29itMZLeeqch9rwNnNVr7/jmJTviwfqJkpSQvkvp5dIJaUf4reIZswY6B5z5W
         cDlroQy4m/KtiI/JMVHX14m6G5/72jNsnbprebKUSFmjjRO2FTJKH5K4VsSUtTwMhNGK
         JmhU3uIrP0+YrYy+j6mtfpAidFPMJIT8HJRXBlF27+WQuyZ2sA0P8HusNjbCRYQIaAAE
         q+QFZHrw/avFFqV0hn8NQL+JEPWCbAcTazx/8lGO5019rzillK4FkxzgegOh6rVVli33
         6MeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dZhUPW8w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wXFY+LIZnF/vjaq0D6eaOExZj94wCzthozKQsqYvY8s=;
        b=cz5OlNx5/1NQLRciAdsmzVHQRtYbG4XYBhy4wSfZxDAEQpLo9JakiFrmK+FDluecMa
         keZvYwQnILXuu4U4Mf1id31Sm3tR/Eb/DEDJBhtHfonJGsBXvF469f/zjZcbvt3tZ0FD
         JthAPgdrHHr0I2EvODYX/p8lhT3a0j2liSKcOK6goCBJevLbH8oIqnj8qFHrfzEzttfr
         0rBOsNu+4XKB2mg84zfmx+bf7IsHFxOx4rYpHU09uD5kMsjyJC+5NoWzdW8wDjB50trI
         4O0nmOGR32GEF9qt+RZ+Vr7CHM0ffQf4bByOgZ5hBML4uDqRma06rV1mI/hIDSvoWotB
         xMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wXFY+LIZnF/vjaq0D6eaOExZj94wCzthozKQsqYvY8s=;
        b=YNwNOv4S9FBaZmrqKv7kOgux9G6F/x1c1x9PwdWBWFf/nCI2boeZbdKIL8/clfvfCz
         s8UphA3KqfF/NTbixXsctJA+P6/vrnWxW/Lhwr68ZPlkD+Xn8fK5Ja27ceyC05Swwh+u
         e+J7Es7Lqg7eZa3u+j2Xy0efKirKwsRMpob0mEHkpHgJwsl0RdsEsDxdE7XHcb1otNjv
         aBWPu8vvgdFlSaz4z4tVSpDl1lEhNKIzCYt0cynkvm8TChzqH7P+vLwL94+LCO4yl4uP
         fSV6x4iMkjR3j9E5eJYT0KQDcE2ZQENMpLKL80ov65XHDWp6TjSYn8uxe0hRua72GPkQ
         0ZFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXABfIsfU0y7cbw4JR2WDJG7ptLfQmutu+zEsbt/EGy89IeIkHr
	PFcsGqne8uyki3dBdbUMV3s=
X-Google-Smtp-Source: APXvYqy2ePHHfelJ/z24ceEzoFXj84CutCEh6uqBG6+NKNV/IoPH8SAo7+/RRZLyiR/NjOuxkZhO/Q==
X-Received: by 2002:a19:7015:: with SMTP id h21mr2686014lfc.68.1580394653766;
        Thu, 30 Jan 2020 06:30:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8488:: with SMTP id g130ls578465lfd.11.gmail; Thu, 30
 Jan 2020 06:30:52 -0800 (PST)
X-Received: by 2002:a19:c7d1:: with SMTP id x200mr345505lff.32.1580394652922;
        Thu, 30 Jan 2020 06:30:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580394652; cv=none;
        d=google.com; s=arc-20160816;
        b=DTCssYV0BrpTecV850pngwZ6f7ySR1Fyn7dfgILrJh2cesOatfxx/AHpIcEFCW2Xmw
         CSxdMoyo7vvoMPXFLgZZsVnkOyDNRE1A3IND0+mEo6xUFk89cRpQKa5FCZqJIknLH6ys
         gYiq5Aa83sUbeJ6XVX9YQJ3E6J+wXZA3k3da8GHeSnbGec4xQut5jj9gCruobSnVOyoa
         dL2U0Q0BWyyeIk/OkW8+U1pbTKoW4tOVV7Ykdz+Osge+LjC6WvBYX1wQicK+nl09G0YI
         2xTGjM+BqloJgd2wTKbIGBSECQ6WDHmn4iopklTPtvAaI6lLzPHhdv8spvbpW17qYE1/
         ruTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=XSPcoVl6EedTi7Go87duNft4OHH5RkN4+l94IqK2CnA=;
        b=OlULTfyJ5ISF3prHufloBnoxYZZUAPd92GMbHPXsiUFCm0LVnAw9Gun1SNrgku/534
         wU3AR6icpmxQa80p7i7hAQrcFfFMjaM23myBAW2wAoybK1gkyNkH3900A2P8pJ+lRBIi
         IP4rVcMbpV1vr7yhVIai6o/Wy+O6Q5X0X84DzEy9EUDXs6N6z2KkhcagBbF8jClcSNE7
         xz0+2r/xcuZsRS9lUt/w/zySwyDGRX4VgJa+RGOBOVXNg9p8MZKgrTAlR3kyzGjiC+fp
         wr9Dtql+09g3N9n/xcKABYvw7ujFfkdZztu7FYJ9VTRv0mzRr5lno/nix5ATJca6p89w
         bNvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dZhUPW8w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id o24si285741lji.4.2020.01.30.06.30.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 06:30:52 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 487jSq6wdfzxqX;
	Thu, 30 Jan 2020 15:30:51 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 30 Jan
 2020 15:30:51 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Jan Kiszka <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	<jailhouse-dev@googlegroups.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
 <7222df54-40c7-6958-570e-9eb50365e905@web.de>
 <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
 <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
 <fb168c39-b767-6ae5-3fb0-08d5128a061c@ti.com>
 <7be98c82-d415-8215-d35c-11241d3727cd@oth-regensburg.de>
 <0c50f891-8bc2-ed3d-a487-69837346a873@siemens.com>
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
Message-ID: <a4621641-750c-f539-2e02-5eb60af843a1@oth-regensburg.de>
Date: Thu, 30 Jan 2020 15:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0c50f891-8bc2-ed3d-a487-69837346a873@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dZhUPW8w;
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



On 30/01/2020 15:11, Jan Kiszka wrote:
> On 30.01.20 14:38, Ralf Ramsauer wrote:
>> On 28/01/2020 09:09, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>
>>>
>>> On 28/01/20 2:41 am, Jan Kiszka wrote:
>>>> On 27.01.20 20:41, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 27/01/20 10:03 pm, Jan Kiszka wrote:
>>>>>> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>>>>>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>>>>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>>>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>>>>>>
>>>>>>>>>> This series adds support for partitioning registers across
>>>>>>>>>> different
>>>>>>>>>> cells
>>>>>>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions=
;
>>>>>>>>>> where it uses
>>>>>>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>>>>>>> aligned regions.
>>>>>>>>>>
>>>>>>>>>> However, most of the embedded platforms will have common set of
>>>>>>>>>> registers which
>>>>>>>>>> need to be partitioned at the granularity of single register. On=
e
>>>>>>>>>> such
>>>>>>>>>> example is
>>>>>>>>>> the pinmux registers avaialble in many platforms including K3
>>>>>>>>>> J721e.
>>>>>>>>>>
>>>>>>>>>> This series implements a regmap unit which allows to describe th=
e
>>>>>>>>>> ownerhip of the
>>>>>>>>>> registers using a simple bitmap. This scales well when you
>>>>>>>>>> have to
>>>>>>>>>> partition
>>>>>>>>>> hundreds of control module or pinmux registers.
>>>>>>>>>>
>>>>>>>>>> Nikhil Devshatwar (4):
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB=
 mem_regions
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config =
for partitioning
>>>>>>>>>> registers
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partiti=
oning registers
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADC=
ONFIG registers
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=
=A0 41 +++-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=
=C2=A0 |=C2=A0 47 +++++
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 258
>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
5 +-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletio=
ns(-)
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhou=
se/regmap.h
>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>>>>>>
>>>>>>>>> Worthwhile to discuss, indeed. The key question for me is how
>>>>>>>>> well it
>>>>>>>>> could map on other SoCs. Ralf, do you think it could be that
>>>>>>>>> simple,
>>>>>>>>> based on your experiments? Or could we also face scenarios
>>>>>>>>> where we
>>>>>>>> The question is what you try to achieve:
>>>>>>>>
>>>>>>>> Jan, when you introduced subpaging, the goal was to allow to assig=
n
>>>>>>>> devices to different domains, if multiple devices are located on
>>>>>>>> the
>>>>>>>> same page. We can observe that pattern on many platforms, and
>>>>>>>> subpaging
>>>>>>>> provides a "generic" solution.
>>>>>>>>
>>>>>>>> So what do you try to achieve with subpaging on a
>>>>>>>> byte-wise/bit-wise
>>>>>>>> granularity? Make a non-partitionable device partitionable? That
>>>>>>>> will
>>>>>>>> only work for some rare cases.
>>>>>>> The main intention here was not to partition peripheral devices, bu=
t
>>>>>>> just the registers
>>>>>>> which are not really related to any device.
>>>>>>>
>>>>>>> Most SoCs will have something like this where pinmux registers,
>>>>>>> efuse registers, internal muxes, MAC addresses, and other config
>>>>>>> options
>>>>>>> are provided.
>>>>>>
>>>>>> Can you point out another SoC that we support which would benefit
>>>>>> from
>>>>>> this description method?
>>>>>>
>>>>>
>>>>> e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit
>>>>> from this.
>>>>> There are lots of pinctrl nodes in the mainline Linux kernel device
>>>>> tree[0] and [1]
>>>>>
>>>>> Currently, the pinmux configuration is described in root cell device
>>>>> tree [2] but not available in inmate device tree [3]
>>>>>
>>>>> [0] -
>>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegr=
a124.dtsi#L334
>>>>>
>>>>>
>>>>> [1] -
>>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegr=
a124-jetson-tk1.dts#L83
>>>>>
>>>>>
>>>>> [2] -
>>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegr=
a124-jetson-tk1.dts#L1035
>>>>>
>>>>>
>>>>> [3] -
>>>>> https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inma=
te-jetson-tk1.dts
>>>>>
>>>>>
>>>>>
>>>>> With this regmap framwork, it is possible to define the pinmux node
>>>>> such
>>>>> that
>>>>> inmate Linux kernel can configure the pinmux when running in
>>>>> Jailhouse cell.
>>>>>
>>>>>>>
>>>>>>> This series was intended to solve these kind of register
>>>>>>> partitioning.
>>>>>>
>>>>>> So, subpaging does not scale when we have a scattered access map,
>>>>>> right?
>>>>> Yes
>>>>>> But can we use this description method to replace subpaging? The
>>>>>> latter
>>>>>> registers an contiguous mmio dispatch region, your approach
>>>>>> additionally
>>>>>> checks within that region a bitmap. A subpage entry can handle up to
>>>>>> PAGE_SIZE-1, a regmap currently only 256 bytes.
>>>>> regmap implentation can be changed to support 4k pages as well.
>>>>> That way, a bitmap can be generated to pass to regmap. But there is
>>>>> additional overhead of checking the offset.
>>>>> But yes, regmap can replace subpage, however, this change should be
>>>>> transparant without having to change the jailhouse_memory
>>>>> descriptions.
>>>>>
>>>>>> I wonder if we can
>>>>>> combine both, maybe expand the memory region to optionally refer to =
a
>>>>>> bitmap for finer-grained access control.
>>>>> Yes, that is also a good option, This will increas the size of cell
>>>>> config though.
>>>>
>>>> I don't think so, at least not noteworthy.
>>>>
>>>> One benefit of combining both would be benefiting from the more precis=
e
>>>> access size control features of the memory region. The regmap only
>>>> supports one register size, memory region all of them. Also, we may
>>>> save
>>>> quite a bit of registration and dispatching code in the hypervisor.
>>>>
>>>> How about something like this:
>>>>
>>>> /* when set, access_bitmap_base is used for subpages */
>>>> #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0 0x0200
>>>>
>>>> struct jailhouse_memory {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;
>>
>> Does the offset inside the page need to be the same for phys and virt?
>=20
> It should not: virt is where Jailhouse intercepts the guest accesses,
> phys is where it mapped the real device internally in order to execute
> those accesses. Practically, we don't exploit that feature so far, though=
.
>=20
>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 access_bitmap_base;
>>
>> We don't need access_bitmap_base.
>>
>> When we iterate over all memory regions, we know the pointer to the next
>> bitmap. Initially, the pointer points to the end of the config. That's
>> all information we need. Together with the size member of the current
>> region, we can simply online calculate the location of the next bitmap
>> and forward the pointer.
>=20
> Yes, we may be able to generate that pointer while parsing the config
> and store it in the runtime state of Jailhouse. But we want a pointer
> when we need to process an access.

Yes, simply store it while registering all areas.

>=20
>>
>> For the bitmap: Ideally, the first entry of the bitmap is non-zero,
>> otherwise phys_start would be off, right?
>=20
> I don't get this yet.

What I wanted to say is that we now have multiple ways of
representations of the same memory region. Ideally, we "normalise"
entries by some convention.

For example:

.flags         =3D MEM_BITMAP,
.virt_start    =3D 0x1000,
.size          =3D 0x0010,
.bitmap        =3D {0x00, 0x0f},

is logically equal to:

.flags         =3D MEM_BITMAP,
.virt_start    =3D 0x1008,
.size          =3D 0x0008,
.bitmap        =3D {0x0f},

is logically equal to:

.flags         =3D MEM_BITMAP,
.virt_start    =3D 0x100c,
.size          =3D 0x0004,
.bitmap        =3D {0x0f},

One convention could be, e.g.:
 - virtual addresses should be 8-byte aligned
 - the first entry of the bitmap must be non-zero

Rationale: We need one byte in the bitmap to represent 8 byte. If the
byte is non-zero, then the bitmap is compact.

>=20
>>
>>>> } __attribute__((packed));
>>>>
>>>> Then we would append access bitmaps to the config as needed, and each
>>>> access_bitmap_base would point into that data. The size of each bitmap
>>>> would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap mean=
s
>>>> access allowed. In theory, we would get away with just adding the
>>>> bitmap
>>>> test to mmio_handle_subpage.
>>
>> Ack. I like this idea.
>>
>> Bitmap size could also be aligned with the bit width of the target
>> architecture. But that's just a minor detail...
>>
>>> I like this as well.
>>> Right now I am calling paging_destroy to make sure that the MMIO handle=
r
>>> gets triggered.
>>> This can be avoided if the mem_region itself can be definesd it as
>>> bitmap.
>>>
>>> Ralf, what are your thoughts?
>>
>> We can easily extend this idea to allow for bit wise granularity:
>>
>> #define JAILHOUSE_MEM_ACCESS_BYTEMAP=C2=A0=C2=A0=C2=A0 0x0200
>> #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0=C2=A0 0x0400
>>
>> struct jailhouse_memory {
>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
>> } __attribute__((packed));
>>
>> The length of the bitmap is either (.size + 7) / 8 in case of
>> JAILHOUSE_MEM_ACCESS_BYTEMAP and .size in case of
>> JAILHOUSE_MEM_ACCESS_BITMAP.
>>
>=20
> That would be possible, true. Would we have a use case for BITMAP already=
?

At the moment -- no. I had one a few years ago :-)

Nevertheless, even if bit granularity isn't implemented right now, we
should keep in mind that we might want to implement it one day.

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
jailhouse-dev/a4621641-750c-f539-2e02-5eb60af843a1%40oth-regensburg.de.
