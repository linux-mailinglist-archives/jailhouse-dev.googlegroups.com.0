Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBC5ZW35QKGQEN2NTFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6427818F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 09:30:20 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id u5sf706495ljl.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 00:30:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601019019; cv=pass;
        d=google.com; s=arc-20160816;
        b=qe7JIXUgJPApm30IIg4tx0lWdo15W0PUGtXusal9M24RIlSdWc0peHh6BJ8Qyt/Pvo
         cHzncPJBiA47RuIp2EhjIWuKPiznaeAjJ1a4gqKGcRoy5a1iswMg14L2fD4ijI/7c46N
         g8AX2Zzo0doVhUJlzEYzoYl4UOYYGKj8vlB90sCueYnH4vR88yRBvR/pjFJPTC0iQMlb
         gj/oH3ns8Z9JFzsGu7qT2w3noEsUqQhYiIhvJ6mTpkFqFG4t/wO528LHXEa0iEBtv8IP
         4MRdVp3Z52iTPvqNdSLae3aot8sUiFsH0TZtRJiPIJAEMooflqlS+6tnDBJKMUUJeMjR
         rX+g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=tV2jvoVl9whikJ5hosopjdgi7sHWUSD5b6z5/tnn9XM=;
        b=wTPooR2PbMpsACZP37cIeYKIl2qytSJd3oSQ9PWXoJi1j3S0TJZOB9h+KGpOzBp6na
         N3IY6PGxtL+oWIC6QQlm7gRDudAXQAi/RGeCxFVhTVkZdrUmrOrOI76c/JA/kSnRkThl
         1xCZl5zEXClS1sEu1rVoLRprE4zTAkiHzfpYnuCyjBPiad6Bm68u+JQgYghgFGIx19Pj
         e68op9VJMQJXSceV3yF7nczWKgXVGkSVgj5ttPtc2eFmTF+oupNMxiIjbEoZk0xJjB2S
         fUhUKaKM7gyHyaTRYm1MHHdiEnfs+tsvAJMb2STJEH2jyrDZ0mN4shVY4hHMzNIPNhey
         DKJw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XrzgSDOt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tV2jvoVl9whikJ5hosopjdgi7sHWUSD5b6z5/tnn9XM=;
        b=FsdQ3EhdzDnd2v77faeKTvoiJaKF0I+P4notTO2jskQAkS/OOXFijva0S3X4X8st//
         0BaphyveePOBW3p1OrxwXbQeTkv6xB/iPwOMkSgZT4JuEVNpRw4n3cz8WECbO4vDZmsR
         MPRv3xX8FAK84BUxbCN/cRkXIi7x6BdRlTvCGBaucw+cbTUSt6D8Q/+hITEQMq8+qw9N
         t/ICmtiKsehgiVEyfBrTmohw9koDRFfiBoiH7340XykXod87sRgsSLB8HYbU9opIp57c
         wS95DPvOP99Hi7M/v4wxPaWsSPTo988KyxWjCT/51ifV0XpoLsQ1G9mFX2ZJaeDT4oeg
         7ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tV2jvoVl9whikJ5hosopjdgi7sHWUSD5b6z5/tnn9XM=;
        b=G/Y7dmXhcpicXlrC16e8CPau5V3xYcutZK2vv+78LfhrwFeRuzPfK60ucgTg3wAkdm
         NnwrlDbQtyrE7YQTYW3JqFUoW25wYLLjUEiOCG+vb+T10YlBt/CX1OY2hWnMSlRNejou
         ls/Mz8dMeNQ2OgjzUr9wZgkp1XzG9tTaum3MBU9ZWg4gIfO+to4VaSopQ4i+stTg+Hlh
         xuh+KkaKcNNZfbd6sYDTLa0mYFpSOWh49cEeaQUpsqMv7LnrX3rtqLNHf+kewR0ddwSx
         KJK0mv06HMmutropfdbo8VNWhyQmW5AfR+KUaVfpEqKjBmXp8/d0UGPjkiPYR47/fmnK
         XqnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530pCboKD6kjYcd3qu2/NTCDlrjyjEGhLzN7W3IrSyV0JBDdaU3u
	U3AIKkZ1uy/6KTkQAe8iUkY=
X-Google-Smtp-Source: ABdhPJxzkOSRpkQDQAj8Lhzown3uvuG8LiZZ6JeTvMXLGXK/WOwQiBigEa0U0FLWBmxZkh1eLc5oqA==
X-Received: by 2002:ac2:5f77:: with SMTP id c23mr993825lfc.568.1601019019764;
        Fri, 25 Sep 2020 00:30:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls24099lff.0.gmail; Fri, 25 Sep
 2020 00:30:18 -0700 (PDT)
