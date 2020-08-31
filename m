Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBD67WH5AKGQET2I5V6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6025725E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 05:33:36 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id i6sf2683063wrs.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 20:33:36 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1598844816; cv=pass;
        d=google.com; s=arc-20160816;
        b=kXW6o45iqHgpWL9RrDBh6ZK6Pg5O1Rqbc3hXPFHzgFDj0HPdNbmZryJvijnB1CRrWG
         c3BwKDwtgwidSSpl0zM61VqpcyzPdaHDxRtbAlGsFfKExdLDAnlUBj59L/drlBzV2vf9
         Bfn5A036GrU8o8hD+B8RWEVUWcLBVp2mzkc/Iuf3K3pp3waSPaGmmBQDHVvCxd73oabP
         QBy9o5dJbljS1uWZ+vIBejW2KGR4S9ADLSRcZ3pVwOtkYsKp7MPd06dAxOZVidY3PXOz
         CJ3LAciv5pl1ocgTlw547ZclkDZR9q24AU+BtnzVlTt6nDuZMvUB8AIjWhrYHQB4Jjbg
         8FAA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=7OxKBQXe75D8LUpGhd6M2sg7FZePQIF4o6sPsU8qNo4=;
        b=o9Zt6tq9Knh3/wmiS5X440qFVGaNIItpnE2H9d9SKKQ0kj5Ebhy4K0qOr2RpB7L4QI
         D2UMFNK2n15bHPP36lkp4kftY7cQMb8AAQ6Sv83yK8+AMDK2WRc+OGY8qaM4CSDMj6ZU
         TSd6VaWT2Tx8PoweppJ7XL7g1zAHdFW7v+mzdrvh5rIXXWLJqlxVCzXkU0DqtnCqV0B9
         VNsKAUYRNEOJ4rt6cbvfC3rMMD6Z0OefX/Xf3Of9eO9PL1cNT3HZ9fH8vzAObZGzwL9M
         UA7GYsGr+nAOolSz7XW6k42XQURNLjNfavn2x4xwI8DwdUEVqDY3x1RM2NUa3L2PdLjp
         KqKQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QnsmWB5f;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7OxKBQXe75D8LUpGhd6M2sg7FZePQIF4o6sPsU8qNo4=;
        b=o+K7WCfAzneYBMClyKk2AmgjZiZPv6AAk2wAOmxdDyIYx3kERD60Kmrkde71Bd+J6H
         I8xnKPBYBifOYXJC1Xb+f1jk8TytncoJw0xXiSf2OloSfJDHcWIRcAsSRlcTQBa4vp8H
         6+J4szCQ2iDujX1gVOQSBrEtHBIePG7H2XsQBAl9LBBGnUiqGpzZVPX2HEj+sE1P4t4K
         LnySruYAjO8gNb0Nzzsq7Fec9bi1U1HOmPS7o7lO45ICyaJYJwtYB8YjW+cMDycYaHH7
         gdpArsVt5ejSfCmJLVukwASzKUe8WHAZclAdm8M4sfcOq31QF/CllkVxZMFHbYEWV3ho
         y8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7OxKBQXe75D8LUpGhd6M2sg7FZePQIF4o6sPsU8qNo4=;
        b=hLxL6241x2fKTtijLcX4UDxRwq948AbacPQdIia43g8NvhHJjzzQFDCFEZaFOq6ypb
         rRwgwkv/qYfI6+XePQc8+LHQeakNUkzI7U37hu6mEQ6NJXjzsjyeOpCsCErYCFMcTsmX
         BYkfjku+oLA72cjQCq3KnJ93kgWBhbdMa/t7zwSPVDxNDp3422/nLobaPQnw9vbSxJzY
         gVf9D80SlRjOHWARYiYGeTVI7tqBLYX8H3uegxvxlt7Z/ew9ScAMniZnR+wYm8pAF8+w
         InCwcMSE8QjYGtqxHlf5GRaUcyRBGNY2yS+pcjLfgHIIP64DixlDmGPz9aHELfxhtvRn
         9vBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530fnWycVG7o6kewIxd1GhWGqfVatZELhROC9tRJRYb+0no7I3zr
	aiyJ1AkLDM6+u/JgGWpzRe0=
