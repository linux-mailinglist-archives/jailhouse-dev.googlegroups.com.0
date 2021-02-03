Return-Path: <jailhouse-dev+bncBAABBAUO5GAAMGQEVFXWQ6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460D30D379
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Feb 2021 07:47:31 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id n18sf13922770wrm.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 22:47:31 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612334851; cv=pass;
        d=google.com; s=arc-20160816;
        b=JCDWUiZXGP6Z+T5vwB/goseWiRuiNoAsbuZOV7zyE3U+WRoC0zmQoOs/b2C/7u8aP4
         5Rm6+IH4r+T7L1Mvq9CSpDcfvpDtcKXYmuoYMLPafhMfjmVEh6w8CyebVKqSjA5PZ2e0
         Udh8FkMVFQVRIRTF0PvnpP3K9MlRuMOFOUhY7ANuq61AH+5nncmVeT0Smf+JSZrkzJWM
         pG1h6zpVhH8kfzikeI6sxcHP4uQ9Rvn5alSVHI85da4AkHUhStpyd3W7M0roDUS0bfwW
         WxMGLAhV8i9ZmZVApS6iBzHscT1735ioH7lZDLiYeyCn0a6flP1XdSLIRdXEWHMH4gzX
         bO8w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=+pajc/1GyqienfbfAK+rl6wQ4P7xUudjyLkOXIuuceU=;
        b=DqLeHsC+qT2vUf9GOl88+I57Slycz9kkJDTwWLqcr2NIICLiD9ZZbKeYNSy4JIA6HO
         BS/bjKitC39jo/lEnb+gdzaLzmwoIqTZ0D0v39WfnujLZVzT6VmSGhN2RMgQ9PM54+AL
         LXzqXjxTzflLgMvBIL2I1wOCa3Yqjj3UCEprfErZ5HQLWQRAz1/wMqXoy0X00a3BbV1I
         DRMCxH3hbCKtMjHKf80TiXaR/sX9qggCT/1Inm7WIKxo5ZbMVOo+k0dNDtL+g/fajog7
         77kUZ3RCjGpfmdiqPS1J6wi7aFm0FZh7UzZ7UeqHsYo9DZV/eVvC6gMLku1x6b9i7gYE
         O/Bg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Ez+rfsqF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.51 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+pajc/1GyqienfbfAK+rl6wQ4P7xUudjyLkOXIuuceU=;
        b=kxSbmi59TcUriZZjtasmvTN8fAVB8dey4dR/a3Sw6YgyEZdp5CEYufWTJR0rmHu2GC
         LqU+fKk/IQIMWhFqrftyLXESL+NU9kFqayaITIEOJS/Ji7G2spH3nCKlZqxw/Gcse2Ka
         Br69yQk//0wwnKn9PXF/3Kb0mPsbJ23zFt/1f4Aq6G97ypxGS4meT/OtewHxmEHEZj5a
         Fg8RFtPftWO9L6it+orKlMDth0Qlvw0QnI23kqE09XaOWKz5mB10Lz7t2vkR6sVis8sL
         0whAvqwMhuYMlrHSIipyUtBvNbKBrWW/RTk9G3g59CQHrUUMDjRmzWV7YwfQ9GxPDpsB
         9LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+pajc/1GyqienfbfAK+rl6wQ4P7xUudjyLkOXIuuceU=;
        b=bGoQ50GhvXSBfoZJ00l/FxPStP7NquNsmzhn+dcmu8LbuOkulSsS2pQ9Ju+B/iVEfe
         1AXaArYGzg2V0wQalabQ78w5EYaeU5TDjP1GJyoG51AMNIOHXqzE7Gxn7ivJoItZU6Gf
         fiOkv/fxjTl0v7GBwvdbuilUQIPI061zDU8sfRYs49fR95DLYZbk+Qpq67Ag1a9e0/8G
         +pBGOT/CTIdkW2Oj/op4WVbwJsjawncWEUWPBtFzJ+Urj7OUEnEAeeg5+fF2isUbY7x6
         T57xDD++pMt8lBzvdovtou7xU3CVnKdhiwK9NmdghlBHBkQbBC3j92NuXTETNFnZbq5h
         YodQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nQ1rbFHEW7VPp3Ex7jgcfNgUE03F+uMacsmmkK64eNXZNeZsV
	bFo7LVR6skyq8PgLcux95dA=
