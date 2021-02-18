Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFXKXCAQMGQEDH2RKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7031E80D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 10:36:23 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id c22sf480543lfh.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 01:36:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613640983; cv=pass;
        d=google.com; s=arc-20160816;
        b=IkIh7GmeBSIXTwDwFM5SszloInOUU3Xi8a8siuLShM34YcTrLmXBiR1eIJr/L1a0/i
         va4A1vBGx658ajyGjWjw8bb3SRfy6fOdA263mcWEPIs1OIs3T0M7KVzh7BkF9jXaUFzy
         v7v2T5EtcOjI48S3CJeehUJxneUP9XL+exk36flFmSBYePCf20lwnKA0+lRbT/MUk2Fo
         Z9UcsS8oC3L1VBvH4vuM1WTIJOgFIulGE93APNP6np7n6hAGLiaBXjocjLV6BwqqMGWV
         L6SFa+Y7gVjE/UnJz9J7t+AXsc/KwuV2T5X+0Aspt7XleLfl3sf5sBcyepaswxFVYM7t
         CVIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=wS3zNC7uGkDebi9RonHYPE+rrFEXWTjiCkcBGpG1VS8=;
        b=mvuqssZqGMiGwq6APOeZmRZw2bgK9D/c26NQ/uA04skKHYIhd3a1o0EpvA4zKINSBi
         PTiAqkFlMiajrG7iFxwav+AnQOxcI0hsAhsXhoUkoaNMK6DAyZLrXfqOSOW4qMgtQLEd
         oMaWItBZD/F/w9wqCJPz/ebNTzpKBDlGz0Vss8ln+X6LHWCC8bh1HDyeYHq8hjd9BNT7
         xY/hIXFL67jLBORjZarEmQfWNqxCcoU3Y6niEj1JLfTqqeL0J63V2J6MI3uDZCt0pKg1
         Y0D1lRCpepMOgHbxd2Onduwq3ToeoKEbdEEVh27q33MqFApxjDINx8WMXub2jxas9SEG
         Eb0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wS3zNC7uGkDebi9RonHYPE+rrFEXWTjiCkcBGpG1VS8=;
        b=sYFwwQ4/hPr42DY9yyX4wHIdOpi1gtQcQNHCC+Whzdm/nzWpPjLGdwXblo0zxA3o2w
         F3YmX1rG0/AX0xGQZ8WwCf2sdDgd2uC1gv5Zcw8rlDV1TN2cdsA+9A51ncRRECqRXb6y
         bQcXBROHV6yR7BhLlfjo0X2E0Hmx6znY2iy6mbO5P6MjhqGVpWacDV0zrc9iD26sclwP
         Eu7yApIV/jizOWWuETUHlzOWZZmvEf+jZ52s20hNHcaTA2Lt6uZPQf72Z7VTJEEhLByI
         adUTTNoFYqQrLJRKToQ0ZKVtcNKXIGDMRK/ZbLgykCg5qQpgkBhgokEcuWIZJo5vst1/
         72Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wS3zNC7uGkDebi9RonHYPE+rrFEXWTjiCkcBGpG1VS8=;
        b=KOT7bbzQ2j+DQgNU976IfVKmF1fn8ooB0U4yIAt2v9hw5klYuwqlW94gpocg10S3hd
         hpsImrPuFQBk3u8E/HdO+up9H9glD/z+aeiwuBjBo0liaDdtpH6uKzGsLy6WLcyO9eIf
         ZKudI25SgJQdwhSb3Yk8Iha6h7pNgpcGC+YdjE8SMtP9OWH1sCGHEHCd5IDQCB6wYOJ4
         On+5zkq+IQ4m/ztIiKh2ZOCKwuszVVYWyZ//6pijx8IBqQZUk/K11msJQMuipbDtJTtR
         dP+WLPlKbIWyVNe8u8YMVRH2Pb1tFgrBYqQP0qo0F8Dcvxcxj9EmeHz4q3y+bkCRzmjq
         /bqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JqG0NvlNyf9b50Tlu0k40S7OiYxIBZ+V/XeNT5qMNafhTpQRG
	G+3kSAd6M8UN18AwBb/PZcI=
X-Google-Smtp-Source: ABdhPJyPsgCkKmg0yX8tW+7DxZW7hZWM5nbYf8yKrsehHU4o21KzHeeYEzTdaNl5+7qSnvUqcXkfvw==
X-Received: by 2002:a2e:9019:: with SMTP id h25mr2016805ljg.467.1613640982906;
        Thu, 18 Feb 2021 01:36:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:480d:: with SMTP id v13ls2781892lfa.0.gmail; Thu, 18 Feb
 2021 01:36:21 -0800 (PST)
