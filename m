Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG7C3T5AKGQE22SNVAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60D260BDE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 09:22:03 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id gt18sf6276484ejb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 00:22:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599549723; cv=pass;
        d=google.com; s=arc-20160816;
        b=qWs9oRkIgIOQ7Soj8Dr1tq6qm8QP6amVArFZHjSu/dmPmOXC+ESuo9U/AcT3ry+Tln
         2MQUiKypNAN36/IbhvGcOYME8ItfupARjlFNK9IWDOI3Lyyc/2yZ7PH9w9LETpoqKtsF
         6+M8DLrcwSwpOSOa3zmAjzazsU5Z+hQgDclvWM3+6THmXtZdjSwqTj4BRQINw1v5EDtj
         J0QVzkPsw8Cew8J6N6FYPimMjQYkeeA/VV6pf+sFvq9p7JMfAbqu6vNcOwL7iktxRdgD
         kzo4Fq1WoWIZ99eQ+9frJV49B+KX75eL8PZsdWjkkgRJdat4ia9lOJdJryRZJfHquGMN
         zfrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=an8gTBfJBvoj4xWAb7vGaPIWekuoIXB4Ej9y2DmCsig=;
        b=M5sNPa+ZNpASGFwYzvEEObWyAXf0U6LaI+bNcBZpNljA1CmSO4Ic2BgpKTfzqwO+nB
         AiLaZpFlXZ4jcclJ5eHEqwZQsRHkaY2u3JK1+uFPXLLXqLYEXZBgXwCXGwBW5ar38vxE
         UgO4sAZex0OebhewpFbm65mNvRqunGSsgNyXQ4vwe/jRZdpIXuyvd05ReA6CSoUJtdaG
         6pP+9yayRaGGIsgRV+JogVZvLTTgZ5H8zFVozU9Pb2rIHgrj2PTcyktWdQK4SefOZSff
         v4HTOzMU2dlTSfN86sq/ytRsbBxHD9BUSN5T0yblFIlRv3BvO6BvhqmrPpHVgCqaXAji
         4vfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=an8gTBfJBvoj4xWAb7vGaPIWekuoIXB4Ej9y2DmCsig=;
        b=KeLtLzqCz6HYYpo8KC+GwVeB+LRsMuKEmCBikcboJiISKWugnRwsvIIrrqXVxun/D5
         zD2UTsaS9WcNjiKMZ3gaNBvRdeZ7cbM5XMOPKcTALnw2kURMv6EYCGM2Ows0IgkGqT82
         +pADbrXTTDBKFX4I2ZW2CU9Daz2GPpjj3VE0R364XhZApWTQmap0goT2/sjfzLXDWHwa
         qcY06g4eJCUxDaia4wDmznYHLWFDksjY/C40IVzwlrshoGQlfk33hb6jF7IVFTva74sh
         ePDnpoSBV15EpozW6iPWVeWgSnJFh/udmVY9cM+670mOcm0v7+uVEz1JGMI+CzRLeCfH
         9Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=an8gTBfJBvoj4xWAb7vGaPIWekuoIXB4Ej9y2DmCsig=;
        b=SwwB01mq2YwboAfFfVOAiiUf6bqUU1plsRp+cNL9lmOscrOBhr5bjQT1fX3o9A0W2/
         +fLzk6xPovRXXMIXnIyrrHd6nwv3mzVlhBB1o9CC2TCr4VVSxCUSttVrpgSlYfe9M114
         W57kQ9h0VO6aUW4gf4QZ6w76ShJRMMThqTiaKQPkcf4IniDSacC/zRDopdMv/39gefkk
         iNHbbNXWu8L0i9brEbx7cEqBKNkX3uTrXnpiru7PIkP6dN0ng3FdVpIyeJuX9wL9+am8
         VRQOk7xBDHluG0ObQpPRNZjHsMXZGbZxXIt1E50WpmSNAcHJy9BGE+/Bvo/cIVNZ481b
         /ANA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316oSBwpIWmFic95bTe/S+y/qOjc7mKUKaAZUVEIWyNUD8B5fNB
	fUcjtSClwRpBUTq8lxTi8Bw=
X-Google-Smtp-Source: ABdhPJwIAtiX0wBB4ARd1UycInTrHKfnpkzvSZWzItarBx9WOkTyZ0oPOM788vpY1tdU3744Q6dPNA==
X-Received: by 2002:aa7:cb0e:: with SMTP id s14mr25083661edt.225.1599549723686;
        Tue, 08 Sep 2020 00:22:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:38c6:: with SMTP id r6ls9456385ejd.9.gmail; Tue, 08
 Sep 2020 00:22:02 -0700 (PDT)
