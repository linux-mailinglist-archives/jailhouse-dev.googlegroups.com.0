Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBH47ZTYAKGQEWLVOVPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3A1310BD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 11:44:48 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id d8sf20456514wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 02:44:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578307487; cv=pass;
        d=google.com; s=arc-20160816;
        b=VvtyQallLJiK9/I5dfYy8HL2zHelVQMtgjpK/MsdZbKHAlW0QD0+y0tl9L104vis7l
         5HBmBD1wVNS3RHagkk8T9J5wHGRbieIE/UDww/bkmaTHYZnfiKHiHRZumlScy8FVurAj
         r/4aVz16MhhTQWBvU6UmIvNwWx+yLiDj3tzEk4NawdSLbtbQxC0Zq2licU1lPCpv4zib
         7gSsnGrgHPFL4hR6Gf6vC+DJe3v38zvwTd0M+g7WQRqxkeOzXEG5pfThvYvMU+ALnzY5
         h24zbUuj9ZwwwOQELHyhM3h+B8ZU8DQ5qz9f9Kyb00elIL0mX9/sHRI2XvB8MxiicaQ7
         bEYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=PbuzVgNtfhOz63lw2HLajgMmSjVqlasKl8v/Mm1RZzE=;
        b=fU2PRSOzGkq9sMKC581Cb/isKve94SsHyg13eG69zCMgJ6YDp4MDMteS5jSh4IFOkW
         XOe7EKedRnT1GzSOPLhn4fFjCGbkydzy9v3a/kTO7R1qe49WQQtevgdkiq2577LVEcLc
         4Yt7eaDtmt12FD+CFuV9755h+IQDbYFYRsD9B+7d4+FxvBhXwsypb9vU0z2eTJcH5yJ5
         WpHeKqHna5o0SA2y7WuBrYGYBwZZwwdq/W52m0xZ+IOGp26dDQd2TuFsCMPfwNO2ebEq
         8dSm1TyxGyYVQZD64Qr5LKaWbruYMnrZYbWeCn487p7pLh8ysP7BrKQl6CpDu1NoLETO
         BfdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gCq1nlr3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbuzVgNtfhOz63lw2HLajgMmSjVqlasKl8v/Mm1RZzE=;
        b=DHWixkfHv/7yqcAc0FqPf00VeHifxwz0F5mtJ/jL0v2hqIfRhnsHkNwlrMEvBgsL/e
         2IFZmpSDIbmroX6A05aBf/M7O+4tSCMg0d9nU7yq40SUAHoao7Xg9948M/Dfc+ellm4Q
         AXQqyMlcJiBZhcl96WhUrYG9+5Z1akQ6Ua08LwZarfHX6KoImgqb6kozNWFqsBDcqkfv
         wCenPHVW25dZ6FkV3IbKSosdgyRGrZKdntS/GsV5InZSaOTnfuZ9SF4m6xETemXWhVjX
         C1XEXeQ8g3qFdY2zeUs7dS3k/O6T3JnXj5DUxxtLIWxUsX/HXSu/jPRUfS2+bHmeTnVB
         9FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbuzVgNtfhOz63lw2HLajgMmSjVqlasKl8v/Mm1RZzE=;
        b=W7VOMMxpObZPU/YGwsnEHZi/BgWYf1JFbSpLAP4BPuP2wgaCCfxdgSnCXegjavw4cY
         pBp6hgUtAKL9zstiX4YVpzSREDEGZY2dmtKf6/kyff9tzh42HzfCI5/7bH/hXl6iffyF
         DMKm9mqVz603kTJoyPY1SpphIfupyhJl5ljFX+mVrpoeHib4AFgK1fn66ISTKx6NY1BR
         /sr7BDhti3qj8mawoP8KmJ8rNl6sTbcUC7lZPk1e+vjWYnTy1mDMtbUfep/fhfEx9h6T
         zVfD476JfesiDXuxBWd651uVwtQPVqqZVVnhkeeY8xcTqPOASKBGu6O9/1aQ7dsTv6Y5
         gx0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXiLxqQeSVooxX0lQEiMRSZADhAUu0+qWk7pqGeggxJANo3d9Xy
	PtHVdgzRQms+VDJCJ2qXh40=
