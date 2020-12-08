Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB6GWXP7AKGQEZRWMSBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 666142D212F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 03:56:57 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id dc6sf6778769edb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Dec 2020 18:56:57 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607396217; cv=pass;
        d=google.com; s=arc-20160816;
        b=e8FQ9aAuKIOtPuQKqZ/3E5I12GBRweeZm51CcKCQBnndxr3Nqp3BRyrh7DBoxQclKC
         eofF02m84bWvmImmT8FTVudfJ8pWB32t6HmrSiQrvYIkUdVfCNcdMUzVwcI2m/Qa6IN7
         ItzZyIvfXCrdWpogPKmUnG0eKnH2kgvc0Ep7bZFjF02pVWJTS5HEOZrOb9X9gPYUFNnX
         XMNtO9XNs9HY/mw9lYPciStrQ6gBu/tPUmnrkHXDSYjnaV12eisUttqfPG2sj3YuDyrx
         M6HM6Vcsu9pLK5t/x62KmykZmbVMY5sCR7sE99W8XkhwoIA+BelGrn6GE/DwFKQpBlcz
         xEKw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=dBIjHwvdQs55Abr086heUiwnxKy0VvXmjY/FE2pK4Y0=;
        b=SCIkUtGTDHvC/atiNRHVqOUphW/Z8Mj+5E7Bq6GsknMuZZilqLyYqhfs2UvE8q2x6T
         I6fDnrxTENjH+voeur3ZxzoBLZ4ZPYt9kq+c2Hth60Vt725bVgyiyLnQJtRwu0Z9aZP+
         ure/o+42ZtxhqZbjYliZyYgKj2fHUTNnqbVzNqgffsfysZD/Pg3tuDywoX+6KkgraGWS
         p914aem506GAYVMrlplyDcJAkowup+tGP1ReyVE1VsgqcisrtLABm9SQy0fz0WiKrWXE
         RUpem7s+RWP842ayXKzhzAS5azEImGqNaJDd8dN9VA4pSoM/z9izbaTaqFWpk5RbN7Am
         +TCQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lQwRbzw9;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dBIjHwvdQs55Abr086heUiwnxKy0VvXmjY/FE2pK4Y0=;
        b=XK1pLqKvrB1X5q2efCBF42IttI2PahTTc+HVhCo74I04/qv7wbsBx92Js0gmjVq5mv
         7ovxS+lhkhW4tZFIijW9NaoAar3smTbn0Hz6vfHxn4B5VGfp8tlICMr03Z8LiXBAL5nf
         Qd6fIGF3OkG8dUjtrMVAmO98j2i5TIItN/cH0KDSjYDd0dELP/InEs/EYaEgHczfxiNp
         WPWBQWPzwWJ+wE9huQnFXm3iN+K0I06Lfl4n9+LSK7LtwsCOz411bos/tzpYW5sEnJY3
         eVlbcyW9GRVT5wTLE+x/bIihxAY6YG7ZGBh4LWtF4P4ufvWXu7wjZkdxYmOnySW68Atk
         ifSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dBIjHwvdQs55Abr086heUiwnxKy0VvXmjY/FE2pK4Y0=;
        b=WfaL3o27YgYR0na1rc71GDAkR5mr52QXYjq5Mj8Cn9KVgboTRpwvWeeVI7uV7/GFYD
         tTGJuiXGgQ/jVyxx4381gmB23jMLqkYEe0lV9AebWwOddXzwfnFPVeQCzmlleveKG/JF
         ypZmiUa+2RRQIA5jx9EndfN2euwnfIXaAO8kUH1P6sF/+gNdv8bVFC7XloKkckzQ1vps
         T6/HtJDNpolAbjpDPAUT8rLT5ilScx0aLHVA1V2VeRhRpTDjk+7PDsNvOMhdtpeXIXgl
         Uf0++TZrCc6mgJ4wJkV4Voej9ACdvbrIz46MlNhhtdR4NEtEUTYQaLnBLCSxqaO4WCXT
         vTUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oQoKgOet6KeqpAevaf6UPqKkgAJ4lypSqaiXWuWnIycsEOGu/
	/U8V/35dRlfAPtuwGZjhqRc=
