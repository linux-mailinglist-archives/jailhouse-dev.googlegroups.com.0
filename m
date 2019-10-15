Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZGBS3WQKGQEIUXN7FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1728CD7362
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 12:35:17 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id r187sf897362wme.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 03:35:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571135716; cv=pass;
        d=google.com; s=arc-20160816;
        b=sjIKNRJCMMF84/QvZaEFSblfD2KXrR6ta7n+0or3nVDP+U6sdNj6ynjuEkiMus3osL
         uBWcTLaXBbLRHWBu/kgDnLGo8Qf3K3NWIXHr1IB0cnU+AB0N+lVXtpmPP0JkRVV1+f1l
         8iYQcokd5MjIB1GDg3dhX/GfpgeEUqlS02MySGlQFf2AH06ewBSQdQHZd0Xp+Gpnyapk
         nzbJFhlYIsIHfQwr+2FFLJgP+F6Fd5sRN8PSMCKZ8rzHTAZqK67OGpEqdwGue0KEepvR
         NDsLZWjYdCXVmvh8rpKdGDR8Auu1SYDNzQaznRCWmxl45eFfG937obYf71FZza7vANz6
         BY5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=WQGz2/aWUdQl/l3ij2ULTVw/vjAS8CPrMQpvQ8jZKs0=;
        b=zB/gLZ1VGIfbEaNC6yqTxkdVhdQrT7N4JiUA2hvp17Ws0DxfkDILnC2NNZ+qanP4YD
         KT4IcZvavdDdBjJV6HH53706d+xtL3pN+7QvdvKPdgAlSi8T16SiOoj+chlcpMxdTeN9
         YFYyd9UhykvVst8SgtbQFv/boy2YWc8ZB6zrPRn58VcgPJHMzrYotjK7jcBlEz1SMG6X
         dt4HnN2No3Qs7S1ykkcjXrnQCMQ9ik6s/aYPETIta0hiNF60olAXtba9Zu6bcL2FdNrc
         EsJ4tmqveKFJ8N6d3aR44O1fW7B3su6B18YF/mrL22pFtBOepffWCD/xh9BNwP44I31o
         s70w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WQGz2/aWUdQl/l3ij2ULTVw/vjAS8CPrMQpvQ8jZKs0=;
        b=NRonXPIocIxOq25XpDHQdsicmkpgxHy7fhswYZwQqRrjpMHdtDypHaxROL/35BC6Vc
         QN6qHvkdvky6fFuDARlyx7lmajbNKk6v7eEGMK1LEQHcSZs42DN/IhOLEWg3GLwJ6/Ut
         xQIEjd9ULKgatC0aEUDoSF/pOqSIT0ec7y0DGdcbiIGTcqC9gsna9rTro8KbwasgtYJX
         ucYEaVgEtnxqEWABF26hJBNioZuu8GgP83omo+i9Yd9wHWKYnNRMM1oQu2IwCRiqKW8B
         NseG/Pdxn13aRkU45Xsqw0Mi2gcgkfzYWJjoYGu6bN0gc+EZXAkNaHdIDNtJVQ0X2anS
         +ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WQGz2/aWUdQl/l3ij2ULTVw/vjAS8CPrMQpvQ8jZKs0=;
        b=kS/nh4TgMIsauEOFRyZ0ZixXapgI7WOFwrB6FWpq8LJUiSZ4kbrOyLUr5EvGWDHfR5
         2Pw9F6lMYtCa7+557MPA2LyIeX901G7W7+2WXjvUKzO/EdWoGxlaADnsqLnyMqboicAk
         Qsm3BP787Sc//kybRYzemeyoVXHY1IVvQJs0hoLEPpLEj2AdUUv1PbdfLaQ30iR7p38p
         GTz3MnyTR9w5M+otH5G0+jLPLLrZVpsbj44AxI2sm0XEnuvAEWXxTOwBsK5niE9FnyOT
         pcp7uTxViQFLNHXSFr+S+xkSso7QS5ntdoF/Lz7oyYL2Gcvm+Tkf6RsGcKtr6W3sG0fI
         e7BQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2xhodyTr3mAF1+Kp4B2+ng0wEvFD3xUxjJR1+2EnRmB27b5LJ
	/1v1LHRzmNjnfmWWc5HjY7w=