X-Google-Smtp-Source: APXvYqy6/RlL0UTu5ZXFE9adLZsMq0w1cOGvdVdal9hp5RAAiVZwUB+kzsp11xAV/QP2zottYqdAGA==
X-Received: by 2002:a05:600c:294:: with SMTP id 20mr33342152wmk.97.1578307487650;
        Mon, 06 Jan 2020 02:44:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c76b:: with SMTP id x11ls5173563wmk.3.gmail; Mon, 06 Jan
 2020 02:44:47 -0800 (PST)
X-Received: by 2002:a05:600c:2301:: with SMTP id 1mr35361091wmo.147.1578307487070;
        Mon, 06 Jan 2020 02:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578307487; cv=none;
        d=google.com; s=arc-20160816;
        b=pnhAmSPP+u4R1Yc01qWBBBy8PG7utCUr/eBaO9+X1y8zJNJ/D6CO/Fvd6GXG8uCPsn
         S7XEZPx8yte4Ua1j8AgNPGO1utfvbqKikDlQhq7/aLJlhp1kGqJEOzy3r9RPXP4IqNiQ
         2tcr66GJDRvxKg3bhhRdWezxhEoiO2nsH7x9PtrkLwt/J4bhoN0qlUbfMahQ+HJH4Des
         LMKIqqrs6pFWT0xozXh+qkinwIrArYfgKTuCdT5nioE0C30CmGXHX0maN63X8mIxC0dm
         MsvGZ+M/WPbuNl6oqxzXcJnE9nvWAWm/zAGrz/+2BP67msilx39Gn7XGPfuCpLma0Pat
         cnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=kZ3VKLqdePr/6pau6g9lwKUxQYOGbAlQrsD0kViNse4=;
        b=U1kEwfaME979LSuwEld47OiNH+EOi0R8Tt2KZ9kCMif8X3Rv+zxmfm3zxOSnxSLANK
         d0BQhK/xRLAIECuXv+xlJ3leI5LZYllK7ZzwR6bSRSMtY3t/lYVQ0S7lSiesibvSCLDg
         E5LMQJTfv+WopHyu6XQj0Q0ZnriviGr6q8oaZe5ImWX8rT+7WmJnMQ7fy74hyUztF2bX
         xdTqAlRWgL5ZR+nLfQuHHll5w6Tj2xR5coJUxccSMUe1QGAD9xwpaXlZSDvtBVgNcvmr
         hXj30STjvrW3y+ko9N40/2Ai+g9x0cHEjqXsVjkcw8fkVIQnwkFMYeNM7++xi5vsBb+e
         fBxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gCq1nlr3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id o139si830092wme.1.2020.01.06.02.44.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 02:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M3T5g-1jfQ2I1gPI-00qx1r; Mon, 06
 Jan 2020 11:44:46 +0100
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
 <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
