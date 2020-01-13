Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBM7A6HYAKGQEBSJWYLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id F3440139226
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:27:15 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id c17sf4955877wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=flFN/z+MxVYJZnBa8tidBct1gXNrQViHH+jq/wE9Ajc=;
        b=tW5dAPo0dEWvM0QYa9/4pY3pt5tvtujCZePLuTUJL5xMnv6CKtxrECaHUpXb7IRc8o
         yRXagQDvBz04LB1nRD7Vp6N+4a3RdSViVeHJdONZprlp7YU17UvNGZ7mBZFi5eYYWduX
         74SlitGHCsNgTWVKcMnNve1hSAHL1T4bjzj4REibyC1kzRY5Ri7jooG54ijziPMRCZ5c
         0C123858xv+rEh+u32+gHgT6MLvi4Dz3Hw05Har/2UqFT9qrIzR7PwYyO8NAkO+I8Owo
         onvdnAxU0Yx+dQf1KbQizvtd2xP2oNjIbrIqxapohWpI29onPyPM/Jwd1hUc382L9JUE
         0JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=flFN/z+MxVYJZnBa8tidBct1gXNrQViHH+jq/wE9Ajc=;
        b=YHmNLJlL5MbG3aAy+GUmElyOZtAh0F6pbRwWqmVhnYNgkO4VvSc6K4w5XMg24+lmxn
         EIudjQIF0SHWACckLVi2MvZZPSEiDZ7zyAsOwAG7pOQlvKburbM9IThSGIFom7BmmwQL
         cyRSQarTtZ/wl9NW05yHFr4NKurfpCA2zSbf+35+8kEVASE0QcLpzWmaLh5/UGBhQkm2
         q4Z1tt6R2V2QSP32D42MUFgU9LHdaGHtiLWWc098PQaj6L9/EdR9DuoTfZIhl8KVkg+6
         5KPZFAoEXrkkUWHGk1EQNqlELWacjtlgkNCi6e2lsMbA6cKLbDe8cuiZRxZc9sgvWMTA
         81VA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUj2o9jDWza4i1RQpLhSmOhZD2Ig21/9rgwgZ3I55EgaRgCURI3
	PtyrQyO+jQseaFFVz4g8iIA=
X-Google-Smtp-Source: APXvYqxnE93ddfcXh1NZ6dWO0rYwrydFfCcIJTm676IrxBIG3v4XapLsLMSP07Tno6g92R2bEeULTg==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr19199427wrp.171.1578922035572;
        Mon, 13 Jan 2020 05:27:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls6094962wmg.0.canary-gmail; Mon,
 13 Jan 2020 05:27:14 -0800 (PST)
X-Received: by 2002:a1c:ddd7:: with SMTP id u206mr21489966wmg.159.1578922034944;
        Mon, 13 Jan 2020 05:27:14 -0800 (PST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80050.outbound.protection.outlook.com. [40.107.8.50])
        by gmr-mx.google.com with ESMTPS id t131si514377wmb.1.2020.01.13.05.27.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.8.50 as permitted sender) client-ip=40.107.8.50;
