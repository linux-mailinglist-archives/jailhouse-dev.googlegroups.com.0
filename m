Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWW6Z74QKGQET2TCS3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id E8310242A61
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 15:32:10 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id f14sf902018wrm.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 06:32:10 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597239130; cv=pass;
        d=google.com; s=arc-20160816;
        b=pE2WNB+duseziOcGsfJ4zoqOVIdTnbIed5vJD/CYSp5O89pNcxa4q8WTZH/IX2jAN1
         RKVJFEQyzkNr3n7mg1yrgRj7Z4aaHa2d3zIxPFkogqDFbawB2U0xo35iMN8/XiHwQ0mV
         mW8toGTm4A0SAmz38+U/mFjSnrNZhdC5VrzWUZyQEmFAXxSE+OHMBMSdmWEIYJhweGN0
         8eSVeGETOABpb4En6mi/HYy6mWL9eqVyGRWPe1yu0EAKUxZKkshlvB1qWEtAPoyao17W
         gfNmsl8AtbbXRfs5gpZ9ZjAUTyGIXmRmifXmuAfVWystXpRdFLxflGKl/gcXGlez2yeE
         m8VQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=0nXf+8SnhCgBFKP451viwbj8LrZGiwnk8gjJyUr3/hQ=;
        b=yVzRiPb4OrxAXtWG21GX7wfepjj93qlvf5e9Dgf6y6Ab08HKUCEc5/mdj2JyOnwp0G
         19NSonaLnFytLz4gA3xbBRul4+wRFyqUC7YgnsE35awADHVVkpjMdrkRxCuXh7g5x+w7
         7ZYVnCLJmecXjyXdEquJB2ZRluvK8JlX30wR3Js1AifP5A7+c/C6SZ8LHRGs/s3BnOoM
         eugf5NuXUYrJP7aKAMFYmwFO6iVuW3tj9Xxp/8G95Fb8w1q+QlSFYwbmUbw4fMwf8FQM
         P5sqs5GNv+vXdODR3+J9227JCd1x20+Wnbx+8eJj3dt1beLWkp1Wmnnl7ardjPAcyK48
         4o1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UnzzDtnH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nXf+8SnhCgBFKP451viwbj8LrZGiwnk8gjJyUr3/hQ=;
        b=O6YJRtx2dgDZ2zgUqCR3CbtcLEEvZeELvgSfkXqWF8+y1Ah5j+P3Sev7GcVOatHIzE
         Mpa+HoeaMK7376D5AbfKirwM6D82szetvapJsDZtenNbFToqNXriyRpTjtOPrIo+Fbmu
         W6qGpXHZsRAzT80bmeI87Y7+RvRLWerPEGJSLC0jnSW0Dx8P4gcjWXJHlfeaZpk5eD23
         Wb71mNA/67rkZBJ21kLSAQtYLAcmeidqGAWfc2Y+L3d8pkK2RIN/hUn8bfFlesjeBztJ
         nMK8pHe/TdxczxVmGW7MIHsFNaC2VSKVbXGYG63JTX48EpmnCLW5hpIUoMvggm1jTLID
         uj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nXf+8SnhCgBFKP451viwbj8LrZGiwnk8gjJyUr3/hQ=;
        b=dmRbfoKPOg6IwgaySjyWil5XbpzK+SHYgT9admp73VKFo2YY9xqFFe5knLzitaqJHf
         ZEregesMhTIqthPla7TDcUWsf7eeuW9WZcc3zVyTXBMNJ2FmxshDVOHLp7Om+y+T6VsN
         KZG/lglltcYmkUrFHbrtwFMbIWZdufLLR/w2c+TPjL6amySR2tJVUV8czg56NjMduCYJ
         8lb7LKgDSsN1d6uffQYf7HzrR6jolp4depdtfzgegEfJxosI3pZ1SDBkDHL2e4wVFv8+
         io0wcZIIT43BrxWL0z4Oqm/BW8zpMEL082FalyZWGfe/bmfiiDlYtcuPZt/mCeSdBiEX
         X86g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533BTUjotDefwpodNGrSsOSs0UttQ9ZaxPhoMkoskMt8PbxF0s89
	A12CPIVz0c3zJuHumXk74gw=
