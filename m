Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3GMYPUAKGQEZ7ALXIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B750F95
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 17:04:13 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id l26sf20899990eda.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:04:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561388653; cv=pass;
        d=google.com; s=arc-20160816;
        b=N+gOzxZqRevsl9MSiHIQOqA1xeieK6n+FC8db5bdsrD8hZwp9tTrriq2cKzOldgF84
         6gbP9JX1c9G083n0NT5II3GFoFTONOF2LFdnDiY9YWIxbL/0HZ/9kWKkY3RfOB8pYM3T
         AlcIMh6N5wI2hMv6ybDq78bf2M+dEUoBcvYOCrQ8FfbQPFtXlLwF8LT9j9Knixz093NL
         MAMfU06Dazs5d8b+WYzfSJ+GyRPja45MySg0CccRxjyBXZScS+McVGnk9twINmBtmhIx
         OWV/IjYz624ZlxLT8yvGRDhVyPCqyMYRqhyx8NGtfel5d3D+KPzzM1U1LJ5eA57L38eT
         xF9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=rRbEuJPOxL/+uJirMUp5R15oGSlspKKcFWG3D+ObhYc=;
        b=FmVWqhfujd9ZSYZAHWAMlOpEN7nh+pS3yWiwwyJmJTlXVyTbY9DifDqgUloM66xjk1
         znxiCkQc5/b76m1rgT6pwnQd6OKzmWdEXGOYFVmQpsNsQ5nkgZ4Zv/cIoiesUFjgseqQ
         CPD/G26X4898wLLzB3xPJkAK1xU1jJadI0u1FSJ6MjglE5l/jvbTuPNHUFTrUlLblPyZ
         hPaTJBtoauozXsA6hxBEoHtoQgmSYjcEtMUHQ1a7SVL9o+eMpuIBae2VbxcZx7/0Y2SW
         lUwd2ZF2nxoKzQpVRlRl2eQwgI7sWjKFOtwLOvZbyRlw+Qrfoi2Wq+g8y92nlos2bSgJ
         m/VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mIUaXtGV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rRbEuJPOxL/+uJirMUp5R15oGSlspKKcFWG3D+ObhYc=;
        b=IZtYvIz7EHkUaI8RRIEDwSZBLZ3bk/HX+9S/8I/1G2uDRpvz/e9fPcQoqvQbCrPeOh
         CXFWaz8AqBja4bdS/J8OUAnPlQ7ptySRUSgS0S+HmeAV129fqSWWRHq5xHqNpHmYCU5O
         h4o69UfeyNsyF767RBL5CVKWbtPeKE15A/GLl+kwZHFKEAEeKopqcpWZYAVxCgtcItG3
         74VKQq2eTpGoxOUGmW3zYYnjZBBBzKMG8t2IqXhE2nvzSwklyz3Mx7fHtGWKfCNAwRSb
         VlM43zHKYFI+Jl4B2nTh+RIS2sXYk9nBqp3tEzfyZvcHi9UiYKMxJAG99Kq4Z2SzopeB
         L2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rRbEuJPOxL/+uJirMUp5R15oGSlspKKcFWG3D+ObhYc=;
        b=tj+3ji1sXbDcni2yKq1z12lHLxBLOXPS+xV7hfCbR1HxxT42P+ndCSpUxPrORWXiKb
         HOxqtxcDvaqcV1ro9KkiI5OdXwCyUzxtRwe5fyurbjmHyMWE7MWvn2yYTtsL0E/ElZdt
         1dEUNW/ABMNjsDwKNPipHaFIF7GVRMUPmEhfpNW72axDrM54MpxRYNbT0wE2RKD3Ny+X
         gUxByHnaGtwcOsiLeoIGLQ5k5BR/D4sQix+rx7P/LqxHlfr3B8hC7UAyvlwOo/vvlMs8
         1w9AgvG2d0WoGJcwb+fMwdbw/NExEnbI99sgEI526EDRk3QUhQhzSS7eiX7i8ne5ZizM
         FbFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9tYa22h2KzNgn8jd5kTQmOaypO1pHShA2up/DrPQUSS6UIQA4
	IVyPxJHyT6tegdic4vQc/i4=
X-Google-Smtp-Source: APXvYqxTMaD0G9jqcxFAlhhE6lPccPA0mFz0CWw0Rjgyub/OfWyvnGhcpVuCw2+DmCDiedkAWNueiQ==
X-Received: by 2002:a05:6402:1212:: with SMTP id c18mr104221278edw.7.1561388653029;
        Mon, 24 Jun 2019 08:04:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e081:: with SMTP id gh1ls3987504ejb.4.gmail; Mon, 24
 Jun 2019 08:04:12 -0700 (PDT)
