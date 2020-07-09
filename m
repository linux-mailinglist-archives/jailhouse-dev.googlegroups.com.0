Return-Path: <jailhouse-dev+bncBCOJ5VM3UENRBCGNTT4AKGQEKDEFSAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A421A1E7
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jul 2020 16:15:36 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id y7sf2668416edp.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jul 2020 07:15:36 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1594304136; cv=pass;
        d=google.com; s=arc-20160816;
        b=OeeV7XKOfQeMWNbuK/LqBbgRrAdHpMouZ1g8OzfecLUceCL42FnkAdhrJ6PJeZnnVG
         Vrlsbgh+TO932hXzpegMltD7sEMIVPDjIwKg4tEHNhdtN7LwevOcYJj1Lam1FRYR6abu
         jNxpMn5ipK05+h15LJFEyzqq6lZhnGBPctuR0BjwbANj6cFv/NWDM0tpoCWpdZkdEuUu
         y1yOYl2efSox0PUxHResAKDmy0YzXvKeFYLZ+UXMYySCUWF16zaDo8N0Q1eyv1c9b+9E
         QywM7x1XQd+BWyQ+l0vCu3GFq8Jz/+Bf2lFtrIKfbB3aK6Td9ZuWVB9HmLH4Z1ooBEko
         swCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=vxP6Y5XfrtBCAnpRjbpIHs269JPsqbW1dVYXC4CCU1s=;
        b=NKbSO9cWKQS6+6f75svbKOjmefqjUErXdZHxDJoy5BRGFbgZkx7pP/A1396gEQbD0e
         mLn39eii02P4Rd4IQSvl4XBQ9F97CMuEI2UhHAjwaeguwwpkI9SGyTERMt03+yVGwCV9
         8/M1h2TupJpfYEFsErsWRCaaZwnMrTn7Z3sbKZNSyoHF78r1e+8BoEfMMvJtlUJK4qWt
         b1VWwEhDQC+SLS0rOKBZ19BsRGVErB+7BMEwpGbWogU53X7meh9cXovzY2hbX9dePMMP
         kxB7vAsrMu5Eq+C3/juZabJqweDHujI3HDZm9jukliGogozzObU+2yh4RzG6RW3Tlk7s
         mOFA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@live.com header.s=selector1 header.b=ITEliw2f;
       arc=pass (i=1);
       spf=pass (google.com: domain of moritzwalker@live.com designates 40.92.75.101 as permitted sender) smtp.mailfrom=moritzwalker@live.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=live.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vxP6Y5XfrtBCAnpRjbpIHs269JPsqbW1dVYXC4CCU1s=;
        b=PV3HBLgWV5b8WwscNerguKf/kmT8zJEt3yAiKlIVs0dcAf46HfZQzXhVWHkBaCIgEm
         jmwJNn61nNSgKhG5F3uArLWB2JBFlHnztiCmJ+F+0VEUu/bwEfWYwSge3pcLbgx+EFhW
         3pRoEoWWqJTHfB/Bcw3anUM5TxBDD/RaQexaqRIUriN5y+N7ehNc0HZm8tmUWOhd+R9q
         ETbLWf1PB+UXsq7FAdAEeDiSnv6QgFZuJx3/tZwku86y2Yic6stU7llxPf++S+BvKH+X
         dsP0I5HM+UVfcqUAfOVES1sFw/UShiNH9v2XWZVrbw6umeIJkq6HTLUk0k5gUr49nlRe
         abLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vxP6Y5XfrtBCAnpRjbpIHs269JPsqbW1dVYXC4CCU1s=;
        b=l6AOe1g9ikhTNrhtB7K18btcwU0ksmMuEcnN2Czvxao384eAWgiaiRDRRqRS9aGQni
         NU0h0LkdxUg5rvhYh0TIbK1zlAuMPumwHI3NfvOQBcZWVGW07nUqVYmQxqI70bqTmH2H
         rhAXFoclwVcAjRRvxojCOB3y7wW+FdQieteAH+wvF2p2kaqps4tpoZ6vbwdkTZ5D7/5t
         3OB0NN1SYk1ZJ+jN45xmjJ8VY0H4MyZ6aTiwuMUaGkApFeFK1LuU1jxcnBTWfqe1Nb/R
         LVBxM3FAOpaNVg+eeCGIajykP9CF9uJzAkyRrK9s0aOyCa990sNV5c8w12TwKSYiHCrw
         0WzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cN46mkiJXIcpBYytyFCum+Z2Prn3TM3ZdkS+gMKAoC8PyhEWY
	78GAbLx9A8dlZWRvJBlRjmI=
X-Google-Smtp-Source: ABdhPJyl8deYWuxD3UY9wqAuhWe3suO841JzMJ2KJy7rveCWPwvXyL14kCFVlArv3EZ76KHNVQ7IbA==
X-Received: by 2002:a05:6402:1250:: with SMTP id l16mr73726603edw.362.1594304136307;
        Thu, 09 Jul 2020 07:15:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:db04:: with SMTP id t4ls732247eds.3.gmail; Thu, 09 Jul
 2020 07:15:35 -0700 (PDT)
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr66522707edb.181.1594304135578;
        Thu, 09 Jul 2020 07:15:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594304135; cv=pass;
        d=google.com; s=arc-20160816;
        b=j5kmtqlgbmbNSzBEZvxbqq+9mUfNomc1xyigwaJ4O/GRaCxyvs+rq4OBqs64EVXeHQ
         frhnhZc3dzW9Ov+FnPkpvsN+i/totFp0BpBrm1n7w2WGNhBqR07vuZvI6ijftV8nNbbD
         CNXPkIvQ76manmRaHE/oCIkdHyJQc2ktn4nFybfAazXawtxc0/cGuzKggTPp4gBo5Mwp
         gSO/ECSM00B0zPymSv/ACzD04nnuDEeovlhXxUHyXEbioY/3BgJk1Ts3BptF/38WzQ/b
         JnXNQ/r8xU+j9kZ+J3o+C/96z50hevMmz9FnZ47LoHGch9gSrkMJ+WXPBl7WJveAsSKY
         I4JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=xLIVfC062WZ725Z8Dv5NgFN7qNSdmGkOOMviu9xTSOc=;
        b=CQI9+cdV79HPANJgb+9xB4/YWeOChLI+yO18E5QYmK8iQcwBWD5jmvEChkN1eE+pk1
         lT5GtfOY/F8a0rRK7gEgOAe3sURDkLhlSAWI9Be+Mb0zOaSQ210xLJK0KGN46ppT3/UY
         /xWgTYJDpbaphyt2bD6okiqAiWdNfqda7UAV9boofqfDSxljCO2bExDtsrilTdB7Aiss
         KkXEgcZl1q8uk+qoaPLSywwExFCW2/hHY62biPx5Jrz/9TXjVAxEjzvOEXouWSMhQlfM
         6yPEIrCM4kQL9lF9nnIpv6kt4lnbeRNlKooIitp6cEZVpU9CEaPA/cQc3/MPSlaxQeq4
         wGSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@live.com header.s=selector1 header.b=ITEliw2f;
       arc=pass (i=1);
       spf=pass (google.com: domain of moritzwalker@live.com designates 40.92.75.101 as permitted sender) smtp.mailfrom=moritzwalker@live.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=live.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-oln040092075101.outbound.protection.outlook.com. [40.92.75.101])
        by gmr-mx.google.com with ESMTPS id x21si176607eju.0.2020.07.09.07.15.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 07:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of moritzwalker@live.com designates 40.92.75.101 as permitted sender) client-ip=40.92.75.101;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/Ywmj0KQr/JwkqKWAb2GnFk3deqctMMyWlM58YxbM4Qsd56zAhPnndo8KNE9JF+a8QcprW4qcRJsFv3yWX/lnmu6VxNnORBkfbgAXnwNKQlLXLVQ8pAPwn92iUP0Ja7+ZOyYo0vonHivhPWrvKTaMCEsJtSVrFvMqWacyexLejQQxRFhQi/56jhrgXCvreru/cY90sUpXb79OQStmouvzM28Z64VC5zx6H3Vf8bVbAeqHL60EMTQrzJ+TiMXYSjTX8+yDqSxlnHmiF0RCKb4OyB/7mCQrp4R9e0pR7/SEq0gXrc8N1c9KGz+WJgR8BTY3cZr+KEmFIbtorN9cJv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLIVfC062WZ725Z8Dv5NgFN7qNSdmGkOOMviu9xTSOc=;
 b=MFNIq1b9tn0plFzbD8COREaEF693/EGYs67dgTAwI/vM2CApbiksuJL8Bfgi8/ozs2ezcguWeJZy5hljZhIs2QbMo/AR4zo9Z8+ZO0TwvRh2b6aCrXT3yCG1+AqvI/tc9YF/jdyAUt5BSAQowBTomcTPPhXHrYqDqVGz/dNo7okXxotZVTiFXwuNEj2COCIiB4Bh5a4YXGFduoswHgrczXXpZiowuRtau3Z+sKXP+lgXrcGJuoAxiKnfIb8Q7sw39EfNqQcTgmf92nksTiH3EO9AeWYzZw8Xhc2oHSr/F/qkG76lPVlkgsfTbpfexkkGCkTSb6ETAL8HQBRvc1pbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR04FT036.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::45) by
 VI1EUR04HT177.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::393)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Thu, 9 Jul
 2020 14:15:34 +0000
Received: from AM0PR07MB5426.eurprd07.prod.outlook.com
 (2a01:111:e400:7e0e::4b) by VI1EUR04FT036.mail.protection.outlook.com
 (2a01:111:e400:7e0e::423) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 14:15:34 +0000
Received: from AM0PR07MB5426.eurprd07.prod.outlook.com
 ([fe80::75c4:dda6:7342:cae2]) by AM0PR07MB5426.eurprd07.prod.outlook.com
 ([fe80::75c4:dda6:7342:cae2%4]) with mapi id 15.20.3195.009; Thu, 9 Jul 2020
 14:15:34 +0000
From: Moritz Walker <moritzwalker@live.com>
To: Jan Kiszka <jan.kiszka@web.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: Need help to run Linux in non-root cell
Thread-Topic: Need help to run Linux in non-root cell
Thread-Index: AQHWUGW+2UMdAbQ1wUyprzasqZlDBKj0P32AgAAxg1yAAAbVgIAAAnsAgAlPaYCAABF6AIABdhVk
Date: Thu, 9 Jul 2020 14:15:34 +0000
Message-ID: <AM0PR07MB542635593444EA2E8226A9D2B2640@AM0PR07MB5426.eurprd07.prod.outlook.com>
References: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a@siemens.com>
 <AM0PR07MB5426401B20187DA3BAB56C4DB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <2b34a9fb-b90c-ef4a-545e-ec0ab7620c78@siemens.com>
 <77cfe59d-589c-99dc-e3ef-bd2891d3daf4@oth-regensburg.de>
 <73b73089-a90c-f26f-bc2f-ce716bb1fafb@st.oth-regensburg.de>,<8d864c50-172e-bc18-accc-c9d478aa05b5@web.de>
In-Reply-To: <8d864c50-172e-bc18-accc-c9d478aa05b5@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:F893919B4AA9F691151FA7348F019A6DBB0967F5FAA4EC59245B7C193C02B01A;UpperCasedChecksum:07864DB016A80A767C9A63343FF33B8E5A4F722E146ECCE371982B7964DDD7FD;SizeAsReceived:7540;Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [E+EKzepggZ1HPzbtrdwSZ9WfEt9ItMoBoSA2H+XMc6SnG4GgizgzV/uMQWlcOpr1]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 93f1694f-66d2-4d16-0247-08d824128bc1
x-ms-traffictypediagnostic: VI1EUR04HT177:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UEsC3UqWyaWA70IACpqubo0p+hLy0uXEcwd6hWmUmDhuxhrAuinYSZhhl2ODluSYr3Jjuj/W6UCGw3qduvoXW6fueEcxL2HHORAwdJnwD4bdlaFEGEb4kxpf7+qpH3jR1EnCXJ2+HA9zhqoLGZYYJlJ7raYsWVCdz4/XEay544LTjE3RTDcg6NRdcsXaOQhUtaOe/ZVVphNTz3NcBTFejP/RcJC7UVKNPj60adQmFLfgm9p9vb2v38gipzgx/s4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB5426.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
x-ms-exchange-antispam-messagedata: zDahXqMNX/RSyhfLD1QZwEqWOTbuSczlXoalo3kWXWmxEZ7FsnrQ1sko2fC07oV+MTQ5Hz8u0Z1hKdldUZ5FnuD1Gk/D69C54+8etVnIf3h0XyccA8l1TImvhmX/DfrP+5uMTYXXfsRHF+Xf8At3vE3tHdBGiMMVto9/0XRdTR5+XiLgiczG+uZD+WZ4klm5cXaMRqi3Yxd4le0uQWx7Mg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
	boundary="_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_"
MIME-Version: 1.0
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT036.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f1694f-66d2-4d16-0247-08d824128bc1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 14:15:34.3889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT177
X-Original-Sender: moritzwalker@live.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@live.com header.s=selector1 header.b=ITEliw2f;       arc=pass
 (i=1);       spf=pass (google.com: domain of moritzwalker@live.com designates
 40.92.75.101 as permitted sender) smtp.mailfrom=moritzwalker@live.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=live.com
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

--_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_"

--_000_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: text/plain; charset="UTF-8"

Hello,

I tried out this patch:

>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>> index d36c2033..5160d37d 100644
>> --- a/hypervisor/arch/x86/apic.c
>> +++ b/hypervisor/arch/x86/apic.c
>> @@ -350,7 +350,7 @@ void apic_clear(void)
>>
>>          /* Finally, reset the TPR again and disable the APIC */
>>          apic_ops.write(APIC_REG_TPR, 0);
>> -       apic_ops.write(APIC_REG_SVR, 0xff);
>> +       //apic_ops.write(APIC_REG_SVR, 0xff);
>>   }
>>
>>   static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,


but now i am stuck witch another kind of error:
FATAL: Unhandled MSR read: c0002001.
FATAL: Unhandled MSR read: c0002011.
FATAL: Unhandled MSR read: c0002021.
FATAL: Unhandled MSR read: c0002031.
FATAL: Unhandled MSR read: c0002041.
FATAL: Unhandled MSR read: c0002051.
FATAL: Unhandled MSR read: c0002061.
FATAL: Unhandled MSR read: c0002071.
FATAL: Unhandled MSR read: c0002081.
FATAL: Unhandled MSR read: c0002091.
FATAL: Unhandled MSR read: c00020a1.
FATAL: Unhandled MSR read: c00020b1.
FATAL: Unhandled MSR read: c00020c1.
FATAL: Unhandled MSR read: c00020d1.
FATAL: Unhandled MSR read: c00020e1.
FATAL: Unhandled MSR read: c00020f1.


So i got back to my intel machine. There i am able to boot non-root linux but the boot process gets stuck at
[   15.618062] e1000e 0000:00:1f.6: can't find IRQ for PCI INT A; probably buggy MP table
...
[   20.724004] random: dropbear: uninitialized urandom read (32 bytes read)] forever.
This error appears, when i run the root cell without any devices (except serial, ivshmem (demo), and ivshmem-net)
and when i add an ethernet controller. lspci for the ethernet controller gives me the following output.


00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (5) I219-V (rev 31)
Subsystem: Lenovo Ethernet Connection (5) I219-V
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 127
Region 0: Memory at f2100000 (32-bit, non-prefetchable) [size=128K]
Capabilities: [c8] Power Management version 3
Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee002b8  Data: 0000
Capabilities: [e0] PCI Advanced Features
AFCap: TP+ FLR+
AFCtrl: FLR-
AFStatus: TP-
Kernel driver in use: e1000e
Kernel modules: e1000e


It seems, that there is an issue, adding the device to the non-root cell, and there is not enougth entropy to fully boot up linux.
Do you have any suggestions how to get linux fully booted?
I have attached the config files for the root (wifi.c) an non-root cell (linux-x86.c), as well as the full log at /dev/jailhouse (log.txt).

Moritz




________________________________
Von: Jan Kiszka <jan.kiszka@web.de>
Gesendet: Mittwoch, 8. Juli 2020 15:39
An: Andrej Utz <andrej.utz@st.oth-regensburg.de>; Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; Moritz Walker <moritzwalker@live.com>; jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
Betreff: Re: Need help to run Linux in non-root cell

On 08.07.20 16:37, Andrej Utz wrote:
> Hi all,
>
> On 02/07/2020 18:26, Ralf Ramsauer wrote:
>>
>>
>> On 02/07/2020 18:17, Jan Kiszka wrote:
>>> On 02.07.20 18:07, Moritz Walker wrote:
>>>>>>   Smells like a regression in that branch for non-root Linux. Is that
>>>>>>   562b04e51bb5e2f04bf175383080333237067c63? Can you share you kernel
>>>>>> config?
>>>>
>>>> Yes, its 562b04e51bb5e2f04bf175383080333237067c63. I  attached the
>>>> kernel config.
>>>> I also tried the kernel from jailhouse-images (Linux version 5.4.17)
>>>> which leads to  the same error
>>>> on my AMD-machine:
>>>
>>> Ah, AMD! Please see
>>
>> Yeah, AMD. It isn't always only Intel. :-)
>>
>>> https://groups.google.com/forum/#!msg/jailhouse-dev/1wRKIiGN0GA/_p_NSIBpDwAJ
>>>
>>> - in fact a known issue (hardware misbehavior) that we didn't workaround
>>> yet.
>>
>> Yes, just wanted to mention! Looks familiar.
>>
>>>
>>> Ralf, Andrej, any news here.
>>
>> Andrej?
>> It's already been a while. Didn't we already have some preliminary
>> patches for Linux?
>>
>> As a hacky workaround, you can try:
>>
>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>> index d36c2033..5160d37d 100644
>> --- a/hypervisor/arch/x86/apic.c
>> +++ b/hypervisor/arch/x86/apic.c
>> @@ -350,7 +350,7 @@ void apic_clear(void)
>>
>>          /* Finally, reset the TPR again and disable the APIC */
>>          apic_ops.write(APIC_REG_TPR, 0);
>> -       apic_ops.write(APIC_REG_SVR, 0xff);
>> +       //apic_ops.write(APIC_REG_SVR, 0xff);
>>   }
>>
>>   static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
>>
>
> Or as an alternative apply the following patch to the kernel:
> https://groups.google.com/d/msg/jailhouse-dev/1wRKIiGN0GA/P5YeS3oqAQAJ
>
> @Jan: Any ideas how to bring the mentioned patch (or something
> equivalent) upstream? I know its a hack and will add proper CPU family
> checks, but the linux-x86 folks still may not even touch it. Meanwhile
> AMD gains market share and as such more people will try to run non-root
> Linux with their CPUs, run into this bug and request support here or
> decide to use other hypervisors.

Code-wise, I think you can simply set the mask bit unconditionally right
after enabling if that is the software-expected state and that is just
not available on all CPUs. That code path is not timing sensitive.

But, in order to explain where this comes from and what will happen if
not doing that - at least over Jailhouse -, a verbose commit message and
likely also a code comment will be needed.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR07MB542635593444EA2E8226A9D2B2640%40AM0PR07MB5426.eurprd07.prod.outlook.com.

--_000_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I tried out this patch:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; diff -=
-git
 a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c</span><br style=
=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&q=
uot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quo=
t;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color:=
 rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; index =
d36c2033..5160d37d
 100644</span><br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe U=
I Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacS=
ystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.66=
67px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; --- a/=
hypervisor/arch/x86/apic.c</span><br style=3D"font-family: &quot;Segoe UI&q=
uot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -appl=
e-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-seri=
f; font-size: 14.6667px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &#43;&=
#43;&#43; b/hypervisor/arch/x86/apic.c</span><br style=3D"font-family: &quo=
t;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&=
quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot=
;, sans-serif; font-size: 14.6667px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; @@ -35=
0,7 &#43;350,7
 @@ void apic_clear(void)</span><br style=3D"font-family: &quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