X-Google-Smtp-Source: ABdhPJwZpNKuY7ZMVSY8oMRgY6qB58xPQiV6yn1pEJiRlKDlI09HtHEXZsNqQSe62XKKksmYGpx4fA==
X-Received: by 2002:a5d:6051:: with SMTP id j17mr10310552wrt.81.1598844816183;
        Sun, 30 Aug 2020 20:33:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6592:: with SMTP id q18ls5554142wru.0.gmail; Sun, 30 Aug
 2020 20:33:35 -0700 (PDT)
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr1380395wrr.188.1598844815506;
        Sun, 30 Aug 2020 20:33:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598844815; cv=pass;
        d=google.com; s=arc-20160816;
        b=FvmbYfMh+GxS9kt2U8ML/wwm2dJU2DwUpxxUF/6IBeNjAjJrp+OsBwXWdpImPN8/yM
         J6IVrMSkJkFGBg8YwdsJrXwEoEPppfCG/Lgz2WLMy4QkqjRonV8vxlUPjrHhxhXSdXuH
         ATuPktSPlc1bZ4EF4cFmngnal/1lrhJ9aZA4zXyhF4xFYqWGTW1RzIxFbsrgvLr4G/W/
         8AqXdGMWQ5cDsg+w2fncPik2dlLoW175Vm50WeCZ05+rPEah7P9HTalHKgN2O4nGd5xm
         slrgjURc9UM+f0i+8Jwr5AkAsxI/1fOVnZMUCVMI4BCQuQqNkporJk9DXgp3KW1Cso4n
         RYeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=arqKVmqX4JClalTpdnC3tUSCmiGr50hVIR6HGB6NckE=;
        b=wbJ+QfJIhoreCNOEiPmaPLUGOoFVoTAQRcdu9KajNgfFYn5oTFMolsb5TwnyMZeaCZ
         vL6UWaieIKndrg6sDymwGo4ZE7/nBXsLRTkTYGo7LcSMUvoafeF+mltJLg8iIlm6YytB
         XTcizpMXWxJ1kSJSU3F7EfTk2CYNlEk+CruqHngw6GhXA+xSpiIi5Y1drEs2nb613pgD
         cjSJHU9i+lYjTACb+O1BCekT+z8xN7FhAbT6iDD2DCFdEqEZZeCzWgTsI7GyyCv2ZUyr
         Xw3ypQVrDpaO3rm/yElOTuJCrkO8JEtfXdLBovqYtOmpRbRPXwfDmiJAcf39NWO3lGqA
         qHGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QnsmWB5f;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60055.outbound.protection.outlook.com. [40.107.6.55])
        by gmr-mx.google.com with ESMTPS id b20si191068wme.0.2020.08.30.20.33.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 20:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.55 as permitted sender) client-ip=40.107.6.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVnIR/GcmXJDH3kvVpxsLZBYQcg+ths/7uKrUQWTQHB5FNA5myGtVpzf7bjjChoaaTIAQmcX/0c1U1L9Nnjs4DmH1S+TCgsaQprtpA2m+qBNljJnnHa+Pdly83qr+sR2oGD9vcWZ5nWItVcxaqwwJtxCERvOhewtYgeujfL5n9vf9ekDdE/RI4uCDaKqQ9Y9LBiFTbln7iLdx2Rc/gz8GzILD+TvwcN7cJA4JAO7d6V01uewb8qgGL78H8F8LlT5lbMEofYcQczd4J9ILk0hL0yl4phUhyFdbw+bxiSk3yRIrM0UNq+lyXh8x3RJuClGug8/Mt1bAJ2GbyNPb/8zDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arqKVmqX4JClalTpdnC3tUSCmiGr50hVIR6HGB6NckE=;
 b=GllToOvl/shU6uY7AwZtL9eEw1DKXqXwmVVqcg5gYxS2HlNtzi0ULhwG8laL04KD+c6lO9DYiPnDHZKd4wo3mYDJfWnXohNiNB/DfADwp9DQ9BO/KR1epV3vL/caNGqC0ZySlAYOmJ8GwUYeupz2fsEB52jNQ+HPrcGSi3IUCrnmzeDyypATNoNUi5wu4p7iIc9CL0C9Md6/Jg/rpuvIoEIzRv5J4kjxhNUZPQaqyB0gG3yEn0LG+GxbXGrzyOIBx2IL3++yavErvzWB3Lv0bhr4D5s1fW9N5/1gKzvXBTCK8KymHJ99smnQLc7QzFXumdoeRNVyIOSExrD7BU4bVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 03:33:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3326.025; Mon, 31 Aug
 2020 03:33:34 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V2 4/4] configs: imx8qm: enable SMMU-v2