X-Received: by 2002:a17:906:4b4a:: with SMTP id j10mr19937249ejv.498.1599549722806;
        Tue, 08 Sep 2020 00:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599549722; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ff+FF1dRAx5lrF0RmGuxm8SWSR9rxZ3rSfx3GwuMYPTeKDJwYwTrIE2esLgbPTTRx
         Nnzprxs526NACFVJhisMlfcPf+psAluZffBL/MoElwwwjJEoadw/LwLk2PJUrtbxbda3
         eVGhljJ3kfn0+VPSZZRVlJOFxM15LIqcrCgQ/d0ewh/ro8kx9C059MeIHNuIf0hUJ5C8
         cUJSZBTXEOIiGUpUnvsmP4Zp5WU2lFYsDNYBAkEd6/EFdEvCpJoHAd6yhtH+V26odKyz
         1E8YbpkR6Dxo91UyfHT9h3K8p2KllEuYikKmH4BHMDx/6MvT49z4PhsS9XAvLWWzJpnG
         JwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ti3D5rU9xLetvd2s+2xmI7fUqkevI77aa+TH1CY7478=;
        b=AWpY5fLTcST+gOiqb7+wOSuIJ4F8pQUjTn5G+Kun+PCLxCx0pQCwEaYG5xUw6E4To1
         EPo2VvkSOHJD01SX1Ny0zq9dxkC+tJkViqvPYhdDSpsCM/4QSu1EZ8Vru7JBt3pAFvdh
         CKPlYkwV/LWZ3JARvg1L18bTlIlgBnXUwVjNnrvxyHtSsYyTCvvvkSTEgMMYsTO0H5V1
         UEg6qlJa/XxEoYMhPyiKaZJUGy9GsTHhuC2jfKpgZ8q29jro5r+rwqzhtq7O5eab4nl/
         a7upQhWhwugpRH/N8cdr8Jst2vjiKMjrKpxAeM8vHHSy2Yok2pye+StH/XV7BQaG15Lr
         /lQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f17si506467edx.5.2020.09.08.00.22.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 00:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0887M2Ce004023
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 09:22:02 +0200
Received: from [139.22.116.238] ([139.22.116.238])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0887M1UE028184;
	Tue, 8 Sep 2020 09:22:01 +0200
Subject: Re: [PATCH v3 0/7] Configuration parser streamlining
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
 <9afe26e3-a7fb-ebae-ea94-7d0ff228ebed@siemens.com>
 <fe12ea0a-d279-1532-099b-e23f0ec822dc@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7e4900c1-9d76-34de-f7b4-5f396b72cac0@siemens.com>
Date: Tue, 8 Sep 2020 09:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fe12ea0a-d279-1532-099b-e23f0ec822dc@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 08.09.20 01:15, Andrej Utz wrote:
> Hi Jan,
>=20
> On 27/08/2020 11:33, Jan Kiszka wrote:
>> On 25.08.20 16:50, Andrej Utz wrote:
>>> Theses patches mostly improve non-functional aspects of the Jailhouse
>>> configuration parser. Logic for unpacking binary data is consolidated
>>> into CStruct class, which all parser classes are inherited from.
>>> To improve input flexibility, data slices are replaced with I/O streams
>>> (see Pythons 'io' package for how to use them).
>>> Finally, a CPU set check is added, which will list conflicting CPUs
>>> between cells and also usage of non-existing ones in the root-cell.
>>>
>>> Changes v2->v3:
>>> =C2=A0=C2=A0 - fix config_parser usage in jailhouse-cell-linux
>>> =C2=A0=C2=A0 - fix output style in "CPU checks" commit
>>>
>>> Changes v1->v2:
>>> =C2=A0=C2=A0 - reference class variables via class object or class name
>>> =C2=A0=C2=A0 - drop implicit PEP8 formatting
>>> =C2=A0=C2=A0 - dropped unused patches
>>>
>>> Andrej Utz (7):
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: store binary format specificat=
ion in
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct.Struct
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: move parsing into class method=
s
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: consolidate binary parsing int=
o CStruct
>>> =C2=A0=C2=A0=C2=A0=C2=A0 class
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: use I/O stream instead slice o=
f bytes
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: parse pin_bitman in Irqchip as=
 list
>>> =C2=A0=C2=A0 pyjailhouse: config_parser: consolidate header parsing
>>> =C2=A0=C2=A0 tools: config-check: add CPU overlap and boundary check
>>>
>>> =C2=A0 pyjailhouse/config_parser.py | 296 ++++++++++++++++++++++-------=
------
>>> =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 tools/jailhouse-config-check |=C2=A0 33 +++-
>>> =C2=A0 3 files changed, 215 insertions(+), 116 deletions(-)
>>>
>>> --=20
>>> 2.28.0
>>>
>>
>> Still doesn't work - did you test jailhouse cell linux?
>=20
> I did and it works... with Python 3.
>=20
>> Traceback (most recent call last):
>> =C2=A0=C2=A0 File "jailhouse/tools/jailhouse-cell-linux", line 723, in <=
module>
>> =C2=A0=C2=A0=C2=A0=C2=A0 config =3D config_parser.parse(args.config, con=
fig_parser.CellConfig)
>> =C2=A0=C2=A0 File "jailhouse/tools/../pyjailhouse/config_parser.py", lin=
e 287,
>> in parse
>> =C2=A0=C2=A0=C2=A0=C2=A0 return config_expect.parse(stream)
>> =C2=A0=C2=A0 File "jailhouse/tools/../pyjailhouse/config_parser.py", lin=
e 220,
>> in parse
>> =C2=A0=C2=A0=C2=A0=C2=A0 cpu_set_num =3D int(self.cpu_set / cpu_fmt.size=
)
>> TypeError: unsupported operand type(s) for /: 'set' and 'int'
>=20
> When using Python 2, the slots of the child classes are not updated with
> cell config data. I'll search for a workaround.
>=20
> By the way: how long will Jailhouse require Python 2 compatibility?

I'm fine with switching ("#!/usr/bin/env python3"), but then someone
should also scan the git history and/or code for obsolete compat patterns.

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
jailhouse-dev/7e4900c1-9d76-34de-f7b4-5f396b72cac0%40siemens.com.