; font-size: 14.6667px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt;</span>=
<br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Rob=
oto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgrou=
nd-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
 Finally, reset the TPR again and disable the APIC */</span><br style=3D"fo=
nt-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, =
&quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helv=
etica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(2=
55, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apic_ops.write(APIC_REG_TPR,
 0);</span><br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI W=
eb (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyst=
emFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667p=
x; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; -&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apic_ops.write(APIC_REG_SVR,
 0xff);</span><br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe U=
I Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacS=
ystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.66=
67px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &#43;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //apic_ops.write(APIC_REG_SVR,
 0xff);</span><br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe U=
I Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacS=
ystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.66=
67px; background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &nbsp;=
 }</span><br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;=
 background-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt;</span>=
<br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Rob=
oto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgrou=
nd-color: rgb(255, 255, 255)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">&gt;&gt; &nbsp;=
 static void
 apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Rob=
oto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgrou=
nd-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;">b=
ut now i am stuck witch another kind of error:</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;"><=
span>FATAL: Unhandled MSR read: c0002001.&nbsp;&nbsp;<br>
</span>
<div>FATAL: Unhandled MSR read: c0002011.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002021.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002031.&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002041.&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002051.&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002061.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002071.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002081.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c0002091.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020a1.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020b1.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020c1.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020d1.&nbsp;&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020e1.&nbsp;<br>
</div>
<div>FATAL: Unhandled MSR read: c00020f1.&nbsp;</div>
<div><br>
</div>
<div><br>
</div>
<div>So i got back to my intel machine. There i am able to boot non-root li=
nux but the boot process gets stuck at</div>
<div>[ &nbsp; 15.618062] e1000e 0000:00:1f.6: can't find IRQ for PCI INT A;=
 probably buggy MP table<br>
</div>
<div>...</div>
<div>[ &nbsp; 20.724004] random: dropbear: uninitialized urandom read (32 b=
ytes read)] forever.</div>
<div>This error appears, when i run the root cell without any devices (exce=
pt serial, ivshmem (demo), and ivshmem-net)</div>
<div>and when i add an ethernet controller. lspci for the ethernet controll=
er gives me the following output.</div>
<div><br>
</div>
<div><br>
</div>
<div><span>00:1f.6 Ethernet controller: Intel Corporation Ethernet Connecti=
on (5) I219-V (rev 31)<br>
</span>
<div>Subsystem: Lenovo Ethernet Connection (5) I219-V<br>
</div>
<div>Control: I/O- Mem&#43; BusMaster&#43; SpecCycle- MemWINV- VGASnoop- Pa=
rErr- Stepping- SERR- FastB2B- DisINTx&#43;<br>
</div>
<div>Status: Cap&#43; 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort=
- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
</div>
<div>Latency: 0<br>
</div>
<div>Interrupt: pin A routed to IRQ 127<br>
</div>
<div>Region 0: Memory at f2100000 (32-bit, non-prefetchable) [size=3D128K]<=
br>
</div>
<div>Capabilities: [c8] Power Management version 3<br>
</div>
<div>Flags: PMEClk- DSI&#43; D1- D2- AuxCurrent=3D0mA PME(D0&#43;,D1-,D2-,D=
3hot&#43;,D3cold&#43;)<br>
</div>
<div>Status: D0 NoSoftRst&#43; PME-Enable- DSel=3D0 DScale=3D1 PME-<br>
</div>
<div>Capabilities: [d0] MSI: Enable&#43; Count=3D1/1 Maskable- 64bit&#43;<b=
r>
</div>
<div>Address: 00000000fee002b8 &nbsp;Data: 0000<br>
</div>
<div>Capabilities: [e0] PCI Advanced Features<br>
</div>
<div>AFCap: TP&#43; FLR&#43;<br>
</div>
<div>AFCtrl: FLR-<br>
</div>
<div>AFStatus: TP-<br>
</div>
<div>Kernel driver in use: e1000e<br>
</div>
<div>Kernel modules: e1000e<br>
</div>
<span></span><br>
</div>
<div><br>
</div>
<div>It seems, that there is an issue, adding the device to the non-root ce=
ll, and there is not enougth entropy to fully boot up linux.</div>
<div>Do you have any suggestions how to get linux fully booted?</div>
<div>I have attached the config files for the root (wifi.c) an non-root cel=
l (linux-x86.c), as well as the full log at /dev/jailhouse (log.txt).</div>
<div><br>
</div>
<div>Moritz</div>
<span></span><br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;"><=
br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;"><=
br>
</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Jan Kiszka &lt;jan.kis=
zka@web.de&gt;<br>
<b>Gesendet:</b> Mittwoch, 8. Juli 2020 15:39<br>
<b>An:</b> Andrej Utz &lt;andrej.utz@st.oth-regensburg.de&gt;; Ralf Ramsaue=
r &lt;ralf.ramsauer@oth-regensburg.de&gt;; Moritz Walker &lt;moritzwalker@l=
ive.com&gt;; jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.=
com&gt;<br>
<b>Betreff:</b> Re: Need help to run Linux in non-root cell</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On 08.07.20 16:37, Andrej Utz wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; On 02/07/2020 18:26, Ralf Ramsauer wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 02/07/2020 18:17, Jan Kiszka wrote:<br>
&gt;&gt;&gt; On 02.07.20 18:07, Moritz Walker wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;Smells like a regression in that branc=
h for non-root Linux. Is that<br>
&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;562b04e51bb5e2f04bf175383080333237067c=
63? Can you share you kernel<br>
&gt;&gt;&gt;&gt;&gt;&gt; config?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Yes, its 562b04e51bb5e2f04bf175383080333237067c63. I&nbsp;=
 attached the<br>
&gt;&gt;&gt;&gt; kernel config.<br>
&gt;&gt;&gt;&gt; I also tried the kernel from jailhouse-images (Linux versi=
on 5.4.17)<br>
&gt;&gt;&gt;&gt; which leads to&nbsp; the same error<br>
&gt;&gt;&gt;&gt; on my AMD-machine:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ah, AMD! Please see<br>
&gt;&gt;<br>
&gt;&gt; Yeah, AMD. It isn't always only Intel. :-)<br>
&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://groups.google.com/forum/#!msg/jailhouse-dev=
/1wRKIiGN0GA/_p_NSIBpDwAJ">
https://groups.google.com/forum/#!msg/jailhouse-dev/1wRKIiGN0GA/_p_NSIBpDwA=
J</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - in fact a known issue (hardware misbehavior) that we didn't =
workaround<br>
&gt;&gt;&gt; yet.<br>
&gt;&gt;<br>
&gt;&gt; Yes, just wanted to mention! Looks familiar.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ralf, Andrej, any news here.<br>
&gt;&gt;<br>
&gt;&gt; Andrej?<br>
&gt;&gt; It's already been a while. Didn't we already have some preliminary=
<br>
&gt;&gt; patches for Linux?<br>
&gt;&gt;<br>
&gt;&gt; As a hacky workaround, you can try:<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic=
.c<br>
&gt;&gt; index d36c2033..5160d37d 100644<br>
&gt;&gt; --- a/hypervisor/arch/x86/apic.c<br>
&gt;&gt; &#43;&#43;&#43; b/hypervisor/arch/x86/apic.c<br>
&gt;&gt; @@ -350,7 &#43;350,7 @@ void apic_clear(void)<br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Finally, reset=
 the TPR again and disable the APIC */<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apic_ops.write(AP=
IC_REG_TPR, 0);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apic_ops.write(APIC_REG_SVR,=
 0xff);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //apic_ops.write(APIC_RE=