X-Received: by 2002:ac2:5b4d:: with SMTP id i13mr1001501lfp.12.1601019018512;
        Fri, 25 Sep 2020 00:30:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601019018; cv=pass;
        d=google.com; s=arc-20160816;
        b=PzLSh/c8tPiF9R0r9gsDEEh5Sl6EjvZejEW2op+oD4WIHLePgAz0zbRTNPRhmo19py
         zOSbsbxljzW3IQhOKBW1NbB+sCbOXQguRGuORzdRPMT8yBas6d+aeqKqOfzixsFn6paM
         hVHXKFdmwUtTUmM6iy3iy0ypvLHyMWaJW0YWPAAir4tYK7e9GIkfyvgRy+1u7CdlG+OD
         sk3VvWlv1bR2Eu8Rf8SKdjuWnjTfVLcE74z5u8X3MOk3gDuDbrQMpLiE5p4HoVT2V3ev
         4yh1Ng29LBQFNmKFqXPmfPK280i1Oio/SJ3AirxHxPHl+/qCgR0XytS9/C4dVHkybRKm
         9RJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=hXHae+o5bjqwNHNIVNw8Q2eH252C3F5BRwfBC1HYVCA=;
        b=MLYCg/8MubAK1aDUn6js/CqBqbuKSVLWq9gohaYsr+uaDkrgUFO7Xg64Csm+YbGycN
         S25UVZU0iQeOtx5t0PEv09vVg44bka/ERPA3WHOTQV9VKj5s//S2Y3qW08dY/YvsztaB
         1FMfTrWXPwSgo4bPx8QZkq28ovAmYNOae/aM3b45bR79ngMYuy6oJ+4Hrl16hAIt9ib0
         wVIVeCdAn9pgVEkgS0C2Yu5HzukDiK1FjEI6NQj70KVcUFLvWnJznprOv2rdK+Clz8X5
         GUMof6+8E69CxP1nzZb2IistHVazFaW0tgsIt0+H5/arabWHmH9kaZ1j5VA6/9YJZb0X
         5pQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XrzgSDOt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140088.outbound.protection.outlook.com. [40.107.14.88])
        by gmr-mx.google.com with ESMTPS id r13si53292ljm.3.2020.09.25.00.30.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.88 as permitted sender) client-ip=40.107.14.88;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnTrAPXYKzUA1fZS0WeYLPO8IH93BWlLwkv4FVyGtiwL9rxrc15qA5aCU/sM+WBQmGpUulaBnR3AAHX3QlEYCcHIJwpTxfv6tnilgvrCxrnn0pR8v0c8daX9Ozy9V/eKm0bGqFaosAKBrTh2zS7xaS+H/gP2dlCBHQC1a3rZn/Ki7m8VmoA1JP1Rbvqu/0gnFZpfEMPcPZEvWnT6Yxhm18m88LObWS2Spn49cDqjXuJbKU9l5REvqtfsKae8ORrYu5g84fvtYOrTRntP3NMHvscwlW8HQLeGZ5dlErTfwv9u4M1KRomX3AyqAdS5AoHyh2ukEj6O6pPbfGJmXDa+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXHae+o5bjqwNHNIVNw8Q2eH252C3F5BRwfBC1HYVCA=;
 b=gasuG/drVKfSAvyEjNQ/EUhgCcSqktwJWSlMmPOYS1DL8PI/sfklzDO/5iupMmuN6lMh09d2LGWCznvFPW46EdeEa1YpHPE9COcnDpP13zHzfSkW35yRnhAKDYEj7qZ8Huw11KQIaob2Aqkm3FHzBBHpxrsttCjTMg4fJDPvFhvRcjNk+nX1+DrK3pbhWnmWwqOqzF0gYqH5wi2qvTcFSm6J1LOf4WPkZz7g7UUIDctDK9Gft1rDumu5IaHy3bGP6aGKkZmMl1ErQhzJ01n+3I+p3q8Vkx28PetFXDl0VrRuicHgl5C+R33GmstXQh0MwApD5oilyszIOxgGCoOUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 07:30:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.022; Fri, 25 Sep
 2020 07:30:17 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Topic: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Index: AQHWkKwNK0JWEvsu4kGyPQM5pp+tJal49wyAgAACHmA=