Date: Mon, 6 Jan 2020 11:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xwd1+HvWCWneiQEGza75FR4pd+P/dFLUM29zSQuDcQfGKrJIe9q
 MB9hq8VLFuE0iPYaz7vlII9AXmXBv4R8crWkVhBZwyQA1wO/lZBRulrfN+kuMYkVfTKiwEC
 HtILW+N3AvnEyq4h3poa3YAPn77StaGkHpx6MPsMTKpCvShiKlT5jmZxLCIT6WsqfRyuxOa
 RyjaxJcRAbQaC8kaTKADQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JWwhdDUzsnA=:L+Yw84bpC3HSsx7LCTMszd
 NRmkzS4iWP8FOf8Pj/s54zF5JIPJpadrP4azPyHLobusnF77hVgpiDgtnrPbifXc0kBH2b+RI
 NVjaXgN8y/N7WTKAPU6DLB1n5zVNSzVxiGm/FLgPX7i+xnbc5NqV2D2/5auOMcR5lVHjKwazq
 4wlkvPnzbUaSt3SMY1mpFg/lMyJZCqQuXaEvsnsyarJg6OBrkgT9M1igZeoQmlYE/O8H3emaR
 hE87YsdydRHFteexDLc/+uHDzEUd4hz7uE+4WeID0BL7iBZ8+7knvs8MAGDs0MTj8iH2wUefs
 pHDX6/JFovLZEBLG4baCjmaGuK5au5P+p4Cq2krCwQ0nCJ10tN3W2YF2MI/kjTlhe2bvX4mZO
 QCws2LX6Vx1MmMtv66lg+ZsnxGJXGaCTI9q5bGILwPR/sicgjWak6waosFa/vrc73+BD48dbd
 PRZSkKqAw0MFXPfmzjmiqm1pMxaPc3EurmOyNhAsH6FBAU86I5whkf3tAH7mILjfW3yHv9Qgy
 edP5uHnplW+rB05G2DsCVAPk+JUtWIFnThoDCnRnxTLH+2NXBwGe9sTmt1L/Dotl9iihe/z+T
 i7yoFH/OunPTDKCtuNwpWzRJsY0smMACDF+SQetV7LIItdyiFK4bdk6sW/5AVVsHXi527Zqed
 19ZidzPqEB5BpuatUd8JOH4oFo8Ix+zGuag8FFeWNVhgCOFMHQ788tsAPYdpubgGO+0aEoNyD
 DruCRiD6uATxawej0qYMUKZdlgKkcUKNcgSDME5BN2X5vFuiAO4LlZTowdxmINEGXq/EK8Qqa
 /m2qYXtqg5izk+f/eoC4vZQiO3xrkH9E7H+Tq77mPQMOVQsro60qQeeNR82KJjhFQnrxO/0XO
 rqB84ZJ4lGl3XFGMDGev7Xij3NxPDoKzwKerwDhmz4BUV3GxO3B61QqZ2K2Fua/XuBX+QqQpb
 vWhjV+C4RRCyR3IzeXIpLfp3r5RiV+Ou1fmzWf1IP+0cA2a5shqf4gOIc4HdR4GOF080S22qn
 ci3EqHqLei5e6ZtvFbG3RFTmaPVKjG+wDgjjdr1rEDooMY4Xdvq2JpqzPZlABmmmjAzG+vrHv
 HYLXN0deJC8Dg/Dwx6xm73U1AiKD6F4x2PGPZF/mqF9fqbgTZORP2LGzS1f3oxbh8CE4i1SLS
 b5ZgjZamud/wMR1uqnmW+xApo8GlFQ8kVHEdHz4vLx668B+0oQ9A/DcBxe1LiTDBTjp+59JQG
 7PhETi0ASfIjyjf8ndtGhwUHgWMc1AeqZdMbsenux3neh4aadc1oyZd0ggtY=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=gCq1nlr3;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 06.01.20 11:10, Nikhil Devshatwar wrote:
>
>
> On 06/01/20 2:52 pm, Jan Kiszka wrote:
>> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>>
>>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>>> notice, no? And will root cell devices keep access to inmate memory
>>>> that
>>>> is carved out during cell creation?
>>>>
>>>> Is that a hardware limitation?
>>>>
>>>> Looks like a blocker...
>>> Yes, this is a hardware limitation. I it designed for static
>>> partitioning.
>>
>> IOW, we can also not change the configuration by destroying and
>> recreating non-root cells with different memory layouts?
>>
>
> For now, we have gic-demo, uart-demo and linux-demo
> You can interchangeably create/destroy cells in any order.

