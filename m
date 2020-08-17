Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZUU5H4QKGQE2RHWOEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF1246238
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:14:15 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id z9sf2679374ljj.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 02:14:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597655655; cv=pass;
        d=google.com; s=arc-20160816;
        b=bZf6W9ebZ/qU96b5nqzWiCsZayAPm8RxF2FwfrmN7w2f2ANqRCO/bzSN6R5EBwCAX5
         10pq+ZC+2xse8lf9n01fktqlEhboMaidp4YDoqh5N6is08Ap2ZfewCA2leq8JXQzXrPI
         ortu8xjzFsteWOJmMZhJP/ei1wmwTaDPXqN2XxqJeHCMcDPIuZ0ogcznrWiQmbQ56o2N
         cFrni9SNXpDINfEsqn9/1a4o5VDL/B59VUvMgspqm4BgYDyQVZG9uVwthQFYHe4T1hlV
         2/HTXPo43XkjIvB/u/oR//JxBa5C4ZEKqCeQKJa4iurWmRyfz7MVQCH38sHp3NuH2DDZ
         ob/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=3VY5NfuvP54V/pFuNsjfPVD39Y9IyXs3hpyY/S0oEKY=;
        b=GdxsfLUkVVd22qW0Dd5hGnNyziBtEWxaA++vKlwhNTLAySVDhJgtauIZi4MomiQ1gA
         PODMAEGIzxfYsHWHIVji31rcff+9E8DPzs6MmpHWD1Z0nh/OGKKk5ueFsyc0yQ2rFcGy
         2jMAAHghCZY0F+HsEJVHv1Dn/1L6SHXvKWo7VIbECk5jG/vdZ8MWaPrX+0GeW73XppsA
         CLbrtBivA1VWAGtMMcpBtJyHo1NzLunyDBQ/lN3CawbcbFKX3J2wWNoFN7wh53CSJeXR
         An3RWqjwUt1Z1KrbxjKqQJc1dgwZ2xf1kQNJkkGFUpiaDAjJ6b9gZk2crn5lfKX2IROV
         nn0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3VY5NfuvP54V/pFuNsjfPVD39Y9IyXs3hpyY/S0oEKY=;
        b=Yb3HS0phza65TuyKaPOjeZez/kUspS2ZQfpi371MUOQcD1v20OUakYS/ex5wRDbdTj
         O4xn6kFq4XhJC9oaz4tDYTCQms5SK8GXwva6oQ/efHTQw0VfbFopn/nGr+HCoZ4WAFTr
         6ALBF4UcKPeVqRw5BK6Uox3QBpQ0xukc2HdZYn/MkbYLK2CdD1JmtUcaRi8kLfEsqPEp
         kWMUKJ09EQng/1Anm8KnfWFlCFJ2PjnkNUdfWkB+vNzuMnhzrtzJVqAZxe8qjovbpgBW
         FhWlH9nMzaDXSP19rOB4LzZO3JcUvVpvOfuw3j14nIEK3mmHj7Y1SG7gyir8HsmKX4bZ
         cpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3VY5NfuvP54V/pFuNsjfPVD39Y9IyXs3hpyY/S0oEKY=;
        b=FwSSymiwJuPqMrjMKJJbFHWQN79ZhsFeyPYbdC6XrRIDmBVTiIZTmEaCqt0hFRMJKf
         wJHMqyLIOD7niobt9LerVkpDPlDZBhXyH3OPhgYraMBRFlKkNMrpHNlAYcyPfiMJ5xid
         hGL3oHuQA9Ss8r6vzOz2skHGnuOd+rxGNAMSGDTU4pT/QjL8cXu5Uo/iYT7gkWQp/62N
         9ePw1lAwxlXhQnmopYjLFXWSBKO6MpHsFKL9+9hwPTonkchDuPeT0wcxzD1rLWCVhen6
         PSr2KuG6uBwc+qAPWEvm20Ua4vC92M1JT4tk8GpqstOExPK2j+KODZdSU8Ba7ywR7Ro6
         Ypqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IK74RfvnPIeDIIdTxsX9qilgMbeA++GrpqayCqvIFByYCF52V
	2O/7tRaktz18bv4vSD1y9Rc=
X-Google-Smtp-Source: ABdhPJyFPyzEwANJUxipP6U2C5U8Bl6QqSMdI7d/Ja07cJj1GPBOJ5LYdWCnQS2gKCPmn+k+mOxkxA==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr7295669ljn.22.1597655655169;
        Mon, 17 Aug 2020 02:14:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c18:: with SMTP id h24ls1142762ljc.6.gmail; Mon, 17 Aug
 2020 02:14:14 -0700 (PDT)
