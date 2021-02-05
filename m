Return-Path: <jailhouse-dev+bncBAABBKUO6SAAMGQEPXZYYGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22731070B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Feb 2021 09:51:55 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id s15sf4910619wrt.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Feb 2021 00:51:55 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612515115; cv=pass;
        d=google.com; s=arc-20160816;
        b=AL9L9zd9IrGX+nukypqNPEdelHqByf9I1YjqaRwtSONvz52fmtaCvNZDHHWSlpBaIN
         f6SymVmtEQ4IYWLty3wW2Ta8frgd+c8vfw/WWlIBpvfVdhtGco16M/VUy0Lm0c3pyrFk
         ONflDohlFgbaPM61tHnNn7vFMZx01kyHrjv/49TtW5jJnGUkWyIOA+hmhyJDw//7lwmt
         Od68lOu0hwa97qoa9m97/U9yfizbRWezNQtgKuugNC1fVoiiqSd2waI4VgAuY4fxT/T2
         IOc8a1ykJmN8Jew6dVBWN1L2K0+manps8wipgMRYiAfsNdIIY16Fd4a5SA67gBAXoOvZ
         Z4IA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4Zx+VrXIKfGgCCFNOos/D2G3EIqtxjfZvalMMjGMG7Q=;
        b=SttLH82ubVyHf4QsjSM4lbdGgRHMxiMVvPlAHU20L0OaXu+7wyuSoCaVr/IkTiXtlY
         GtZ1VVw4MAu1YDAIYOumYRAgMYvES4r0kT06x7lr8sg9lFQ4RU69uhe7Q81jO1kvouVu
         sPlE4gcuHItOHko6rl6ghZH5swSw5ofEYnCJHcC+FgMdcj2HaliCx+/kKSf9ckPD9qd3
         alund+UY4E90GoJbVJVdyR49rBKnOtDvRhBABanEdU3xVDxqyuDhpe8vIqo7cyT7M5Un
         7kNY6sJzySWzrEJJQHH/VNS+k6383mKM+oXNrXr9IMHMSzk5VqgLV6Y38UkZ5H19cUuY
         zVOg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=JF2unjjL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zx+VrXIKfGgCCFNOos/D2G3EIqtxjfZvalMMjGMG7Q=;
        b=GpM669knUVjFUFo0Od/1IDApHqh3gn1uH6AV5U+ziHt0NqW02Dd0y+PPP8GxttJUcJ
         ZWHJwYx1PNe1tM2nWRLTBrMJik3CTyp6/cCwXJt4UPnh23KkxTJ+eQWXPK7SrLhTIvqH
         1wKAxbncrspKaPlDjMsRR5LZ94UEgSIc2KeEh2Y3Yu3LqBeoOgsAA/9Dvxbm1YMhbFy1
         Og7tiP6cy/5nIQoWFLFEzNxkX+H/gn/L7RWShAJOUa10KP4k7FxxlO5yo7pTdExSMF5u
         MIXXpxK8mJUzKtiWJt1/nKq4DClcqTN9KKeS1Tw8ngeFT12WxwTqIlkJcAcc+HQpMjKO
         tY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zx+VrXIKfGgCCFNOos/D2G3EIqtxjfZvalMMjGMG7Q=;
        b=c1H2by4e6+cb6kXTr/N7RV1ihbMfRBFLn1r9ldpcvfxD52yTwQ91M7RJr4/bL89yPj
         eREDkW55clzVjY8HIxEH45NhFMvKk+s7UYB0R4qLXM6HjP/lTnO1GxL6y76ga4Yx5Rud
         f06C0MPLupWcpUeBXr1oD79Q4y987iLFjSRoPAfIHjdx6qAtfZTTn2RtIpzcZEpUe7HH
         V4IA/7rDds27/Xc6jZze4yQD+un3QYYUl80Lgc3WRyo2XJGgTupv8OZbpqw6c7h+H1XV
         +d27lwOXZxGsQN5p2IjTmqmWuFhidyVXOnn0iZplnERTGNDsWZmyASeUPjUcDvsQXV/g
         A6YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HxUvue/CblomuZBfNHrmzTL04dH1wHfSE2AeehXXCXVHv79tK
	1P/Vo2e+ZIht5qWA/uQwmRE=