X-Google-Smtp-Source: ABdhPJwFFyjBoyV+9dsWowGKiMH3Z0s73qx0zmg7FAFj98JdEeBOB0adGUwngQYjVo0SKrpY18nYCg==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr9084239wmd.59.1597239130617;
        Wed, 12 Aug 2020 06:32:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fa8e:: with SMTP id h14ls830658wrr.0.gmail; Wed, 12 Aug
 2020 06:32:09 -0700 (PDT)
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr34991047wrx.139.1597239129905;
        Wed, 12 Aug 2020 06:32:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597239129; cv=pass;
        d=google.com; s=arc-20160816;
        b=FwWhCzIiSgFnnsclOugQdOK98Eus2aFNLZkRu1NvY2m000ixZ0mf7SjX8PZVcv7b3z
         isP7bIgfg1sMZl5DPSSK5IUTck5WX4BVJ1Z4UeEISHiihUhRlPlSFtRPIgAkeF3mFkmC
         5hJbXrCpQp4oxjEYXjOqsw+53SLkEnnwc2GoFWAL3NoYhC/pAPvk1KfZSDNnnhVgHPq0
         egh+pVh464mdErZQTZEwB7xsL9wQooCJ9cu1GIHCmEDyqHs/4tYDwx1OAIbPbq5eUtyM
         F066bTZ00LYe53stnUs+Xx2kZ/9TQb2x6BMxglgz7YkVucmIH3iiRLnqEbvCY9Hz3kIg
         8uRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=khoxBmE1dxIWEWKF1ac9qiI1d8com5yNtcgtRopVOD4=;
        b=YsELcXcVePs1EtzoU/pi60K/8SdlM/75cBr4loVY7c+V0dsMHYIucw9g0IOEXjDdDs
         4oF7V3YWWUDg8fXQUEH44mMUX3hgvSjeM5N+SZIIe/IFD+ui6Ja1aphsmbrOBwE3WYxo
         0J3/0dIrGOh0FGTBoEbwfxu9kTzrZQOqazF+jUroM3/+Md8arMc861HiJmO2JK3lMr5z
         fKZW4KSIHVR/qIKf9T/L6hrADFPxTNlLFQ6a5KlLY299C9GaE92ptj17xEa9J8JkBZ8T
         NiJ6gM9Tutc7u3qtCc63H1coOkoYK+wLMyeaGQTiVWi+ik9D2KUjQHtcotS2q4oj8Fjl
         HSJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UnzzDtnH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00075.outbound.protection.outlook.com. [40.107.0.75])
        by gmr-mx.google.com with ESMTPS id m3si124289wme.0.2020.08.12.06.32.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 06:32:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.75 as permitted sender) client-ip=40.107.0.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS3sz7cPS2kGqcLZy7xx3c9LBkEbeCyb/DCS6EFQYriMN5zXdtrVSLZFB8XpcNNGKkUOpp2/atm640jHLYMZ49Kzfdfs5JUkTmGYlvLSpeqM40YXpK/7e9zwUeeN2CHDlXJBaDK4bhEVsrPJN7EjvDC1uFlol1ho7CqszEHsnzsSO34lTSAoVem9YbE0oAve44evbq9qrsg0WM3OnovKf8SfKOwRSXcO0MLCDdTUKanVFJUr4WhaGyk7TvD6Tfv7Aqk2nKBPsNLeY6BHFsySjqbDTK462eEIDgsGRAyQbDJ2wkxFxLp9AZmR/uJRuxwXsWR+VjBDGFX9hJ/T1cOuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khoxBmE1dxIWEWKF1ac9qiI1d8com5yNtcgtRopVOD4=;
 b=H+NdDdEgwFSsJDsiI1xqjYiiZQx4a+djDV59C5s6QmGcWm11zqJDI/9ONOHCpg7wqBcO2jk2kspe6c2t83LcwJKtuvND3GFlR29Pfpbwqd2vS6vSSxfMHeTVsJwqZT9T2N89kYFxl23/Pkt5q3eo+E88fwDRsOChUiZHw4DVL7W9fbdwxGVrNUE9XiePFm88ipFyQk7qYuhKTIzjFKLCWb0NcQqjWI4rPZjhUxxiRiffIK0YWfMM8qgK/tUfcu/Aryd3BuKDUoRnqPrCN7lvnhcv0gsZ77t5Kupuh/rlga9wTR8afxGMGBlLY+ezhZ5y6VkwJe2YyZTusXq0aIIPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2536.eurprd04.prod.outlook.com (2603:10a6:4:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 12 Aug
 2020 13:32:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.015; Wed, 12 Aug
 2020 13:32:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V1 4/5] arm: include: protect header file
 hypervisor/arch/arm/include/asm/bitops.h
Thread-Topic: [PATCH V1 4/5] arm: include: protect header file
 hypervisor/arch/arm/include/asm/bitops.h
Thread-Index: AQHWbwfKMsp/F9uxA06aNViIZyTZBKk0WteAgAAgUgA=
Date: Wed, 12 Aug 2020 13:32:08 +0000
Message-ID: <DB6PR0402MB2760E0441BE26A7031A07FE888420@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-4-alice.guo@nxp.com>
 <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