X-Google-Smtp-Source: ABdhPJxk7kSPKNiBwxtbWdzflm926LNLfuDQtDVtw9iSXhcPtwnCBHZFmymGSbyTwJ/j2zTbMlb9yg==
X-Received: by 2002:a17:906:a0c3:: with SMTP id bh3mr21674329ejb.497.1607396217177;
        Mon, 07 Dec 2020 18:56:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:22d3:: with SMTP id dm19ls1573990edb.2.gmail; Mon,
 07 Dec 2020 18:56:56 -0800 (PST)
X-Received: by 2002:a50:8f64:: with SMTP id 91mr22880716edy.310.1607396216331;
        Mon, 07 Dec 2020 18:56:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607396216; cv=pass;
        d=google.com; s=arc-20160816;
        b=r4BLRDyPowAom9RQ3LY9Hvw0hp7QOuLJ3TuWe12L9U08mLlIzTLIPbdLCB1zkUpAzL
         txBTQOoTCIxFQqbzU6/lOazHX3k63EJ1JLcArKU5jPi2yxB9QB6QvpeipM1vQ1C1jIs8
         21mHe5DGFW1P15b/sgXPxYtjdANlYWqD9v39OINjlkDwDT5eHvtkAQjmkgCFk8RD/RRb
         Vjv9v6cJnWBOvTSZCgEtGtsiVcNmp1xRyqAbMEL7yLpmWCkLJho/PuUvYu7jIAxRaImy
         5wTLq5LFyiUxvAMI5oSEJc/iJUx5HHKACR23RDvLtOM6DGgUa5U7AxrCgM3nCKu5Eoxn
         ewkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=Ek5bR7+7Kb29ojhfMnsXkqkTICF4HrEDJ3PcCUyUyuk=;
        b=o5t5h6pqTF9Ood7z3WnQOuM7p/Kj1kvYL0Qe1uQMde3F5MByA424rkWWnPcnof28Si
         CA4YTEJ2J5zfI+VF7sMfgPGfyxZod0gX2Sp9z5mAmCVX2D5liTtg2jGXZzDTdUN50B53
         ToAre0bcjMYZmCDUr4aueMjbBKVCkz3mUdRgf/IW5eQGxXbDnkYsrhhk40wwiewImlwk
         EsfJsRGCVMHC2JIEQ3ePUHItjQaWjtxFkAlN935qclTwge2IFqw6nSBEZLJLNbqcqIqF
         6mqpD6ObBQiqcuWkGFYKfPPaFAk9jVolmMOy81WXLYINzKAcU0+RTspm5HEIZD6AWDWm
         vjlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lQwRbzw9;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150048.outbound.protection.outlook.com. [40.107.15.48])
        by gmr-mx.google.com with ESMTPS id i6si564999edk.4.2020.12.07.18.56.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 18:56:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.48 as permitted sender) client-ip=40.107.15.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxVSrWyhY3KR31nluRbvEjVm8R5tj5YzH8swzYE+KiwOcbwJbgpBYM35QtwE5SRZ06BoZc+DVabcFy59b5g86IiOV8Gdyi2tqiM+XAqyqu+xP5om7DPKFvSmPiR9rWoctK+sAZ2G4E7axZBN3QUweXiYVjiQ1JC0lck9U779sgCoyYnhUc6ZQ64FqjkQG0cruZMOwQZMP3RhHw05eOYInb9qQHnCDAj73OqO/CcxGQYDCLvN9ypgi+MUW5pJTRuFD8T2qkWbCOx2pin5ml58qtzRNGnuVbMNT50V7DgMvAyc8K9m1xjwt61pnw2svFP+IWIFYqTV4Akew2ydIiD3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek5bR7+7Kb29ojhfMnsXkqkTICF4HrEDJ3PcCUyUyuk=;
 b=aWsYiQG4K5HdYFPalRHabj0gBtw/FGoiu+7F6ME8FVqk83xlsZ4BvpiiWoaG1Jbqqf4oYJ+zaAJaevRsij20ZM+X+4PZ1nGFNzE/jflRMEglWia/OdIuO8/lmeK/fdBvujK0TI8LyzLVPLq/CbSD8jHTKyirzARV4GEYJ9PstQNF6KwkKcUqjekv7Cgm3IrNu4O1JNK4Fl3bNSec1xdsiAWebPkkO1/wdEka3b8pCofHLqzQ/TknVFgP3HyHOIEY7QhQSL4s0dhAsGN8EZzebSo1l8HD8xTpsnQ9g87eVtMNmqSZo4CafPdpDu0KqazJV28Eh85ZY0xhhacLLkxiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4762.eurprd04.prod.outlook.com (2603:10a6:10:16::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Tue, 8 Dec
 2020 02:56:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Tue, 8 Dec 2020
 02:56:55 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQADqiQAACSJ9gA=
Date: Tue, 8 Dec 2020 02:56:55 +0000
Message-ID: <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
In-Reply-To: <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5993ce9f-3d62-44c4-e1ec-08d89b24ec1b
x-ms-traffictypediagnostic: DB7PR04MB4762:
x-microsoft-antispam-prvs: <DB7PR04MB47626569A0C03909B90D71F588CD0@DB7PR04MB4762.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RdW+aDfJodocLKKMzPliidnRzqNzbMGryvfXsV3gPhP4HVY9APK/A6Vdef93PIytaKpKTVcSh0q+iFbxaFzJwhcXUrM+f6j2hCbgsby0yiA/n9Ey8SQ3fJ1nu8sYvogeqw/q9x1RtxD7yqKi+tJyUK2FmsKLLCq+nb5HmqXe8SQqsREUNwxu8IZvIm5XvS1i1M906TWuPLOz8E4rmewF4bG+VgijAXVx06+xTbHTWetl6Q41YlY2GkoIdXefdC2qN/759Xxw/IrcIQqKX8a94iOfLcT///4OySsb480EPeC6WEpeOie8bD+oygpb/1828L2L2Z0NTs27Lu2SEAGNa7dnE19fn9c+r0K6W09pZb+7zFmVMimxmKF+BDD0J3yVg2Aue+ibzUXh7NCFTQg30Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(966005)(55016002)(9686003)(66556008)(44832011)(33656002)(45080400002)(110136005)(86362001)(508600001)(71200400001)(2906002)(5660300002)(66476007)(64756008)(83380400001)(66946007)(7696005)(53546011)(8936002)(52536014)(8676002)(26005)(66446008)(6506007)(76116006)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UWd5TE53MzBlVFZNWHp2TEUvMDdIRng4dlg2NTNUc2FWSDdCdFVYZUdpNjdZ?=
 =?utf-8?B?OHJZL2lQQ1dONFBXOXJ3T1JpM0FqbURZWHVtWGxXdWMyM2N5M0FsTGJEbTdJ?=
 =?utf-8?B?bW5CZk1nRWUzTnJDMytGYW1xUTZRMm5HY25GNHpjdVNSMUpTa0p1K0x2YWlD?=
 =?utf-8?B?MnV4azNxOXA4WGFSV0lHd28rUmFOdUhOQmdyTG9GRUIzZ3FNdFFpbGxKVkFV?=
 =?utf-8?B?cUtNZUkxN3dWMlk1a0V4V2o4bFdTQUllT3FRWjhpUTdrMWR2NC80Y2xQa2dT?=
 =?utf-8?B?MFA3bzh4SEhXUHppeTZOMkxLRVFRdVhkOStHOEd3c21hcDNyRUNVa1N6K3hk?=
 =?utf-8?B?RURmeEp2eGY1eElYdjNraGhxWDVaVlhIUXpYRE1FNWxWYlVsWjh5U04yMHp4?=
 =?utf-8?B?UVU0eDRlYkptMytNdGVFcTdraEw5czZWNXNJVkRTQ01Ma1huem1OTGZoNHpK?=
 =?utf-8?B?ZTViQldFZllRTUZ4WDQyWUQyNWc0VkdoeEtsM3N3emNRYStKMkFhL01BbFJY?=
 =?utf-8?B?T0swaVFiWHJlVytYaHhHTjJiZk5HSDllQTZZelJrc3RDRHAyTzdoVUxmc3dY?=
 =?utf-8?B?VmVTaGJTR3pwc0VUQTZOQjdqR3MxdDdpZFk2Q2Y2ZDFsK3ZIWjMxOVJVbEtW?=
 =?utf-8?B?Y0gvc2dOdEtrRVlBWFdsMllXTXZ1VkdXcWVWamQwWUI4RzNTYytUYk1QbVQz?=
 =?utf-8?B?M1RNWUpmVU4xZGJkN2dwN3gyT1dyZjlzWmtUN3dWK2Z1NFVXelpmcHhEYUE5?=
 =?utf-8?B?eTl0dm56elRPOUQ5SHNKaEwwU29Vd2FzdkJ5RlZ1L2dscWdQbVEzNmYzeTZ6?=
 =?utf-8?B?UjhCSUx2SllXUDY1dFRSM3RYRCtPYmNYQlN2MG5wRVVzV21BU05MakY2dWJ2?=
 =?utf-8?B?N0xOSFNMam9VQVBHRFlKdXdvaVY0SGdyRUZHV0c3ajdXTjJVaWh6bXltUkx4?=
 =?utf-8?B?bTdqWkJ6cWg4dXdpdmdsc0YwTFBHdk1zeUNXWURCUldnZUljdFlScVNBQ1FX?=
 =?utf-8?B?aDZ5VlI1U0ZqMzk3c1ZwUnFwT05UNEhzQXdFYWE0WW44MmtHejRKb0pLWkhr?=
 =?utf-8?B?dCtUS1VMMjZic0RIVG5UUVVLc1c3dlRCZ0JLNWRJWnZFckxQWlR3VWRFT2Rh?=
 =?utf-8?B?RnJYVGF5a1FHK1FhWDVWYTlaRy9sK3pOWHNyMnR2YzA2SHMzTHZOdlFWNkx2?=
 =?utf-8?B?QzQ5Y2JtSkVvTFc4R2lCL3RSU1U1RVNUV3JwT0VnZnMyWG5YSFI4QzRPNjhF?=
 =?utf-8?B?d0dzRGpwN2crK2FrY2dLbkQ5K0lrK2I5eWg2R3V6VTZGeFNobm9PTWdiN1JG?=
 =?utf-8?Q?O4hpXxfivVzp0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5993ce9f-3d62-44c4-e1ec-08d89b24ec1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 02:56:55.3854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ax2k1abc+gnMprDmHElF2QgFPu4U/ADTzjJDgRoWIpZi+c1GbvL/zWj9pOMkYXgptRs3MBREfsiSucz3X5sJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4762
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lQwRbzw9;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: Re: ARM64 MSIX enabling error
> 
> On 07.12.20 08:46, Peng Fan wrote:
> > Hi,
> >
> > I use MSIX, not INTX in root cell file, but always met the following error.
> > uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> >
> >
> > I am trying virtio ivshmem on my board, but seems virtio ivshmem
> > vi_find_vqs not work with INTX, so I change to MSIX to see how.
> > But met upper error, any suggestions?
> 
> MSI-X for virtual devices only works when injecting them into a physical PCI
> bus which is using MSI-X already. Is that the case here? If not, you need to
> debug the INTx case.

ok. Thanks.

I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,

But it responds to input very slow, when I press enter key, it takes long
time to respond.

device_status: 0x3
device_features_sel: 1
device_features_sel: 0
driver_features_sel: 1
driver_features[1]: 0x13
driver_features_sel: 0
driver_features[0]: 0x1
device_status: 0xb
queue_sel: 0
queue size: 8
queue driver vector: 0
queue desc: 0x200
queue driver: 0x280
queue device: 0x2c0
queue enable: 1
queue_sel: 1
queue size: 8
queue driver vector: 0
queue desc: 0x400
queue driver: 0x480
queue device: 0x4c0
queue enable: 1
device_status: 0xf
[  226.993850] IPv6: ADDRCONF(NETDEV_CHANGE): eth2: link becomes ready

NXP i.MX Release Distro 5.10-gatesgarth imx8mpevk hvc0

imx8mpevk login:
r
oNXP i.MX Release Distro 5.10-gatesgarth imx8mpevk hvc0

imx8mpevkot login: Password: o

Thanks,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F3bbd059e-632b-da36-1f79-
> de1731e1352e%2540siemens.com&amp;data=04%7C01%7Cpeng.fan%40nxp
> .com%7C155f3a290ef74116dbea08d89a928628%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C0%7C637429301388787283%7CUnknown%7CTWFpb
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C1000&amp;sdata=7s7hZumLfWQ0bBKPbES%2F2%2FcILeuhW
> %2BaFULzFB3Gd%2B4Q%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760AF37C2A42481C80249E788CD0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
