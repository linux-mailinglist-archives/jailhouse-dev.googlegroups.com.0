Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB66MYX6AKGQEKWD36UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D7295D19
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 13:01:16 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id t8sf234314lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 04:01:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603364476; cv=pass;
        d=google.com; s=arc-20160816;
        b=qT6E+neDakhdWDiF2K1LQ+9ZWuNPXobJNz9iw5FxdYYGQh1wETz+0sMPMn9Tb2dPDd
         Mt4QmAG1WxhCtLSruBxh6YIEgL7aGCnYN8n/I18xI6bssxkA43YeycADcJb+zuJCtYzg
         /h16+wqQgYjQknSFyde+AMmc5qCMjFFGC778V/vXEVzHcGXMOhjG5/PqhQf9dPeOU+7r
         6/4OyDFMaD8sk8HKCk4U+hVBvqXqpPnhGIZQCkN6dqKUqZZMYtN4lMdNVqZZ18y1vOrS
         MzpWTontYyRby3pfk9CcjnA+iZC74lv+5AspOOwVlMtk2u2uHRSZoga2OrdGNlPzujA3
         8jtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=j8el6j0q2Cy4PMSk+hYS1wqZNqNporxQwRGWDXQbzwU=;
        b=hlH72YviDWoEsCPtWlelFuwLr4SELjCPGnlBzNNYWcphmla8vwooub3sFjuW/+iJoH
         Jw7qSaJ+iMJ9v45I6G1TmLCwZ9oCZ0gcmMsc+zazYAiO5lX3NBw8Ejki+Kjn6E14tQVR
         fp4PGVjbmCsfDwKWNj9GPqo+U8cfnZ1h4CvFp4sLvwNxvgbH+4i89LPU5kKq4HMziAOk
         93CWr2mOlRVIOfQO6utXSH78EyPj428v8PYMJ4rnSSefVD0Jkzpis5IdLQ3+4n7qYihH
         vKlOaUXFdGRbiAPy/z7mhs2/GA9enchudIXLT6UMnVrBJgswof/byJO561hbWJr1Lk9b
         v8kQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OP8EE9zb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j8el6j0q2Cy4PMSk+hYS1wqZNqNporxQwRGWDXQbzwU=;
        b=epclZgAbu1/hF9CEMJJTu//37dlQSJJIdoGife6SxllR+vzwg1hsYbtZpkVfYc3go8
         fGEw725B02WOvOJkT63WAd4P/SOm2GKOhfQxjh7vwfrK07aIxy12G701YYO5d5Hjh0VK
         +RM+krtgJl/JvgXNHiTwcEurJBAVHPT087tTM10eEexqFoIhgkVCfUDzh45JXwtaG9Qr
         RB5YBbXYld17dLpm/3C/NYuKkCObuQ6rlhgIxsM0td3IxR6UbQOGIwEh6PGEvvV72ohu
         31YKSQtU0dtldMqOK7NnDAAV8ZFgrBzbpzo7hVyRnY9CpuZIWZWi4eMb5rqtgUPQ7veC
         uPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j8el6j0q2Cy4PMSk+hYS1wqZNqNporxQwRGWDXQbzwU=;
        b=oFbnMS2iKw6swWsd3lnjNn6UIlMoYTqCoGQDqw74fIHSFJdYe/PraqXBHqfGmu5cl7
         aZvMlXle2I5845d+neFMApbqVNQTCPJe4malGMo/aoc5MoBjmlYdqnxBD271Izf350Oa
         xS9My2xE5dVh5ZrVRcTsWlaNmRh2KSFa+hlxhxf+RO7jMLPH21h7gYbjYpNBKs4wT1z7
         /6+jEo8oWKhQDLcbUGIbJvQ0ENsk0W1cI6bofDEDXkknbqMt0qR1pKoZQbQb3/81F8tC
         gMfHeXy15gZznGU0v7sKsxV9gPPWEYmsL06m9Ym31oqK+MjX6qOHeGSOluGnxEmz8szZ
         WdmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dRvLNbooruUIAJnzGWEskK79U3w+jXg7bPMTpBOI+HOZcdcy3
	dlKEbZVYpa7xHfES79aTUjY=
X-Google-Smtp-Source: ABdhPJxyoL6wjm7q2ie2wz6z+fjlzLJnuzKVRa95LQz/rmZv3GQX6ANrbq+Tw1nQr9GQh/RQZpsNCg==
X-Received: by 2002:ac2:46f3:: with SMTP id q19mr723479lfo.271.1603364475893;
        Thu, 22 Oct 2020 04:01:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls928339lff.0.gmail; Thu, 22 Oct
 2020 04:01:14 -0700 (PDT)
