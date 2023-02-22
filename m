Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTXI3CPQMGQEKPZRZLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AE69F7B5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Feb 2023 16:27:11 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id en10-20020a056402528a00b004acbf564d75sf10478969edb.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Feb 2023 07:27:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677079631; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pl4bUOLDtDrpFYTt39DklNIPemgfmVOkbhDp8Fgz/rPRNX2oKLirx9U1XEFrKwtw2X
         /Z+EHDvxXyIrekhSNyEIA+HSASM9hC69C6qwGDydW9TJs1HQnGmOMYdUXySyYz6tUDnf
         X0m93p2SN8RpoNeCtQ/g2z88m24sAJMAqpFkes7o1Nr9XEJlw7KJLDjNno9Hgp7na1mQ
         evzpZO2EpU3+ylReX7LhOIBNyqLSzXe77FrjNB47teZ3SCVBgeJVRtGy8/pW2YKUtc5X
         v3hUVabn0uBlX5JZpEQFihax0wirxnDVQ/8X9lSg+lzdE+TJpao6yjJd6yuuyYUWGyJa
         WquA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=zRVb9zhj/dAAaCq5mF7n4vJvzOYkBHmcH5Y9ryWCr9c=;
        b=qklvko/hgDSN3exFhWeEVSvK60GcgoBHOX2v7kyTxxWzToUEHYGjLnPfO0OZfGlPAz
         uPEWJj9t476GvvO9ZtkTIWd/zrixAMI5T9NqgHWMyQR5EYx7IRUyMk5wWVs2Of2xXP8E
         Cr/x6FXVKHagp/JIoeOX/8jD6IAhbVPlqsqdmj03/QidY0Bth2HK7lKL/+uhFfw197UB
         Naw+3LZx7pTaYYKw955u97MbHEJVHaOG49Z0Exgg9ZMqqmZARgPhal4G1Yn/MT1wYOEJ
         0u8CjL73orPQhznOuzenHa3iRZ+Xhmtf6lKOhTduy5DXqdILQy39WNcpnRDTw92zP2xF
         VgFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZXKmKiQf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zRVb9zhj/dAAaCq5mF7n4vJvzOYkBHmcH5Y9ryWCr9c=;
        b=emzpd6xDcWlm833e5MCmyetbfTSX6tT+WlYQJeGXJmxBw0jMGPHm2w3KyWDYz+bTPg
         jx2RaT7wY+zFbSivILFdw4375nbZSfFGxQzI9EVVQKccT9sPu6YxvtvXfK9Xz+MNH5dd
         R2iURkbA5OPo5rZdkQT2dbtR2hgOOvU1ioAOD7SS7zh/NS/quhd7sCmz3RfWpLDmJDsa
         JhyNT3atumcZaAF5+QNMHmEvzDnuazjOxdn7x3JDvOM5vnW6hBdV7z3hSfY4R10nzEt0
         hjpB6AIrA0xzoKjU/N6O1bTs1Lw0XDppxbWb/6HWReFx3GF5g3s/Ceiit+osr9IF1rkt
         QUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRVb9zhj/dAAaCq5mF7n4vJvzOYkBHmcH5Y9ryWCr9c=;
        b=cEfr0NzbP7FXHd03z20XZew4evBEdMVvqAcnlixuv0fwW4EtJfvhpipS0dHU96AItm
         nhykf3e02gGAOTgl31nJPXiuSCxJxoMn8ceP2UglkKZ66gy3NZeLljI50rxucsjrluE5
         TBQGmyoC0o+pqVIJZ+D18v+h5GoXnzTDMLWpH3MyuCaydzhKTJQCOld1pLZBrvBB127r
         o8T7EpDn7HYqo5tnoczihoajcReSd92uedEaljjfEkgaV3W616swKkuVZrwUDUnzf/xV
         DgBYA02cPartfQlrwh4GJfblMM5OJkqYwLbUeRz8K6pyXEfUX9QyGH1DPaGfcJZc83fy
         uC9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXKsFzKHtbfcm4xTDSGdAxGx2ezjhGOhHGKOqxSklg8UbqRvRn/
	osGPSudNZAe5d82PljJCE5g=
X-Google-Smtp-Source: AK7set/BpI2kGutwvgiQxRiMW0kq+mflb64wCWlnIuhXCSHrL5XzIQwqjm663mfHCtYBukf9ykieEA==
X-Received: by 2002:a17:907:3a44:b0:8cb:56f3:95b2 with SMTP id fc4-20020a1709073a4400b008cb56f395b2mr5405532ejc.9.1677079630581;
        Wed, 22 Feb 2023 07:27:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4305:b0:4ad:73cb:b525 with SMTP id
 m5-20020a056402430500b004ad73cbb525ls7926124edc.3.-pod-prod-gmail; Wed, 22
 Feb 2023 07:27:08 -0800 (PST)