I was rather referring to

1. create linux-demo with, say, 256 MB DMA-capable RAM
2. destroy linux-demo
3. edit config to use 128 MB only
4. create linux-demo with reduced RAM

>
>>> Although, I made sure to not break memory isolatio with the following
>>> workaround:
>>>
>>> When booting a root cell for Jailhouse, you would typically carveout
>>> memory for the
>>> inmate cell. I have defined the cell configs such that, in the root cel=
l
>>> config, RAM region for inmate is
>>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>>
>>> When creating cell, root cell maps the inmate RAM loadable region, here
>>> that memory is not
>>> mapped in IO space.
>>> ---> Limitation of this is that you cannot DMA copy the images in the
>>> loadable sections,
>>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>>
>>> When destroying the cell, Jailhouse should map the memory back to the
>>> root cell.
>>> Here, again, the inmate RAM region gets ignored in IO mapping because o=
f
>>> lacking flag MEM_DMA
>>>
>>> cell_create=C2=A0 and cell_destroy work in regression, tested successfu=
lly.
>>>
>>
>> Please add at least a test to the unmap function that warns when a
>> config is violating the hardware constraints. It's still not clear to
>> me, though, how well that goes with changing inmate cell configs.
>>
> Let me explain via the code
>
> root cell config for j721e-evm:
>
> 1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D=
 0x80000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D=
 0x80000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x800=
00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
> 2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D=
 0x880000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D=
 0x880000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1fa=
00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
> 3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem and =
baremetal apps */ {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D=
 0x89fe00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D=
 0x89fe00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x200=
000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
> 4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */ {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D=
 0x8a0000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D=
 0x8a0000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x600=
00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>
> Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2 gets
> mapped in PVU
>
> inmate cell config for j721e-evm-linux-demo:
>
> 5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D=
 0x8a0000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D=
 0x8a0000000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x600=
00000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>
>
> * When enabling jailhouse:
>  =C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5) should =
be mapped in
> CPU MMU and PVU
>  =C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. root cell =
kernel
> continues without any trouble
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memory is re=
served, no driver attempts DMA to
> that region, no faults seen
>
> * When creating inmate cell:
>  =C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU should be rem=
oved from root
> cell stream ID and to be added in the inmate cell stream ID
>  =C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because nothing w=
as ever mapped
>
> * When loading images (SET_LOADABLE):
>  =C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be mapped in =
the PVU map
> for root cell streamID
>  =C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips this chu=
nk and never
> maps to root cell
>  =C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell view of i=
nmate loadable
> memory, there will be faults
>  =C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU copy th=
e images)
> Correct me if I am wrong here
>
> * When starting cell
>  =C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed from roo=
t cell and
> added to inmate cell
>  =C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
>  =C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2nd time d=
oes nothing if
> the pvu_tlb_is_enabled returns true
>
> Nowhere, PVU unit reprograms the memory map to add or remove entires.
> Because it doesn't have to do.

I'm asking for a check in pvu_iommu_unmap_memory that the passed memory
region does not have JAILHOUSE_MEM_DMA set. When that is the case,
something went wrong because the request cannot be fulfilled on the PVU.

However, I'm afraid that test will trigger on non-root cell destruction
when that cell contained DMA-capable memory. That would mean any device
that this cell owned and that is DMA-capable could continue to write the
cell memory, possibly competing with the root cell loading new content
into it. This gets rather nasty because now you need to prevent such
writes be resetting all devices reliably. But Jailhouse can only do that
for PCI devices (removing the master bit), not for random platform devices.

Jan

>
> Sure, there are some limitations of this appoach:
> * DMA copy of boot images not supported
> * Root cell memory map should be split to mark all inmate used RAM
> regions without MEM_DMA flag.
>
> Regards,
> Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f332e7d-f2b7-91fd-375a-5dc019a94e7e%40web.de.