X-Received: by 2002:a05:6512:971:: with SMTP id v17mr2098126lft.580.1613640981745;
        Thu, 18 Feb 2021 01:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613640981; cv=none;
        d=google.com; s=arc-20160816;
        b=bdie3I9VHwYGlyU/h+4WuUKHOmkoNma8mItHDhEIloOzQ61Z/84i2wzYsSW9CAzXy/
         dlBartEF+urgWHh0oUpVbJPFrAZBpUFOJuPVxwIHgCEz4xfbd/ETUkDunkuxC/zRmXFs
         ToJh6zav7j/s+Yl5j+2+K5C316lucRvj97cIVKN8PgxYTvE40qjkeZrg6RdLZR62Pul9
         dR55/oMUoOcU3O9DXKCc87sslpc+GnDvMHtYisAI/S60gEEO35oYQGMaSPwhXSAZTnH8
         /D05XaJAFc0DgCebeUYH5Q/0/KLQdeF5dccNTmC2S4P/7lVDJpNQYdXM+hCZPZBX9N9i
         wU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=A76ehagDbD3X2pS4T8+C58N0V8NrHYA7/YG/+KzNpps=;
        b=ulv/QYqRWKc4zYUIXKUEtKuLFky+PfgpgcjIWPiFtoK2SZye5qR+xVw7kwNtXbkmxw
         0XAHv+0cdJMQU8FugEI8gAs+6vQZLIuN6J8ZvNIQ2VJ1pF9ht4QS9iE2g6lRp0zASKVo
         Ws0dxP+D3GTndiCxaDf9BrBnrnCf1q4CGRzuSgo2lWJA7Ar2Ol5w4oV7SnkRagG9bdYM
         2GO1ZWCNXIh0OLUToXVCDeZkGwOWkdC/qfeTU0WIcbLOHXHOullhqAYZG0jSHAf+X7oK
         2ZOcjqB9e46RnIFuczmCuTj2AcY75TMn8b7rKjENJTZ11pL+rvxhoUQQX5mn3q6uKRkx
         NBaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m17si162469lfg.0.2021.02.18.01.36.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 01:36:21 -0800 (PST)
Received-SPF: neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 11I9aK8h031646
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Feb 2021 10:36:20 +0100
Received: from [139.22.135.163] ([139.22.135.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11I9VJSu006463;
	Thu, 18 Feb 2021 10:31:20 +0100
Subject: Re: Jailhouse hanging
To: Jari Ronkainen <jari.ronkainen@unikie.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1f674212-e966-3ce4-c2ea-e601a015c19c@siemens.com>
Date: Thu, 18 Feb 2021 10:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 194.138.37.39 is neither permitted nor denied by best guess
 record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 18.02.21 10:07, Jari Ronkainen wrote:
> I have tried to get jailhouse running on=C2=A0 UP xtreme board with an LT=
E
> module attached.
> However, running into some problems, and this one is one I couldn't
> solve myself:=C2=A0 The entire system hangs quite fast after getting this
> message:
>=20
> =C2=A0 =C2=A0 VT-d fault event reported by IOMMU 1:
> =C2=A0 =C2=A0 =C2=A0 Source Identifier (bus:dev.func): 01:00.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Fault Reason: 0x22 Fault Info: 2d000000000 Typ=
e 0
>=20
> The 01:00.0 is the PCI address for the LTE module.
>=20
> Cross-referencing with Linux kernel, I figured that 0x22 is
> "Present bit in context entry is clear"
>=20
> Don't know how to figure out what to do with "fault info" or "type"
> here either.
>=20
> Root cell configuration can be found in
>=20
> =C2=A0https://pastebin.com/armiRjH9
>=20
> Setting iommu =3D 0 for the LTE modem prevents system from hanging
> instantly, but the failure message is still there.=C2=A0 Issuing "jailhou=
se
> disable"
> still hangs the system reliably with no extra messages.
>=20

Yeah, the error message already indicate the IOMMU 1 is the right one
(otherwise the message would have come from unit 0).

The issue might be around the guest enabling (or not disabling)
interrupts in the modem before properly programming the MSI registers.
Or that Jailhouse considers the programming invalid for some reason and,
thus, does not arm the entry. Places you want to inspect/instrument are in

    arch_pci_update_msi
        -> x86_pci_translate_msi
            -> iommu_get_remapped_root_int
        -> iommu_map_interrupt

>=20
> relevant lspci:
> =C2=A0 =C2=A001:00.0 Network controller: Qualcomm Atheros QCA6174 802.11a=
c
> Wireless Network Adapter
>=20
>=20
> Thanks all for the previous help, and thanks in advance for helping.
>=20
> Also, I got this from jailhouse console -f, I don't get anything from the
> UART, does that mean misconfiguration there in this case?
>=20

Likely. Can be as simple as the wrong divider. Where did you get the
parameters from?

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1f674212-e966-3ce4-c2ea-e601a015c19c%40siemens.com.