Received: from VI1PR08CA0235.eurprd08.prod.outlook.com (2603:10a6:802:15::44)
 by VI1PR0801MB1693.eurprd08.prod.outlook.com (2603:10a6:800:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Mon, 13 Jan
 2020 13:27:13 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR08CA0235.outlook.office365.com
 (2603:10a6:802:15::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13 via Frontend
 Transport; Mon, 13 Jan 2020 13:27:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 13 Jan 2020 13:27:13 +0000
Received: ("Tessian outbound ca1df68f3668:v40"); Mon, 13 Jan 2020 13:27:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2ea90f10ef31dab
X-CR-MTA-TID: 64aa7808
Received: from 09c5ecc63a51.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 012D2278-91B6-47FD-90AD-21C71393FEA6.1;
	Mon, 13 Jan 2020 13:27:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09c5ecc63a51.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Jan 2020 13:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYShYpxsfwfnsIkVkjB5gF52PYHhPjhhToJqBHKfhRhSgbveYuHFJf2inNSWMmEPgNlR6szM1MFbuzOhMS47vHhAHTUEex4QGtfDjLrJPDau+psn1gqzLhVlLDkVdZZd3nlJ72GjgNsxER48IvTijGXJls/Ow/k1NlwX8nWWJxL2sTBgzZrsCa1NoYOvaE0VBJg21b0Ch8MUl98VqNNtNkY0PXgWCyUV+/D1UsqcDhM+x77sIf6bOSroIrDOJvbYioLB6nqWSIn9eumhzjZ2+PE+aLq9/JORl/aCcAjML2JwGUENwpDdbDeW3gOl5oRbBQeP73gWVuFSMhcv+jng6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1DTpsPjyO1L6az0WbDBZG2tRM9B7aq3gk0ihJi6Igo=;
 b=bRy+ctNcviDYVKpji6+LYkm4f2yohISpx2vljIGI2Zqdsn60yM0vKTiuJEYokAxynizAmuzDSKlzUzvdIIUhVxAF9KtO78h/yoedst+bWhBPvN7xNhcMrspqxud212h793COR53syv0+H8Ndmzr0U/Rj+nrLaWov528DJBZD2qvbCgotDz1nkl/oDinqLPlBN4CDLIPOBgnYkM+gEqqqVHYWeBSWBWNulOcbg9ck3bQQ2ULaLgW6c0v57pVvnSaGp4exq76meoVxHJSCuqMFGmNKv25SsB/7gcP1a2bGuLs66v7S5M6/YDmsis6MDQMzqB4nigUDiJJIPif5BpPavg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com (10.255.114.77) by
 VE1PR08MB4911.eurprd08.prod.outlook.com (10.255.115.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 13:27:05 +0000
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885]) by VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 13:27:05 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] arm-common: gic-v3: ensure LR writes are visible
Thread-Topic: [PATCH] arm-common: gic-v3: ensure LR writes are visible
Thread-Index: AQHVxwUsrmKcnXcJuUqGA5r2y0JjrqfoHvcAgAAYtIA=
Date: Mon, 13 Jan 2020 13:27:05 +0000
Message-ID: <C8CE26B4-1B4A-4115-8F21-F2C6723B8DF6@arm.com>
References: <20200109155423.125000-1-chase.conklin@arm.com>
 <3efc9991-a9d0-9681-de34-cf40664d6971@web.de>
In-Reply-To: <3efc9991-a9d0-9681-de34-cf40664d6971@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [72.177.104.243]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aba081f7-510e-4619-fdae-08d7982c4cd7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4911:|VI1PR0801MB1693:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB16930B62E889FF904FB2CCFAFB350@VI1PR0801MB1693.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 028166BF91
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(40434004)(189003)(199004)(2906002)(91956017)(76116006)(8936002)(6512007)(2616005)(66476007)(64756008)(26005)(66446008)(6506007)(53546011)(36756003)(110136005)(66556008)(6486002)(8676002)(81156014)(81166006)(33656002)(186003)(316002)(478600001)(86362001)(66946007)(5660300002)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4911;H:VE1PR08MB4893.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: s7nTBJGl9lTNTMqA+08RE4ylQMgXt1bi6KLSYOnRggv2sYMkD2Xz7n29Lp5AU4E4wveFh5traYt+R++n96AY5VrvESRpN7WNfw+jOC/wwQBkcg+hVsZ7EZ5hQkv7dmDhBKAX3FQiADZVafTBn1nfPEIHfhIHNErnyzhAGQOwq4PbKob9kNQ57mhLS1zmfX2TqD4fsPIlvnLftSYV9XTWz+c4Yv6D0DWop3FiFJ8/K0arAW8hUD+A43wc1wRDnoNGMhGdyxSqiWyxnN25AbsbMaLPnxGZLuursluEgHIS6Lwyh6CoXDSU9RwklMypYg748gstL8oN6IjxLNj5j3VBnHB3Adyy/ilezwtENf9Txs7dQ/7N3L7LJhu8HJMLe89Gvh9/Pl9XDdHFgptCfPIEMACbsCfW9enwfSdVMA1dk0wqHolksTAgxc4SBTZkhOhbLk9s1qvIYnQ6n4Ggjo7otv4SNF4qfPocNUUOCjnDk1RdT1m1RWKzHJAlwbCjmzxq
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <B3EE33A67FAFB2498FD16ADAAFF05730@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4911
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Chase.Conklin@arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(40434004)(189003)(199004)(110136005)(5660300002)(86362001)(70586007)(356004)(6486002)(36906005)(26826003)(316002)(2616005)(478600001)(26005)(336012)(6512007)(6506007)(186003)(8936002)(33656002)(81166006)(81156014)(8676002)(2906002)(70206006)(36756003)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0801MB1693;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 02a60183-5105-4a38-8b75-08d7982c486b
X-Forefront-PRVS: 028166BF91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYwyb/teDCEtmxCgAHNxBkSGzgzDglX6Z71FpgftlFfXR72SR7dcYSVTx/Otyr9+klHb1frDWwvHsz8lflY/dr2cjzier2cbl0B7sX4qmprG5oYn2sLaI4QAEchptD3nW3HmM/hvVkjh3mjU6ptRZCuugq5lY1AnEeukXc2Nc640N+B/UxYQ3kp4LRFiM11HWWpYM2Fpx2XshCBiq54vFTaIBNF/2Xrq17MFe8LjgS+bhREAGoh1+rH+H3kVN/1Wc/RFLXwWYIwJz9k0kO6w+g1Qxdi2P4ct7RABGT1HAUXE4r9unnDskWsv4DksxcnvqUlk0CbiK9J1XvWaGluGtvQyDz9IjXdJv6yJEcrF8TgeFbgMOlxCiyARD8tWismDpU5U4VPcrpcs1SvVlo/ANBuiRYjoSUurL6PA00jJOnaXQMckrqaopdmLgaieAmLUpG2LK1XPJV/Ir7dGbMuMrlTNE/wybQ1mr5JkBJXrf230yAoSPR3jeZNTDHe6ACLv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 13:27:13.0300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba081f7-510e-4619-fdae-08d7982c4cd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1693
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=RYwRIGtK;       dkim=neutral (body hash did not verify)
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=rXcXN+I3;       arc=fail (body hash mismatch);       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 40.107.8.50 as
 permitted sender) smtp.mailfrom=Chase.Conklin@arm.com
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

