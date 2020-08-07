Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBX76WL4QKGQEZOHDOKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AB23E5F3
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:36 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id f14sf102109ljg.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:36 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768096; cv=pass;
        d=google.com; s=arc-20160816;
        b=cDUp21vO07cdi7dNd455+iLo9NMRXmSddUTOJRJLdVy1UICfkMdQFlBqJYrrTaXZm6
         WKZ8hmfp9H5gu8VRDsi6CVc6mlh+OK4Q4hYamtGArvkKjJqumqIHcljHp7Bsvo7h1MYo
         7kJa8lkHYL+sJsZrDSmHPaHmtY4JWo8JrUlHrMVyYI0gBKSJKoRUcWFrQrf4lNYzdPaB
         CNJTKR5M+uhqGYyeEHchPWYzHw0Fg5SKwqryLSyfaphJYQ3Gs83LxWo0qXvbrk4WwCsH
         QPBLWmeMWa2wLVB3hqnrZKEiRKhh+xMMYWe2FoLFdJ5rGbYoX/91DtOuG03BsHQ07PeP
         YPOQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UYu5v1qApLtxJNj9m9ONMQnDzmrENZEJwPnwR2NPVws=;
        b=P/IwQfATqzJlOgqmXdU+6bwALbEXAh1oEdhs3IizICdkZsYwg293MoQ43fk7DrpcDi
         auni7UeFKOdi/2xvjBCbIZwkg7AA3J0JEQlXHB+vFjx9uH1WwurfPcS7Woimwujh1CXk
         5p+0uEfG+MHVB/m3TcjwtcYDfbWeznW77IXleeUOGui7L1CQYePbu+Lqj7OMuV0HCEUX
         lEeDZnQJt7B6deNNWXLxttiYNrNR4oUoFOgTTVPWtmjIsuFOI/UsN9tTjG8uwCyS9OEC
         VYbWtrGmwQC6S0sJfXvHHvHa7AoTDZdaDKu9obmd24ZJFQve1RzrqUsgZHqBkOzKdVsb
         hiEA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cKHlOXqB;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYu5v1qApLtxJNj9m9ONMQnDzmrENZEJwPnwR2NPVws=;
        b=KIY+HfCo9XY1RdvXo3Li8zA0YORF062YEKmj/UchWYabuDZ8e94tfMw9v3/Q0c5H2x
         41ipWrRaT99cVP+LqU4TGneDLlt6dQI4UE+kIfBFMniWqkgBq+Wo1bE4ARPWQYpJL2RF
         KgCDTQkn15Um5jJlFARxPHFQwheSTuu48KlTy3F7gdDDjrxYdiI8ynnBTAUKLIzJOfdn
         IEH2bmfYl5L+gCRitzyNAHnqwNPW3HzOx0sDoJNBHVkKZ0XQTJ3hI62T8YPIj1hm+YWE
         qNUbLB+ae3QDogYV84TwDeMK3/7g2A/zCdT/fEQuKDqShLHvCsssCEaRgg6oJdQ8jIFm
         LeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYu5v1qApLtxJNj9m9ONMQnDzmrENZEJwPnwR2NPVws=;
        b=pt7l157yLDY8weMlc1YXK9d+mZ2GQoXP+CLDqqTIC2903Hqzyn9ETW0sFlkNbNL1uV
         jkQJYBqPrXoNYphli5D/Ug0F+1vODyLsoxujGLvGDtys/jLZ2PUB7Eu89ZkW31DVTEJy
         H4d7S6QcsPrJPhcZ9Np3LKlc41/ZwJyidXe1OL9VVEyZPq4jVdhLwweLR5MIvxDum1aS
         CtrYtwppCUTbL+c73kUXHlceAGk5qyA/iXPGGnbjPJg/SJrYXEU6eQg6Ijeoly1Iy3a4
         QYYMr1OPV0ipqRdK321Zoo/2O3SoHAAqGgZfcMEtNlW/Mgt5uWTuGQe20cEWnIHUOUqv
         41Vg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533koB0LuTi7PVFtw0SVcqhSucHCPwxzHLh/+VrzkYh8jIw7s1yu
	jHnAW2Lma9qN8oS7guK+n8I=
