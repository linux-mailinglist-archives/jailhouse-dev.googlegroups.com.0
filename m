Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSX4SLXQKGQEW5PG74A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A610E660
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 08:33:31 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id q12sf20065044wrr.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 23:33:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575272010; cv=pass;
        d=google.com; s=arc-20160816;
        b=YSypgDQGv/FotS1fOo3GXv+MlDGuImf9HzIFK/RXRlpijGvjN7dzDSa68WgEGOWxs/
         PMDSbECUKOtYtOzhycu6TJB5HZQRlFFYsbMbJwxGf20ncHPn+TsnxvzwT7Jmk+0xZO4p
         KaF/FWz30z1PfdbOgfMNJSA7grN1L/18kbPL0XyXYfQ7/236q79CGl3xWhq4VC3HZTaL
         e6GwAbyXfYqKP+8EiY8vyTVFhxE4Ht8snlV1hVpXDay4aldD0KB1MuTVRT9D27pf/VTU
         dcmCw6Cj1NbsQWk4y8g0SanPOXQ/ebyjihfWFwOH8GcUO7eXjGhB3AkQdZriFxKRGQVT
         fAXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=D9so0lDSQAwzVAusdA8rcjMFmX0wKowXkQPNP7N8LKA=;
        b=QuqCTUXfW5e5xUePdkWr9bYo3NlrkPES2s0nmmXhGzDi7Yx0YD+E4f5H9mUVBAB8bT
         QFZ5AbkkOOZMcBrFZeg1Rl83vsS0lfT6cJ2yArRlLUlaiZhbQV/g61CbG6EPYFPs7mHz
         xL+c3w2KPwKdfTM90tHvr/FG4nIloqFwe9AdaLbKExw8pgVo8BacZ0hV4RNCJXEZJTGa
         5LQebIDVD0Mlum7Wj8QuUtxiJjP+5e2QFG/CTtGFLvjbqfrE/rp4lrJV9fKE1L2m7cmw
         C0uADVPLcHkmzNwcyYy0BiFT9BavAXhXFcAE82/byXA62mfhs7TmuU15djjErbNxoK7i
         rZwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D9so0lDSQAwzVAusdA8rcjMFmX0wKowXkQPNP7N8LKA=;
        b=bsyZdAhadSA2cIuOm87EyXpDW9Ue0PRMdmWMEvbKw1ZzB11bLLEZKinAkGieTK+WCH
         WazHM6PyjiCM2xfAkT4ntKgy7sl4Z+ku+VlPFE+ouWJXqOqGbe5dBg30Uef86azGpw1f
         ae/DDHkCgO92NEVJ/PCK7AgxbzJOY6SnT0kGa+Gi3B5Ik6FgijkKzIoFltw1nFXJtfT1
         xa6QTJrDDyRwIVMDjX22ni6oqN2p5auiuUrLHyFWzwMETSVqRtFeUz7DFCCVp/GFG/Cb
         rAL7OJS6RAC5c4mx+NjSZMhQHCPYDT5b3bcTw4rZfh0S9g8x/rXLyQ6ULUrK74ZmDHiY
         4hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D9so0lDSQAwzVAusdA8rcjMFmX0wKowXkQPNP7N8LKA=;
        b=EQrNNutnjmzLJZwQ4cGobZqO5f30QnAQO5QzgiJ24CNbY8vipZti7WK/uxoi6wYc70
         MZObO0cGRgWxVxoc7EFSw25yd4JrDZC/HcRB4zCiXLV1cFJfZEE0PYP4nSS9wmaEMOt6
         VBNpJx5k8i3UgqXA+88mTQgd0H8pAIEbH5z3s2uL47Q+C58l83Zo6KwYX8ZnYDUwHJoX
         SP9HUKghpcw8hKCj/sv2fllBEuzOXv2IMPmjWCtzB0TXY/ayq5Om/zA2qqpDd1rZorP0
         +zxF4J4QkwEEXTUChI9jtYQwjfj67nIw70p01vyfPfX/x3IJ+UnDsNoa97tEPdqa2QDU
         5PJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0OCuxbfI0jtyC7uhsIsT8Bu1ab1pG1KjrejqBksAzubM69M6s
	4X0prnB1pug1WPylp8X4yeU=
X-Google-Smtp-Source: APXvYqyokP3zuUBvHBZ1sKPg9KiIh2x/HcKA8j/OU7gQg+I0N7VrFzXH+eFHs+RZF1ix9KSUxhXUJw==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr25699441wmd.33.1575272010748;
        Sun, 01 Dec 2019 23:33:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e341:: with SMTP id n1ls1432968wrj.8.gmail; Sun, 01 Dec
 2019 23:33:30 -0800 (PST)