X-Received: by 2002:a05:6512:504:: with SMTP id o4mr729517lfb.450.1603364474700;
        Thu, 22 Oct 2020 04:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603364474; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9WdmJcEzcyHOdZYIv0Yl0xeQnCR+mVfju9NJSjDIgx5soMZEqwGyESsj/YC9F5nWF
         XXcn4RO4VrSEaUnsA7gfi1CD7Iiy9oXhwIuMuaznSKGyVnTTVxiL43p75CjKwtrtqhgn
         k4kI3N8F2G/3mw+BwC80I7FN+TZcMguHCNdDK246GDKFFonSup+QPvdu4FzeOuBXu8Za
         TE2C9sVRJltDiAQ1zqVDjGN83hAhOMWL0R07NWXP0gALnDD6MQzP6N5xHYVx+GFj0AeV
         sIapaA/NjGscmLLhMXhhu5rct90HeZ66MKcaiqq8joBv/onf5vuieJ4hl2SgXYUeIGme
         LXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=WbxuGysgieElVsWvDrdgg+OLggaf1Gwioct1mPk+l1g=;
        b=zILK4A5P42UhDZSUdfAmqYapAlCVyzmBX09LE4O32a+jEEQow1tfJnrZbDGJNcsRxg
         EI/K65PnroFK4bnyG7x3AKjeM8yO/sHdz0BigLZ3Rr1Li4/6l3gf+5+VGhEGGO1iUqj4
         FW4A+H9diV2bJNfJ2H92cJVs/IwWYc6o3eDL4mKO2RSZbPNRScgXz19eTi4jx5aLz4W5
         D9FsSfus6//jYpiXOg9cO6N+r6hmx2KqTKiIBdEYbmjdIMLM3tImCumoJrd3UxVVgckG
         uz3IZAk+8vQ4fip05HEbB2kYmPbhbtEhaf1s1PKZuKvcBfQazsN5OMNTm/4/jLaotEb8
         HRFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OP8EE9zb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id x19si37341ljh.2.2020.10.22.04.01.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 04:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4CH4D94zcwzy39;
	Thu, 22 Oct 2020 13:01:13 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 22 Oct
 2020 13:01:13 +0200
Subject: Re: Jailhouse in qemu and ubuntu
To: Andrea Bastoni <andrea.bastoni@tum.de>, Jari Ronkainen
	<jari.ronkainen@unikie.com>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
 <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
 <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <3f1b6c78-46f8-424e-7114-11d29103b325@oth-regensburg.de>
Date: Thu, 22 Oct 2020 13:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OP8EE9zb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 10/22/20 12:09 PM, Andrea Bastoni wrote:
> Hi,
>=20
> On 20/10/2020 12:19, Jari Ronkainen wrote:
>> I noticed that dmesg gives me
>>
>> jailhouse: not as system configuration
>=20
> I'm hitting likely the same with Ubuntu 20.04, but not under Debian testi=
ng.
>=20
> It seems that the .note.gnu.property section is interfering with objcpy a=
nd
> causes the "JHSYST" identification to be removed from the .cell.
>=20
> Removing the section while copying the .o fixes the issue:
>=20
> objcopy --version
> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>=20
> readelf -a jailhouse/configs/x86/qemu-x86.o
> ...
> Displaying notes found in: .note.gnu.property
>   Owner                Data size        Description
>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>       Properties: x86 feature: IBT, SHSTK
>=20
> hexdump -C jailhouse/configs/x86/qemu-x86.cell
> 00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............=
GNU.|

And the Gnu comes around and drops its own magic cowpat. ;-)

Jan, maybe it's time to use a linker script for configs? This should
avoid such errors in the future. I think we have already seen something
similar in the past.

>=20
>=20
> objcopy -O binary --remove-section=3D.note.gnu.property
> jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell
>=20
> 00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST......=
...:|

This reminds me that I wanted to write an extension for file(1). It'd
really be helpful if file would be able do determine if a file actually
is a configuration, and then if it is system or a cell config.

  Ralf

>=20
> Maybe related to:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D906414
>=20
> Thanks,
> Andrea
>=20
>>
>> , but this is the example .cell file that builds
>> with the source code and is used as an example
>> in the README.md?
>> On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ronkainen wrote:
>>
>>     Hi,
>>
>>     I'm interested in running ROS2 in a Linux cell, first through
>>     QEMU and later on Up Xtreme board.=C2=A0 Apologies for stupid
>>     questions,=C2=A0 and please refer me to a more appropriate forum
>>     if this is the wrong place for them.
>>
>>     First I have built a fresh virtual machine and installed Ubuntu
>>     20.04 LTS, then installed linux headers, build tools and python
>>     through apt.
>>
>>     The compilation and installing seems to work fine, but when I
>>     get to the point where I should do
>>
>>     # jailhouse enable jailhouse/configs/qemu-x86.cell
>>
>>     I get an error message
>>
>>     JAILHOUSE_ENABLE: Invalid argument
>>
>>     I do not know how to get past this, any help?
>>
>>
>>     Other things is it seems like the documentation is not entirely
>>     up to date, and I noticed things like experimental virtio support
>>     and IPC reworkings in 0.12 release notes, is there any more info
>>     about those in the wild or should I just dig through git commits?
>>
>> --=20
>> You received this message because you are subscribed to the Google Group=
s
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email
>> to jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>> To view this discussion on the web visit
>> https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-=
50a39589bd88n%40googlegroups.com
>> <https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8=
-50a39589bd88n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f1b6c78-46f8-424e-7114-11d29103b325%40oth-regensburg.de.