G_SVR, 0xff);<br>
&gt;&gt; &nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; &nbsp; static void apic_send_ipi(unsigned int target_cpu_id, u32 o=
rig_icr_hi,<br>
&gt;&gt;<br>
&gt;<br>
&gt; Or as an alternative apply the following patch to the kernel:<br>
&gt; <a href=3D"https://groups.google.com/d/msg/jailhouse-dev/1wRKIiGN0GA/P=
5YeS3oqAQAJ">
https://groups.google.com/d/msg/jailhouse-dev/1wRKIiGN0GA/P5YeS3oqAQAJ</a><=
br>
&gt;<br>
&gt; @Jan: Any ideas how to bring the mentioned patch (or something<br>
&gt; equivalent) upstream? I know its a hack and will add proper CPU family=
<br>
&gt; checks, but the linux-x86 folks still may not even touch it. Meanwhile=
<br>
&gt; AMD gains market share and as such more people will try to run non-roo=
t<br>
&gt; Linux with their CPUs, run into this bug and request support here or<b=
r>
&gt; decide to use other hypervisors.<br>
<br>
Code-wise, I think you can simply set the mask bit unconditionally right<br=
>
after enabling if that is the software-expected state and that is just<br>
not available on all CPUs. That code path is not timing sensitive.<br>
<br>
But, in order to explain where this comes from and what will happen if<br>
not doing that - at least over Jailhouse -, a verbose commit message and<br=
>
likely also a code comment will be needed.<br>
<br>
Jan<br>
</div>
</span></font></div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR07MB542635593444EA2E8226A9D2B2640%40AM0PR07MB=
5426.eurprd07.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR07MB542635593444EA2E8226A9=
D2B2640%40AM0PR07MB5426.eurprd07.prod.outlook.com</a>.<br />

--_000_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_--

--_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: text/plain; name="log.txt"
Content-Description: log.txt
Content-Disposition: attachment; filename="log.txt"; size=25803;
	creation-date="Thu, 09 Jul 2020 14:14:18 GMT";
	modification-date="Thu, 09 Jul 2020 14:15:11 GMT"
Content-Transfer-Encoding: base64

ZmZmZmZmZjAwMDAwNTAKVXNpbmcgeDJBUElDClBhZ2UgcG9vbCB1c2FnZSBhZnRlciBlYXJseSBz
ZXR1cDogbWVtIDUwLzU4MCwgcmVtYXAgMC8xMzEwNzIKSW5pdGlhbGl6aW5nIHByb2Nlc3NvcnM6
CiBDUFUgMS4uLiAoQVBJQyBJRCAyKSBPSwogQ1BVIDIuLi4gKEFQSUMgSUQgNCkgT0sKIENQVSAz
Li4uIChBUElDIElEIDYpIE9LCiBDUFUgMC4uLiAoQVBJQyBJRCAwKSBPSwpJbml0aWFsaXppbmcg
dW5pdDogVlQtZApETUFSIHVuaXQgQDB4ZmVkOTAwMDAvMHgxMDAwCkRNQVIgdW5pdCBAMHhmZWQ5
MTAwMC8weDEwMDAKUmVzZXJ2aW5nIDEyMCBpbnRlcnJ1cHQocykgZm9yIGRldmljZSBmMDoxZi4w
IGF0IGluZGV4IDAKSW5pdGlhbGl6aW5nIHVuaXQ6IElPQVBJQwpJbml0aWFsaXppbmcgdW5pdDog
Q2FjaGUgQWxsb2NhdGlvbiBUZWNobm9sb2d5CkluaXRpYWxpemluZyB1bml0OiBQQ0kKQWRkaW5n
IFBDSSBkZXZpY2UgMDA6MDAuMCB0byBjZWxsICJSb290Q2VsbCIKQWRkaW5nIFBDSSBkZXZpY2Ug
MDA6MDEuMCB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBk
ZXZpY2UgMDA6MDEuMCBhdCBpbmRleCAxMjAKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MDEuMiB0byBj
ZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MDEu
MiBhdCBpbmRleCAxMjEKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MDIuMCB0byBjZWxsICJSb290Q2Vs
bCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MDIuMCBhdCBpbmRleCAx
MjIKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MTQuMCB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5n
IDggaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MTQuMCBhdCBpbmRleCAxMjMKQWRkaW5nIFBD
SSBkZXZpY2UgMDA6MTQuMiB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0
KHMpIGZvciBkZXZpY2UgMDA6MTQuMiBhdCBpbmRleCAxMzEKQWRkaW5nIFBDSSBkZXZpY2UgMDA6
MTYuMCB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZp
Y2UgMDA6MTYuMCBhdCBpbmRleCAxMzIKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MTcuMCB0byBjZWxs
ICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MTcuMCBh
dCBpbmRleCAxMzMKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MWMuMCB0byBjZWxsICJSb290Q2VsbCIK
UmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MWMuMCBhdCBpbmRleCAxMzQK
QWRkaW5nIFBDSSBkZXZpY2UgMDA6MWYuMCB0byBjZWxsICJSb290Q2VsbCIKQWRkaW5nIFBDSSBk
ZXZpY2UgMDA6MWYuMiB0byBjZWxsICJSb290Q2VsbCIKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MWYu
MyB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2Ug
MDA6MWYuMyBhdCBpbmRleCAxMzUKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MWYuNCB0byBjZWxsICJS
b290Q2VsbCIKQWRkaW5nIFBDSSBkZXZpY2UgMDA6MWYuNiB0byBjZWxsICJSb290Q2VsbCIKUmVz
ZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZvciBkZXZpY2UgMDA6MWYuNiBhdCBpbmRleCAxMzYKQWRk
aW5nIFBDSSBkZXZpY2UgMDI6MDAuMCB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50
ZXJydXB0KHMpIGZvciBkZXZpY2UgMDI6MDAuMCBhdCBpbmRleCAxMzcKQWRkaW5nIFBDSSBkZXZp
Y2UgMDM6MDAuMCB0byBjZWxsICJSb290Q2VsbCIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0KHMpIGZv
ciBkZXZpY2UgMDM6MDAuMCBhdCBpbmRleCAxMzgKQWRkaW5nIHZpcnR1YWwgUENJIGRldmljZSAw
MDowZC4wIHRvIGNlbGwgIlJvb3RDZWxsIgpBZGRpbmcgdmlydHVhbCBQQ0kgZGV2aWNlIDAwOjBl
LjAgdG8gY2VsbCAiUm9vdENlbGwiClBhZ2UgcG9vbCB1c2FnZSBhZnRlciBsYXRlIHNldHVwOiBt
ZW0gMjcyLzU4MCwgcmVtYXAgMTYzOTMvMTMxMDcyCkFjdGl2YXRpbmcgaHlwZXJ2aXNvcgpBZGRp
bmcgdmlydHVhbCBQQ0kgZGV2aWNlIDAwOjBkLjAgdG8gY2VsbCAibGludXgteDg2IgpTaGFyZWQg
bWVtb3J5IGNvbm5lY3Rpb24gZXN0YWJsaXNoZWQsIHBlZXIgY2VsbHM6CiAiUm9vdENlbGwiCkFk
ZGluZyB2aXJ0dWFsIFBDSSBkZXZpY2UgMDA6MGUuMCB0byBjZWxsICJsaW51eC14ODYiClNoYXJl
ZCBtZW1vcnkgY29ubmVjdGlvbiBlc3RhYmxpc2hlZCwgcGVlciBjZWxsczoKICJSb290Q2VsbCIK
UmVtb3ZpbmcgUENJIGRldmljZSAwMDoxZi42IGZyb20gY2VsbCAiUm9vdENlbGwiCkZyZWVpbmcg
MSBpbnRlcnJ1cHQocykgZm9yIGRldmljZSAwMDoxZi42IGF0IGluZGV4IDEzNgpBZGRpbmcgUENJ
IGRldmljZSAwMDoxZi42IHRvIGNlbGwgImxpbnV4LXg4NiIKUmVzZXJ2aW5nIDEgaW50ZXJydXB0
KHMpIGZvciBkZXZpY2UgMDA6MWYuNiBhdCBpbmRleCAxMzYKQ3JlYXRlZCBjZWxsICJsaW51eC14
ODYiClBhZ2UgcG9vbCB1c2FnZSBhZnRlciBjZWxsIGNyZWF0aW9uOiBtZW0gMzY2LzU4MCwgcmVt
YXAgMTYzOTMvMTMxMDcyCkNlbGwgImxpbnV4LXg4NiIgY2FuIGJlIGxvYWRlZApDUFUgMiByZWNl
aXZlZCBTSVBJLCB2ZWN0b3IgMTAwCkNQVSAzIHJlY2VpdmVkIFNJUEksIHZlY3RvciAxMDAKU3Rh
cnRlZCBjZWxsICJsaW51eC14ODYiClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS40LjE3
IChidWlsZGVyQDQ4MWIzYzBmMTVlNykgKGdjYyB2ZXJzaW9uIDguMy4wIChEZWJpYW4gOC4zLjAt
NikpICMxIFNNUCBXZWQgSnVsIDggMjM6Mjk6NTAgVVRDIDIwMjAKWyAgICAwLjAwMDAwMF0gQ29t
bWFuZCBsaW5lOiBjb25zb2xlPXR0eVMwLDk2MDAgY29uc29sZT1qYWlsaG91c2UKWyAgICAwLjAw
MDAwMF0geDg2L2ZwdTogU3VwcG9ydGluZyBYU0FWRSBmZWF0dXJlIDB4MDAxOiAneDg3IGZsb2F0
aW5nIHBvaW50IHJlZ2lzdGVycycKWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogU3VwcG9ydGluZyBY
U0FWRSBmZWF0dXJlIDB4MDAyOiAnU1NFIHJlZ2lzdGVycycKWyAgICAwLjAwMDAwMF0geDg2L2Zw
dTogU3VwcG9ydGluZyBYU0FWRSBmZWF0dXJlIDB4MDA0OiAnQVZYIHJlZ2lzdGVycycKWyAgICAw
LjAwMDAwMF0geDg2L2ZwdTogU3VwcG9ydGluZyBYU0FWRSBmZWF0dXJlIDB4MDA4OiAnTVBYIGJv
dW5kcyByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUg
ZmVhdHVyZSAweDAxMDogJ01QWCBDU1InClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IHhzdGF0ZV9v
ZmZzZXRbMl06ICA1NzYsIHhzdGF0ZV9zaXplc1syXTogIDI1NgpbICAgIDAuMDAwMDAwXSB4ODYv
ZnB1OiB4c3RhdGVfb2Zmc2V0WzNdOiAgODMyLCB4c3RhdGVfc2l6ZXNbM106ICAgNjQKWyAgICAw
LjAwMDAwMF0geDg2L2ZwdTogeHN0YXRlX29mZnNldFs0XTogIDg5NiwgeHN0YXRlX3NpemVzWzRd
OiAgIDY0ClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IEVuYWJsZWQgeHN0YXRlIGZlYXR1cmVzIDB4
MWYsIGNvbnRleHQgc2l6ZSBpcyA5NjAgYnl0ZXMsIHVzaW5nICdjb21wYWN0ZWQnIGZvcm1hdC4K
WyAgICAwLjAwMDAwMF0gQklPUy1wcm92aWRlZCBwaHlzaWNhbCBSQU0gbWFwOgpbICAgIDAuMDAw
MDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDAwMDBmZmZm
Zl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAxMDAw
MDAtMHgwMDAwMDAwMDAwMTAwZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6
IFttZW0gMHgwMDAwMDAwMDAwMjAwMDAwLTB4MDAwMDAwMDAwNDhmZmZmZl0gdXNhYmxlClsgICAg
MC4wMDAwMDBdIGVhcmx5Y29uOiBqYWlsaG91c2UwIGF0IEkvTyBwb3J0IDB4MCAob3B0aW9ucyAn
JykKWyAgICAwLjAwMDAwMF0gcHJpbnRrOiBib290Y29uc29sZSBbamFpbGhvdXNlMF0gZW5hYmxl
ZApbICAgIDAuMDAwMDAwXSBOWCAoRXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uOiBhY3RpdmUK
WyAgICAwLjAwMDAwMF0gZXh0ZW5kZWQgcGh5c2ljYWwgUkFNIG1hcDoKWyAgICAwLjAwMDAwMF0g
cmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwMDAw
MDFmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgw
MDAwMDAwMDAwMDAyMDAwLTB4MDAwMDAwMDAwMDAwMjEyYl0gdXNhYmxlClsgICAgMC4wMDAwMDBd
IHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMDAwMDIxMmMtMHgwMDAwMDAwMDAw
MGZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gcmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4
MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwMDAxMDBmZmZdIHJlc2VydmVkClsgICAgMC4wMDAw
MDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMDAyMDAwMDAtMHgwMDAwMDAw
MDA0OGZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gRE1JIG5vdCBwcmVzZW50IG9yIGludmFs
aWQuClsgICAgMC4wMDAwMDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IEphaWxob3VzZQpbICAgIDAu
MDAwMDAwXSB0c2M6IERldGVjdGVkIDI4MDcuOTcxIE1IeiBwcm9jZXNzb3IKWyAgICAwLjAwMDAx
OV0gbGFzdF9wZm4gPSAweDQ5MDAgbWF4X2FyY2hfcGZuID0gMHg0MDAwMDAwMDAKWyAgICAwLjAx
MDM4Nl0geDg2L1BBVDogQ29uZmlndXJhdGlvbiBbMC03XTogV0IgIFdDICBVQy0gVUMgIFdCICBX
UCAgVUMtIFdUICAKWyAgICAwLjAyMTAwNl0geDJhcGljOiBlbmFibGVkIGJ5IEJJT1MsIHN3aXRj
aGluZyB0byB4MmFwaWMgb3BzClsgICAgMC4wNDYyMDRdIFVzaW5nIEdCIHBhZ2VzIGZvciBkaXJl
Y3QgbWFwcGluZwpbICAgIDAuMDU2MzYyXSBSQU1ESVNLOiBbbWVtIDB4MDNhYjgwMDAtMHgwNDMx
ZWZmZl0KWyAgICAwLjA2NjUwMV0gWm9uZSByYW5nZXM6ClsgICAgMC4wNzY1MDJdICAgRE1BICAg
ICAgW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwZmZmZmZmXQpbICAgIDAuMDg2
NTI3XSAgIERNQTMyICAgIFttZW0gMHgwMDAwMDAwMDAxMDAwMDAwLTB4MDAwMDAwMDAwNDhmZmZm
Zl0KWyAgICAwLjA5NjU1Nl0gICBOb3JtYWwgICBlbXB0eQpbICAgIDAuMTA2NTUzXSBNb3ZhYmxl
IHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMTE2NTYyXSBFYXJseSBtZW1vcnkgbm9k
ZSByYW5nZXMKWyAgICAwLjEyNjYwM10gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMDAwMDEw
MDAtMHgwMDAwMDAwMDAwMDlmZmZmXQpbICAgIDAuMTM2NjQwXSAgIG5vZGUgICAwOiBbbWVtIDB4
MDAwMDAwMDAwMDIwMDAwMC0weDAwMDAwMDAwMDQ4ZmZmZmZdClsgICAgMC4xNDY3MTddIFplcm9l
ZCBzdHJ1Y3QgcGFnZSBpbiB1bmF2YWlsYWJsZSByYW5nZXM6IDM1MyBwYWdlcwpbICAgIDAuMTQ2
NzE5XSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDAwMDAwMTAwMC0weDAwMDAw
MDAwMDQ4ZmZmZmZdClsgICAgMC4xNjY5ODldIFNldHRpbmcgQVBJQyByb3V0aW5nIHRvIHBoeXNp
Y2FsIHgyYXBpYy4KWyAgICAwLjE3NzA4Ml0gSU9BUElDWzBdOiBhcGljX2lkIDAsIHZlcnNpb24g
MzIsIGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMTE5ClsgICAgMC4xODcxMTVdIHNtcGJvb3Q6
IEFsbG93aW5nIDIgQ1BVcywgMCBob3RwbHVnIENQVXMKWyAgICAwLjE5NzE0Ml0gW21lbSAweDA0
OTAwMDAwLTB4ZmZmZmZmZmZdIGF2YWlsYWJsZSBmb3IgUENJIGRldmljZXMKWyAgICAwLjIwNzE3
MF0gQm9vdGluZyBwYXJhdmlydHVhbGl6ZWQga2VybmVsIG9uIGJhcmUgaGFyZHdhcmUKWyAgICAw
LjIxNzE5Ml0gY2xvY2tzb3VyY2U6IHJlZmluZWQtamlmZmllczogbWFzazogMHhmZmZmZmZmZiBt
YXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogNzY0NTUxOTYwMDIxMTU2OCBucwpb
ICAgIDAuMzExNzMxXSBzZXR1cF9wZXJjcHU6IE5SX0NQVVM6OTYgbnJfY3B1bWFza19iaXRzOjk2
IG5yX2NwdV9pZHM6MiBucl9ub2RlX2lkczoxClsgICAgMC4zMjE5MzVdIHBlcmNwdTogRW1iZWRk
ZWQgNTAgcGFnZXMvY3B1IHMxNjYyOTYgcjgxOTIgZDMwMzEyIHUxMDQ4NTc2ClsgICAgMC4zMzIw
NTRdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGluZyBvbi4gIFRvdGFsIHBhZ2Vz
OiAxODA2MQpbICAgIDAuMzQyMTMwXSBLZXJuZWwgY29tbWFuZCBsaW5lOiBjb25zb2xlPXR0eVMw
LDk2MDAgY29uc29sZT1qYWlsaG91c2UKWyAgICAwLjM1MjI2Ml0gRGVudHJ5IGNhY2hlIGhhc2gg
dGFibGUgZW50cmllczogMTYzODQgKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVhcikKWyAg
ICAwLjM2MjMxNF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjog
NCwgNjU1MzYgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjM3MjQwN10gbWVtIGF1dG8taW5pdDogc3Rh
Y2s6b2ZmLCBoZWFwIGFsbG9jOm9mZiwgaGVhcCBmcmVlOm9mZgpbICAgIDAuMzgyNjE2XSBNZW1v
cnk6IDM5NDA4Sy83MzM0MEsgYXZhaWxhYmxlICgxMDI0M0sga2VybmVsIGNvZGUsIDEzMjBLIHJ3
ZGF0YSwgMjU2MEsgcm9kYXRhLCAxMjA0SyBpbml0LCAxMTY0SyBic3MsIDMzOTMySyByZXNlcnZl
ZCwgMEsgY21hLXJlc2VydmVkKQpbICAgIDAuMzkyNzg5XSBLZXJuZWwvVXNlciBwYWdlIHRhYmxl
cyBpc29sYXRpb246IGVuYWJsZWQKWyAgICAwLjQwMjg2MF0gcmN1OiBIaWVyYXJjaGljYWwgUkNV
IGltcGxlbWVudGF0aW9uLgpbICAgIDAuNDEyODc5XSByY3U6IAlSQ1UgZXZlbnQgdHJhY2luZyBp
cyBlbmFibGVkLgpbICAgIDAuNDIyODk2XSByY3U6IAlSQ1UgcmVzdHJpY3RpbmcgQ1BVcyBmcm9t
IE5SX0NQVVM9OTYgdG8gbnJfY3B1X2lkcz0yLgpbICAgIDAuNDMyOTM1XSByY3U6IFJDVSBjYWxj
dWxhdGVkIHZhbHVlIG9mIHNjaGVkdWxlci1lbmxpc3RtZW50IGRlbGF5IGlzIDI1IGppZmZpZXMu
ClsgICAgMC40NDI5OTZdIHJjdTogQWRqdXN0aW5nIGdlb21ldHJ5IGZvciByY3VfZmFub3V0X2xl
YWY9MTYsIG5yX2NwdV9pZHM9MgpbICAgIDAuNDU1NjMxXSBOUl9JUlFTOiA2NDAwLCBucl9pcnFz
OiA1MTIsIHByZWFsbG9jYXRlZCBpcnFzOiAwClsgICAgMC40NjU5ODJdIHJhbmRvbTogZ2V0X3Jh
bmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBzdGFydF9rZXJuZWwrMHgzMWQvMHg1MDQgd2l0aCBjcm5n
X2luaXQ9MApbICAgIDAuNDc2MTU1XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDI1
ClsgICAgMC40ODYxNzVdIEVuYWJsaW5nIFVBUlQwIChwb3J0IDB4M2Y4KQpbICAgIDAuMDAwMDAw
XSBMaW51eCB2ZXJzaW9uIDUuNC4xNyAoYnVpbGRlckA0ODFiM2MwZjE1ZTcpIChnY2MgdmVyc2lv
biA4LjMuMCAoRGViaWFuIDguMy4wLTYpKSAjMSBTTVAgV2VkIEp1bCA4IDIzOjI5OjUwIFVUQyAy
MDIwClsgICAgMC4wMDAwMDBdIENvbW1hbmQgbGluZTogY29uc29sZT10dHlTMCw5NjAwIGNvbnNv
bGU9amFpbGhvdXNlClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVh
dHVyZSAweDAwMTogJ3g4NyBmbG9hdGluZyBwb2ludCByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBd
IHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwMjogJ1NTRSByZWdpc3RlcnMn
ClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwNDog
J0FWWCByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUg
ZmVhdHVyZSAweDAwODogJ01QWCBib3VuZHMgcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4ODYv
ZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMTA6ICdNUFggQ1NSJwpbICAgIDAuMDAw
MDAwXSB4ODYvZnB1OiB4c3RhdGVfb2Zmc2V0WzJdOiAgNTc2LCB4c3RhdGVfc2l6ZXNbMl06ICAy
NTYKWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogeHN0YXRlX29mZnNldFszXTogIDgzMiwgeHN0YXRl
X3NpemVzWzNdOiAgIDY0ClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IHhzdGF0ZV9vZmZzZXRbNF06
ICA4OTYsIHhzdGF0ZV9zaXplc1s0XTogICA2NApbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBFbmFi
bGVkIHhzdGF0ZSBmZWF0dXJlcyAweDFmLCBjb250ZXh0IHNpemUgaXMgOTYwIGJ5dGVzLCB1c2lu
ZyAnY29tcGFjdGVkJyBmb3JtYXQuClsgICAgMC4wMDAwMDBdIEJJT1MtcHJvdmlkZWQgcGh5c2lj
YWwgUkFNIG1hcDoKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDAw
MDAwMC0weDAwMDAwMDAwMDAwZmZmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6
IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDAwMDEwMGZmZl0gcmVzZXJ2ZWQKWyAg
ICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDIwMDAwMC0weDAwMDAwMDAw
MDQ4ZmZmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBlYXJseWNvbjogamFpbGhvdXNlMCBhdCBJ
L08gcG9ydCAweDAgKG9wdGlvbnMgJycpClsgICAgMC4wMDAwMDBdIHByaW50azogYm9vdGNvbnNv
bGUgW2phaWxob3VzZTBdIGVuYWJsZWQKWyAgICAwLjAwMDAwMF0gTlggKEV4ZWN1dGUgRGlzYWJs
ZSkgcHJvdGVjdGlvbjogYWN0aXZlClsgICAgMC4wMDAwMDBdIGV4dGVuZGVkIHBoeXNpY2FsIFJB
TSBtYXA6ClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAw
MDAwMDAwMDAtMHgwMDAwMDAwMDAwMDAxZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gcmVzZXJ2
ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDAwMDAwMjAwMC0weDAwMDAwMDAwMDAwMDIxMmJd
IHVzYWJsZQpbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAwMDAw
MDAwMDAyMTJjLTB4MDAwMDAwMDAwMDBmZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIHJlc2Vy
dmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMDAxMDAwMDAtMHgwMDAwMDAwMDAwMTAwZmZm
XSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAw
MDAwMDAwMjAwMDAwLTB4MDAwMDAwMDAwNDhmZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIERN
SSBub3QgcHJlc2VudCBvciBpbnZhbGlkLgpbICAgIDAuMDAwMDAwXSBIeXBlcnZpc29yIGRldGVj
dGVkOiBKYWlsaG91c2UKWyAgICAwLjAwMDAwMF0gdHNjOiBEZXRlY3RlZCAyODA3Ljk3MSBNSHog
cHJvY2Vzc29yClsgICAgMC4wMDAwMTldIGxhc3RfcGZuID0gMHg0OTAwIG1heF9hcmNoX3BmbiA9
IDB4NDAwMDAwMDAwClsgICAgMC4wMTAzODZdIHg4Ni9QQVQ6IENvbmZpZ3VyYXRpb24gWzAtN106
IFdCICBXQyAgVUMtIFVDICBXQiAgV1AgIFVDLSBXVCAgClsgICAgMC4wMjEwMDZdIHgyYXBpYzog
ZW5hYmxlZCBieSBCSU9TLCBzd2l0Y2hpbmcgdG8geDJhcGljIG9wcwpbICAgIDAuMDQ2MjA0XSBV
c2luZyBHQiBwYWdlcyBmb3IgZGlyZWN0IG1hcHBpbmcKWyAgICAwLjA1NjM2Ml0gUkFNRElTSzog
W21lbSAweDAzYWI4MDAwLTB4MDQzMWVmZmZdClsgICAgMC4wNjY1MDFdIFpvbmUgcmFuZ2VzOgpb
ICAgIDAuMDc2NTAyXSAgIERNQSAgICAgIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAw
MDAwMGZmZmZmZl0KWyAgICAwLjA4NjUyN10gICBETUEzMiAgICBbbWVtIDB4MDAwMDAwMDAwMTAw
MDAwMC0weDAwMDAwMDAwMDQ4ZmZmZmZdClsgICAgMC4wOTY1NTZdICAgTm9ybWFsICAgZW1wdHkK
WyAgICAwLjEwNjU1M10gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUKWyAgICAwLjEx
NjU2Ml0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzClsgICAgMC4xMjY2MDNdICAgbm9kZSAgIDA6
IFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAwMDAwMDA5ZmZmZl0KWyAgICAwLjEzNjY0
MF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMDAyMDAwMDAtMHgwMDAwMDAwMDA0OGZmZmZm
XQpbICAgIDAuMTQ2NzE3XSBaZXJvZWQgc3RydWN0IHBhZ2UgaW4gdW5hdmFpbGFibGUgcmFuZ2Vz
OiAzNTMgcGFnZXMKWyAgICAwLjE0NjcxOV0gSW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbSAweDAw
MDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDA0OGZmZmZmXQpbICAgIDAuMTY2OTg5XSBTZXR0aW5n
IEFQSUMgcm91dGluZyB0byBwaHlzaWNhbCB4MmFwaWMuClsgICAgMC4xNzcwODJdIElPQVBJQ1sw
XTogYXBpY19pZCAwLCB2ZXJzaW9uIDMyLCBhZGRyZXNzIDB4ZmVjMDAwMDAsIEdTSSAwLTExOQpb
ICAgIDAuMTg3MTE1XSBzbXBib290OiBBbGxvd2luZyAyIENQVXMsIDAgaG90cGx1ZyBDUFVzClsg
ICAgMC4xOTcxNDJdIFttZW0gMHgwNDkwMDAwMC0weGZmZmZmZmZmXSBhdmFpbGFibGUgZm9yIFBD
SSBkZXZpY2VzClsgICAgMC4yMDcxNzBdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBv
biBiYXJlIGhhcmR3YXJlClsgICAgMC4yMTcxOTJdIGNsb2Nrc291cmNlOiByZWZpbmVkLWppZmZp
ZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6
IDc2NDU1MTk2MDAyMTE1NjggbnMKWyAgICAwLjMxMTczMV0gc2V0dXBfcGVyY3B1OiBOUl9DUFVT
Ojk2IG5yX2NwdW1hc2tfYml0czo5NiBucl9jcHVfaWRzOjIgbnJfbm9kZV9pZHM6MQpbICAgIDAu
MzIxOTM1XSBwZXJjcHU6IEVtYmVkZGVkIDUwIHBhZ2VzL2NwdSBzMTY2Mjk2IHI4MTkyIGQzMDMx
MiB1MTA0ODU3NgpbICAgIDAuMzMyMDU0XSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3Jv
dXBpbmcgb24uICBUb3RhbCBwYWdlczogMTgwNjEKWyAgICAwLjM0MjEzMF0gS2VybmVsIGNvbW1h
bmQgbGluZTogY29uc29sZT10dHlTMCw5NjAwIGNvbnNvbGU9amFpbGhvdXNlClsgICAgMC4zNTIy
NjJdIERlbnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDE2Mzg0IChvcmRlcjogNSwgMTMx
MDcyIGJ5dGVzLCBsaW5lYXIpClsgICAgMC4zNjIzMTRdIElub2RlLWNhY2hlIGhhc2ggdGFibGUg
ZW50cmllczogODE5MiAob3JkZXI6IDQsIDY1NTM2IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4zNzI0
MDddIG1lbSBhdXRvLWluaXQ6IHN0YWNrOm9mZiwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpv
ZmYKWyAgICAwLjM4MjYxNl0gTWVtb3J5OiAzOTQwOEsvNzMzNDBLIGF2YWlsYWJsZSAoMTAyNDNL
IGtlcm5lbCBjb2RlLCAxMzIwSyByd2RhdGEsIDI1NjBLIHJvZGF0YSwgMTIwNEsgaW5pdCwgMTE2
NEsgYnNzLCAzMzkzMksgcmVzZXJ2ZWQsIDBLIGNtYS1yZXNlcnZlZCkKWyAgICAwLjM5Mjc4OV0g
S2VybmVsL1VzZXIgcGFnZSB0YWJsZXMgaXNvbGF0aW9uOiBlbmFibGVkClsgICAgMC40MDI4NjBd
IHJjdTogSGllcmFyY2hpY2FsIFJDVSBpbXBsZW1lbnRhdGlvbi4KWyAgICAwLjQxMjg3OV0gcmN1
OiAJUkNVIGV2ZW50IHRyYWNpbmcgaXMgZW5hYmxlZC4KWyAgICAwLjQyMjg5Nl0gcmN1OiAJUkNV
IHJlc3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTk2IHRvIG5yX2NwdV9pZHM9Mi4KWyAgICAw
LjQzMjkzNV0gcmN1OiBSQ1UgY2FsY3VsYXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVu
dCBkZWxheSBpcyAyNSBqaWZmaWVzLgpbICAgIDAuNDQyOTk2XSByY3U6IEFkanVzdGluZyBnZW9t
ZXRyeSBmb3IgcmN1X2Zhbm91dF9sZWFmPTE2LCBucl9jcHVfaWRzPTIKWyAgICAwLjQ1NTYzMV0g
TlJfSVJRUzogNjQwMCwgbnJfaXJxczogNTEyLCBwcmVhbGxvY2F0ZWQgaXJxczogMApbICAgIDAu
NDY1OTgyXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZyb20gc3RhcnRfa2VybmVs
KzB4MzFkLzB4NTA0IHdpdGggY3JuZ19pbml0PTAKWyAgICAwLjQ3NjE1NV0gQ29uc29sZTogY29s
b3VyIGR1bW15IGRldmljZSA4MHgyNQpbICAgIDAuNDg2MTc1XSBFbmFibGluZyBVQVJUMCAocG9y
dCAweDNmOCkKWyAgICA2LjAzNDgzMl0gcHJpbnRrOiBjb25zb2xlIFt0dHlTMF0gZW5hYmxlZApb
ICAgIDYuMDk0NTk3XSBBUElDOiBTd2l0Y2ggdG8gc3ltbWV0cmljIEkvTyBtb2RlIHNldHVwClsg
ICAgNi4xNjY5MDldIGNsb2Nrc291cmNlOiB0c2MtZWFybHk6IG1hc2s6IDB4ZmZmZmZmZmZmZmZm
ZmZmZiBtYXhfY3ljbGVzOiAweDI4NzlhYWJkZDA2LCBtYXhfaWRsZV9uczogNDQwNzk1MzQyNTIy
IG5zClsgICAgNi4zMDIzNzZdIENhbGlicmF0aW5nIGRlbGF5IGxvb3AgKHNraXBwZWQpLCB2YWx1
ZSBjYWxjdWxhdGVkIHVzaW5nIHRpbWVyIGZyZXF1ZW5jeS4uIDU2MTUuOTQgQm9nb01JUFMgKGxw
aj0xMTIzMTg4NCkKWyAgICA2LjMwNjM3MV0gcGlkX21heDogZGVmYXVsdDogMzI3NjggbWluaW11
bTogMzAxClsgICAgNi4zMDYzNzFdIExTTTogU2VjdXJpdHkgRnJhbWV3b3JrIGluaXRpYWxpemlu
ZwpbICAgIDYuMzA2MzcxXSBTRUxpbnV4OiAgSW5pdGlhbGl6aW5nLgpbICAgIDYuMzA2MzcxXSBN
b3VudC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3JkZXI6IDAsIDQwOTYgYnl0ZXMs
IGxpbmVhcikKWyAgICA2LjMwNjM3MV0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJp
ZXM6IDUxMiAob3JkZXI6IDAsIDQwOTYgYnl0ZXMsIGxpbmVhcikKWyAgICA2LjMwNjM3MV0gcHJv
Y2VzczogdXNpbmcgbXdhaXQgaW4gaWRsZSB0aHJlYWRzClsgICAgNi4zMDYzNzFdIExhc3QgbGV2
ZWwgaVRMQiBlbnRyaWVzOiA0S0IgMTI4LCAyTUIgOCwgNE1CIDgKWyAgICA2LjMwNjM3MV0gTGFz
dCBsZXZlbCBkVExCIGVudHJpZXM6IDRLQiA2NCwgMk1CIDAsIDRNQiAwLCAxR0IgNApbICAgIDYu
MzA2MzcxXSBTcGVjdHJlIFYxIDogTWl0aWdhdGlvbjogdXNlcmNvcHkvc3dhcGdzIGJhcnJpZXJz
IGFuZCBfX3VzZXIgcG9pbnRlciBzYW5pdGl6YXRpb24KWyAgICA2LjMwNjM3MV0gU3BlY3RyZSBW
MiA6IE1pdGlnYXRpb246IEZ1bGwgZ2VuZXJpYyByZXRwb2xpbmUKWyAgICA2LjMwNjM3MV0gU3Bl
Y3RyZSBWMiA6IFNwZWN0cmUgdjIgLyBTcGVjdHJlUlNCIG1pdGlnYXRpb246IEZpbGxpbmcgUlNC
IG9uIGNvbnRleHQgc3dpdGNoClsgICAgNi4zMDYzNzFdIFNwZWN0cmUgVjIgOiBFbmFibGluZyBS
ZXN0cmljdGVkIFNwZWN1bGF0aW9uIGZvciBmaXJtd2FyZSBjYWxscwpbICAgIDYuMzA2MzcxXSBT
cGVjdHJlIFYyIDogbWl0aWdhdGlvbjogRW5hYmxpbmcgY29uZGl0aW9uYWwgSW5kaXJlY3QgQnJh
bmNoIFByZWRpY3Rpb24gQmFycmllcgpbICAgIDYuMzA2MzcxXSBTcGVjdHJlIFYyIDogVXNlciBz
cGFjZTogTWl0aWdhdGlvbjogU1RJQlAgdmlhIHNlY2NvbXAgYW5kIHByY3RsClsgICAgNi4zMDYz
NzFdIFNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzczogTWl0aWdhdGlvbjogU3BlY3VsYXRpdmUgU3Rv
cmUgQnlwYXNzIGRpc2FibGVkIHZpYSBwcmN0bCBhbmQgc2VjY29tcApbICAgIDYuMzA2MzcxXSBN
RFM6IE1pdGlnYXRpb246IENsZWFyIENQVSBidWZmZXJzClsgICAgNi4zMDYzNzFdIEZyZWVpbmcg
U01QIGFsdGVybmF0aXZlcyBtZW1vcnk6IDE2SwpbICAgIDYuMzA2MzcxXSBzbXBib290OiBDUFUw
OiBJbnRlbChSKSBDb3JlKFRNKSBpNy03NzAwSFEgQ1BVIEAgMi44MEdIeiAoZmFtaWx5OiAweDYs
IG1vZGVsOiAweDllLCBzdGVwcGluZzogMHg5KQpbICAgIDYuMzA2NDk2XSBQZXJmb3JtYW5jZSBF
dmVudHM6IFBFQlMgZm10MyssIFNreWxha2UgZXZlbnRzLCAzMi1kZWVwIExCUiwgZnVsbC13aWR0
aCBjb3VudGVycywgSW50ZWwgUE1VIGRyaXZlci4KWyAgICA2LjMxMDM3OV0gLi4uIHZlcnNpb246
ICAgICAgICAgICAgICAgIDQKWyAgICA2LjMxNDM3NV0gLi4uIGJpdCB3aWR0aDogICAgICAgICAg
ICAgIDQ4ClsgICAgNi4zMTgzNzVdIC4uLiBnZW5lcmljIHJlZ2lzdGVyczogICAgICA4ClsgICAg
Ni4zMjIzNzNdIC4uLiB2YWx1ZSBtYXNrOiAgICAgICAgICAgICAwMDAwZmZmZmZmZmZmZmZmClsg
ICAgNi4zMjYzNzZdIC4uLiBtYXggcGVyaW9kOiAgICAgICAgICAgICAwMDAwN2ZmZmZmZmZmZmZm
ClsgICAgNi4zMzAzNzVdIC4uLiBmaXhlZC1wdXJwb3NlIGV2ZW50czogICAzClsgICAgNi4zMzQz
NzVdIC4uLiBldmVudCBtYXNrOiAgICAgICAgICAgICAwMDAwMDAwNzAwMDAwMGZmClsgICAgNi4z
Mzg0NDJdIHJjdTogSGllcmFyY2hpY2FsIFNSQ1UgaW1wbGVtZW50YXRpb24uClsgICAgNi4zNDI0
ODddIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMgLi4uClsgICAgNi4zNDY1MjBdIHg4
NjogQm9vdGluZyBTTVAgY29uZmlndXJhdGlvbjoKQ1BVIDMgcmVjZWl2ZWQgU0lQSSwgdmVjdG9y
IDlhClsgICAgNi4zNTAzODFdIC4uLi4gbm9kZSAgIzAsIENQVXM6ICAgICAgIzEKWyAgICA2LjM2
MDkxOV0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgMiBDUFVzClsgICAgNi4zNjYzNzZdIHNtcGJv
b3Q6IE1heCBsb2dpY2FsIHBhY2thZ2VzOiAxClsgICAgNi4zNzAzNzZdIHNtcGJvb3Q6IFRvdGFs
IG9mIDIgcHJvY2Vzc29ycyBhY3RpdmF0ZWQgKDExMjMxLjg4IEJvZ29NSVBTKQpbICAgIDYuMzc0
Nzk2XSBkZXZ0bXBmczogaW5pdGlhbGl6ZWQKWyAgICA2LjQyMjU0MV0gY2xvY2tzb3VyY2U6IGpp
ZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVf
bnM6IDc2NDUwNDE3ODUxMDAwMDAgbnMKWyAgICA2LjU1MDM4NF0gZnV0ZXggaGFzaCB0YWJsZSBl
bnRyaWVzOiA1MTIgKG9yZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFyKQpbICAgIDYuNjM4NDQ3
XSB4b3I6IGF1dG9tYXRpY2FsbHkgdXNpbmcgYmVzdCBjaGVja3N1bW1pbmcgZnVuY3Rpb24gICBh
dnggICAgICAgClsgICAgNi43MzQ0ODNdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkg
MTYKWyAgICA2LjczODQ0M10gYXVkaXQ6IGluaXRpYWxpemluZyBuZXRsaW5rIHN1YnN5cyAoZGlz
YWJsZWQpClsgICAgNi43NDI0MDJdIGF1ZGl0OiB0eXBlPTIwMDAgYXVkaXQoMC40NDA6MSk6IHN0
YXRlPWluaXRpYWxpemVkIGF1ZGl0X2VuYWJsZWQ9MCByZXM9MQpbICAgIDYuODQyMzg1XSBjcHVp
ZGxlOiB1c2luZyBnb3Zlcm5vciBsYWRkZXIKWyAgICA2LjkwMjQwMF0gY3B1aWRsZTogdXNpbmcg
Z292ZXJub3IgbWVudQpbICAgIDYuOTA2NDIyXSBQQ0k6IFVzaW5nIGNvbmZpZ3VyYXRpb24gdHlw
ZSAxIGZvciBiYXNlIGFjY2VzcwpbICAgIDYuOTEwMzgxXSBQQ0k6IE1NQ09ORklHIGZvciBkb21h
aW4gMDAwMCBbYnVzIDAwLWZmXSBhdCBbbWVtIDB4ZjgwMDAwMDAtMHgxMDdmZmZmZmZdIChiYXNl
IDB4ZjgwMDAwMDApClsgICAgNi45ODIzNzNdIHJhaWQ2OiBhdngyeDQgICBnZW4oKSAyNTAxNyBN
Qi9zClsgICAgNy4xMTAzNzJdIHJhaWQ2OiBhdngyeDQgICB4b3IoKSAxODg0NSBNQi9zClsgICAg
Ny4yMzgzNzJdIHJhaWQ2OiBhdngyeDIgICBnZW4oKSAyNTE5NSBNQi9zClsgICAgNy4zMjYzNzVd
IGNsb2Nrc291cmNlOiB0aW1la2VlcGluZyB3YXRjaGRvZyBvbiBDUFUxOiBNYXJraW5nIGNsb2Nr
c291cmNlICd0c2MtZWFybHknIGFzIHVuc3RhYmxlIGJlY2F1c2UgdGhlIHNrZXcgaXMgdG9vIGxh
cmdlOgpbICAgIDcuNDc0Mzc3XSBjbG9ja3NvdXJjZTogICAgICAgICAgICAgICAgICAgICAgICdy
ZWZpbmVkLWppZmZpZXMnIHdkX25vdzogZmZmZWRjMDggd2RfbGFzdDogZmZmZWRiODggbWFzazog
ZmZmZmZmZmYKWyAgICA3LjYwNjM3Nl0gY2xvY2tzb3VyY2U6ICAgICAgICAgICAgICAgICAgICAg
ICAndHNjLWVhcmx5JyBjc19ub3c6IDhlMGJjYzUyMzMgY3NfbGFzdDogOGQ4Y2Y3ZTMzMCBtYXNr
OiBmZmZmZmZmZmZmZmZmZmZmClsgICAgNy43NDYzNzZdIHRzYzogTWFya2luZyBUU0MgdW5zdGFi
bGUgZHVlIHRvIGNsb2Nrc291cmNlIHdhdGNoZG9nClsgICAgNy44MzAzODVdIHJhaWQ2OiBhdngy
eDIgICB4b3IoKSAgNjE0NSBNQi9zClsgICAgNy45NTgzNzJdIHJhaWQ2OiBhdngyeDEgICBnZW4o
KSAyMDUwOCBNQi9zClsgICAgOC4wODU0MDZdIHJhaWQ2OiBhdngyeDEgICB4b3IoKSAxMzE4NyBN
Qi9zClsgICAgOC4yMTQzNzRdIHJhaWQ2OiBzc2UyeDQgICBnZW4oKSAxMjE5OCBNQi9zClsgICAg
OC4zNDIzNzRdIHJhaWQ2OiBzc2UyeDQgICB4b3IoKSAgNzc4NSBNQi9zClsgICAgOC40NzAzNzRd
IHJhaWQ2OiBzc2UyeDIgICBnZW4oKSAxMDM4OSBNQi9zClsgICAgOC41OTgzNzJdIHJhaWQ2OiBz
c2UyeDIgICB4b3IoKSAgNjg0MCBNQi9zClsgICAgOC43MjU0MTFdIHJhaWQ2OiBzc2UyeDEgICBn
ZW4oKSAgOTEzNSBNQi9zClsgICAgOC44NTQzNzVdIHJhaWQ2OiBzc2UyeDEgICB4b3IoKSAgNTE2
MSBNQi9zClsgICAgOC45MTQzNzZdIHJhaWQ2OiB1c2luZyBhbGdvcml0aG0gYXZ4MngyIGdlbigp
IDI1MTk1IE1CL3MKWyAgICA4Ljk5MDM3Nl0gcmFpZDY6IC4uLi4geG9yKCkgNjE0NSBNQi9zLCBy
bXcgZW5hYmxlZApbICAgIDkuMDU4Mzc2XSByYWlkNjogdXNpbmcgYXZ4MngyIHJlY292ZXJ5IGFs
Z29yaXRobQpbICAgIDkuMTI2NDExXSBBQ1BJOiBJbnRlcnByZXRlciBkaXNhYmxlZC4KWyAgICA5
LjE4MjM5Nl0gaW9tbXU6IERlZmF1bHQgZG9tYWluIHR5cGU6IFRyYW5zbGF0ZWQgClsgICAgOS4y
NTA0MTZdIHZnYWFyYjogbG9hZGVkClsgICAgOS4yOTA0NTRdIFNDU0kgc3Vic3lzdGVtIGluaXRp
YWxpemVkClsgICAgOS4zNDY0MzBdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBk
cml2ZXIgdXNiZnMKWyAgICA5LjQyMjQxNF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJm
YWNlIGRyaXZlciBodWIKWyAgICA5LjQ5NDM5Nl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgZGV2
aWNlIGRyaXZlciB1c2IKWyAgICA5LjU2NjQwNF0gcHBzX2NvcmU6IExpbnV4UFBTIEFQSSB2ZXIu
IDEgcmVnaXN0ZXJlZApbICAgIDkuNjM0Mzc1XSBwcHNfY29yZTogU29mdHdhcmUgdmVyLiA1LjMu
NiAtIENvcHlyaWdodCAyMDA1LTIwMDcgUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGludXgu
aXQ+ClsgICAgOS43NTQzODldIFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQKWyAgICA5Ljgx
MDQxM10gUENJOiBQcm9iaW5nIFBDSSBoYXJkd2FyZQpbICAgIDkuODY2NDExXSBQQ0kgaG9zdCBi
cmlkZ2UgdG8gYnVzIDAwMDA6MDAKWyAgICA5LjkyMjM3OV0gcGNpX2J1cyAwMDAwOjAwOiByb290
IGJ1cyByZXNvdXJjZSBbaW8gIDB4MDAwMC0weGZmZmZdClsgICAxMC4wMDYzODFdIHBjaV9idXMg
MDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweDAwMDAwMDAwLTB4N2ZmZmZmZmZmZl0K
WyAgIDEwLjEwMjM3OF0gcGNpX2J1cyAwMDAwOjAwOiBObyBidXNuIHJlc291cmNlIGZvdW5kIGZv
ciByb290IGJ1cywgd2lsbCB1c2UgW2J1cyAwMC1mZl0KWyAgIDEwLjIwNjUxMl0gcGNpIDAwMDA6
MDA6MGQuMDogWzExMGE6NDEwNl0gdHlwZSAwMCBjbGFzcyAweGZmMDAwMQpbICAgMTAuMjg2Mzk4
XSBwY2kgMDAwMDowMDowZC4wOiByZWcgMHgxMDogW21lbSAweDAwMDAwMDAwLTB4MDAwMDBmZmZd
ClsgICAxMC4zNzQzODhdIHBjaSAwMDAwOjAwOjBkLjA6IHJlZyAweDE0OiBbbWVtIDB4MDAwMDAw
MDAtMHgwMDAwMDFmZl0KWyAgIDEwLjQ1ODQ5MV0gcGNpIDAwMDA6MDA6MGUuMDogWzExMGE6NDEw
Nl0gdHlwZSAwMCBjbGFzcyAweGZmMDAwMApbICAgMTAuNTM4Mzk3XSBwY2kgMDAwMDowMDowZS4w
OiByZWcgMHgxMDogW21lbSAweDAwMDAwMDAwLTB4MDAwMDBmZmZdClsgICAxMC42MjYzODZdIHBj
aSAwMDAwOjAwOjBlLjA6IHJlZyAweDE0OiBbbWVtIDB4MDAwMDAwMDAtMHgwMDAwMDFmZl0KWyAg
IDEwLjcxMDY2M10gcGNpIDAwMDA6MDA6MWYuNjogWzgwODY6MTVkNl0gdHlwZSAwMCBjbGFzcyAw
eDAyMDAwMApbICAgMTAuNzkwNDI2XSBwY2kgMDAwMDowMDoxZi42OiByZWcgMHgxMDogW21lbSAw
eGYyMTAwMDAwLTB4ZjIxMWZmZmZdClsgICAxMC44NzQ1MTddIHBjaSAwMDAwOjAwOjFmLjY6IFBN
RSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xkClsgICAxMC45NTg0NjddIHBjaV9idXMg
MDAwMDowMDogYnVzbl9yZXM6IFtidXMgMDAtZmZdIGVuZCBpcyB1cGRhdGVkIHRvIDAwClsgICAx
MS4xMDY1NDFdIGNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSByZWZpbmVkLWpp
ZmZpZXMKWyAgIDExLjMzNjcyN10gVkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82LjYuMApbICAgMTEu
Mzk0NDEyXSBWRlM6IERxdW90LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRlciAw
LCA0MDk2IGJ5dGVzKQpbICAgMTEuNDg2NDM0XSBwbnA6IFBuUCBBQ1BJOiBkaXNhYmxlZApbICAg
MTEuNTM4NDM2XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICdzdGVw
X3dpc2UnClsgICAxMS41NDY0MDBdIGNsb2Nrc291cmNlOiBhY3BpX3BtOiBtYXNrOiAweGZmZmZm
ZiBtYXhfY3ljbGVzOiAweGZmZmZmZiwgbWF4X2lkbGVfbnM6IDIwODU3MDEwMjQgbnMKWyAgIDEx
Ljc0MjQyN10gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIGFjcGlfcG0KWyAg
IDExLjgxNTcwNl0gcGNpIDAwMDA6MDA6MGQuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0gMHgwODAw
MDAwMC0weDA4MDAwZmZmXQpbICAgMTEuOTA2NjMxXSBwY2kgMDAwMDowMDowZS4wOiBCQVIgMDog
YXNzaWduZWQgW21lbSAweDA4MDAxMDAwLTB4MDgwMDFmZmZdClsgICAxMS45OTc1MjRdIHBjaSAw
MDAwOjAwOjBkLjA6IEJBUiAxOiBhc3NpZ25lZCBbbWVtIDB4MDgwMDIwMDAtMHgwODAwMjFmZl0K
WyAgIDEyLjA4ODQxNl0gcGNpIDAwMDA6MDA6MGUuMDogQkFSIDE6IGFzc2lnbmVkIFttZW0gMHgw
ODAwMjIwMC0weDA4MDAyM2ZmXQpbICAgMTIuMTc5MzA4XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291
cmNlIDQgW2lvICAweDAwMDAtMHhmZmZmXQpbICAgMTIuMjU1Njg5XSBwY2lfYnVzIDAwMDA6MDA6
IHJlc291cmNlIDUgW21lbSAweDAwMDAwMDAwLTB4N2ZmZmZmZmZmZl0KWyAgIDEyLjM0MjQ4MV0g
TkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAyClsgICAxMi40MDQ0NTddIHRjcF9saXN0
ZW5fcG9ydGFkZHJfaGFzaCBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDAsIDQwOTYg
Ynl0ZXMsIGxpbmVhcikKWyAgIDEyLjUxNDAwM10gVENQIGVzdGFibGlzaGVkIGhhc2ggdGFibGUg
ZW50cmllczogMTAyNCAob3JkZXI6IDEsIDgxOTIgYnl0ZXMsIGxpbmVhcikKWyAgIDEyLjYxNTI1
N10gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlcjogMiwgMTYzODQgYnl0
ZXMsIGxpbmVhcikKWyAgIDEyLjcxMDI4Nl0gVENQOiBIYXNoIHRhYmxlcyBjb25maWd1cmVkIChl
c3RhYmxpc2hlZCAxMDI0IGJpbmQgMTAyNCkKWyAgIDEyLjc5NjAyMV0gVURQIGhhc2ggdGFibGUg
ZW50cmllczogMjU2IChvcmRlcjogMSwgODE5MiBieXRlcywgbGluZWFyKQpbICAgMTIuODgzODEy
XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDEsIDgxOTIgYnl0ZXMs
IGxpbmVhcikKWyAgIDEyLjk3NjgzOV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAx
ClsgICAxMy4wMzg4NjddIFJQQzogUmVnaXN0ZXJlZCBuYW1lZCBVTklYIHNvY2tldCB0cmFuc3Bv
cnQgbW9kdWxlLgpbICAgMTMuMTE5Mzk2XSBSUEM6IFJlZ2lzdGVyZWQgdWRwIHRyYW5zcG9ydCBt
b2R1bGUuClsgICAxMy4xODU0MDNdIFJQQzogUmVnaXN0ZXJlZCB0Y3AgdHJhbnNwb3J0IG1vZHVs
ZS4KWyAgIDEzLjI1MTQ1NF0gUlBDOiBSZWdpc3RlcmVkIHRjcCBORlN2NC4xIGJhY2tjaGFubmVs
IHRyYW5zcG9ydCBtb2R1bGUuClsgICAxMy4zMzgyMTZdIFBDSTogQ0xTIDAgYnl0ZXMsIGRlZmF1
bHQgNjQKWyAgIDEzLjM5NDk3NF0gVHJ5aW5nIHRvIHVucGFjayByb290ZnMgaW1hZ2UgYXMgaW5p
dHJhbWZzLi4uClsgICAxMy40NzY5MzFdIEZyZWVpbmcgaW5pdHJkIG1lbW9yeTogODYwNEsKWyAg
IDEzLjUzMzg4NV0gUkFQTCBQTVU6IEFQSSB1bml0IGlzIDJeLTMyIEpvdWxlcywgNSBmaXhlZCBj
b3VudGVycywgNjU1MzYwIG1zIG92ZmwgdGltZXIKWyAgIDEzLjYzODI2NV0gUkFQTCBQTVU6IGh3
IHVuaXQgb2YgZG9tYWluIHBwMC1jb3JlIDJeLTE0IEpvdWxlcwpbICAgMTMuNzE2NzEyXSBSQVBM
IFBNVTogaHcgdW5pdCBvZiBkb21haW4gcGFja2FnZSAyXi0xNCBKb3VsZXMKWyAgIDEzLjc5NDEy
OF0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIGRyYW0gMl4tMTQgSm91bGVzClsgICAxMy44
Njg0MjhdIFJBUEwgUE1VOiBodyB1bml0IG9mIGRvbWFpbiBwcDEtZ3B1IDJeLTE0IEpvdWxlcwpb
ICAgMTMuOTQ1ODM4XSBSQVBMIFBNVTogaHcgdW5pdCBvZiBkb21haW4gcHN5cyAyXi0xNCBKb3Vs
ZXMKWyAgIDE0LjAyMDQ0N10gSW5pdGlhbGlzZSBzeXN0ZW0gdHJ1c3RlZCBrZXlyaW5ncwpbICAg
MTQuMDgzNDM5XSB3b3JraW5nc2V0OiB0aW1lc3RhbXBfYml0cz02MiBtYXhfb3JkZXI9MTQgYnVj
a2V0X29yZGVyPTAKWyAgIDE0LjE3MDUxNF0gTkZTOiBSZWdpc3RlcmluZyB0aGUgaWRfcmVzb2x2
ZXIga2V5IHR5cGUKWyAgIDE0LjI0MDY5Nl0gS2V5IHR5cGUgaWRfcmVzb2x2ZXIgcmVnaXN0ZXJl
ZApbICAgMTQuMzAwNDgzXSBLZXkgdHlwZSBpZF9sZWdhY3kgcmVnaXN0ZXJlZApbICAgMTQuMzU4
MjAwXSBuZnM0ZmlsZWxheW91dF9pbml0OiBORlN2NCBGaWxlIExheW91dCBEcml2ZXIgUmVnaXN0
ZXJpbmcuLi4KWyAgIDE0LjQ0ODA5OF0gOXA6IEluc3RhbGxpbmcgdjlmcyA5cDIwMDAgZmlsZSBz
eXN0ZW0gc3VwcG9ydApbICAgMTQuNTIzNjM4XSBLZXkgdHlwZSBhc3ltbWV0cmljIHJlZ2lzdGVy
ZWQKWyAgIDE0LjU4MjQxNV0gQXN5bW1ldHJpYyBrZXkgcGFyc2VyICd4NTA5JyByZWdpc3RlcmVk
ClsgICAxNC42NTA1MjNdIEJsb2NrIGxheWVyIFNDU0kgZ2VuZXJpYyAoYnNnKSBkcml2ZXIgdmVy
c2lvbiAwLjQgbG9hZGVkIChtYWpvciAyNTEpClsgICAxNC43NDg2OTBdIGlvIHNjaGVkdWxlciBt
cS1kZWFkbGluZSByZWdpc3RlcmVkClsgICAxNC44MTI2NTRdIGlvIHNjaGVkdWxlciBreWJlciBy
ZWdpc3RlcmVkClsgICAxNC44ODA2MTFdIFNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDQgcG9y
dHMsIElSUSBzaGFyaW5nIGVuYWJsZWQKWyAgIDE0Ljk4NjM0NF0gc2VyaWFsODI1MDogdHR5UzAg
YXQgSS9PIDB4M2Y4IChpcnEgPSA0LCBiYXNlX2JhdWQgPSAxMTUyMDApIGlzIGEgMTY1NTBBClsg
ICAxNS4wODg5NzNdIExpbnV4IGFncGdhcnQgaW50ZXJmYWNlIHYwLjEwMwpbICAgMTUuMTQ3NzUx
XSBBTUQtVmk6IEFNRCBJT01NVXYyIGRyaXZlciBieSBKb2VyZyBSb2VkZWwgPGpyb2VkZWxAc3Vz
ZS5kZT4KWyAgIDE1LjIzNzYxMV0gQU1ELVZpOiBBTUQgSU9NTVV2MiBmdW5jdGlvbmFsaXR5IG5v
dCBhdmFpbGFibGUgb24gdGhpcyBzeXN0ZW0KWyAgIDE1LjMzMTA4NV0gYnJkOiBtb2R1bGUgbG9h
ZGVkClsgICAxNS4zNzc0NzFdIGUxMDAwZTogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29yayBEcml2
ZXIgLSAzLjIuNi1rClsgICAxNS40NTY5NThdIGUxMDAwZTogQ29weXJpZ2h0KGMpIDE5OTkgLSAy
MDE1IEludGVsIENvcnBvcmF0aW9uLgpbICAgMTUuNTM3NTQ0XSBlMTAwMGUgMDAwMDowMDoxZi42
OiBlbmFibGluZyBkZXZpY2UgKDA0MDAgLT4gMDQwMikKWyAgIDE1LjYxODA2Ml0gZTEwMDBlIDAw
MDA6MDA6MWYuNjogY2FuJ3QgZmluZCBJUlEgZm9yIFBDSSBJTlQgQTsgcHJvYmFibHkgYnVnZ3kg
TVAgdGFibGUKWyAgIDE1LjcyMjUxN10gZTEwMDBlIDAwMDA6MDA6MWYuNjogSW50ZXJydXB0IFRo
cm90dGxpbmcgUmF0ZSAoaW50cy9zZWMpIHNldCB0byBkeW5hbWljIGNvbnNlcnZhdGl2ZSBtb2Rl
ClsgICAxNi4wNDYzODNdIGUxMDAwZSAwMDAwOjAwOjFmLjYgMDAwMDowMDoxZi42ICh1bmluaXRp
YWxpemVkKTogcmVnaXN0ZXJlZCBQSEMgY2xvY2sKWyAgIDE2LjIxNDIwN10gZTEwMDBlIDAwMDA6
MDA6MWYuNiBldGgwOiAoUENJIEV4cHJlc3M6Mi41R1QvczpXaWR0aCB4MSkgNTQ6ZTE6YWQ6MTU6
M2E6ZWYKWyAgIDE2LjMxODU2NF0gZTEwMDBlIDAwMDA6MDA6MWYuNiBldGgwOiBJbnRlbChSKSBQ
Uk8vMTAwMCBOZXR3b3JrIENvbm5lY3Rpb24KWyAgIDE2LjQxMDYxM10gZTEwMDBlIDAwMDA6MDA6
MWYuNiBldGgwOiBNQUM6IDEyLCBQSFk6IDEyLCBQQkEgTm86IEZGRkZGRi0wRkYKWyAgIDE2LjUw
MjYwMl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBhc2l4ClsgICAx
Ni41NzY5MTldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgYXg4ODE3
OV8xNzhhClsgICAxNi42NTk1MzBdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBk
cml2ZXIgY2RjX2V0aGVyClsgICAxNi43MzkwMzldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGlu
dGVyZmFjZSBkcml2ZXIgY2RjX2VlbQpbICAgMTYuODE2NDcyXSB1c2Jjb3JlOiByZWdpc3RlcmVk
IG5ldyBpbnRlcmZhY2UgZHJpdmVyIGRtOTYwMQpbICAgMTYuODkyODY2XSB1c2Jjb3JlOiByZWdp
c3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHNyOTcwMApbICAgMTYuOTY5MjYzXSB1c2Jjb3Jl
OiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIENvcmVDaGlwcwpbICAgMTcuMDQ4NzY4
XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHNtc2M3NXh4ClsgICAx
Ny4xMjcyMzldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgc21zYzk1
eHgKWyAgIDE3LjIwNTcwMV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZl
ciBnbDYyMGEKWyAgIDE3LjI4MjA5MF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciBuZXQxMDgwClsgICAxNy4zNTk1MTldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGlu
dGVyZmFjZSBkcml2ZXIgcGx1c2IKWyAgIDE3LjQzNDg2Ml0gdXNiY29yZTogcmVnaXN0ZXJlZCBu
ZXcgaW50ZXJmYWNlIGRyaXZlciBybmRpc19ob3N0ClsgICAxNy41MTU0MzFdIHVzYmNvcmU6IHJl
Z2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgY2RjX3N1YnNldApbICAgMTcuNTk1OTY0XSB1
c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHphdXJ1cwpbICAgMTcuNjcy
MzUxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIE1PU0NISVAgdXNi
LWV0aGVybmV0IGRyaXZlcgpbICAgMTcuNzcwNTI0XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBp
bnRlcmZhY2UgZHJpdmVyIGNkY19uY20KWyAgIDE3Ljg0Nzk0Ml0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBodWF3ZWlfY2RjX25jbQpbICAgMTcuOTMyNjI3XSB1c2Jj
b3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGNkY19tYmltClsgICAxOC4wMTEw
ODNdIGl2c2htZW0tbmV0IDAwMDA6MDA6MGQuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAw
MDIpClsgICAxOC4wOTY4MjZdIGl2c2htZW0tbmV0IDAwMDA6MDA6MGQuMDogVFggbWVtb3J5IGF0
IDB4MDAwMDAwMDAzYTY4MDAwMCwgc2l6ZSAweDAwMDAwMDAwMDAwN2YwMDAKWyAgIDE4LjIwOTQ4
N10gaXZzaG1lbS1uZXQgMDAwMDowMDowZC4wOiBSWCBtZW1vcnkgYXQgMHgwMDAwMDAwMDNhNjAx
MDAwLCBzaXplIDB4MDAwMDAwMDAwMDA3ZjAwMApbICAgMTguMzIyNDQ3XSB1aW9faXZzaG1lbSAw
MDAwOjAwOjBlLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQpbICAgMTguNDA4MTg3
XSB1aW9faXZzaG1lbSAwMDAwOjAwOjBlLjA6IHN0YXRlX3RhYmxlIGF0IDB4MDAwMDAwMDAzYTcw
MDAwMCwgc2l6ZSAweDAwMDAwMDAwMDAwMDEwMDAKWyAgIDE4LjUyMjkyOF0gdWlvX2l2c2htZW0g
MDAwMDowMDowZS4wOiByd19zZWN0aW9uIGF0IDB4MDAwMDAwMDAzYTcwMTAwMCwgc2l6ZSAweDAw
MDAwMDAwMDAwMDkwMDAKWyAgIDE4LjYzNjY1MF0gdWlvX2l2c2htZW0gMDAwMDowMDowZS4wOiBp
bnB1dF9zZWN0aW9ucyBhdCAweDAwMDAwMDAwM2E3MGEwMDAsIHNpemUgMHgwMDAwMDAwMDAwMDA0
MDAwClsgICAxOC43NTQ0OTldIHVpb19pdnNobWVtIDAwMDA6MDA6MGUuMDogb3V0cHV0X3NlY3Rp
b24gYXQgMHgwMDAwMDAwMDNhNzBjMDAwLCBzaXplIDB4MDAwMDAwMDAwMDAwMjAwMApbICAgMTgu
ODczMTU4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGNkY193ZG0K
WyAgIDE4Ljk1MDc4OF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1
c2Itc3RvcmFnZQpbICAgMTkuMDMyNjMwXSBtb3VzZWRldjogUFMvMiBtb3VzZSBkZXZpY2UgY29t
bW9uIGZvciBhbGwgbWljZQpbICAgMTkuMTA5MjIwXSBpbnRlbF9wc3RhdGU6IEludGVsIFAtc3Rh
dGUgZHJpdmVyIGluaXRpYWxpemluZwpbICAgMTkuMTg1OTI0XSBpbnRlbF9wc3RhdGU6IEhXUCBl
bmFibGVkClsgICAxOS4yMzk1MTldIHNkaGNpOiBTZWN1cmUgRGlnaXRhbCBIb3N0IENvbnRyb2xs
ZXIgSW50ZXJmYWNlIGRyaXZlcgpbICAgMTkuMzIzMTYwXSBzZGhjaTogQ29weXJpZ2h0KGMpIFBp
ZXJyZSBPc3NtYW4KWyAgIDE5LjM4NTA1NV0gcHJpbnRrOiBjb25zb2xlIFtqYWlsaG91c2UwXSBl
bmFibGVkClsgICAxOS4zODUwNTVdIHByaW50azogY29uc29sZSBbamFpbGhvdXNlMF0gZW5hYmxl
ZApbICAgMTkuNDYwMDczXSBwcmludGs6IGJvb3Rjb25zb2xlIFtqYWlsaG91c2UwXSBkaXNhYmxl
ZApbICAgMTkuNDYwMDczXSBwcmludGs6IGJvb3Rjb25zb2xlIFtqYWlsaG91c2UwXSBkaXNhYmxl
ZApbICAgMTkuNTQwMzQ0XSA5cG5ldDogSW5zdGFsbGluZyA5UDIwMDAgc3VwcG9ydApbICAgMTku
NjAxMjE4XSBLZXkgdHlwZSBkbnNfcmVzb2x2ZXIgcmVnaXN0ZXJlZApbICAgMTkuNjYyMDczXSBJ
UEkgc2hvcnRoYW5kIGJyb2FkY2FzdDogZW5hYmxlZApbICAgMTkuNzIzMDA0XSByZWdpc3RlcmVk
IHRhc2tzdGF0cyB2ZXJzaW9uIDEKWyAgIDE5Ljc4MTc4M10gTG9hZGluZyBjb21waWxlZC1pbiBY
LjUwOSBjZXJ0aWZpY2F0ZXMKWyAgIDE5Ljg0ODk3OF0gQnRyZnMgbG9hZGVkLCBjcmMzMmM9Y3Jj
MzJjLWdlbmVyaWMKWyAgIDE5LjkxMzIwN10gVW5zdGFibGUgY2xvY2sgZGV0ZWN0ZWQsIHN3aXRj
aGluZyBkZWZhdWx0IHRyYWNpbmcgY2xvY2sgdG8gImdsb2JhbCIKWyAgIDE5LjkxMzIwN10gSWYg
eW91IHdhbnQgdG8ga2VlcCB1c2luZyB0aGUgbG9jYWwgY2xvY2ssIHRoZW4gYWRkOgpbICAgMTku
OTEzMjA3XSAgICJ0cmFjZV9jbG9jaz1sb2NhbCIKWyAgIDE5LjkxMzIwN10gb24gdGhlIGtlcm5l
bCBjb21tYW5kIGxpbmUKWyAgIDIwLjE5NzQwNl0gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdl
IG1lbW9yeTogMTIwNEsKWyAgIDIwLjI3NDM4Nl0gV3JpdGUgcHJvdGVjdGluZyB0aGUga2VybmVs
IHJlYWQtb25seSBkYXRhOiAxNjM4NGsKWyAgIDIwLjM1NDMyOF0gRnJlZWluZyB1bnVzZWQga2Vy
bmVsIGltYWdlIG1lbW9yeTogMjAyOEsKWyAgIDIwLjQyNDc3NF0gRnJlZWluZyB1bnVzZWQga2Vy
bmVsIGltYWdlIG1lbW9yeTogMTUzNksKWyAgIDIwLjQ5NDk1Nl0gcm9kYXRhX3Rlc3Q6IGFsbCB0
ZXN0cyB3ZXJlIHN1Y2Nlc3NmdWwKWyAgIDIwLjU2MjAxMF0gUnVuIC9pbml0IGFzIGluaXQgcHJv
Y2VzcwpbICAgMjAuNjM1MTU1XSByYW5kb206IGRkOiB1bmluaXRpYWxpemVkIHVyYW5kb20gcmVh
ZCAoNTEyIGJ5dGVzIHJlYWQpClsgICAyMC43MjQwMDRdIHJhbmRvbTogZHJvcGJlYXI6IHVuaW5p
dGlhbGl6ZWQgdXJhbmRvbSByZWFkICgzMiBieXRlcyByZWFkKQoK

--_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: text/x-csrc; name="linux-x86.c"
Content-Description: linux-x86.c
Content-Disposition: attachment; filename="linux-x86.c"; size=5719;
	creation-date="Thu, 09 Jul 2020 14:14:56 GMT";
	modification-date="Thu, 09 Jul 2020 14:15:11 GMT"
Content-Transfer-Encoding: base64

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvbmZpZ3VyYXRpb24gZm9yIExpbnV4IGlubWF0ZSwgMSBDUFUsIDc0IE1CIFJBTSwgfjFN
QiBzaG1lbSwgc2VyaWFsIHBvcnRzCiAqCiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAx
My0yMDE1CiAqCiAqIEF1dGhvcnM6CiAqICBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMu
Y29tPgogKgogKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR1BMLCB2ZXJzaW9uIDIuICBTZWUKICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxl
dmVsIGRpcmVjdG9yeS4KICovCgojaW5jbHVkZSA8amFpbGhvdXNlL3R5cGVzLmg+CiNpbmNsdWRl
IDxqYWlsaG91c2UvY2VsbC1jb25maWcuaD4KCnN0cnVjdCB7CglzdHJ1Y3QgamFpbGhvdXNlX2Nl
bGxfZGVzYyBjZWxsOwoJX191NjQgY3B1c1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1l
bV9yZWdpb25zWzExXTsKCXN0cnVjdCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsK
CXN0cnVjdCBqYWlsaG91c2VfaXJxY2hpcCBpcnFjaGlwc1sxXTsKCXN0cnVjdCBqYWlsaG91c2Vf
cGlvIHBpb19yZWdpb25zWzFdOwoJc3RydWN0IGphaWxob3VzZV9wY2lfZGV2aWNlIHBjaV9kZXZp
Y2VzWzJdOwoJc3RydWN0IGphaWxob3VzZV9wY2lfY2FwYWJpbGl0eSBwY2lfY2Fwc1swXTsKfSBf
X2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7CgkuY2VsbCA9IHsKCQkuc2lnbmF0dXJl
ID0gSkFJTEhPVVNFX0NFTExfREVTQ19TSUdOQVRVUkUsCgkJLnJldmlzaW9uID0gSkFJTEhPVVNF
X0NPTkZJR19SRVZJU0lPTiwKCQkubmFtZSA9ICJsaW51eC14ODYiLAoJCS5mbGFncyA9IEpBSUxI
T1VTRV9DRUxMX1BBU1NJVkVfQ09NTVJFRyB8CgkJCSBKQUlMSE9VU0VfQ0VMTF9WSVJUVUFMX0NP
TlNPTEVfQUNUSVZFLAoKCQkuY3B1X3NldF9zaXplID0gc2l6ZW9mKGNvbmZpZy5jcHVzKSwKCQku
bnVtX21lbW9yeV9yZWdpb25zID0gQVJSQVlfU0laRShjb25maWcubWVtX3JlZ2lvbnMpLAoJCS5u
dW1fY2FjaGVfcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLmNhY2hlX3JlZ2lvbnMpLAoJCS5u
dW1faXJxY2hpcHMgPSBBUlJBWV9TSVpFKGNvbmZpZy5pcnFjaGlwcyksCgkJLm51bV9waW9fcmVn
aW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwKCQkubnVtX3BjaV9kZXZpY2Vz
ID0gQVJSQVlfU0laRShjb25maWcucGNpX2RldmljZXMpLAoJCS5udW1fcGNpX2NhcHMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5wY2lfY2FwcyksCgl9LAoKCS5jcHVzID0gewoJCTBiMTEwMCwKCX0sCgoJ
Lm1lbV9yZWdpb25zID0gewkJCgkJLyogMCAuLiAzIElWU0hNRU0gbmV0d29ya2luZyAqLwkJCgkJ
SkFJTEhPVVNFX1NITUVNX05FVF9SRUdJT05TKDB4M2E2MDAwMDAsIDEpLAoJCS8qIDQgSVZTSE1F
TSBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMgKGRlbW8pICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4
M2E3MDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgzYTcwMDAwMCwKCQkJLnNpemUgPSAweDEwMDAs
CgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJF
RCwKCQl9LAoJCS8qIDUgKi8gCgkJewoJCQkucGh5c19zdGFydCA9IDB4M2E3MDEwMDAsCgkJCS52
aXJ0X3N0YXJ0ID0gMHgzYTcwMTAwMCwKCQkJLnNpemUgPSAweDkwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01F
TV9ST09UU0hBUkVELAoJCX0sCgkJLyogNiAqLyAKCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgzYTcw
YTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDNhNzBhMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwKCQkJ
LmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJ
CX0sCgkJLyogNyAqLyAKCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgzYTcwYzAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweDNhNzBjMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwKCQkJLmZsYWdzID0gSkFJTEhP
VVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX1JP
T1RTSEFSRUQsCgkJfSwKCQkvKiA4IGxvdyBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4M0E3
MUYwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMCwKCQkJLnNpemUgPSAweDAwMTAwMDAwLAoJCQkuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxI
T1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BIHwKCQkJCUpBSUxIT1VTRV9NRU1f
TE9BREFCTEUsCgkJfSwKCQkvKiA5IGNvbW11bmljYXRpb24gcmVnaW9uICovIHsKCQkJLnZpcnRf
c3RhcnQgPSAweDAwMTAwMDAwLAoJCQkuc2l6ZSA9IDB4MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01F
TV9DT01NX1JFR0lPTiwKCQl9LAoJCS8qIDEwIGhpZ2ggUkFNICovIHsKCQkJLnBoeXNfc3RhcnQg
PSAweDNhODFmMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MDAyMDAwMDAsCgkJCS5zaXplID0gMHg0
NzAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dS
SVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BIHwKCQkJ
CUpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiAyMCBNZW1SZWdpb246IGYyMTAwMDAw
LWYyMTFmZmZmIDogZTEwMDBlIAoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGYyMTAwMDAwLAoJCQku
dmlydF9zdGFydCA9IDB4ZjIxMDAwMDAsCgkJCS5zaXplID0gMHgyMDAwMCwKCQkJLmZsYWdzID0g
SkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCSovCgl9LAoK
CS5jYWNoZV9yZWdpb25zID0gewoJCXsKCQkJLnN0YXJ0ID0gMCwKCQkJLnNpemUgPSAyLAoJCQku
dHlwZSA9IEpBSUxIT1VTRV9DQUNIRV9MMywKCQl9LAoJfSwKCgkuaXJxY2hpcHMgPSB7CgkJLy9J
T0FQSUMKCQl7CgkJCS5hZGRyZXNzID0gMHhmZWMwMDAwMCwKCQkJLmlkID0gMHgxZjBmOCwKCQkJ
LnBpbl9iaXRtYXAgPSB7CgkJCQkoMSA8PCAzKSwwLDAsMAoJCQl9LAoJCX0sCgl9LAoKCS5waW9f
cmVnaW9ucyA9IHsKCQkvL1BJT19SQU5HRSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElP
X1JBTkdFKDB4M2Y4LCA4KSwgLyogc2VyaWFsIDEgKi8KCQkvL1BJT19SQU5HRSgweDQsIDB4Ziks
CgkJLy9QSU9fUkFOR0UoMHg4MCwgMHgxMCksLyogZG1hIHBhZ2UgcmVnICovCgkJLy9QSU9fUkFO
R0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbDEgKi8KCX0sCgoJLnBjaV9kZXZpY2Vz
ID0gewoJCS8qCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9JVlNITUVNLAoJCQku
ZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgwYyA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9V
U0VfSVZTSE1FTV9CQVJfTUFTS19NU0lYLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDIsCgkJCS5z
aG1lbV9yZWdpb25zX3N0YXJ0ID0gMCwKCQkJLnNobWVtX2Rldl9pZCA9IDEsCgkJCS5zaG1lbV9w
ZWVycyA9IDIsCgkJCS5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19WSVJU
SU9fRlJPTlQgKwoJCQkJVklSVElPX0RFVl9CTE9DSywKCQl9LAoJCXsKCQkJLnR5cGUgPSBKQUlM
SE9VU0VfUENJX1RZUEVfSVZTSE1FTSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MGQg
PDwgMywKCQkJLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfTVNJWCwKCQkJ
Lm51bV9tc2l4X3ZlY3RvcnMgPSAzLAoJCQkuc2htZW1fcmVnaW9uc19zdGFydCA9IDQsCgkJCS5z
aG1lbV9kZXZfaWQgPSAxLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJvdG9jb2wg
PSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVklSVElPX0ZST05UICsKCQkJCVZJUlRJT19ERVZfQ09O
U09MRSwKCQl9LAoJCSovCgkJewkvLyBJVlNITUVNIChuZXR3b3JraW5nKQoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9JVlNITUVNLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuaW9tbXUgPSAx
LAoJCQkuYmRmID0gMHgwZCA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1FTV9C
QVJfTUFTS19NU0lYLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDIsCgkJCS5zaG1lbV9yZWdpb25z
X3N0YXJ0ID0gMCwKCQkJLnNobWVtX2Rldl9pZCA9IDEsCgkJCS5zaG1lbV9wZWVycyA9IDIsCgkJ
CS5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19WRVRILAoJCX0sCgkJewkg
LyogSVZTSE1FTSAoZGVtbykgKi8KCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfSVZTSE1F
TSwKCQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4MDAwMCwKCQkJLmJkZiA9IDB4MGUgPDwg
MywKCQkJLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfTVNJWCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAxNiwKCQkJLnNobWVtX3JlZ2lvbnNfc3RhcnQgPSA0LAoJCQkuc2ht
ZW1fZGV2X2lkID0gMSwKCQkJLnNobWVtX3BlZXJzID0gMiwKCQkJLnNobWVtX3Byb3RvY29sID0g
SkFJTEhPVVNFX1NITUVNX1BST1RPX1VOREVGSU5FRCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MWYuNiAKCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11
ID0gMSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZmUsCgkJCS5iYXJfbWFzayA9IHsK
CQkJCTB4ZmZmZTAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1f
Y2FwcyA9IDUsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJ
CS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3Jl
Z2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sKi8KCX0sCgkucGNp
X2NhcHMgPSB7CgkJLyoKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfUE0sCgkJCS5zdGFydCA9IDB4
YzgsCgkJCS5sZW4gPSAweDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJ
CX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSSwKCQkJLnN0YXJ0ID0gMHhkMCwKCQkJLmxl
biA9IDB4ZSwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJ
CS5pZCA9IFBDSV9DQVBfSURfQUYsCgkJCS5zdGFydCA9IDB4ZTAsCgkJCS5sZW4gPSAweDIsCgkJ
CS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9FWFRfQ0FQX0lEX0VSUiB8IEpBSUxI
T1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxMDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxh
Z3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfRVhUX0NBUF9JRF9EU04gfCBKQUlMSE9VU0Vf
UENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTQwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0g
MCwKCQl9LAoJCSovCgl9Cn07Cg==

--_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_
Content-Type: text/x-csrc; name="wifi.c"
Content-Description: wifi.c
Content-Disposition: attachment; filename="wifi.c"; size=33238;
	creation-date="Thu, 09 Jul 2020 14:14:56 GMT";
	modification-date="Thu, 09 Jul 2020 14:15:11 GMT"
Content-Transfer-Encoding: base64

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAxNC0yMDE3CiAqCiAqIFRoaXMgd29yayBp
cyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNl
ZQogKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogKgogKiBB
bHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHVzZSBvciByZWRpc3RyaWJ1dGUgdGhpcyBmaWxlIHVuZGVy
IHRoZSBmb2xsb3dpbmcKICogQlNEIGxpY2Vuc2U6CiAqCiAqIFJlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAogKiBtb2RpZmlj
YXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnMKICogYXJlIG1ldDoKICoKICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11
c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2Yg
Y29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgogKgogKiAyLiBSZWRpc3Ry
aWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdo
dAogKiAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlCiAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVy
aWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCiAqCiAqIFRISVMgU09GVFdBUkUg
SVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFT
IElTIgogKiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCiAqIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFO
VEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFCiAqIEFSRSBESVND
TEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERFUiBPUiBDT05UUklC
VVRPUlMgQkUKICogTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwg
U1BFQ0lBTCwgRVhFTVBMQVJZLCBPUgogKiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRgogKiBTVUJTVElUVVRFIEdPT0RT
IE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MK
ICogSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4KICogQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQg
KElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkKICogQVJJU0lORyBJTiBBTlkgV0FZ
IE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRgogKiBU
SEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAqCiAqIENvbmZpZ3VyYXRpb24gZm9yIExF
Tk9WTyAyMEo2Q1RPMVdXCiAqIGNyZWF0ZWQgd2l0aCAnL3Vzci9sb2NhbC9saWJleGVjL2phaWxo
b3VzZS9qYWlsaG91c2UgY29uZmlnIGNyZWF0ZSBjb25maWdzL3g4Ni93aWZpLmMnCiAqCiAqIE5P
VEU6IFRoaXMgY29uZmlnIGV4cGVjdHMgdGhlIGZvbGxvd2luZyB0byBiZSBhcHBlbmRlZCB0byB5
b3VyIGtlcm5lbCBjbWRsaW5lCiAqICAgICAgICJtZW1tYXA9MHg1MjAwMDAwJDB4M2EwMDAwMDAi
CiAqLwoKI2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2Nl
bGwtY29uZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9zeXN0ZW0gaGVhZGVyOwoJ
X191NjQgY3B1c1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzY2XTsK
CXN0cnVjdCBqYWlsaG91c2VfaXJxY2hpcCBpcnFjaGlwc1sxXTsKCXN0cnVjdCBqYWlsaG91c2Vf
cGlvIHBpb19yZWdpb25zWzQ0XTsKCXN0cnVjdCBqYWlsaG91c2VfcGNpX2RldmljZSBwY2lfZGV2
aWNlc1sxOF07CglzdHJ1Y3QgamFpbGhvdXNlX3BjaV9jYXBhYmlsaXR5IHBjaV9jYXBzWzU1XTsK
fSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7CgkuaGVhZGVyID0gewoJCS5zaWdu
YXR1cmUgPSBKQUlMSE9VU0VfU1lTVEVNX1NJR05BVFVSRSwKCQkucmV2aXNpb24gPSBKQUlMSE9V
U0VfQ09ORklHX1JFVklTSU9OLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9TWVNfVklSVFVBTF9ERUJV
R19DT05TT0xFLAoJCS5oeXBlcnZpc29yX21lbW9yeSA9IHsKCQkJLnBoeXNfc3RhcnQgPSAweDNh
MDAwMDAwLAoJCQkuc2l6ZSA9IDB4NjAwMDAwLAoJCX0sCgkJLmRlYnVnX2NvbnNvbGUgPSB7CiAg
ICAgICAgCS5hZGRyZXNzID0gMHhlMDAwMDAwMCwKICAgICAgICAJLnNpemUgPSAgMHgxMDAwMDAw
MCwgCiAgICAgICAgCS50eXBlID0gSkFJTEhPVVNFX0NPTl9UWVBFX0VGSUZCLCAgCiAgICAgICAg
CS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX01NSU8gfCBKQUlMSE9VU0VfQ09OX0ZCXzEw
MjR4NzY4LCAKICAgIAl9LAoJCS5wbGF0Zm9ybV9pbmZvID0gewoJCQkucGNpX21tY29uZmlnX2Jh
c2UgPSAweGY4MDAwMDAwLAoJCQkucGNpX21tY29uZmlnX2VuZF9idXMgPSAweDNmLAoJCQkuaW9t
bXVfdW5pdHMgPSB7CgkJCQl7CgkJCQkJLnR5cGUgPSBKQUlMSE9VU0VfSU9NTVVfSU5URUwsCgkJ
CQkJLmJhc2UgPSAweGZlZDkwMDAwLAoJCQkJCS5zaXplID0gMHgxMDAwLAoJCQkJfSwKCQkJCXsK
CQkJCQkudHlwZSA9IEpBSUxIT1VTRV9JT01NVV9JTlRFTCwKCQkJCQkuYmFzZSA9IDB4ZmVkOTEw
MDAsCgkJCQkJLnNpemUgPSAweDEwMDAsCgkJCQl9LAoJCQl9LAoJCQkueDg2ID0gewoJCQkJLnBt
X3RpbWVyX2FkZHJlc3MgPSAweDE4MDgsCgkJCQkudnRkX2ludGVycnVwdF9saW1pdCA9IDI1NiwK
CQkJfSwKCQl9LAoJCS5yb290X2NlbGwgPSB7CgkJCS5uYW1lID0gIlJvb3RDZWxsIiwKCQkJLmNw
dV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJCS5udW1fbWVtb3J5X3JlZ2lvbnMg
PSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJCS5udW1faXJxY2hpcHMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5pcnFjaGlwcyksCgkJCS5udW1fcGlvX3JlZ2lvbnMgPSBBUlJBWV9TSVpF
KGNvbmZpZy5waW9fcmVnaW9ucyksCgkJCS5udW1fcGNpX2RldmljZXMgPSBBUlJBWV9TSVpFKGNv
bmZpZy5wY2lfZGV2aWNlcyksCgkJCS5udW1fcGNpX2NhcHMgPSBBUlJBWV9TSVpFKGNvbmZpZy5w
Y2lfY2FwcyksCgkJfSwKCX0sCgoJLmNwdXMgPSB7CgkJMHgwMDAwMDAwMDAwMDAwMDBmLAoJfSwK
CgkubWVtX3JlZ2lvbnMgPSB7CgkJLyogMCBNZW1SZWdpb246IDAwMDAwMDAwLTAwMDU3ZmZmIDog
U3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHgwLAoJCQkuc2l6ZSA9IDB4NTgwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8
IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhP
VVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDAwMDU5MDAwLTAwMDhiZmZmIDogU3lz
dGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDU5MDAwLAoJCQkudmlydF9zdGFydCA9
IDB4NTkwMDAsCgkJCS5zaXplID0gMHgzMzAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBK
QUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMDAxMDAwMDAtMzlmZmZmZmYg
OiBTeXN0ZW0gUkFNICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4MTAwMDAwLAoJCQkudmlydF9z
dGFydCA9IDB4MTAwMDAwLAoJCQkuc2l6ZSA9IDB4MzlmMDAwMDAsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9F
WEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDNmMzAwMDAw
LThmMjAwMDAwIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDNmMzAwMDAw
LAoJCQkudmlydF9zdGFydCA9IDB4M2YzMDAwMDAsCgkJCS5zaXplID0gMHg0ZmYwMDAwMCwKCQkJ
LmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlK
QUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJl
Z2lvbjogOGYyMjIwMDAtOGZlOGFmZmYgOiBTeXN0ZW0gUkFNICovCgkJewoJCQkucGh5c19zdGFy
dCA9IDB4OGYyMjIwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg4ZjIyMjAwMCwKCQkJLnNpemUgPSAw
eGM2OTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9
LAoJCS8qIDUgTWVtUmVnaW9uOiA4ZmU4YzAwMC05MWRhZjAxNyA6IFN5c3RlbSBSQU0gKi8KCQl7
CgkJCS5waHlzX3N0YXJ0ID0gMHg4ZmU4YzAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDhmZThjMDAw
LAoJCQkuc2l6ZSA9IDB4MWYyNDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwg
SkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9V
U0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogOTFkYWYwMTgtOTFkYmYwNTcgOiBTeXN0
ZW0gUkFNICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4OTFkYWYwMTgsCgkJCS52aXJ0X3N0YXJ0
ID0gMHg5MWRhZjAxOCwKCQkJLnNpemUgPSAweDExMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VU
RSB8IEpBSUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5MWRiZjA1OC05M2Uz
YWZmZiA6IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MWRiZjA1OCwKCQkJ
LnZpcnRfc3RhcnQgPSAweDkxZGJmMDU4LAoJCQkuc2l6ZSA9IDB4MjA3YzAwMCwKCQkJLmZsYWdz
ID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9V
U0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjog
OTNlM2IwMDAtOTNlM2JmZmYgOiBBQ1BJIE5vbi12b2xhdGlsZSBTdG9yYWdlICovCgkJewoJCQku
cGh5c19zdGFydCA9IDB4OTNlM2IwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5M2UzYjAwMCwKCQkJ
LnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VT
RV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IDkzZTNkMDAwLTlkNzdjZmZmIDogU3lz
dGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDkzZTNkMDAwLAoJCQkudmlydF9zdGFy
dCA9IDB4OTNlM2QwMDAsCgkJCS5zaXplID0gMHg5OTQwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhF
Q1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogMTAgOWQ3N2QwMDAtOWY0MWYwMDAq
LwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDlkNzdkMDAwLAoJCQkudmlydF9zdGFydCA9IDB4OWQ3
N2QwMDAsCgkJCS5zaXplID0gMHgxQ0EyMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpB
SUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5ZmU5YTAwMC05ZmY5OWZmZiA6
IEFDUEkgTm9uLXZvbGF0aWxlIFN0b3JhZ2UgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5ZmU5
YTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDlmZTlhMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAwLAoJ
CQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0s
CgkJLyogTWVtUmVnaW9uOiA5ZmY5YTAwMC05ZmZmZWZmZiA6IEFDUEkgVGFibGVzICovCgkJewoJ
CQkucGh5c19zdGFydCA9IDB4OWZmOWEwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5ZmY5YTAwMCwK
CQkJLnNpemUgPSAweDY1MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5ZmZmZjAwMC05ZmZmZmZmZiA6
IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5ZmZmZjAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweDlmZmZmMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhP
VVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VY
RUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYzAwMDAwMDAt
Y2ZmZmZmZmYgOiAwMDAwOjAyOjAwLjAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhjMDAwMDAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweGMwMDAwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAwMDAsCgkJ
CS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwK
CQkvKiAxNSBNZW1SZWdpb246IGQwMDAwMDAwLWQxZmZmZmZmIDogMDAwMDowMjowMC4wICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4ZDAwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhkMDAwMDAw
MCwKCQkJLnNpemUgPSAweDIwMDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8
IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGUwMDAwMDAwLWVmZmZm
ZmZmIDogMDAwMDowMDowMi4wICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZTAwMDAwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHhlMDAwMDAwMCwKCQkJLnNpemUgPSAweDEwMDAwMDAwLAoJCQkuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyog
TWVtUmVnaW9uOiBmMDAwMDAwMC1mMGZmZmZmZiA6IDAwMDA6MDA6MDIuMCAqLwoJCXsKCQkJLnBo
eXNfc3RhcnQgPSAweGYwMDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZjAwMDAwMDAsCgkJCS5z
aXplID0gMHgxMDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmMTAwMDAwMC1mMWZmZmZmZiA6IDAw
MDA6MDI6MDAuMCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGYxMDAwMDAwLAoJCQkudmlydF9z
dGFydCA9IDB4ZjEwMDAwMDAsCgkJCS5zaXplID0gMHgxMDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9u
OiBmMjAwMDAwMC1mMjAwMWZmZiA6IGl3bHdpZmkgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhm
MjAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGYyMDAwMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwK
CQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9
LAoJCS8qIDIwIE1lbVJlZ2lvbjogZjIxMDAwMDAtZjIxMWZmZmYgOiBlMTAwMGUgKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHhmMjEwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGYyMTAwMDAwLAoJ
CQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9ETUEgfCBKQUlMSE9VU0VfTUVNX0VY
RUNVVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGYyMTIwMDAwLWYyMTJmZmZmIDogeGhjaS1oY2Qg
Ki8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmMjEyMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGYy
MTIwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVB
RCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJCUpBSUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJ
LyogTWVtUmVnaW9uOiBmMjEzMDAwMC1mMjEzZmZmZiA6IElDSCBIRCBhdWRpbyAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweGYyMTMwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZjIxMzAwMDAsCgkJ
CS5zaXplID0gMHgxMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZjIxNDAwMDAtZjIxNDNmZmYgOiBJ
Q0ggSEQgYXVkaW8gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmMjE0MDAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweGYyMTQwMDAwLAoJCQkuc2l6ZSA9IDB4NDAwMCwKCQkJLmZsYWdzID0gSkFJTEhP
VVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjog
ZjIxNDQwMDAtZjIxNDdmZmYgOiAwMDAwOjAwOjFmLjIgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHhmMjE0NDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGYyMTQ0MDAwLAoJCQkuc2l6ZSA9IDB4NDAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoJCS8qIE1lbVJlZ2lvbjogZjIxNDgwMDAtZjIxNDlmZmYgOiBhaGNpICovCgkJewoJCQku
cGh5c19zdGFydCA9IDB4ZjIxNDgwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmMjE0ODAwMCwKCQkJ
LnNpemUgPSAweDIwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VT
RV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGYyMTRhMDAwLWYyMTRhZmZmIDogSW50
ZWwgUENIIHRoZXJtYWwgZHJpdmVyICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZjIxNGEwMDAs
CgkJCS52aXJ0X3N0YXJ0ID0gMHhmMjE0YTAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFn
cyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBN
ZW1SZWdpb246IGYyMTRiMDAwLWYyMTRiZmZmIDogbWVpX21lICovCgkJewoJCQkucGh5c19zdGFy
dCA9IDB4ZjIxNGIwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmMjE0YjAwMCwKCQkJLnNpemUgPSAw
eDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJ
VEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGYyMTRjMDAwLWYyMTRjN2ZmIDogYWhjaSAqLwoJCXsK
CQkJLnBoeXNfc3RhcnQgPSAweGYyMTRjMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZjIxNGMwMDAs
CgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmMjE0ZDAwMC1mMjE0ZDBmZiA6
IDAwMDA6MDA6MWYuNCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGYyMTRkMDAwLAoJCQkudmly
dF9zdGFydCA9IDB4ZjIxNGQwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogMzAgTWVtUmVn
aW9uOiBmMjE0ZTAwMC1mMjE0ZTBmZiA6IGFoY2kgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhm
MjE0ZTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGYyMTRlMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwK
CQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9
LAoJCS8qIE1lbVJlZ2lvbjogZjdmZTAwMDAtZjdmZmZmZmYgOiBwbnAgMDA6MGEgKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHhmN2ZlMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGY3ZmUwMDAwLAoJ
CQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZkMDAwMDAwLWZkYWJmZmZmIDog
cG5wIDAwOjAwICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmQwMDAwMDAsCgkJCS52aXJ0X3N0
YXJ0ID0gMHhmZDAwMDAwMCwKCQkJLnNpemUgPSAweGFjMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhP
VVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjog
ZmRhYzAwMDAtZmRhY2ZmZmYgOiBwbnAgMDA6MDkgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhm
ZGFjMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZkYWMwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAs
CgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJ
fSwKCQkvKiBNZW1SZWdpb246IGZkYWQwMDAwLWZkYWRmZmZmIDogcG5wIDAwOjAwICovCgkJewoJ
CQkucGh5c19zdGFydCA9IDB4ZmRhZDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZGFkMDAwMCwK
CQkJLnNpemUgPSAweDEwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogMzUgTWVtUmVnaW9uOiBmZGFlMDAwMC1mZGFlZmZm
ZiA6IHBucCAwMDowOSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZkYWUwMDAwLAoJCQkudmly
dF9zdGFydCA9IDB4ZmRhZTAwMDAsCgkJCS5zaXplID0gMHgxMDAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lv
bjogZmRhZjAwMDAtZmRhZmZmZmYgOiBwbnAgMDA6MDkgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHhmZGFmMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZkYWYwMDAwLAoJCQkuc2l6ZSA9IDB4MTAw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IGZkYjAwMDAwLWZkZmZmZmZmIDogcG5wIDAwOjAwICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4ZmRiMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZGIwMDAw
MCwKCQkJLnNpemUgPSAJCTB4NTAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQg
fCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZGRjMTAwMC1mZGRj
ZmZmZiA6IEN1c3RvbSAqLwoJCS8vIHsKCQkvLwkucGh5c19zdGFydCA9IDB4ZmRkYzEwMDAsCgkJ
Ly8JLnZpcnRfc3RhcnQgPSAweGZkZGMxMDAwLAoJCS8vCS5zaXplID0gMHgxMDAwMCwKCQkvLwku
ZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCS8vIH0s
CgkJLyogTWVtUmVnaW9uOiBmZTAzNjAwMC1mZTAzYmZmZiA6IHBucCAwMDowMCAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweGZlMDM2MDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmUwMzYwMDAsCgkJ
CS5zaXplID0gMHg2MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZTAzZDAwMC1mZTNmZmZmZiA6IHBu
cCAwMDowMCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlMDNkMDAwLAoJCQkudmlydF9zdGFy
dCA9IDB4ZmUwM2QwMDAsCgkJCS5zaXplID0gMHgzYzMwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VT
RV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiA0MCBNZW1SZWdpb246
IGZlNDEwMDAwLWZlN2ZmZmZmIDogcG5wIDAwOjAwICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4
ZmU0MTAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZTQxMDAwMCwKCQkJLnNpemUgPSAweDNmMDAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoJCS8qIE1lbVJlZ2lvbjogZmViMDAwMDAtZmViZmZmZmYgOiBwbnAgMDA6MDggKi8KCQl7
CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWIwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlYjAwMDAw
LAoJCQkuc2l6ZSA9IDB4MTAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWQwMDAwMC1mZWQwMDNm
ZiA6IFBOUDAxMDM6MDAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWQwMDAwMCwKCQkJLnZp
cnRfc3RhcnQgPSAweGZlZDAwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lv
bjogZmVkMTAwMDAtZmVkMTNmZmYgOiBwbnAgMDA6MDggKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHhmZWQxMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlZDEwMDAwLAoJCQkuc2l6ZSA9IDB4NDAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoJCS8qIE1lbVJlZ2lvbjogZmVkMTgwMDAtZmVkMThmZmYgOiBwbnAgMDA6MGEgKi8KCQl7
CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWQxODAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlZDE4MDAw
LAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIDQ1IE1lbVJlZ2lvbjogZmVkMTkwMDAtZmVkMTlm
ZmYgOiBwbnAgMDA6MGEgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWQxOTAwMCwKCQkJLnZp
cnRfc3RhcnQgPSAweGZlZDE5MDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lv
bjogZmVkMjAwMDAtZmVkM2ZmZmYgOiBwbnAgMDA6MGEgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHhmZWQyMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlZDIwMDAwLAoJCQkuc2l6ZSA9IDB4MjAw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IGZlZDQ1MDAwLWZlZDhmZmZmIDogcG5wIDAwOjBhICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4ZmVkNDUwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZWQ0NTAw
MCwKCQkJLnNpemUgPSAweDRiMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZjAwMDAwMC1mZmZmZmZm
ZiA6IHBucCAwMDowYSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZmMDAwMDAwLAoJCQkudmly
dF9zdGFydCA9IDB4ZmYwMDAwMDAsCgkJCS5zaXplID0gMHgxMDAwMDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVn
aW9uOiAxMDAwMDAwMDAtMTIxN2ZmZmZmIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweDEwMDAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDEwMDAwMDAwMCwKCQkJLnNpemUg
PSAweDIxODAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0Vf
TUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1B
LAoJCX0sCgkJLyogNTAgTWVtUmVnaW9uOiAxMjE4MDAwMDAtMTIzZmZmZmZmIDogS2VybmVsICov
CgkJewoJCQkucGh5c19zdGFydCA9IDB4MTIxODAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MTIx
ODAwMDAwLAoJCQkuc2l6ZSA9IDB4MjgwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBK
QUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMTI0MDAwMDAwLTQ1MjdmZmZm
ZiA6IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgxMjQwMDAwMDAsCgkJCS52
aXJ0X3N0YXJ0ID0gMHgxMjQwMDAwMDAsCgkJCS5zaXplID0gMHgzMmU4MDAwMDAsCgkJCS5mbGFn
cyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhP
VVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246
IDQ1MjgwMDAwMC00NTNmZmZmZmYgOiBSQU0gYnVmZmVyICovCgkJewoJCQkucGh5c19zdGFydCA9
IDB4NDUyODAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4NDUyODAwMDAwLAoJCQkuc2l6ZSA9IDB4
MTgwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9
LAoJCS8qIE1lbVJlZ2lvbjogOWY0MWYwMDAtOWY0M2VmZmYgOiBBQ1BJIERNQVIgUk1SUiAqLwoJ
CS8qIFBDSSBkZXZpY2U6IDAwOjE0LjAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5ZjQxZjAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweDlmNDFmMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJ
TEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdp
b246IGFhMDAwMDAwLWFjN2ZmZmZmIDogQUNQSSBETUFSIFJNUlIgKi8KCQkvKiBQQ0kgZGV2aWNl
OiAwMDowMi4wICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4YWEwMDAwMDAsCgkJCS52aXJ0X3N0
YXJ0ID0gMHhhYTAwMDAwMCwKCQkJLnNpemUgPSAweDI4MDAwMDAsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9F
WEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiA1NSBNZW1SZWdpb246IDNhNzEw
MDAwLTNmMWZmZmZmIDogSkFJTEhPVVNFIElubWF0ZSBNZW1veSAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweDNBNzFGMDAwLAoJCQkudmlydF9zdGFydCA9IDB4M0E3MUYwMDAsCgkJCS5zaXplID0g
MHg0QUUxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFLAoJCX0sCgkJLyogNTYtNTkgSVZTSE1FTSBuZXR3b3JraW5nICovCQkKCQkvKiAgM2E2
MDAwMDAgLSAzYTZmZmZmZiovCgkJSkFJTEhPVVNFX1NITUVNX05FVF9SRUdJT05TKDB4M2E2MDAw
MDAsIDApLAoJCS8qIDYwIDNhNzAwMDAwIC0gMHgzYTcwMTAwMCBJVlNITUVNIGRlbW8qLwoJCXsK
CQkJLnBoeXNfc3RhcnQgPSAweDNhNzAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4M2E3MDAwMDAs
CgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQsCgkJfSwK
CQkvKiA2MSAzYTcwMTAwMCAtIDB4M2E3MGEwMDAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDNh
NzAxMDAwLAoJCQkudmlydF9zdGFydCA9IDB4M2E3MDEwMDAsCgkJCS5zaXplID0gMHg5MDAwLAoJ
CQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0s
CgkJLyogNjIgM2E3MGEwMDAgLSAweDNhNzBjMDAwKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgz
YTcwYTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDNhNzBhMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwK
CQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9
LAoJCS8qIDYzIDNhNzBjMDAwIC0gM2E3MGUwMDAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgz
YTcwYzAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDNhNzBjMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwK
CQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFELAoJCX0sCgkJLyogSVZTSE1FTSBzaGFyZWQg
bWVtb3J5IHJlZ2lvbiAodmlydGlvLWNvbiBiYWNrLWVuZCkgKi8KCQl7CgkJCS5waHlzX3N0YXJ0
ID0gMHgzYTcwZTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDNhNzBlMDAwLAoJCQkuc2l6ZSA9IDB4
MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFELAoJCX0sCgkJewoJCQkucGh5c19z
dGFydCA9IDB4M2E3MGYwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgzYTcwZjAwMCwKCQkJLnNpemUg
PSAweGYwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUsCgkJfSwKCX0sCgoJLmlycWNoaXBzID0gewoJCS8qIElPQVBJQyAyLCBHU0kgYmFzZSAw
ICovCgkJewoJCQkuYWRkcmVzcyA9IDB4ZmVjMDAwMDAsCgkJCS5pZCA9IDB4MWYwZjgsCgkJCS5w
aW5fYml0bWFwID0gewoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhm
ZmZmZmZmZgoJCQl9LAoJCX0sCgl9LAoKCS5waW9fcmVnaW9ucyA9IHsKCQkvKiBQb3J0IEkvTzog
MDAwMC0wMDFmIDogZG1hMSAqLwoJCVBJT19SQU5HRSgweDAsIDB4MjApLCAKCQkvKiBQb3J0IEkv
TzogMDAyMC0wMDIxIDogcGljMSAqLwoJCVBJT19SQU5HRSgweDIwLCAweDIpLCAKCQkvKiBQb3J0
IEkvTzogMDA0MC0wMDQzIDogdGltZXIwICovCgkJUElPX1JBTkdFKDB4NDAsIDB4NCksCgkJLyog
UG9ydCBJL086IDAwNTAtMDA1MyA6IHRpbWVyMSAqLwoJCVBJT19SQU5HRSgweDUwLCAweDQpLCAK
CQkvKiBQb3J0IEkvTzogMDA2MC0wMDYwIDoga2V5Ym9hcmQgKi8KCQlQSU9fUkFOR0UoMHg2MCwg
MHgxKSwKCQkvKiBQb3J0IEkvTzogMDA2MS0wMDYxIDogUE5QMDgwMDowMCAqLwoJCVBJT19SQU5H
RSgweDYxLCAweDEpLAoJCS8qIFBvcnQgSS9POiAwMDYyLTAwNjIgOiBFQyBkYXRhICovCgkJUElP
X1JBTkdFKDB4NjIsIDB4MSksIAoJCS8qIFBvcnQgSS9POiAwMDY0LTAwNjQgOiBrZXlib2FyZCAq
LwoJCVBJT19SQU5HRSgweDY0LCAweDEpLAoJCS8qIFBvcnQgSS9POiAwMDY2LTAwNjYgOiBFQyBj
bWQgKi8KCQkgUElPX1JBTkdFKDB4NjYsIDB4MSksIAoJCS8qIFBvcnQgSS9POiAwMDcwLTAwNzcg
OiBydGMwICovCgkJUElPX1JBTkdFKDB4NzAsIDB4OCksCgkJLyogUG9ydCBJL086IDAwODAtMDA4
ZiA6IGRtYSBwYWdlIHJlZyAqLwoJCVBJT19SQU5HRSgweDgwLCAweDEwKSwgCgkJLyogUG9ydCBJ
L086IDAwYTAtMDBhMSA6IHBpYzIgKi8KCQlQSU9fUkFOR0UoMHhhMCwgMHgyKSwgCgkJLyogUG9y
dCBJL086IDAwYzAtMDBkZiA6IHBvd2VyICAqLwoJCVBJT19SQU5HRSgweGIyLCAweDEpLCAKCQlQ
SU9fUkFOR0UoMHhlMCwgMHgyMCksCgoJCS8qIFBvcnQgSS9POiAwMGMwLTAwZGYgOiBkbWEyICov
CgkJUElPX1JBTkdFKDB4YzAsIDB4MjApLCAKCQkvKiBQb3J0IEkvTzogMDBmMC0wMGYwIDogUE5Q
MEMwNDowMCAqLwoJCVBJT19SQU5HRSgweGYwLCAweDEpLCAKCQlQSU9fUkFOR0UoMHgzYzAsIDB4
MTApLCAKCgkJLyogUG9ydCBJL086IDAzZjgtMDNmZiA6IHNlcmlhbCAqLwoJCVBJT19SQU5HRSgw
eDNmOCwgMHg4KSwKCQkvKiBQb3J0IEkvTzogMDQwMC0wNDFmIDogaVRDT193ZHQgKi8KCQlQSU9f
UkFOR0UoMHg0MDAsIDB4MjApLCAKCQkvKiBQb3J0IEkvTzogMDY4MC0wNjlmIDogcG5wIDAwOjAy
ICovCgkJUElPX1JBTkdFKDB4NjgwLCAweDIwKSwgCgkJLyogUG9ydCBJL086IDA4MDAtMDg3ZiA6
IHBucCAwMDowOCAqLwoJCVBJT19SQU5HRSgweDgwMCwgMHg4MCksIAoJCS8qIFBvcnQgSS9POiAw
ODgwLTA4ZmYgOiBwbnAgMDA6MDggKi8KCQlQSU9fUkFOR0UoMHg4ODAsIDB4ODApLCAKCQkvKiBQ
b3J0IEkvTzogMDkwMC0wOTdmIDogcG5wIDAwOjA4ICovCgkJUElPX1JBTkdFKDB4OTAwLCAweDgw
KSwgCgkJLyogUG9ydCBJL086IDA5ODAtMDlmZiA6IHBucCAwMDowOCAqLwoJCVBJT19SQU5HRSgw
eDk4MCwgMHg4MCksIAoJCS8qIFBvcnQgSS9POiAwYTAwLTBhN2YgOiBwbnAgMDA6MDggKi8KCQlQ
SU9fUkFOR0UoMHhhMDAsIDB4ODApLCAKCQkvKiBQb3J0IEkvTzogMGE4MC0wYWZmIDogcG5wIDAw
OjA4ICovCgkJUElPX1JBTkdFKDB4YTgwLCAweDgwKSwgCgkJLyogUG9ydCBJL086IDBiMDAtMGI3
ZiA6IHBucCAwMDowOCAqLwoJCVBJT19SQU5HRSgweGIwMCwgMHg4MCksIAoJCS8qIFBvcnQgSS9P
OiAwYjgwLTBiZmYgOiBwbnAgMDA6MDggKi8KCQkgUElPX1JBTkdFKDB4YjgwLCAweDgwKSwgCgkJ
LyogMTVlMC0xNWVmIDogcG5wIDAwOjA4Ki8KCQlQSU9fUkFOR0UoMHgxNWUwLCAweDEwKSwKCQkv
KiAxNjRlLTE2NGYgOiBwbnAgMDA6MDIqLwoJCVBJT19SQU5HRSgweDE2NGUsIDB4MiksCgkJLyog
MTgwMC0xODAzIDogQUNQSSBQTTFhX0VWVF9CTCovCgkJUElPX1JBTkdFKDB4MTgwMCwgMHg0KSwK
CQkvKiAxODA0LTE4MDUgOiBBQ1BJIFBNMWFfQ05UX0JMKi8KCQlQSU9fUkFOR0UoMHgxODA0LCAw
eDIpLAoJCS8qIDE4MDgtMTgwYiA6IEFDUEkgUE1fVE0qLwoJCVBJT19SQU5HRSgweDE4MDgsIDB4
YiksCgkJLyogMTgxMC0xODE1IDogQUNQSSBDUFUgdGhyb3R0bCovCgkJUElPX1JBTkdFKDB4MTgx
MCwgMHg2KSwKCQkvKiAxODMwLTE4MzMgOiBpVENPX3dkdCAqLwoJCVBJT19SQU5HRSgweDE4MzAs
IDB4NCksCgkJLyogMTg1MC0xODUwIDogQUNQSSBQTTJfQ05UX0JMKi8KCQlQSU9fUkFOR0UoMHgx
ODgwLCAweDIwKSwKCQkvKiAxODU0LTE4NTcgOiBwbnAgMDA6MDUqLwoJCVBJT19SQU5HRSgweDE4
ODAsIDB4MjApLAoJCS8qIFBJT19SQU5HRSgxODgwLTE4OWYpICovCgkJUElPX1JBTkdFKDB4MTg4
MCwgMHgyMCksCgkJLyogUG9ydCBJL086IGQwMDAtZDA3ZiA6IDAwMDA6MDI6MDAuMCAqLwoJCVBJ
T19SQU5HRSgweGQwMDAsIDB4ODApLAoJCS8qIFBvcnQgSS9POiBlMDAwLWUwM2YgOiAwMDAwOjAw
OjAyLjAgKi8KCQlQSU9fUkFOR0UoMHhlMDAwLCAweDQwKSwKCQkvKiBQb3J0IEkvTzogZTA2MC1l
MDdmIDogMDAwMDowMDoxNy4wICovCgkJUElPX1JBTkdFKDB4ZTA2MCwgMHgyMCksCgkJLyogUG9y
dCBJL086IGUwODAtZTA4NyA6IDAwMDA6MDA6MTcuMCAqLwoJCVBJT19SQU5HRSgweGUwODAsIDB4
OCksCgkJLyogUG9ydCBJL086IGUwODgtZTA4YiA6IDAwMDA6MDA6MTcuMCAqLwoJCVBJT19SQU5H
RSgweGUwODgsIDB4NCksCgkJLyogUG9ydCBJL086IGVmYTAtZWZiZiA6IDAwMDA6MDA6MWYuNCAq
LwoJCVBJT19SQU5HRSgweGVmYTAsIDB4MjApLAoJfSwKCgkucGNpX2RldmljZXMgPSB7CgkJLyog
UENJRGV2aWNlOiAwMDowMC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9C
UklER0UsCgkJCS5pb21tdSA9IDEsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDAsCgkJ
CS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFy
dCA9IDAsCgkJCS5udW1fY2FwcyA9IDMsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNp
XzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9
IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiAwMDowMS4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9CUklER0UsCgkJCS5pb21tdSA9IDEsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweDgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDEsCgkJCS5udW1fY2FwcyA9IDcrMiwKCQkJLm51bV9tc2lfdmVjdG9ycyA9
IDEsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjAxLjIgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0JSSURHRSwKCQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4YSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMSsxLAoJCQkubnVtX2NhcHMgPSA3LAoJCQkubnVtX21z
aV92ZWN0b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21hc2thYmxlID0gMCwK
CQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJ
Lm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MDIuMCAqLwoJCXsK
CQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQku
ZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxMCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZjAw
MDAwMCwgMHhmZmZmZmZmZiwgMHhmMDAwMDAwMCwKCQkJCTB4ZmZmZmZmZmYsIDB4ZmZmZmZmYzAs
IDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gOCsyLAoJCQkubnVtX2NhcHMgPSA3
LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21h
c2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6
ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MTQuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9t
bXUgPSAxLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhhMCwKCQkJLmJhcl9tYXNrID0g
ewoJCQkJMHhmZmZmMDAwMCwgMHhmZmZmZmZmZiwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMTUrMiwKCQkJ
Lm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDgsCgkJCS5tc2lfNjRiaXRzID0g
MSwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1z
aXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQ
Q0lEZXZpY2U6IDAwOjE0LjIgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RF
VklDRSwKCQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YTIsCgkJ
CS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmYwMDAsIDB4ZmZmZmZmZmYsIDB4MDAwMDAwMDAsCgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFy
dCA9IDE3KzIsCgkJCS5udW1fY2FwcyA9IDIsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQku
bXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9y
cyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgw
LAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxNi4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VT
RV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDEsCgkJCS5kb21haW4gPSAweDAsCgkJCS5i
ZGYgPSAweGIwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmZmMDAwLCAweGZmZmZmZmZmLCAw
eDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwK
CQkJLmNhcHNfc3RhcnQgPSAxOSsyLAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0
b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAxLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhf
YWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MTcuMCAqLwoJCXsKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAxLAoJCQkuZG9tYWlu
ID0gMHgwLAoJCQkuYmRmID0gMHhiOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZmZTAwMCwg
MHhmZmZmZmYwMCwgMHhmZmZmZmZmOCwKCQkJCTB4ZmZmZmZmZmMsIDB4ZmZmZmZmZTAsIDB4ZmZm
ZmY4MDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMjErMiwKCQkJLm51bV9jYXBzID0gMywKCQkJ
Lm51bV9tc2lfdmVjdG9ycyA9IDEsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJs
ZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAw
eDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFjLjAg
Ki8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0JSSURHRSwKCQkJLmlvbW11ID0g
MSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZTAsCgkJCS5iYXJfbWFzayA9IHsKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDI0KzIsCgkJCS5udW1f
Y2FwcyA9IDgsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJ
CS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3Jl
Z2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2
aWNlOiAwMDoxZi4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0Us
CgkJCS5pb21tdSA9IDEsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGY4LAoJCQkuYmFy
X21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAw
LAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJp
dHMgPSAwLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJ
CQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJ
CS8qIFBDSURldmljZTogMDA6MWYuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZ
UEVfREVWSUNFLAoJCQkuaW9tbXUgPSAxLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhm
YSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZmYzAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBz
X3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJ
CS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0
b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAw
eDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFmLjMgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhP
VVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJ
LmJkZiA9IDB4ZmIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmMwMDAsIDB4ZmZmZmZmZmYs
IDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweGZmZmYwMDAwLCAweGZmZmZmZmZmLAoJCQl9
LAoJCQkuY2Fwc19zdGFydCA9IDMyKzIsCgkJCS5udW1fY2FwcyA9IDIsCgkJCS5udW1fbXNpX3Zl
Y3RvcnMgPSAxLAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQku
bnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNp
eF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxZi40ICovCgkJewoJCQku
dHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDEsCgkJCS5kb21h
aW4gPSAweDAsCgkJCS5iZGYgPSAweGZjLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmZmZjAw
LCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHhmZmZmZmZlMCwgMHgw
MDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21hc2thYmxl
ID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4
MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWYuNiAq
LwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAx
LAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhmZSwKCQkJLmJhcl9tYXNrID0gewoJCQkJ
MHhmZmZlMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMzQrMiwKCQkJLm51bV9j
YXBzID0gMywKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDEsCgkJCS5tc2lfNjRiaXRzID0gMSwKCQkJ
Lm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVn
aW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZp
Y2U6IDAyOjAwLjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwK
CQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MjAwLAoJCQkuYmFy
X21hc2sgPSB7CgkJCQkweGZmMDAwMDAwLCAweGYwMDAwMDAwLCAweGZmZmZmZmZmLAoJCQkJMHhm
ZTAwMDAwMCwgMHhmZmZmZmZmZiwgMHhmZmZmZmY4MCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAz
NysyLAoJCQkubnVtX2NhcHMgPSA5LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1zaV82
NGJpdHMgPSAxLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAw
LAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9
LAoJCS8qIFBDSURldmljZTogMDM6MDAuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJ
X1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAxLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0g
MHgzMDAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmUwMDAsIDB4ZmZmZmZmZmYsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDQ2KzIsCgkJCS5udW1fY2FwcyA9IDcsCgkJCS5udW1fbXNpX3ZlY3RvcnMg
PSAxLAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21z
aXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRy
ZXNzID0gMHgwLAoJCX0sCgkJeyAvLyBJVlNITUVNIChuZXR3b3JraW5nKSAKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSwKCQkJLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4
MDAwMCwKCQkJLmJkZiA9IDB4MGQgPDwgMywKCQkJLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hN
RU1fQkFSX01BU0tfTVNJWCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAyLCAKCQkJLnNobWVtX3Jl
Z2lvbnNfc3RhcnQgPSA1NiwKCQkJLnNobWVtX2Rldl9pZCA9IDAsCgkJCS5zaG1lbV9wZWVycyA9
IDIsCgkJCS5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19WRVRILAoJCX0s
CgkJeyAvL0lWU0hNRU0gKGRlbW8pIDE2IAoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9J
VlNITUVNLAoJCQkuaW9tbXUgPSAxLAoJCQkuZG9tYWluID0gMHgwMDAwLAoJCQkuYmRmID0gMHgw
ZSA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1FTV9CQVJfTUFTS19NU0lYLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDE2LAoJCQkuc2htZW1fcmVnaW9uc19zdGFydCA9IDYwLAoJ
CQkuc2htZW1fZGV2X2lkID0gMCwKCQkJLnNobWVtX3BlZXJzID0gMiwKCQkJLnNobWVtX3Byb3Rv
Y29sID0gSkFJTEhPVVNFX1NITUVNX1BST1RPX1VOREVGSU5FRCwKCQl9LAoJCS8qCgkJeyAvLyBJ
VlNITUVNICh2aXJ0aW8tY29uIGJhY2stZW5kKSAKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZ
UEVfSVZTSE1FTSwKCQkJLy8uaW9tbXUgPSAxLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0g
MHgwYyA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1FTV9CQVJfTUFTS19NU0lY
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDMsCgkJCS5zaG1lbV9yZWdpb25zX3N0YXJ0ID0gNjQs
CgkJCS5zaG1lbV9kZXZfaWQgPSAwLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJv
dG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVklSVElPX0JBQ0sgKwoJCQkJVklSVElPX0RF
Vl9DT05TT0xFLAoJCX0sKi8KCX0sCgoJLnBjaV9jYXBzID0gewoJCS8qIFBDSURldmljZTogMDA6
MDAuMCAqLwoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9WTkRSLAoJCQkuc3RhcnQgPSAweGUwLAoJ
CQkubGVuID0gMHgyLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lE
X1ZORFIsCgkJCS5zdGFydCA9IDB4MjAsCgkJCS5sZW4gPSAweDEwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MDEuMCAqLwoJCS8q
IFBDSURldmljZTogMDA6MDEuMiAqLwoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9TU1ZJRCwKCQkJ
LnN0YXJ0ID0gMHg4OCwKCQkJLmxlbiA9IDB4MTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lD
QVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1BNLAoJCQkuc3RhcnQgPSAw
eDgwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwK
CQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4OTAsCgkJCS5s
ZW4gPSAweGEsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJ
CQkuaWQgPSBQQ0lfQ0FQX0lEX0VYUCwKCQkJLnN0YXJ0ID0gMHhhMCwKCQkJLmxlbiA9IDB4M2Ms
CgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQ
Q0lfRVhUX0NBUF9JRF9WQyB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgx
MDAsCgkJCS5sZW4gPSAweDIwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwK
CQl9LAoJCXsKCQkJLmlkID0gUENJX0VYVF9DQVBfSURfUkNMRCB8IEpBSUxIT1VTRV9QQ0lfRVhU
X0NBUCwKCQkJLnN0YXJ0ID0gMHgxNDAsCgkJCS5sZW4gPSAweDQsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCQl7CgkJCS5pZCA9IFBDSV9FWFRfQ0FQX0lEX1NFQ1BDSSB8IEpBSUxIT1VTRV9QQ0lfRVhU
X0NBUCwKCQkJLnN0YXJ0ID0gMHhkOTQsCgkJCS5sZW4gPSAweDEwLAoJCQkuZmxhZ3MgPSAwLAoJ
CX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1ZORFIsCgkJCS5zdGFydCA9IDB4MjQwLAoJCQku
bGVuID0gMHgxMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQkv
KiBQQ0lEZXZpY2U6IDAwOjAyLjAgKi8KCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfVk5EUiwKCQkJ
LnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDB4MiwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJ
LmlkID0gUENJX0NBUF9JRF9FWFAsCgkJCS5zdGFydCA9IDB4NzAsCgkJCS5sZW4gPSAweDNjLAoJ
CQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSSwKCQkJLnN0YXJ0
ID0gMHhhYywKCQkJLmxlbiA9IDB4YSwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJ
VEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfUE0sCgkJCS5zdGFydCA9IDB4ZDAsCgkJ
CS5sZW4gPSAweDIwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJ
CXsKCQkJLmlkID0gUENJX0VYVF9DQVBfSURfUEFTSUQgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAs
CgkJCS5zdGFydCA9IDB4MTAwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJ
ewoJCQkuaWQgPSBQQ0lfRVhUX0NBUF9JRF9BVFMgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJ
CS5zdGFydCA9IDB4MjAwLAoJCQkubGVuID0gMHg0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJ
CQkuaWQgPSBQQ0lfRVhUX0NBUF9JRF9QUkkgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5z
dGFydCA9IDB4MzAwLAoJCQkubGVuID0gMHg0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJLyogUENJ
RGV2aWNlOiAwMDoxNC4wICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1BNLAoJCQkuc3RhcnQg
PSAweDcwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklU
RSwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4ODAsCgkJ
CS5sZW4gPSAweGUsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJ
LyogUENJRGV2aWNlOiAwMDoxNC4yICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1BNLAoJCQku
c3RhcnQgPSAweDUwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQ
U19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4
ODAsCgkJCS5sZW4gPSAweGEsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiAwMDoxNi4wICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1BN
LAoJCQkuc3RhcnQgPSAweDUwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
UENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFy
dCA9IDB4OGMsCgkJCS5sZW4gPSAweGUsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dS
SVRFLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxNy4wICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQ
X0lEX01TSSwKCQkJLnN0YXJ0ID0gMHg4MCwKCQkJLmxlbiA9IDB4YSwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfUE0sCgkJ
CS5zdGFydCA9IDB4NzAsCgkJCS5sZW4gPSAweDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lD
QVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1NBVEEsCgkJCS5zdGFydCA9
IDB4YTgsCgkJCS5sZW4gPSAweDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6
IDAwOjFjLjAgKi8KCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfRVhQLAoJCQkuc3RhcnQgPSAweDQw
LAoJCQkubGVuID0gMHgzYywKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NB
UF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4ODAsCgkJCS5sZW4gPSAweGEsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1NTVklE
LAoJCQkuc3RhcnQgPSAweDkwLAoJCQkubGVuID0gMHgyLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJ
ewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1BNLAoJCQkuc3RhcnQgPSAweGEwLAoJCQkubGVuID0gMHg4
LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0g
UENJX0VYVF9DQVBfSURfRVJSIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAw
eDEwMCwKCQkJLmxlbiA9IDB4NDAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBD
SV9FWFRfQ0FQX0lEX0FDUyB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgx
NDAsCgkJCS5sZW4gPSAweDgsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9F
WFRfQ0FQX0lEX0wxU1MgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MjAw
LAoJCQkubGVuID0gMHg0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfRVhU
X0NBUF9JRF9TRUNQQ0kgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MjIw
LAoJCQkubGVuID0gMHgxMCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MWYuMyAqLwoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9QTSwKCQkJLnN0YXJ0ID0gMHg1MCwKCQkJ
LmxlbiA9IDB4OCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7
CgkJCS5pZCA9IFBDSV9DQVBfSURfTVNJLAoJCQkuc3RhcnQgPSAweDYwLAoJCQkubGVuID0gMHhl
LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCS8qIFBDSURldmlj
ZTogMDA6MWYuNiAqLwoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9QTSwKCQkJLnN0YXJ0ID0gMHhj
OCwKCQkJLmxlbiA9IDB4OCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJ
fSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfTVNJLAoJCQkuc3RhcnQgPSAweGQwLAoJCQkubGVu
ID0gMHhlLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJ
LmlkID0gUENJX0NBUF9JRF9BRiwKCQkJLnN0YXJ0ID0gMHhlMCwKCQkJLmxlbiA9IDB4MiwKCQkJ
LmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDI6MDAuMCAqLwoJCXsKCQkJLmlkID0g
UENJX0NBUF9JRF9QTSwKCQkJLnN0YXJ0ID0gMHg2MCwKCQkJLmxlbiA9IDB4OCwKCQkJLmZsYWdz
ID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURf
TVNJLAoJCQkuc3RhcnQgPSAweDY4LAoJCQkubGVuID0gMHhlLAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9FWFAsCgkJCS5z
dGFydCA9IDB4NzgsCgkJCS5sZW4gPSAweDNjLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQku
aWQgPSBQQ0lfRVhUX0NBUF9JRF9WQyB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0
ID0gMHgxMDAsCgkJCS5sZW4gPSAweDEwLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQg
PSBQQ0lfRVhUX0NBUF9JRF9MVFIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9
IDB4MjUwLAoJCQkubGVuID0gMHg4LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQ
Q0lfRVhUX0NBUF9JRF9MMVNTIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAw
eDI1OCwKCQkJLmxlbiA9IDB4NCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gUENJ
X0VYVF9DQVBfSURfUFdSIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDEy
OCwKCQkJLmxlbiA9IDB4MTAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9F
WFRfQ0FQX0lEX1ZORFIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4NjAw
LAoJCQkubGVuID0gMHgyOCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0VY
VF9DQVBfSURfU0VDUENJIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDkw
MCwKCQkJLmxlbiA9IDB4MTAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAz
OjAwLjAgKi8KCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfUE0sCgkJCS5zdGFydCA9IDB4YzgsCgkJ
CS5sZW4gPSAweDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJ
ewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSSwKCQkJLnN0YXJ0ID0gMHhkMCwKCQkJLmxlbiA9IDB4
ZSwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9
IFBDSV9DQVBfSURfRVhQLAoJCQkuc3RhcnQgPSAweDQwLAoJCQkubGVuID0gMHgzYywKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9FWFRf
Q0FQX0lEX0VSUiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxMDAsCgkJ
CS5sZW4gPSAweDQwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJ
CXsKCQkJLmlkID0gUENJX0VYVF9DQVBfSURfRFNOIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJ
CQkuc3RhcnQgPSAweDE0MCwKCQkJLmxlbiA9IDB4YywKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BD
SUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9FWFRfQ0FQX0lEX0xUUiB8IEpBSUxI
T1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxNGMsCgkJCS5sZW4gPSAweDgsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfRVhU
X0NBUF9JRF9MMVNTIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDE1NCwK
CQkJLmxlbiA9IDB4NCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwK
CX0sCn07Cg==

--_006_AM0PR07MB542635593444EA2E8226A9D2B2640AM0PR07MB5426eurp_--