On 1/12/20, 11:58 PM, "Jan Kiszka" <jan.kiszka@web.de> wrote:
> On 09.01.20 16:55, Chase Conklin wrote:
>> The GICv3 architecture does not guarantee that writes to the list
>> registers are self-synchronizing. As a result, it is possible for a
>> valid interrupt to be written into a list register but have the empty
>> list register status register report that list register as not holding
>> a valid interrupt. Since the empty list register status registers are
>> used to indicate which list registers can be used to inject an
>> interrupt to a cell, it is possible for a valid list register entry to
>> be overwritten, dropping the corresponding interrupt.
>>
>> Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
>> Signed-off-by: Chase Conklin <chase.conklin@arm.com>
>> ---
>>   hypervisor/arch/arm-common/gic-v3.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-c=
ommon/gic-v3.c
>> index 906d9a8d..6a1d90f8 100644
>> --- a/hypervisor/arch/arm-common/gic-v3.c
>> +++ b/hypervisor/arch/arm-common/gic-v3.c
>> @@ -113,6 +113,12 @@ static void gicv3_write_lr(unsigned int reg, u64 va=
l)
>>   __WRITE_LR8_15(7)
>>   #undef __WRITE_LR8_15
>>   }
>> +
>> +/*
>> + * Ensure the write to the LR is visible to the GIC (so that ICH_ELRSR
>> + * is updated to indicate that the just-written LR is no longer empty)
>> + */
>> +isb();
>
> Ah, good to know. May we have such issues elsewhere as well? GICv2 is
> not affected because it uses MMIO accesses, right?

It's possible that this sort of issue exists elsewhere; I haven't done a
thorough check for all system register writes that affect EL2/Hyp context. =
I'm
less familiar with GICv2 than GICv3, but I don't think an ISB would be requ=
ired
after list register writes because it uses MMIO. That said, a DSB may be
necessary to ensure a store to a LR is completed prior to a subsequent ELSR
load to ensure that it reflects the value stored to the LR.

> Unfortunately, both your patches got mangled by your mail client. Can
> you resent, maybe directly via git send-email?

Yikes! I used git send-email. I'll look into why the patches got mangled an=
d
repost soon.

Thanks,
Chase

> Thanks,
> Jan
>
>>   }
>>
>>   static int gicv3_init(void)
>> --
>> 2.22.0
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/C8CE26B4-1B4A-4115-8F21-F2C6723B8DF6%40arm.com.