X-Google-Smtp-Source: ABdhPJyG50rnDwWDk0QksTy9SKbjhBfoRoAuvdne8JrKc7STa1hhtWVaHWVy6e7blhrDa8LaRYjCRA==
X-Received: by 2002:adf:d085:: with SMTP id y5mr3856417wrh.41.1612515115096;
        Fri, 05 Feb 2021 00:51:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls3379278wrr.0.gmail; Fri, 05 Feb
 2021 00:51:54 -0800 (PST)
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr3802700wrt.388.1612515114372;
        Fri, 05 Feb 2021 00:51:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612515114; cv=pass;
        d=google.com; s=arc-20160816;
        b=K/spF4C2r43mx6FE4FulVBlpZaw2WYGx+s0f+meJha9DNPR7WyB2hZ5ShHJ5a6wzx/
         rLrDEooUHeX73ZStenLcTh6LDHTg8qNdwlJ7FLaGFHi4G3uBIgVX1hVh0/tYRN4l84Mz
         3mlAPXArHNV6O50jEC40QFYj9VlbLmJq+lW0MIDEFNylVeHkQWgSaF8THCA+jWYjPYEU
         UbI67VJpqEJttz5/zEgOwioGjk9tZ7VkztEK7Fj3GtJXRLZP3mKItHGqRlkIEiTlAB9o
         uHjbPqBTXmYLTGWa0Oy8JIqiYa24Ef44FigqilNNeZW4ypCFz6g9fsr6cfrZP4uMVY8J
         r9hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7ihhS1EE5u7A/TJ9HLHJbNDD//boq2+Y2OeAvGI1yVc=;
        b=paRpkYd+Gmt7ML4KHN7dxuVyMhLtoB851EWBsPEkxfp8dcaU8TxaGwL0C7qG2x5aQ7
         bZDgG0QkROFpA3PtZQjh/BKOoLWEPJ121vGQc2yiiMPlyXS3P2H/oaZUbRvqxcQ0JE1w
         yfuhzvnRgb3tyQ1cTUy7/7wYOFxHYoaIcOz4kI8/oSbOOg+UmsI4HPIddOJZP9DTwRtx
         nxvuecGukkJRSD1qCv5j/CQIqv+rSzINXmgm0jpLbr0d6cSJOyZDsFLLF6fzy7fI3kcm
         QS3b2/Dpb43fbNE95LWUp/iBJraqzXzVD/0durRkoUlr3c6aoiQCMV8BLOD2q3qjAEFK
         Ukyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=JF2unjjL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com. [40.107.20.58])
        by gmr-mx.google.com with ESMTPS id q81si501727wme.0.2021.02.05.00.51.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 00:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.20.58 as permitted sender) client-ip=40.107.20.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixl+YXudluMfsamzjBvjii1oP3r9azwudnjlm4thKkYIv6MKJS6Ox9Y+J4ayrjTkoZKTxkgrYnry2OIYEEeMx1H/WwDrOcIj0zO1n35pgm4XmMK/RZyUifXCwGXI8WXsdfFfkFy2m8FGctiyABJHdBNlcrCPTjU/Xj0sODs4/fL2VMsRcq/ZR+UcWtJGVfQ1PCzUSzSKO097gBej6SDzJMohWbx15ZFXACU0cu752I/pOyFrBB4ckKY+mPiGqhpj+7YrFrpsTq+oIQnyCHH02J+xwLqc2jSg8nT9yAe9YnYtnjQT24MgBM8f4/be8qsqR3qLmbRZN6DWgmMde/0C3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ihhS1EE5u7A/TJ9HLHJbNDD//boq2+Y2OeAvGI1yVc=;
 b=TZztQ5mhaq4LocuDBNvDe65zVBfOloA0EQxXinz9ElXWATcQLV5LtD2CMFnPO1KI3dAbwNFDACswSAd7FmgkOmKIWpKP/fQmgIvlTKm7tSLU5IpyeeW4FLLZ9jEicrYx9F6tbWEWS7hCGdCP2KniLc/2sKFMflZGckJHUZQMEw0iVTtzcLdPqNwUWRJsxOa2nqW8TrN/MiaX0fCrZwI6bB8DcnS225EOmFo91aKDrEbyAMFNfaZui5AkObksInOdBPL61LLdqQB5lzywhXQUp1iiiQxVy6nn6fI52QZ1RfRAWTfjzTqeWmv6psR8Rqv0Q+UuU7+aOsmnsqjOBGQE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 08:51:52 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 08:51:52 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v2 1/3] configs: ls1043a-rdb: add DPAA support in cell configure file