Date: Fri, 25 Sep 2020 07:30:17 +0000
Message-ID: <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
In-Reply-To: <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1824d32-b84e-46fb-38b8-08d86124d9ae
x-ms-traffictypediagnostic: DBAPR04MB7350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7350F7F66673CC08203039FB88360@DBAPR04MB7350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jcpGgvbWnZXpcQfmWrgBBC1oIub5AYOzdwMsOQwWliom9zARSfzT6/NoMXriHX/E1eMuj2opxDRsKNVGb+QCOoSSALCfJeGZ5mo5OSJLz/6+tPWeGi8mFG7HWpLeCIOmaWhj4rElM6R5xR46IJFy5jb5LHlPmRWtx7iUCdkDTqdaN/O4n+PCN/GKHYzVYYT1ayaY9hg2r8Xg6fIy5RAbaKlX7V3MN2itwHdCbXPW7+LMpHerASfRxfToUZnwcqjcrRPrmDQT0Q5BrJEN0pgSx8rUgwjB2WrxUva20UnahQjynot/blx8yve56nNwtPKpiEEkMdto6yGF+xnZcpLW0ANp/yOgu7nl2ayN6zRjXEsZShMexWwrtoGWJoYV5SMX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(64756008)(66556008)(66946007)(316002)(66446008)(2906002)(7696005)(478600001)(110136005)(8936002)(33656002)(6506007)(55016002)(9686003)(86362001)(83380400001)(66476007)(76116006)(186003)(53546011)(52536014)(44832011)(26005)(71200400001)(8676002)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KYz9Yi+OCZc7ykb98VvtPDF6DBnFCjj2+fW7JNzs/xoqqpDovlRz0oMMfFct+n+RCuV0BdzlRr4NBWbEfnCmP2vXM8JgJ8bPPA9RFmmsjgKnVRERXk2I5PeUv0/yuNm6q1yJjZr+3P+sxcvUGtbTFEeO98xBTQMDs4SBv6v78p6vLrC0DSSFkx/QzwqNz4TJlVCl8Pc2A9IJgXXrlxqVwwQBEHBVKkR9Qqni2ptb2AR/7LWG05e5Nk2uLHvjYlGZdXmjHepRHvSBbtJ/2CMyRfatVOnS4DDCuOAKZGrambMpbtzBbk4lVwakDjrPysbNff6orb3sBxKl8QmMZ8Al0oebwOV289On/ugfpfr+/q3K0VUF74SapVRgQMhzDDqppjgxK/GXaJ8r5ZumXFpiR9EPc4QktH1GXA3fYT4hN5vXHWkUrKhQ9hu9cDK/Iq+MNCQIyyo0JT5FaqkHQP2RRD1bzQIlJ0CfHTcYKTHeCIoaB6EV2Po0N7sS0SjkW6dTC3vN4w47+3ig5Ss9MjzMvraU9O22g7d//tiorlYJKhbeQhh/YeDQAnx3m66BR9hzptoYA5ecHRBZlE9B9TIHn8WSGNZMreEymLxQLm61SkvpczsbA1zn66xDGXRsb7WdsmTMiM2+OirBzZU5bhCpDw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1824d32-b84e-46fb-38b8-08d86124d9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 07:30:17.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QllQb1qYZFIxpbD4AYUUulW2V4Eq2FpRuE7f7WgcZ16kJEy6Ay8r64RNKDfYN+srNCVS3i8gV3fcVfcqb76LrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=XrzgSDOt;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.14.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
> 
> On 22.09.20 08:45, Alice Guo wrote:
> > +		.platform_info = {
> > +			/*
> > +			 * .pci_mmconfig_base is fixed; if you change it,
> > +			 * update the value in mach.h
> > +			 * (PCI_CFG_BASE) and regenerate the inmate library
> > +			 */
> > +			.pci_mmconfig_base = 0xfd700000,
> > +			.pci_mmconfig_end_bus = 0x0,
> > +			.pci_is_virtual = 1,
> > +			.pci_domain = 0,
> > +
> > +			.iommu_units = {
> > +				{
> > +					.type = JAILHOUSE_IOMMU_ARM_MMU500,
> > +					.base = 0x51400000,
> > +					.size = 0x40000,
> > +					.arm_mmu500.sid_mask = 0x7f80,
> 
> How is the sid_mask of a platform retrieved? Can this be derived from
> information in a normal device tree?

This could be get from device tree, to i.MX8QM,
iommus = <&smmu 0x12 0x7f80>;
0x12 is sid, 0x7f80 is sid mask.

Sid mask is use to get the extract the exact sid from SOC internal BUS,
You could think as below:
Bus signal & 0x7f80 = 0x12

Regards,
Peng.

> 
> Or is this coming from here:
> 
> /* ID0 */
> id = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_ID0); [...]
> /* Max. number of entries we have for stream matching/indexing */ if
> (smmu->version == ARM_SMMU_V2 && id & ARM_SMMU_ID0_EXIDS) {
>          smmu->features |= ARM_SMMU_FEAT_EXIDS;
>          size = 1 << 16;
> } else {
>          size = 1 << FIELD_GET(ARM_SMMU_ID0_NUMSIDB, id); }
> smmu->streamid_mask = size - 1;
> 
> If it were so simple, I would actually say do the same in Jailhouse and drop the
> configurable. We may even demand ARM_SMMU_ID0_EXIDS if that is
> practically the only case in the field by now.
> 
> But I'm lacking a full picture yet.
> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760ADEA2D5A37133E5A1D9388360%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