X-Google-Smtp-Source: ABdhPJw0QL7S9W23brbNIBzUumQ3Xk17adDX9nY5VOFnVlv/6WKEVuhh84kvRb+OAIWZVl4TaF8p3A==
X-Received: by 2002:a2e:95c3:: with SMTP id y3mr5694993ljh.224.1596768095838;
        Thu, 06 Aug 2020 19:41:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls2188355lfg.0.gmail; Thu, 06 Aug
 2020 19:41:35 -0700 (PDT)
X-Received: by 2002:ac2:568b:: with SMTP id 11mr5242070lfr.87.1596768095256;
        Thu, 06 Aug 2020 19:41:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768095; cv=pass;
        d=google.com; s=arc-20160816;
        b=AP+FwKQm33SgPk3XOIvrzDTu3T0+fezcSdUcp1Cp3RSumUqeMZY2cptwFXezgzsUH6
         3P8WwNhtLrJ+8q9pRDhQDbCOqjCOD40/Fk0nkVBQDXSLE2bxV3A3Y11+y97KbX7ez5WN
         nfBu3G8D+p0Pg/IWEdVw7ib6s+aUgIOY9+JxLfG/w5gAcFTCLpHQpBRrYgbVnjYfQ+pf
         uodWptR1sJ4ZGaliKbr5kQi8jJOD+ukIeamU/f22mfUJURK94DQE7W1euvTINv3T2/Qg
         S/aznugx1Wqv60S8D3jrnxu96jj3FtKTDPdpQ3WUKMuIVEcge+AEMAqrntqdBk51v24W
         ywew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Sk0VYixpdSVGw9Y3G6xy82KbIFnndRQnBPIug73wVSQ=;
        b=CPrHmqPCYchtHOMQlsk48pIGYKoOupjgRVgmP6NZxWXNIBgogpIHUa5OGkyGWT0tMq
         1qIZAHgz/cuLFdSyqUAhIogt2pndNs9e7aLDbb2LmKybm3z35M7wq/eD3oPdcqZnccD3
         FlS4fWTOGTvkuF4SE/Tkc4/MrPR1S5+ucyoHobGkxBvq7YrYw8JCEGkolZkYfOc1Tt+E
         wWb05oqo3tq1/6h8jVjStfoHPpefvCjLR1cH2Zs1lmtbRH473NPBf+Jz+F30ZFJYr6uF
         LnQeDIiIhs/3HGeha2LVxiqqOU89CImZv2Ovh6BwFSZCUtKWWsHfveYtIPDc9v0G4b4H
         qjxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cKHlOXqB;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150055.outbound.protection.outlook.com. [40.107.15.55])
        by gmr-mx.google.com with ESMTPS id 69si351762lfa.3.2020.08.06.19.41.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.55 as permitted sender) client-ip=40.107.15.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQwInrXOiAVRumb3bIrILq9thngp9n26hCcDxlShY3fs0G7Dlyy3EsoTbcslHazTzdWya6NWOuXojqeI4dtAqr8flV0PV2U9nRN66i5ALknziUD4YWZIMjupmgYkWAf8ketMpjhZggWSKNB/yF9McpC31C1FQyc9f8KNXpx3E1oMypeAE2t4wKIfKII5aRwQvkrQFkLndPXY7DQQORlggcwedN8BoeL0qOMhVlxu7r85dOXzuLj3cjqSRPKyuQ7ALSTz93ZYNJ7HiKKkYUfMAe69Ds7YR1wrNUvQigQLMhwLFV5N7/ZB2Ztc2wXyTDBPalUsROw1lTZMLPNhSJys4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk0VYixpdSVGw9Y3G6xy82KbIFnndRQnBPIug73wVSQ=;
 b=GohKMqjh4mZ6KUUgEY0J2q3rqU3HwZXM2G/1jU/qUxh42dWIYvRxTthR3hsG0lVk1uUh/eGDhkMtp4+JsT7wW7V2yS8DwHIjWkmFwIrRZV/JvLZaRP96OkcGWl/oEaOC6qAv7DxhO0dSmXJptDAtLkv3YvQVDhnlJ1dTfnMIGiDqiaWtIkDSU54ANJvWnzXNc9xWjQ0u/XxYY5zCS/qK9pAAC+GevodqtxGmLlys8pfbW23TkMZJA3mTRDXB0F288h+VvM2DIHXrqaUCupwvbeW4ogL8FkDG0N+yxiW/fmYUNQxjJeRTlCSjTOUg9OgXjO4uuWt8JejA2Bmcx4zz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:33 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:33 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 06/10] Add libbaremetal