X-Received: by 2002:a05:6402:2055:b0:4ad:7c7c:a70d with SMTP id bc21-20020a056402205500b004ad7c7ca70dmr8995168edb.19.1677079628656;
        Wed, 22 Feb 2023 07:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677079628; cv=none;
        d=google.com; s=arc-20160816;
        b=yWV04LA8DVijWnlX+9h0okty0tEhLxJO+j3PKUIn9+cNVLImGhRvCSm2yZxmDYPXPO
         VNvqxBcdMExH7cupsaVYcIN6NQwzFOZQzVzKbS2cYdGvZVCX692Zvb8xvYPcPxK0sxrl
         0+XTIvGivdKeXNLBcfeyQfa7Wdn4D60nqJcACo2ZUbo2xdlTuToPo84ESq6wgJii16ve
         yccqAkkIDpwa7q9RbJpg+WPnO7ThO7tlImB8BNP/WHP5eHDK49KIiPNtTTphQ1OBpYTF
         +HtS8VNJGdg7Ix/Gohx0H7BBDshIGAOsFqBRl3LUhf3NsHkomqGXkJqjiEPbhXoC+v+f
         ljvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rZvX+iMsS8mqSfIVFwivhtSoRmmcBKr/i7gJyWgDk/E=;
        b=IdcRYddZfs51hWg3amyD9v0XYngOaNTGMnGXwktl8Y/jVCW5+2gCVWDFKMjAk9qUAQ
         aByJ7c8kRz988giMLqW/Hu7eP3Vy0yQUBEcrNs1bpYiEZmTollSJpfZf9F2Lqiheg/3b
         59FTas9UOtpP93/Ph2hKF8e9TrdEnMN18vt8odnd2sigAYZjyXxFl+x1ehnBpUwmagNg
         KHAmKLWpivzSua6pRG/Qa2riLr5f8QS98H3yYlVN5QuyxZp5GB5VAI0rvfRozANoZRRa
         g/+2dwR3fZzgvYaxf+9a8HrGzoYAcmNP3H9Ue6mixXCY9Bz9UEuXDgYleDr3eVUqpSBU
         kkNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZXKmKiQf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id j10-20020a05640211ca00b004aee5c48387si195494edw.3.2023.02.22.07.27.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4PMKlJ1QTQzxsj;
	Wed, 22 Feb 2023 16:27:08 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 22 Feb
 2023 16:27:07 +0100
Message-ID: <c7248484-26a9-b284-ad20-3ed41eacdc7e@oth-regensburg.de>
Date: Wed, 22 Feb 2023 16:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Root cell "loses" the IP on the virtual network interface
Content-Language: en-US
To: Yelena Konyukh <ykonyukh@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZXKmKiQf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Yelena,

On 21/02/2023 18:23, Yelena Konyukh wrote:
>=20
> Hi All,
>=20
> I would be very grateful for any comments on the following issue:
>=20
> I run Jailhouse on an arm64 platform with Xilinx kernel. I use=20
> ivshmem-net driver and the relevant cells and .DTBs configurations to=20
> support a virtual network interface in my root cell and my non-root=20
> Linux cell.
>=20
> Generally speaking, everything works quite well - the virtual network=20
> interfaces communicate with each other and, once I have setup my root=20
> cell, which also has a physical network interface, to act as a router=20
> for my non-root Linux, my non-root cell has access to the external networ=
k.
>=20
> However, I noticed that sometimes the IP which I setup on the root=20
> cell's virtual interface gets "lost". That is=C2=A0 - I assign an IP with=
=20
> ifconfig to the virtual NIC and after a period of time (sometimes it=20
> takes > 1 minute) the IP is no longer there. I keep re-setting the IP=20
> and eventually it "sticks"...
> At some point I thought it is setting the IP on the root's NIC after
> netif_carrier_on() is invoked for the root's NIC that makes the IP=20
> "stick", but it now looks like it is not the case and I no longer have=20
> any clue as to what causes the IP "stick".

Uhm, what distribution do you use for your root-cell?

Unless the NIC state doesn't change over time (which could explain the=20
loss of the IP) it sounds to me like there is some Network Configuration=20
Application that grabs the interface as soon as it exists and tries to=20
reconfigure it. Then it maybe tries to DHCP on the interface and the IP=20
is lost. Something like NetworkManager, systemd-networkd, =E2=80=A6 Is ther=
e any=20
of those applications running in your root cell?

   Ralf

>=20
> Has anyone seen anything similar?
> Any comments would be very much appreciated.
>=20
> Thank you
>=20
> Best Regards,
>=20
> Yelena
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c7248484-26a9-b284-ad20-3ed41eacdc7e%40oth-regensburg.de.