X-Received: by 2002:a2e:504a:: with SMTP id v10mr7309089ljd.428.1597655654053;
        Mon, 17 Aug 2020 02:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597655654; cv=none;
        d=google.com; s=arc-20160816;
        b=SlaAvAzDCzvXkQp4aceK7Tk8Uk1TO+0cZOKMDnkDVB533ZUHiq6Oqe7OBNlDUJTfNg
         NAMy7T1sBHTR+o82rHLT0vHsGaL4SFVYcjioFneVYTLymqHLvAPQXwh6GIM4yxy4oqu7
         Dy17BIwc+xGExDS1qBpoZrjyouP9rF+IzlocAVJw1wV1sTCeHeR/lq1cSaxpNZf73bIy
         tcx2E8kC1MVfsOL4+axJP9hUT9W7KkuQuO+U+DndUd0foq9GabiQUBZteZYYYTPCHbH/
         D//RlwtTRKG6x1P/pV3mHWWRoHOx2B/kbg95rr3M8+3Ksx8CUavdbil8EXz1R4gtFYDh
         cN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gH20kogYmAm8qJeQ+f01H3D37E+iLLy/72Ew4DfawKg=;
        b=OPmPnW9tz8ZqRePL224EZomL+mdUpwB8eTfCvx6ZJJkQ2pUoOuthbcJJfxde0UXPjm
         lBwPAICNwRiMKnJqczCLdRK/OJjBT+2x+l4ZhgWLMBnEShhsmSJaEAE+zFjj5f1XOjkZ
         AchNqh2zgJ67QPlrurMXpmTM52lU4pDXDK5w+V8AK1NsEF1E4ycI50l/nxUdSduMn4gw
         CRFvV2DBvfQ1FRoGoeLo+L6EHOkS6Sb96aQ1+PGX/T/HgeO4jLlU7uXbRiVWmGeTNKom
         ugY3jg6dmGtdFFFK6az6p/dyoRibkqCEGxixXTv1aKBViBn0rYDmkhVVeMD79p7yyJck
         kERA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z26si700470lfe.5.2020.08.17.02.14.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07H9EC9i002528
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2020 11:14:12 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07H9ECSU002344;
	Mon, 17 Aug 2020 11:14:12 +0200
Subject: Re: [EXT] Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell
 configuration files
To: Alice Guo <alice.guo@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <20200815190949.6837-4-alice.guo@nxp.com>
 <abc77bec-9b59-e56f-a188-18859536ba3f@siemens.com>
 <DB8PR04MB706508CAD1386D15A5234BFCE25F0@DB8PR04MB7065.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <58bbc203-5599-20d6-40ad-f99d555c5d35@siemens.com>
Date: Mon, 17 Aug 2020 11:14:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB8PR04MB706508CAD1386D15A5234BFCE25F0@DB8PR04MB7065.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 17.08.20 11:06, Alice Guo wrote:
>> -----Original Message-----
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>> Sent: 2020=E5=B9=B48=E6=9C=8814=E6=97=A5 21:48
>> To: Alice Guo <alice.guo@nxp.com>; jailhouse-dev@googlegroups.com
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Subject: [EXT] Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell conf=
iguration
>> files
>>
>> Caution: EXT Email
>>
>> On 15.08.20 21:09, Alice Guo wrote:
>>> Add imx8dxl-gic-demo-aarch32.c to support AArch32 VM on the imx8dxl
>>> platform. Distinguish whether it is AArch32 inmate cell by the macro
>>> JAILHOUSE_CELL_AARCH32.
>>>
>>> Add "imx8dxl-gic-demo-aarch64.c" for AArch64 VM.
>>>
>>> "imx8dxl.c" is used for the root cell.
>>>
>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>> ---
>>>   configs/arm64/imx8dxl-gic-demo-aarch32.c |  64 +++++++++
>>>   configs/arm64/imx8dxl-gic-demo-aarch64.c |  64 +++++++++
>>
>> Sorry, missed that so far:
>>
>> Please add a imx8dxl-inmate-demo.c, instead of aarch64, and make sure it=
 is in
>> line with other inmate-demo configs. That will ease using this target wi=
th all
>> kinds of inmates, including tests (once we have more...).
>>
>> And for the aarch32 variant: If the only difference is the flag, maybe p=
ut that in
>> a define and include the imx8dxl-inmate-demo.c, rather than copying it. =
Will
>> make maintenance easier.
>=20
>=20
> [alice]:
> Accoring your comment, add the following code to configs/arm64/imx8dxl-gi=
c-demo.c.
> But it cannot work correctly because this file will not be compiled when =
building for arm32. Do them need to be changed?
> #if defined(CONFIG_ARM)
>                .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |=20
> JAILHOUSE_CELL_AARCH32, #elif defined(CONFIG_ARM64)
>                .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG, #endif
>=20

I was thinking of

imx8dxl-inmate-demo.c:

#ifdef USE_AARCH32
.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
#else
.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
#endif

and imx8dxl-inmate-demo-aarch32.c:

#define USE_AARCH32
#include "imx8dxl-inmate-demo.c"

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
jailhouse-dev/58bbc203-5599-20d6-40ad-f99d555c5d35%40siemens.com.