Date: Fri,  7 Aug 2020 11:06:28 +0800
Message-Id: <20200807030632.28259-7-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:31 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9511ae9b-73eb-49c9-92e3-08d83a7b6566
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087F0FEC26173467C09BA0688490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0hEmPtrF40tfljAAojql44h39bJ6g9gvabC2HEyOProz0gaMEUKaAMPZJaswg+gM4sdvY2s9XIn5IB4CCVxDAZfXmwOZ5i85n4SvNqEdyGdrk48nyLHE1aglrmhE3s9wBN4vhvZLF77A7aft6rscFzPtRDSnVnIFEf/GIVHHB+BvF3mW5a7mBu8vj0/IDNvplOw91i0wTa53MuFyKpfbBVEkBZgtNiBKAC9v4iAjUf/JKwga8Q9jguJzuGOfDDOPKjj6rkEH2sz/P4ToRyhocFaZwSe4xwq0QQJiD43jdgVouGtOzNZo1iWmsXzpNccg5kJKu4GsV0zPUrJsqq0BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VinsfKFB0PyboKAbOfOJWXC5U1yAXdU8jdvjwQmPlK9AlNc7L/KG3kLtyS6V3fIllri6OpSHfU0WMfBD0dyv2RHGhog7imO2KgxH1zsxShRGnHLhyrdw55Vd6V6wUQVlvW7/dwBoE0HHznHVvO6Pu6/dTCRNH6c6HE0DcJ73pvXa0nwhbcwaQUdaiwPt81MupV8ki3YLlJCyWID2/86eNu+7MTqGqgWRPLAv60buoZdTF5BuTbCm3jfQp8osuIX3pCJcr+p66XmAloTo56rD1vqzbor2X1z0Llx/km7Q+opkyIKSnHXiTuvnw8503Xy8Jba91glK7E/nZS76wvg/WJITmYgZ/r3aknScZp1aVwFuAH8j2Nvjcxp9PFxJveQy36HT/IomlbWtXK6+mFbMm/Mw2c6TdT7LvPgaCslQzG19nQR+NgxC4d21bD2njr/ueKj2xNfy1rvzoOye0B9Sssdgzt6FimXYhI8/mQKJ5BAjClZiL5OMJNTeWztJc4EEFfvJaYWmRhH5e0PFLwc3u1Yrmj1bYhbLU/aCHadFiP8SQE2IOPgEAc2BkWCOnVG72zR07HmQF2Simn/Is/bTq9WvHHH+kfkT0GTrRJKhQCa9axeFzB0JcMTiooMg2ERoDs0QDrKxevKwuwdtfs1xsQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9511ae9b-73eb-49c9-92e3-08d83a7b6566
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:33.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI8NyxXyIwr/kz4cCzYy2+XwXQtfb0fHgkgWTCnq04ktEpL1QxmjdiP+VlGNfQe7NBbHzOK3Qxv1bhsIJyyekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=cKHlOXqB;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

Add libbaremetal for sharing code between inmates and jailhouse
baremetal loader.