In-Reply-To: <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [221.225.135.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fac16c48-45a9-486e-fcee-08d83ec41c5e
x-ms-traffictypediagnostic: DB6PR0401MB2536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2536BFD256C2A68F328802BA88420@DB6PR0401MB2536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rR33Z6TVHToCXL2iqAdIXiSwjChJgQVg1EfTwwqV1Qu4C3uhs6jz9hyJsZ3qOesaDfedZe1aEexEclcubgwUOkOxjtP6B/fZ5X9YGnDxy+hN7JLJ4n/LSFoTzIN2fJVDTJ+4DZzUpnJ6AAAyPXQA8oeS6S8QLOH9QSzsY5O7PpMFbe6b30mU7ebpn2+pdiy4JkGMFmZbDzn3VrZUNbHQYhAOkEQKrdmiAZEwok6I4YmbDAzikjxw6rAWzL2bag8LGRjupEhEKFPdeCd8ni6fIUM+RVCNkivvbJc2VhginAmIv1MQXrT6VG18LTy4Hq+1I4R/8PBlyY/mYYNhrWKNHpU7p5Xvq118eLaiAaaKF0m5gk+xLtz+D0uQEUYJJb4Zwb0tEonNaDNeA6+lNi3KOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(55016002)(7696005)(66446008)(52536014)(316002)(110136005)(2906002)(86362001)(8676002)(478600001)(53546011)(45080400002)(6506007)(5660300002)(64756008)(186003)(44832011)(8936002)(83080400001)(66476007)(71200400001)(76116006)(26005)(966005)(83380400001)(9686003)(66946007)(66556008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IWIIdA2nKK+p3uvC9mHl3s70wlEdxkFNiXA2W+0fCSEnz5QLagIW5dCT24Cqr/c8FDi4VZAxVzbkAawpK4CMSwHOl8gmIa2VyU1zxPo4jSC+eCsKlRKBOqtDR74C3JJHVel8LuUSsBbbdF2LVTPU9H7gUAku03AXG5DvFDByLD5TCJNuXtQqX9hwkLJplvEvRwf7qAYCB7Ygo3T1B6ioAL6aQBtjg0BVIeUUsfbIy2QihUaKWFpNXHZLBdKLsnJ4xpPAQx69bXKaO0g6/GIouHPx2PUfkl8j9PBHlnANS6bsE3alBmOvtnuWAOSG0EIbzcXvypt/KWtoDjs4G3LJ2O6IQ28EvLPw+8ZlIkmPGf6t1bI2Y3JfhgT3bNrqDtlJryKBfxctcYYC/fRVpG3ud0xuIK6xEC4ZDroW5t2nyLJyie+jfKTuA+uIvBOnTG9X4ZJbc1X1Knf/tZQZZzvnqVgVNamDzO4XvrT2jRU+3gefx5I6TXrAC68RryzINSBkgFbX1cHrpgtohkmFUImt52oZsxlcKpDPOjpPn611EZuDp9RcDV5nkp89wRsM5UTabjIXwe5u2aA2WmDbzH6r8wK2gL2NKtiGOSXDrY7ShMm4kSn9vPRqL3HonWqJ86P7DNzQrxwlT2tZdqVt7z3Tmw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac16c48-45a9-486e-fcee-08d83ec41c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 13:32:08.1455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4hMFe+Ja9BV6B3V74axOPLpzYT3FBLZdSu2aZnHk9PHCz1Uzotglfh7U6IBsbvKBjZqGiB8UTZrTD9LkoA2UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2536
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=UnzzDtnH;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V1 4/5] arm: include: protect header file
> hypervisor/arch/arm/include/asm/bitops.h
> 
> On 11.08.20 20:16, Alice Guo wrote:
> > Use "__ARM32_ASM_BITOPS__" to avoid redefine functions declared in
> > hypervisor/arch/arm/include/asm/bitops.h when building for AArch32.
> >
> 
> I do not yet understand the exact need. 

I think we should add some guard to make sure the contents in a header file
could only be included once. Otherwise it would be easy
to trigger issues if files was included twice by some nested including.

Regards,
Peng.

When does the build break without
> this patch? After patch 5 or already before it?
> 
> Jan
> 
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >   hypervisor/arch/arm/include/asm/bitops.h | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/hypervisor/arch/arm/include/asm/bitops.h
> > b/hypervisor/arch/arm/include/asm/bitops.h
> > index 67aee781..2940ae16 100644
> > --- a/hypervisor/arch/arm/include/asm/bitops.h
> > +++ b/hypervisor/arch/arm/include/asm/bitops.h
> > @@ -13,6 +13,10 @@
> >    */
> >
> >   /* also include from arm-common */
> > +
> > +#ifndef __ARM32_ASM_BITOPS__
> > +#define __ARM32_ASM_BITOPS__
> > +
> >   #include_next <asm/bitops.h>
> >
> >   static inline int atomic_test_and_set_bit(int nr, volatile unsigned
> > long *addr) @@ -42,3 +46,4 @@ static inline int
> > atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
> >
> >   	return !!(test);
> >   }
> > +#endif
> >
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2Fc7a37ee8-371c-d3e2-90a1-
> 7fda635505de%2540siemens.com&amp;data=02%7C01%7Cpeng.fan%40nxp.
> com%7C58d8abb6601b4bb72ed808d83eb3979c%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C637328288346066670&amp;sdata=fuR42sXQ
> WaS7VI2EDGnGCPuQO8PvNlo6lsx66rgJqHM%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E0441BE26A7031A07FE888420%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