X-Google-Smtp-Source: ABdhPJxtYu2JSnB1GVaLhYwlP/9x/DBx30jsWToceC8WDLEdFLW2drzgX/Ejm2Li8egcbfqT3J4VFQ==
X-Received: by 2002:a05:600c:4105:: with SMTP id j5mr1336776wmi.0.1612334851103;
        Tue, 02 Feb 2021 22:47:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d02:: with SMTP id z2ls951066wrt.3.gmail; Tue, 02 Feb
 2021 22:47:30 -0800 (PST)
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr1725607wrx.302.1612334850484;
        Tue, 02 Feb 2021 22:47:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612334850; cv=pass;
        d=google.com; s=arc-20160816;
        b=WlxunnxLtPLEesRcgTg+elTGYBVauVmnlUuJJNtuBM2RZK6uYAH3ZZs28sgLSwKMS5
         NUStM6DsOKGZe6PjgZmhD6gtJaJq6Ai5vzJjXiNNWb8y1wY3/Kkv0AJatqYdu79begX3
         w6o1bYp7EVCSk5x7CVirC6YASEysvaK+zF+HmPEMtaiiZGxT4BWEgynMvDPsL/U6C2Ug
         QydfzKL7FEf3VDgm9ojCTDJNlZZiYnD9uzkE7yo4qHt4W0ux3V1uP4o6l7ZBE7biutBD
         TGj82jvGoHgcdQJPzzbn3WJYh4hcffg+arcimlbHaX+sQFF/qJnUGV2DoRF+vI/enA6o
         lowQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=A7eOD28WI0LkDQH5ZdvEKyMtz10ukiOx8GDQYBkZvi8=;
        b=ChGRD7PNWY5hv3zqI2Do8lgM1vpoNrWPYwR7lSfAyAX0aA8O+I4mci2xNQhpS9Ak6j
         QnQdnODlR6DHPToj9zdGkWHx7vYvc0jGMOVE4daolvqleyHY0Q5KnqPF/SFnBxLnbC3Q
         4ZBhelacXwMGkquYkDa6m2Jit55lcTOX2sDXXG6RuZNA/BklMogqSe3EhtV0OfX+FTpG
         PEE/fKoNv7euh6vzKqbWM/SK8Bk3/hTNgCNRGExWDlFeKu3qxXHEnp/rZ0iYgQeKHZE5
         aAuLgmNWeCRhwluAn3T7VTjHteZ8FKKCpcpfXQaD4byuFA4XOMFfSTuq8pAx/0xd7kuc
         qZRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Ez+rfsqF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.51 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com. [40.107.14.51])
        by gmr-mx.google.com with ESMTPS id m2si26061wmm.2.2021.02.02.22.47.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 22:47:30 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.51 as permitted sender) client-ip=40.107.14.51;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/85gNP4aSqM0o7/xXuZHrQndb/MIEKgHbfMgjeNFnDw4r+TqMFBG4nsmO1WY0vo+ib2VHhxGF6zGtHcIeWewnRa9ofolD+NI+sFeIpkG9eKY4gXal4q30XtcO7x6ZqjdR/PH+a0ElYZBZNb2jUtGcmo+ask4aB2Yjh6XoSLvm4Z0eyl5sAj+/cPNXcYvuWlpwUt00Lw+PohanjGjkMj5vqZCc/UiY2eGTb6JXcWsaHtZVufDhI+YBMiIRlX0J9UH2u0kOdLAxC0ZtUZTt1PMAB2ec/y94i/eOn4C9OnUNnt9g7h90AwWJqha+VJESwStNVuxPyvRvHmWgaFzSRO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7eOD28WI0LkDQH5ZdvEKyMtz10ukiOx8GDQYBkZvi8=;
 b=lHa7XEKkjDXLgweR4jM0/VEDBzeXJ/KM6+zJJiEJgWw3JO4kzmLPwKLRYqlp2SapVp11NkEvCP/xSL18AbQGp4sY/11TBTXaEK4awJoFg49sEdG04r+kKgy+sPMMG/73jZjv34fHENW6nXnWEp8NC45eiyYBV2ZJPaOIHoww6+f9ensI4yAXVpaoUBT+bkoJyX/v+jvtBpf997sGg2uybzPquSHaOcX5vMbLMaTxlnA2Y/Ib4GMo4MDTMLtjWashCOYfFdCDHvNIVQxMlNwYOkxPn33xPg2YuSbbupnTyPr/Aud31JzdnWUJXUJfPciesD6B+OuAI5aSea9E1Qvb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB5149.eurprd04.prod.outlook.com (2603:10a6:803:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 06:47:29 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 06:47:29 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP ls1043ardb platform
Date: Wed,  3 Feb 2021 14:50:54 +0800
Message-Id: <20210203065057.27914-1-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 06:47:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11a77d0f-6b14-4596-92e4-08d8c80f930c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB51499C3AC3FA78ED5C6A7035E1B49@VI1PR04MB5149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFNSX0XImyFNPnmo0OpU3eeQrpxoM+n8q9A2Ko5NXvtqcVsGKxa28DEClSLqgTlHoblpdMAA3iqgMoV3miwOKM27akrDJgOWY7fbDE7S6olFN2CV78+V73T4i/Cp4gsnJ+P7R9vI5hG8Ah9R01PIeW6MzEAIXRMmoTH9GTVGCBQTu+Wj1CN8ui2sEmGdtkAfiik9tiD0fY3uwdZFqSmXOCVTdUe/SWdwqanN8p1Iv2aTP+sOe59HByR+0FPRdjyOnYGQIaQ+oj65jyd5lrQPyVzmPsw5RK/tcsp4KZIUIkmZqKZG0VwJ5bgfXpM7Tx7JRinOH5/+KCb4mXstuSowUA41+t7XfFJ/2wa/FQ0cFZenHy7QZyyNHbJMfa2UyDsrqQRrPOgY9VtZkEQw7FwRUsLI0PKO1n9LrdV4OiAss081rsc9lXIM9Z2mEccQ5Bt21iQ5haQh9Q2Xe3K7wlQ8v5mWJ0XDVWpA7LePr5EI8AbXWxO3WzVltEyB5hvCcbecxr7dBRLCPYLkDYXsTVL/Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(316002)(2906002)(5660300002)(9686003)(8936002)(26005)(8676002)(6512007)(86362001)(186003)(478600001)(4744005)(16526019)(66556008)(1076003)(6486002)(6506007)(83380400001)(6666004)(36756003)(956004)(66946007)(52116002)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XNtNRZOjKvI/0Q6EcS4N2wO3vXAUys2SmMpNK9Bcao/of+hz40Mw03lBTLdp?=
 =?us-ascii?Q?6R/keq8wrim6dma28KRDFyVa5hmgGeTomi3iulXS3K1pBFXJs9aOmwRq4G1+?=
 =?us-ascii?Q?Pyh03U8yN/xV3l6hbMEH4Ovh1aPfWnltpmwIsxIr6iQy0VyRWen1iR58CyiT?=
 =?us-ascii?Q?SI7uNNecR4U2FO1NaZfyueXbFWao4iJI6td5Y1IJ4LIp4iVbNQyTIngm+q32?=
 =?us-ascii?Q?me8SbDPFdqU3gZ5SWGNBMr5arxdV9s9kBuwPwlcG7DycuLptAMc4coiakxz1?=
 =?us-ascii?Q?bRcA87T0qkueEChli1cLIQRoIhoX5NLPRUoGPGklISVS8UyFZUdXxebo0eTZ?=
 =?us-ascii?Q?cqMVDKWCBLTvFcR8sAxMa3WCCijj/+BhUhuMHtmLtiJZMgZdI/RATDt1qrqf?=
 =?us-ascii?Q?fqHmFwAchAMabX1Y9yXPJXkx7dU1kI6zJkSGTtCjwMaKuEGQyZ8sJloBUr1Y?=
 =?us-ascii?Q?T2TqwggOxDhjjOQoNElhjeM1ZuIaVt8Qm+YeMlMOBI1iXpehrxpakOLqCDNU?=
 =?us-ascii?Q?dIaFHoBCUSWsbKYR3usfCsq73F2VCyVOnhXGrq9DKDNHIEwZrLVWkcq02D67?=
 =?us-ascii?Q?ZB1mToswgqg/6JeFO0rn3qKSRpYlH94E0etnxBzn/NS4cmrXt6R+Yi3NxAmL?=
 =?us-ascii?Q?Ls8LQYjIeHSy6qWFVZqc4m+kXXMAN4ODAXeYewIflM4qx1QBVjStlTBM63M8?=
 =?us-ascii?Q?bIPR3cqdRAL3weHA7sOxd6uTekpy7nbutTk1EEUJn7t2y40lKRzITgeiq6MD?=
 =?us-ascii?Q?rtZIss9ArwOtRhFi6R6SCfxG1npLfR9CiSX9Jn4Cz98ckoxMPL0Jkwdd4J69?=
 =?us-ascii?Q?KgvA756UDDhRw/TGeRDgL+xwmdHKirnd9gXb0BV57VSulGXAgcIgnBQ5dBQh?=
 =?us-ascii?Q?0lr0MTm+PHe628KovkIrn4kXb2DPlnZqE4B9ej6go3w2eCgusEFGcwFOFyT8?=
 =?us-ascii?Q?qycVp/H47948yJGCxqxv7m31JlRvjLDWRc0MCw2+uxBBXOR55BIgmQeROwqb?=
 =?us-ascii?Q?H3gEsw6x4hLIdy5XXqXPcofFwd++BsDiqnive5SpJf0ZGCHjgntURvohvFyZ?=
 =?us-ascii?Q?iCd4g0BL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a77d0f-6b14-4596-92e4-08d8c80f930c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 06:47:29.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8lRBJbfTrnKZRrqtdBzcO70JuoW1zPfoqoSe9GjGJP0qYXQbfD8EKqDIw4aI+tMNyjAz78To8IfS/3w1OHJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5149
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Ez+rfsqF;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.14.51 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

From: "hongbo.wang" <hongbo.wang@nxp.com>

inmate-ls1043a-rdb-fman-ucode.dtsi is fman ucode, it will be included
in inmate-ls1043a-rdb.dts. 

hongbo.wang (3):
  configs: ls1043a-rdb: add DPAA support in cell configure file
  configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
  configs: ls1043a-rdb: add DPAA fman-ucode dtsi file

 .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030 +++++++++++++++++
 configs/arm64/dts/inmate-ls1043a-rdb.dts      |  767 +++++++++++-
 configs/arm64/ls1043a-rdb-linux-demo.c        |   57 +-
 3 files changed, 1843 insertions(+), 11 deletions(-)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210203065057.27914-1-hongbo.wang%40nxp.com.