X-Received: by 2002:adf:db86:: with SMTP id u6mr70980800wri.318.1575272009992;
        Sun, 01 Dec 2019 23:33:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575272009; cv=none;
        d=google.com; s=arc-20160816;
        b=z98nmePxk9yNnTOY/G7Vy75PBTxpPnMPRy0HC5OTZSzNfEczgGYcpZo9CYjbR9teF+
         vbeeGFY7x063XIYwVSFi9xTJ767tuYVUh3ytFttOJMVft/KuAwnfks4Gk5ZBiRv0Z2qc
         CK5mMemCtDhMudGLRNjqA1X1h/CWxKgBR/GCXPacY8EBgdwt7ddFRkYolelVgBC/l0og
         AwWHnah1n+yfV7DIzTmuY6DIzqEruYUiHs10rgIBN+BHiWzIuuvIWcY1wcPCAAXS+sxv
         +rAl46Mt1W8EPAzBCwSHPDf5o0vGS1PYH3OXgjXNn2MC7oGead5BT0iQxB0IvQLguuDp
         kM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=H3QRfQrSgPyBUXDx12oKQLa8e9IF4lewm2EGdGsIsTg=;
        b=HBXE/a4fIn8xhT7pS8E7J3HTXh1iRuBKyoS8BIFDnqoSCzVcv+Tz3pJ6CRyEhNXHCg
         5l0tUtWGkVVgMMLoHvirnhU16iuY/Eld5XFKeuk8cIhpagpt7jSXgjDvqTDVNdsc0baV
         C+PEnK41ycEyVTvUWlATXw3pZ8FcAaXpxgUHBd7KloOQfsY9evy5JHfQXWP2RW6yntAS
         9F4oZraqdsVSHBT0vgLDZAXwopm0Ey44/ThExiA+1U9R/Wp47DMQxVQ+i1/WVOa7XRsk
         y3ILzl+XEPwTx4r9rxQztKzF8LBo7zN9j5LmjdsEMCBYf9Y7h6LbE8HJakgJVXpXyfJd
         27yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r11si1858109wrl.3.2019.12.01.23.33.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 23:33:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xB27XSA1025617
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2019 08:33:28 +0100
Received: from [167.87.6.91] ([167.87.6.91])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB27XQaa023066;
	Mon, 2 Dec 2019 08:33:27 +0100
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Peng Fan <peng.fan@nxp.com>, Marco Solieri <ms@xt3.it>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
        "tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
        "giulioc@xilinx.com" <giulioc@xilinx.com>,
        "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
        "fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
 <AM0PR04MB4481E19D836B1CA3925FC88388430@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dbfe8d28-c4e9-e7d4-1400-0868c61f89b2@siemens.com>
Date: Mon, 2 Dec 2019 08:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481E19D836B1CA3925FC88388430@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 02.12.19 08:24, Peng Fan wrote:
> Hi Jan,
>=20
>> -----Original Message-----
>> From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>> On Behalf Of Jan Kiszka
>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 14:27
>> To: Peng Fan <peng.fan@nxp.com>; Marco Solieri <ms@xt3.it>; Jailhouse
>> <jailhouse-dev@googlegroups.com>
>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
>> giulioc@xilinx.com; 'claudio@evidence.eu.com' <claudio@evidence.eu.com>;
>> fabio.federici@utrc.utc.com
>> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
>>
>> On 02.12.19 03:52, Peng Fan wrote:
>>> + jailhouse mailist.
>>>
>>>> -----Original Message-----
>>>> From: Peng Fan
>>>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
>>>> To: Marco Solieri <ms@xt3.it>
>>>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
>>>> giulioc@xilinx.com; claudio@evidence.eu.com;
>>>> fabio.federici@utrc.utc.com
>>>> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
>>>>
>>>>> Subject: [PATCH 0/8] Add cache coloring support for Arm
>>>>>
>>>>
>>>> I am reading the patchset, but this patchset could not resolve the
>>>> cache contention between root cell Linux and inmate cell, right? It
>>>> only address the cache contention inside the inmate cell, if I underst=
and
>> correctly.
>>>>
>>>> Is there any v2 plan to address the upper issue?
>>>>
>>>> To address root cell color issue, 1:1 mapping in root cell might not
>>>> work, because IPA/PA needs a remap, but this will waste PA space, if
>>>> inmate only need a small area PA space. Seems root/inmate cache
>>>> contention is hard to avoid.
>>
>> Coloring the root cell is indeed a tricky issue as I remarked back then =
as well. I
>> suspect the best way will be trying the approach that TI has a prototype=
 for:
>> start Jailhouse via a loader (could be a UEFI
>> executable) and boot the root cell Linux already colored after that -> n=
o DMA
>> in-flight problems.
>=20
> To SoCs that not have SMMU, coloring the root cell will incur DMA issue, =
such as
> CMA will not work. If root cell could not be colored, does it make sense =
to color
> inmate cell?

CMA is generally a problem, not only for the root cell without SMMU...

If you cannot color the root cell, you can only suspend it and move all=20
work over to non-root cells. Granted, this will waste even more resources.

>=20
> Does TI has public code for their work? I not find that in list. I recall=
ed
> that TI mostly want to start inmate cell as soon as possible not for cach=
e coloring.

Lokesh, Nikhil?

>=20
>>
>> What you cannot solve is the memory usage. That is inherent to coloring.
>> So, what we actually want is vendors like your employer finally implemen=
ting
>> cache partitioning in hardware. ;)
>=20
> That needs to purchase ARM's new hardware IP, such as ARMv8.3.

Yes...

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
jailhouse-dev/dbfe8d28-c4e9-e7d4-1400-0868c61f89b2%40siemens.com.