The Makefile code is copied from inmates, currently only string.c
is moved from inmates to libbaremetal. In future, we might
need to share uart/mmu and etc.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Kbuild                                 |  4 +-
 inmates/Makefile                       |  4 ++
 inmates/lib/arm-common/Makefile.lib    |  2 +-
 inmates/lib/arm/Makefile.lib           |  2 +-
 inmates/lib/arm64/Makefile.lib         |  2 +-
 inmates/lib/x86/Makefile               |  2 +-
 inmates/lib/x86/Makefile.lib           |  3 +-
 libbaremetal/Makefile                  | 46 +++++++++++++++++++++++
 libbaremetal/arm-common/Makefile.lib   | 41 ++++++++++++++++++++
 libbaremetal/arm/Makefile              | 44 ++++++++++++++++++++++
 libbaremetal/arm/Makefile.lib          | 63 +++++++++++++++++++++++++++++++
 libbaremetal/arm64/Makefile            | 44 ++++++++++++++++++++++
 libbaremetal/arm64/Makefile.lib        | 63 +++++++++++++++++++++++++++++++
 {inmates/lib => libbaremetal}/string.c |  0
 libbaremetal/x86/Makefile              | 66 ++++++++++++++++++++++++++++++++
 libbaremetal/x86/Makefile.lib          | 69 ++++++++++++++++++++++++++++++++++
 16 files changed, 449 insertions(+), 6 deletions(-)
 create mode 100644 libbaremetal/Makefile
 create mode 100644 libbaremetal/arm-common/Makefile.lib
 create mode 100644 libbaremetal/arm/Makefile
 create mode 100644 libbaremetal/arm/Makefile.lib
 create mode 100644 libbaremetal/arm64/Makefile
 create mode 100644 libbaremetal/arm64/Makefile.lib
 rename {inmates/lib => libbaremetal}/string.c (100%)
 create mode 100644 libbaremetal/x86/Makefile
 create mode 100644 libbaremetal/x86/Makefile.lib

diff --git a/Kbuild b/Kbuild
index 0b25e26e..dc6423ad 100644
--- a/Kbuild
+++ b/Kbuild
@@ -51,7 +51,7 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
 	$(call if_changed,gen_pci_defs)
 
-subdir-y := hypervisor configs inmates tools
+subdir-y := hypervisor configs inmates tools libbaremetal
 
 subdir-ccflags-y := -Werror
 
@@ -62,6 +62,8 @@ ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
 
 $(obj)/driver $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
 
+$(addprefix $(obj)/,inmates): $(addprefix $(obj)/,libbaremetal)
+
 $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
 
 $(obj)/tools: $(GEN_PCI_DEFS_PY)
diff --git a/inmates/Makefile b/inmates/Makefile
index 095055c8..44354c87 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -15,7 +15,11 @@
 INMATES_LIB = $(src)/lib/$(SRCARCH)
 export INMATES_LIB
 
+BAREMETAL_LIB = $(src)/../libbaremetal/$(SRCARCH)
+export BAREMETAL_LIB
+
 INCLUDES := -I$(INMATES_LIB) \
+	    -I$(BAREMETAL_LIB)/include \
 	    -I$(src)/../include/arch/$(SRCARCH) \
 	    -I$(src)/lib/include \
 	    -I$(src)/../include	\
diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 3d7b335d..d99102a9 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -36,7 +36,7 @@
 # THE POSSIBILITY OF SUCH DAMAGE.
 #
 
-objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
+objs-y := ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
 objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
index 0976f894..4b4165bb 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -56,7 +56,7 @@ endef
 
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/lib.a
+		   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
 	$(call if_changed,ld)
 
 $(obj)/%.bin: $(obj)/%-linked.o
diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
index 0976f894..6d5df339 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -56,7 +56,7 @@ endef
 
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/lib.a
+                   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
 	$(call if_changed,ld)
 
 $(obj)/%.bin: $(obj)/%-linked.o
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 40d3eba2..74e38b5a 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -42,7 +42,7 @@ always := lib.a lib32.a
 
 TARGETS := cpu-features.o excp.o header-common.o irq.o ioapic.o printk.o
 TARGETS += setup.o uart.o
-TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o ../test.o
+TARGETS += ../alloc.o ../pci.o ../cmdline.o ../setup.o ../test.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
 TARGETS_64_ONLY := mem.o pci.o smp.o timing.o header-64.o
diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
index 6190315b..754dc426 100644
--- a/inmates/lib/x86/Makefile.lib
+++ b/inmates/lib/x86/Makefile.lib
@@ -55,7 +55,8 @@ endef
 # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
+		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) \
+		   $(BAREMETAL_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
 	$(call if_changed,ld)
 
 $(obj)/%.bin: $(obj)/%-linked.o
diff --git a/libbaremetal/Makefile b/libbaremetal/Makefile
new file mode 100644
index 00000000..f36a2d09
--- /dev/null
+++ b/libbaremetal/Makefile
@@ -0,0 +1,46 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+-include $(GEN_CONFIG_MK)
+
+BAREMETAL_LIB := $(src)/$(SRCARCH)
+export BAREMETAL_LIB
+
+INCLUDES := -I$(BAREMETAL_LIB) \
+	    -I$(src)/../include/arch/$(SRCARCH) \
+	    -I$(src)/include \
+	    -I$(src)/../include
+
+ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
+INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
+INCLUDES += -I$(src)/arm-common/include
+endif
+
+LINUXINCLUDE  := $(INCLUDES)
+KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
+KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
+		 -Wmissing-declarations -Wmissing-prototypes \
+		 -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
+		 -fno-common -fno-stack-protector -ffreestanding \
+		 -ffunction-sections \
+		 -D__LINUX_COMPILER_TYPES_H
+ifneq ($(wildcard $(INC_CONFIG_H)),)
+KBUILD_CFLAGS += -include $(INC_CONFIG_H)
+endif
+
+OBJCOPYFLAGS := -O binary
+# prior to 4.19
+LDFLAGS += --gc-sections -T
+# since 4.19
+KBUILD_LDFLAGS += --gc-sections -T
+
+subdir-y := $(SRCARCH)
diff --git a/libbaremetal/arm-common/Makefile.lib b/libbaremetal/arm-common/Makefile.lib
new file mode 100644
index 00000000..7b650a44
--- /dev/null
+++ b/libbaremetal/arm-common/Makefile.lib
@@ -0,0 +1,41 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) OTH Regensburg, 2016
+#
+# Authors:
+#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+objs-y := ../string.o
+
+common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/libbaremetal/arm/Makefile b/libbaremetal/arm/Makefile
new file mode 100644
index 00000000..952b1475
--- /dev/null
+++ b/libbaremetal/arm/Makefile
@@ -0,0 +1,44 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2015, 2016
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+include $(INMATES_LIB)/Makefile.lib
+include $(INMATES_LIB)/../arm-common/Makefile.lib
+
+always := lib.a
+
+lib-y := $(common-objs-y)
diff --git a/libbaremetal/arm/Makefile.lib b/libbaremetal/arm/Makefile.lib
new file mode 100644
index 00000000..0976f894
--- /dev/null
+++ b/libbaremetal/arm/Makefile.lib
@@ -0,0 +1,63 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) ARM Limited, 2014
+# Copyright (c) Siemens AG, 2014
+#
+# Authors:
+#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+-include $(GEN_CONFIG_MK)
+
+LINUXINCLUDE += -I$(INMATES_LIB)/include
+LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
+
+define DECLARE_TARGETS =
+ _TARGETS = $(1)
+ always := $$(_TARGETS)
+ # $(NAME-y) NAME-linked.o NAME.bin
+ targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
+            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
+endef
+
+# prevent deleting intermediate files which would cause rebuilds
+.SECONDARY: $(addprefix $(obj)/,$(targets))
+
+.SECONDEXPANSION:
+$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
+		   $(INMATES_LIB)/lib.a
+	$(call if_changed,ld)
+
+$(obj)/%.bin: $(obj)/%-linked.o
+	$(call if_changed,objcopy)
diff --git a/libbaremetal/arm64/Makefile b/libbaremetal/arm64/Makefile
new file mode 100644
index 00000000..6d3cf399
--- /dev/null
+++ b/libbaremetal/arm64/Makefile
@@ -0,0 +1,44 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2015
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+include $(BAREMETAL_LIB)/Makefile.lib
+include $(BAREMETAL_LIB)/../arm-common/Makefile.lib
+
+always := lib.a
+
+lib-y := $(common-objs-y)
diff --git a/libbaremetal/arm64/Makefile.lib b/libbaremetal/arm64/Makefile.lib
new file mode 100644
index 00000000..c4560721
--- /dev/null
+++ b/libbaremetal/arm64/Makefile.lib
@@ -0,0 +1,63 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) ARM Limited, 2014
+# Copyright (c) Siemens AG, 2014
+#
+# Authors:
+#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+-include $(GEN_CONFIG_MK)
+
+LINUXINCLUDE += -I$(INMATES_LIB)/include
+LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
+
+define DECLARE_TARGETS =
+ _TARGETS = $(1)
+ always := $$(_TARGETS)
+ # $(NAME-y) NAME-linked.o NAME.bin
+ targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
+            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
+endef
+
+# prevent deleting intermediate files which would cause rebuilds
+.SECONDARY: $(addprefix $(obj)/,$(targets))
+
+.SECONDEXPANSION:
+$(obj)/%-linked.o: $$(addprefix $$(obj)/,$$($$*-y)) \
+		   $(INMATES_LIB)/lib.a
+	$(call if_changed,ld)
+
+$(obj)/%.bin: $(obj)/%-linked.o
+	$(call if_changed,objcopy)
diff --git a/inmates/lib/string.c b/libbaremetal/string.c
similarity index 100%
rename from inmates/lib/string.c
rename to libbaremetal/string.c
diff --git a/libbaremetal/x86/Makefile b/libbaremetal/x86/Makefile
new file mode 100644
index 00000000..e4e72b5b
--- /dev/null
+++ b/libbaremetal/x86/Makefile
@@ -0,0 +1,66 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2015, 2016
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+include $(INMATES_LIB)/Makefile.lib
+
+always := lib.a lib32.a
+
+TARGETS := += ../string.o
+
+lib-y := $(TARGETS) $(TARGETS_64_ONLY)
+lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
+
+quiet_cmd_link_archive32 = AR      $@
+cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
+
+$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
+	$(call if_changed,link_archive32)
+
+targets += $(lib32-y)
+
+# Code of this object is called before SSE/AVX extensions are available. Ensure
+# that the compiler won't generate unsupported instructions for this file.
+CFLAGS_cpu-features.o += -mno-sse
+
+$(obj)/%-32.o: c_flags += -m32
+$(obj)/%-32.o: $(src)/%.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/%-32.o: a_flags += -m32
+$(obj)/%-32.o: $(src)/%.S FORCE
+	$(call if_changed_rule,as_o_S)
diff --git a/libbaremetal/x86/Makefile.lib b/libbaremetal/x86/Makefile.lib
new file mode 100644
index 00000000..6190315b
--- /dev/null
+++ b/libbaremetal/x86/Makefile.lib
@@ -0,0 +1,69 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013, 2014
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+-include $(GEN_CONFIG_MK)
+
+KBUILD_CFLAGS += -m64 -mno-red-zone
+LINUXINCLUDE += -I$(INMATES_LIB)/include
+
+define DECLARE_TARGETS =
+ _TARGETS = $(1)
+ always := $$(_TARGETS)
+ # $(NAME-y) NAME-linked.o NAME.bin
+ targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
+            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
+endef
+
+# prevent deleting intermediate files which would cause rebuilds
+.SECONDARY: $(addprefix $(obj)/,$(targets))
+
+# obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
+.SECONDEXPANSION:
+$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
+		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
+	$(call if_changed,ld)
+
+$(obj)/%.bin: $(obj)/%-linked.o
+	$(call if_changed,objcopy)
+
+# 32-bit (i386) support
+define DECLARE_32_BIT =
+ CFLAGS_$(1).o := -m32 -msse
+ LDFLAGS_$(1)-linked.o := /dev/null -m elf_i386 -T
+ $(1)_32 := y
+endef
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-7-peng.fan%40nxp.com.