Thread-Topic: [PATCH V2 4/4] configs: imx8qm: enable SMMU-v2
Thread-Index: AQHWfRd1OqkoBJPQLUKByV2RJplYSqlQS/qAgAFIdNA=
Date: Mon, 31 Aug 2020 03:33:33 +0000
Message-ID: <DB6PR0402MB27604AF5457385559F35070E88510@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200828084425.21282-1-alice.guo@nxp.com>
 <20200828084425.21282-4-alice.guo@nxp.com>
 <9cee2068-1a77-aab7-1040-e60039c2bbec@web.de>
In-Reply-To: <9cee2068-1a77-aab7-1040-e60039c2bbec@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6b2efcd-370a-4185-469d-08d84d5ea3a5
x-ms-traffictypediagnostic: DB6PR04MB3128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB312889E7802B11D687F5B4AA88510@DB6PR04MB3128.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJqtO8G3g/e2PaRDEsUQEMZ3V2i/Zj1ySDh1j6u5QJN5pC2foUCiPfdk6N21i3rHTxjruwBGR9v5iBn8wpxujFLCMJhdgZk15PNP+ATRFj3v//waRjibvqmbRSRDdTGU8yOxmGpmNf50iobNKTSOSreabjsi23S7HxodNnkA7IAg5Dw2mGKDEL1iQOPndiEeD+d9IhHi3kBfZMHPYVTD7nKh3CL/HDAq294MnpYm4yefa0ZK4j+krGlUjz6xmUL9Zt6/ojhSG18xLheCdjJSLPM/bFiM5EKrXC/voygn+nsuBbMUFnBKMg8rw7Bsw6HRmqlYfbrBet6nqUDdt39Dox1Uujeo0KvgnUlhgr+dO+ODgAzb+4SYzVfzBnrBGnWC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(26005)(186003)(52536014)(7696005)(44832011)(33656002)(64756008)(6506007)(110136005)(71200400001)(66446008)(478600001)(316002)(55016002)(9686003)(5660300002)(53546011)(8676002)(86362001)(4744005)(66476007)(66556008)(2906002)(76116006)(66946007)(8936002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aoNvzibg+KHPB5s9mKcnKrP+WY6+Rwr8hcnf4XG/Sa3nYMLHa6eNpt3CkjMHU09x4oyAWmcnvWw/JQmiU6rRA1Q5DoPXS4Rz4p5zc8lkH34sZZNf92wdSRxbSdOpDNZRVS3BCJgBUL45LZizM9B9x/VhlDzBHDK2asczCqbGNJyERUbY35f8u3JsmmkVEHLYjEMPm7eqiTy+EMtkmGJ/mZBFSrNZFlUX+ay5Fwn0NGS03eV0NEyCanBJStJKhs5O3jciLsQq1TH7CSGIcyfSUiajnCxtAYOBmlDpVAmKA2wTUR+F7L9nLBS5eLSjxMidZW3rGbsfiSnd/PitOef4IK1UnVyIbmKWm3pQkVYKIShiDPdt3GIdN/3xwb+FgVOcrA+6zPRooAdGvZYmC99vtF2bUFDaT6Fa4ecFb71IqN8hvg8T+56+XoOBUVxaolVmnZASV4owBohS/Aqrhe0R601srSUNcZ5RtU07v8lGHTfKEcJmIz851UuabNKuy76rrI2zUTtOeH4drTThebVD3JVrI5QQm72ZVjY94GPcYGuJNIq4p5vY+QrN1C6DBp+zpO3VyKnFKRNrq4a8oOk0rmEzyqRtC9KQeT3TEZMgZ5wvi/Xpyk6Cwlrk0g6AINBNOHdoiBNq5/pGpnjOFS5HuA==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b2efcd-370a-4185-469d-08d84d5ea3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 03:33:33.9647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mxlMEEl5O08cHJpsELa6o55wpSEa9iEgiPA4MdXWABbaANjRwHNLkAGWXJa9lpmnA8uyGJKJJ8+OKc0xELAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=QnsmWB5f;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V2 4/4] configs: imx8qm: enable SMMU-v2
> 
> On 28.08.20 10:44, Alice Guo wrote:
> > Add root cell and inmate cell configuration files for imx8qm, which
> > enable SMMU-v2 on the imx8qm platform.
> 
> This *adds* configs for the imx8qm target (EVM?). Subject and commit log
> should make that clearer. The fact that this platform comes with SMMUv2 and,
> thus, stresses the new code is just one aspect.
> 
> The other imx8 variants do not come with an SMMU, do they?

i.MX8(8Q/8QM/ and future) has SMMU.
i.MX8X(8QX, DX..) and i.MX8M(8MQ/M/N/P) not have SMMU.

Regards,
Peng.

> 
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27604AF5457385559F35070E88510%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