X-Received: by 2002:a17:906:c4f:: with SMTP id t15mr86837531ejf.190.1561388652393;
        Mon, 24 Jun 2019 08:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561388652; cv=none;
        d=google.com; s=arc-20160816;
        b=oq1Bp7j0wIUHJYPFfZ1PYF3KkEoxiiDg4mR5f/4hPnCTYxrHqkQ6/RtfkTtN8YBRqs
         rGG9psaPZVK77V3lnoxm3uEdjvULmTH9fAJDFY8vr6Ax2T3EprnIZ+tjlwrMTK3D/WTp
         yurSSEZ52n13PG1FnQ8zZOl9vth/EbeP36XdMmdJFiV3p0k8Q+LAZqEhgTNWawSz/mVC
         fYI+EbaJf2tucHIuRESmDlwvqC7rjsnj/p36sBAsYmCFzp/rBLOcOknBk8fHBaTgmmOS
         60+xPucz8O/1tzksPrUlgpMY+r1souSkB9iUDL0bo/Z3XDPUVxhdfOqaluwUcW++4AKF
         SrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=AFSSQMws3uYjgDSjEOaLGdyOUw60dzNPJcd9kZxFglY=;
        b=TohewZ52Jyg6Xc/QJTBzvvfwcNqkPzq8hUalf/lASL52gG8u8QxR4SEfJ+5TpOGdIX
         3j9qDm5iOBpVreE54eo1G4pw+jW3CG9ElmjVZjZ5ZlfmbpZmUx7eDKLo3Ryk1wYcF/PS
         tJSv69NR+LHAGwCT1SKz5pUhDpq/tBgpxthR0voK1C+3x0U/UV9hUAXxZ0UvZCHnoMuU
         CDqZLLec4wdnmy4YETmEGjGB5RTISYVti6Zy1AOqGhIaKAi0OBQxGLbp/zIGGY6Vowbn
         hMN+p0zCMibijIvdB/HuAtcA5b3vtPOUCXVAfMMMtOoGeFLjDZWOEjiyJcyrGWehtg5a
         318Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mIUaXtGV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id jz14si331020ejb.0.2019.06.24.08.04.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 08:04:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45XXcq5Lvkzy8K;
	Mon, 24 Jun 2019 17:04:11 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 24 Jun
 2019 17:04:11 +0200
Subject: Re: [PATCH 0/3] x86: Fix stalled IRQs after handover
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
 <1c8de33e-8ec3-9e4f-5a4e-d70ad133362a@oth-regensburg.de>
 <49b44cac-9657-f4b1-745c-bda91a515b26@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <8d9a8525-c8f7-ca0d-9401-9c264e896866@oth-regensburg.de>
Date: Mon, 24 Jun 2019 17:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <49b44cac-9657-f4b1-745c-bda91a515b26@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mIUaXtGV;
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

On 6/24/19 4:08 PM, Jan Kiszka wrote:
> On 24.06.19 15:57, Ralf Ramsauer wrote:
>> Hi Jan,
>>
>> On 6/24/19 8:28 AM, Jan Kiszka wrote:
>>> This series comes out of pre-release testing: With new kernel versions,
>>> we spuriously injected masked MSI vectors that are not acked by Linux,
>>> thus caused interrupt stalling.
>>>
>>> Jan
>>>
>>> Jan Kiszka (3):
>>> =C2=A0=C2=A0 core, tools: Add msi_maskable flag to jailhouse_pci_device
>>> =C2=A0=C2=A0 x86: pci: Do not inject masked MSI vectors on handover
>>> =C2=A0=C2=A0 core: Rename arch_pci_suppress_msi to arch_pci_set_suppres=
s_msi
>>
>> FYI: tested this on our AMD machine. Sometimes, we still loose the
>> ethernet device on jailhouse enable; especially, when jailhouse is
>> enabled over ethernet via ssh. It's a rtl8169, supports MSI-X.
>>
>> =C2=A0From my gut feeling I would say that this series, together with
>> 9c633193fd583e lowers the chance of loosing the device when enabling,
>> still, the symptoms didn't fully disappear.
>=20
> Recent changes in next may require regenerating the config in order to
> get the desired fix. Did you do this as well?

Of course - not. But doesn't make a difference, the only device with
msi_maskable =3D 1 is a secondary RS232 card...

  Ralf

>=20
> Jan
>=20
>>
>> =C2=A0=C2=A0 Ralf
>>
>>>
>>> =C2=A0 hypervisor/arch/arm-common/pci.c=C2=A0=C2=A0 |=C2=A0 6 +++---
>>> =C2=A0 hypervisor/arch/x86/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 15 ++++++++++-----
>>> =C2=A0 hypervisor/include/jailhouse/pci.h |=C2=A0 8 ++++----
>>> =C2=A0 hypervisor/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++-=
--
>>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
>>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 tools/root-cell-config.c.tmpl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>>> =C2=A0 7 files changed, 25 insertions(+), 16 deletions(-)
>>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8d9a8525-c8f7-ca0d-9401-9c264e896866%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