Date: Fri,  5 Feb 2021 16:55:07 +0800
Message-Id: <20210205085509.21595-2-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205085509.21595-1-hongbo.wang@nxp.com>
References: <20210205085509.21595-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0161.apcprd01.prod.exchangelabs.com (2603:1096:4:28::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 08:51:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4acd60a-5618-4d5a-1019-08d8c9b34850
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70697A22A40156E1AE0F9FABE1B29@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIJ9wy0GLVCX86OVqPewW/cRfQPS6EBdr5hMxSLdoazICZ2fa/IktXxBJuZ/Zufy23OZIT8puJglNqv9W/qN3oJjCngOTFSOMtes6mOUX4ZG+KZLS4POIqy/BUw74DRgY66Fw7GOQaZfwdIPboO9NwcQ1lUhO4kFitDJSfuCBHM2bALHC9Hw7zHUjHCjw4RJl46fzWBsu5vxpkIPJqkk3gchUX3lqGemDRin70lmPq+ofWmsTxYiPG22In9mx0k+eR5S+vt1hMYFfu9VOMNJr+u42xljXNbJOaudLgsBb1V4k9gIUtGEk7Dd7/iyzh2caSgWVhZCaYxaiWQCYtrrXb2JFggECMYdTIb9Sil2SHWIUX1ZJiIMObJwCN5WHrL/eZkkUh7Dk2IR8856vcckXWNquR5nDzZ2Ot7Id5qrYWTlmhHH8uPZJr6sQZYCTpsDUXA5rLfxys3dbJ4PW9fa9dGxvGhx1dyxQNhIxkl0Ck4E0pwOD9mT66fqV6y+2D03drDnslQf5g1TKBOCrEwc8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(9686003)(2616005)(8676002)(186003)(956004)(2906002)(1076003)(86362001)(26005)(52116002)(66556008)(6512007)(6666004)(5660300002)(316002)(66946007)(6506007)(8936002)(36756003)(66476007)(83380400001)(478600001)(6486002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ThGVUsQYv2mRqOV+StkJTdiMVzrXwnCIjSJS8S2VT/HL3NSNkqMpjq62RIVs?=
 =?us-ascii?Q?uM/QUhNk4mxNJEEVLkM5EJx36Nue/BwtiWjk5l6gF4j2kEIqZvmaGt3JY+zt?=
 =?us-ascii?Q?vAOTMjL5KknklhKakqPkTMaOGqWKltdtlEUT5IlaPvfcFDIwhseJ7alfHdS/?=
 =?us-ascii?Q?qj/nCIHftXS0lpWU/QXJldYw0nlzUK3Wx75P0GILbFhq1ewHT425qW3Ld4lB?=
 =?us-ascii?Q?P7WRM0PCXQLKCJcUI3fbLa8fJi+tfFtdUv5eH7kCLYwgYcPG8rjz9j0bhenT?=
 =?us-ascii?Q?jBUDNDAodP2DjPVJ5a05grMX3M2u2Sq442//G27dSI+N7i9uqs2a1AFo5dGj?=
 =?us-ascii?Q?+42c22Igitdwh85wti31EsdhJuOVMwPGiYL0fm9fuqAtX0PsKiNk7GaO0yy9?=
 =?us-ascii?Q?5pGUpBFtkqD0Vh7g3oL2qdlUm9nBn8jigjOiM4dtcLLW2RaR8kHK2/5Nbh9f?=
 =?us-ascii?Q?d/PC2AUztiZryjaaaEvBxPn6r53qh6gI+IUF5WQyeBKqgpFSbsb/v31q8QnO?=
 =?us-ascii?Q?kzTRxFqXbxCeykWhwAZekGZnzCYpwRrVk5C31sLysu9mjZ62NHz22nTbl/0x?=
 =?us-ascii?Q?SetetYIWcxKTm/b7oUPRALZDRQTqc0zfkNCShJoGINc+A2Um7J8HtUgk/zNd?=
 =?us-ascii?Q?LRsYx7E57/4cypN9MyILJc1KOKwbJxzmaAoG5Bq+sSCWpTRz/Jmjde01TYrZ?=
 =?us-ascii?Q?mpkzrkCZuSvlKYKr6Yr8e8Fm4OkkmUr+wEVBKQZKLdJD+GEJE77Kehl4YxOi?=
 =?us-ascii?Q?6n0BgeY+UNGHvEPdqxIjE6yI63wGPjwATgLNh95A+pwwnga67TvVAnV32PJK?=
 =?us-ascii?Q?ey2usdz4TEq4wiwAzknT3mzOOZOYTq17geuaMmHc+6IvvlpgptngP4dGwaEL?=
 =?us-ascii?Q?VLslm4FxiI2bFwPBFcxK+n3+BzG4h51zInxTRvnPdhZ7Je58cU2sZgY+1Kna?=
 =?us-ascii?Q?vI9QPO8vQwMrVPLoWWHP8eCf2NV6JAMcyndQMq9LaMoYWHMt/2ZJflY6C5sU?=
 =?us-ascii?Q?tZIaypNXp9EJvNpwzYYj1RALsx7dsCMO/gA1nhYZpgtsaZ6QCgdXzZXD1b9j?=
 =?us-ascii?Q?QT5Xx1X8ZEd+yH3/RXXJEpgkPGaSlyRQydBKy1XeMpq06qKpy09kuQtvrWcH?=
 =?us-ascii?Q?QYIycPZYtu9nY+bEkxyhAzi21uSKRBEZQNCejvUhcV2B8m/9KcjWuUBjfvwD?=
 =?us-ascii?Q?xxAo2jeWbQaxu2qYuxoCl3QzqHJ6IgM/BDZCeFOSOXNvbcgscBLc8QHA5dBR?=
 =?us-ascii?Q?QTd4C/0UXS63aXZsqT11i910uhCOHwsIYwcY8pjkRV0rKh91l6ecfNv2b8dv?=
 =?us-ascii?Q?hs1fljav5zTot+g+QKK+cmHq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4acd60a-5618-4d5a-1019-08d8c9b34850
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:51:52.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywKhvVBfY2H3H5qJAv6Bb12sKMfejQfxjZjwWc4UIyRSxBYHrcspw2t7kA0/MDsVhThE8nPNl8XfEIDnRFNiNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=JF2unjjL;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.20.58 as permitted sender)
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

  this file is used for the case that non-root linux cell own
all DPAA1 ports, root cell don't connect ethernet via DPAA ports.

  if user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, can choose this.

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c | 212 ++++++++++++++++++++
 1 file changed, 212 insertions(+)
 create mode 100644 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c

diff --git a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
new file mode 100644
index 00000000..89552b16
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
@@ -0,0 +1,212 @@
+/*
+ * ls1043a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Hongbo Wang <hongbo.wang@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[23];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,  /* vPCI INTx: 60,61,62,63 */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xc0500000,
+			.virt_start = 0xc0500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc0501000,
+			.virt_start = 0xc0501000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050a000,
+			.virt_start = 0xc050a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050c000,
+			.virt_start = 0xc050c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050e000,
+			.virt_start = 0xc050e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0600000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+                },
+		/* qman */ {
+			.phys_start = 0x01880000,
+			.virt_start = 0x01880000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* bman */ {
+                        .phys_start = 0x01890000,
+                        .virt_start = 0x01890000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* fman */ {
+			.phys_start = 0x01a00000,
+			.virt_start = 0x01a00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qportals CE */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* qportals CI */ {
+			.phys_start = 0x504000000,
+			.virt_start = 0x504000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* bportals CE */ {
+			.phys_start = 0x508000000,
+			.virt_start = 0x508000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* bportals CI */ {
+			.phys_start = 0x50c000000,
+			.virt_start = 0x50c000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xc0400000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0900000,
+			.virt_start = 0xc0900000,
+			.size = 0x33700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32)  | 1 << (61 - 32) |
+					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
+				1 << (44 + 32 - 64) | 1 << (45 + 32 - 64),
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				1 << (132 + 32 - 160),  /* 10G PHY */
+				0xfffff000,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210205085509.21595-2-hongbo.wang%40nxp.com.