X-Google-Smtp-Source: APXvYqwj5FC0af1Pqwk6g0EKPU49RlnrAEWR94t2lIhnh4j2T3vmlpHLewo6u+6BgTsu3m6E6f4i+g==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr31035830wrw.182.1571135716746;
        Tue, 15 Oct 2019 03:35:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:690e:: with SMTP id t14ls669505wru.2.gmail; Tue, 15 Oct
 2019 03:35:16 -0700 (PDT)
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr16681679wrr.365.1571135716166;
        Tue, 15 Oct 2019 03:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571135716; cv=none;
        d=google.com; s=arc-20160816;
        b=JGj3DqL8K+mTnLQIpnJNl+ctDVJ8jLYJHfu0LUYkE8oT9wcqpAKwwiGO1fMA4W+d6a
         tDI4PrkrK1VffGZk1TdlN7UlWIuA+AeqLoiArr4JbsbW5cB/l1V8NWvRi1M8ny5NQo3a
         1Ox3PR5dtaEBQdlNrFSZ8S/buohqFplwzEJxiGWaspdaWR9SEscpPmUc3nV0bwt6wJaV
         Sj65xzoyiQp7zXoGGs7sawLNQmmg5+vL6I0lqB1gX33inNczdnT9YfO8krXAEjG4kszu
         O95ZNbBDAxYgJzgewHofgKNnrGZPg82zbsRLqDvjy+vcvNdwyaHU/JI6OmGtxUvidwtC
         eh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=IK/JHNeQgk313PoJslCVvpApBL1zxZDOQs0I/aAh7w8=;
        b=TbtrV3ri35oRBiiI4BbABbnG/BzOvqNIiNf4xrDwg3UutTFLlK7sW2S0m85zIVfN1Z
         E+9gwFlIp11Yf0gZqGialOtm/pKxEzrJc0MGqgAnIMnWXi0cSETHdYjULTxyZi3OX/O9
         hMShsP4BuBj8rbu0Pdu2x6M4TQvgWYOV61n4cKmxRkQk7hPaWTQ7qGapmfQxTtW67B1h
         paYJXH047GzVBb7ubbp9rUEua0uWijNF40ZKAkAmI14UbmIGHvR545bb9xeGXZKVfEkI
         EBOLAxBHkxmy7cOSsT63b8WsGHjBnJ7uolSee2DSrHqejKuessOOGIi2bu0BwQfm0m4m
         /cMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n16si1348464wrs.4.2019.10.15.03.35.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x9FAZFIa019706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2019 12:35:15 +0200
Received: from [167.87.8.191] ([167.87.8.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9FAZE0p018673;
	Tue, 15 Oct 2019 12:35:15 +0200
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
 <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
 <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
 <1D8490BB-5C2F-49C5-82FD-9623433A2DEC@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f47b63d3-5ccd-d993-3670-b41bd9b722cb@siemens.com>
Date: Tue, 15 Oct 2019 12:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1D8490BB-5C2F-49C5-82FD-9623433A2DEC@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 15.10.19 11:46, Oliver Schwartz wrote:
>=20
>=20
>> On 12 Oct 2019, at 11:41, Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 11.10.19 20:23, Oliver Schwartz wrote:
>>>
>>>
>>>> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>>>>
>>>> On 11.10.19 15:30, Oliver Schwartz wrote:
>>>>> This patch adds the SMC SiP IDs that are used by Petalinux to the roo=
t cell
>>>>> of zynqmp-zcu102.c. The SiP calls are:
>>>>> 0x0f: PM_SET_REQUIREMENT
>>>>> 0x24: PM_CLOCK_ENABLE
>>>>> 0x25: PM_CLOCK_DISABLE
>>>>
>>>> I suspect that this punches pretty large holes into the isolation. Don=
't we rather need filtering on /which/ clocks a guest is allowed to control=
? Rather than allowing to power /all/ clocks or none?
>>>
>>> Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99s =
only the root cell that is allowed to issue SMC calls. I agree that securit=
y-wise it=E2=80=99s more desirable to also filter by clock IDs. On the othe=
r hand it makes the configuration considerably more difficult, because you =
need to synchronize devices in DTS and jailhouse configuration.
>>>
>>> So you=E2=80=99d make both the call ID and the clock ID a configuration=
 parameter?
>>
>> We possibly need two things here:
>>
>> 1. ZynqMP-specific filtering of PM_CLOCK_* firmware calls on clock-level
>> 2. ZynqMP-specific forwarding or emulation of PM_SET_REQUIREMENT
>>   firmware call
>=20
> I=E2=80=99m not sure what part of PM_SET_REQUIREMENT can / should be emul=
ated. Do you have something specific in mind?

I have no idea yet what that thing does. Do you have a reference to some
API documentation?

>=20
>> There is no point in generic per-ID SMC call filtering. We will likely
>> only be able to moderate few of those calls with a binary filter. As in
>> case of the clock calls, we will have to take their parameters into
>> account, i.e. interpret them. You pointed out the Xen approach for this
>> SoC, and that is pointing out what is needed. If not more.
>=20
> For what it=E2=80=99s worth, the current Xen implementation doesn=E2=80=
=99t do any parameter inspection - it may intend to do so in the future, bu=
t currently all filtering is reduced to checking for the hardware domain (w=
hich is Dom0, the root cell in Xen speak). As a result, Dom0 is allowed to =
do most SMC calls for any device, whereas all other virtual machines can=E2=
=80=99t do SMC calls - see the implementation of domain_has_node_access() a=
nd domain_has_reset_access() in [1].

Ugh, missed that in all those switch-cases.

Well, same question then: Where is this interface documented?

Jan

>=20
> Regards,
>=20
> Oliver
>=20
> [1]: https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xil=
inx-zynqmp-eemi.c
>=20
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f47b63d3-5ccd-d993-3670-b41bd9b722cb%40siemens.com.
