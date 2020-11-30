Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBSNPSL7AKGQEFKZOPBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F52C7E4D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 07:57:13 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id w17sf7866843wrp.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Nov 2020 22:57:13 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606719433; cv=pass;
        d=google.com; s=arc-20160816;
        b=kt3gakglyVrOrVOcoRXaXLYA++vuui9nq+yG3ZnWI7lQ4aCIaRulALXNqfd9lAJxhf
         kA0dJalJkj93YzQvjvxS0QRrRJRPpgBlB5GitDlnRwa635PMK9LbS9nomZGWcx0uGqwV
         j0PHWZNg0VCBf6MQhUvb1ZW2YxByPuPXwsqSBdSJPlC76ZNVo/e1laAso9N1AyxgipcA
         4JLOvS7g7meJtyiMKFuZdRE/uErq1ijJEXGGulvZoKUdzsEyV7S/YDcoUBtTryNKbc2C
         JDKhvhbCcmRQ9GaiiCcjT/iQCsvT8pyenuogb2oMxH+zuX5yaFtoYrmBMPjPPt9VEwqj
         d7Qg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/nqMVjtR7lBx0dIef1nHL+B0V+x/SsW5wrC8/1MTGpA=;
        b=JsnWBEak+TdRMjBtpH7APWKfvxaGqeOcTGbURg4lLjwAaG2du5/p5G0deXu7rjlYDm
         JvaaD7EQTj8PAp17rUmPRQbqVuyCY0hoUX5QFU7D2XVTzGHu99Qu/L+mhd4azEyXC1tA
         opcyj+wSYR5xzFSCs1ImucsK00X6nZitqWbS1DII/0NFpssiT1xd9mreUBK4BXhpX+LE
         IITZmTycORqhFpezK1tRTYlXamnGY+BVX6vzyE/fvu2Se0AgssjHDJ7h4dmmCwa4C64J
         i/NDAFmRFOmJcXN/0CgF2Kf10C4ab2WRatbyN3jZqayXUThaMJWBI9kLKihcIeJ1cj7T
         xTcw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YXCpGc5X;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.44 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/nqMVjtR7lBx0dIef1nHL+B0V+x/SsW5wrC8/1MTGpA=;
        b=NKBphheHU4gHLQPXkeO4cXZ89pPUcHcI20aqGg8YTRXVadWQNkI+odAjqmjzz5ISt2
         AEPahLpwDE/dQAaqaBT1ournBP3PGFtD3hX+cqOl2DKBJOGF4St4mPSGVX/kJZgxgnqH
         pGIAUrrxyjjtZPYSdz2pix8feW4kDcrlO3Uu6pUO1iYhVTTliP33z56Yapr38WNo+nBa
         NVmHReI6qvGT1evDR4o258XcW3IF1cTT0LE1iBzBoJQM3RDuFqk3ApnXj3VpSC4UfdCa
         /OC5n/TFql+m+fUUbKiwA/vCQy4Uh/wSRuJlnBhjoZfCCg3D1anOtkgfAxEnrQcc9Pr6
         4nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/nqMVjtR7lBx0dIef1nHL+B0V+x/SsW5wrC8/1MTGpA=;
        b=l70Bs0YX2ZwCv7JqBnJNV/aZ9XZKsVsyXAK9OjmkyauOqRyfJheKzvDIhxy8kEFYi6
         Me+Xm+Qr9WDbp84qEY7yMw80VKdxfUjXTiL8g5algEVNM3412xogJwQY1O4hfeIriIRz
         wqmxVbBf/0p0QFJq6pUcol+NjXfKoU1vsuW/CsbNfwmgUUFGojIySuO5xktwIVnk/kzG
         LkhGVlMB2ra7j8ExzSJ3z0eeSeHs1O0nUAaBAWkv4qjpgwLIpHHa8C/9p8RF6saaAUNA
         ReXdm3L12vnT2WSqDlbDhrNP5g3/0KE3G7F+4pJddKEkURWtg+41SzQKWmDDj3FWOl4q
         3rkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532q9zfRMdX29OKDcz2t1I4kC91CWni8fnv052mDbslZwb1F1WbG
	pLNXo6PslP6HXWx/OqGHmdQ=
X-Google-Smtp-Source: ABdhPJzFkQDG93lKxE5mgIV/RDXp+kUUmPM80nKnICR21B4NeEgknyxNjb4WhYW8rgqE6MjsyihOsA==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr21896924wmc.86.1606719433426;
        Sun, 29 Nov 2020 22:57:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls8018339wrc.2.gmail; Sun, 29 Nov
 2020 22:57:12 -0800 (PST)
X-Received: by 2002:adf:f651:: with SMTP id x17mr25734928wrp.185.1606719432531;
        Sun, 29 Nov 2020 22:57:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606719432; cv=pass;
        d=google.com; s=arc-20160816;
        b=kJ+0BhVffoeYvuA1Bssb9MqTi08GyyZTR82CNYusuQcI5Bgt02mKHEHUi1uyqdQlbE
         X8bedhCUJXh56Q2vvXXBiLPF8HboPQgOgD4KFXff8hsiXtoGfDYL5Xb/PrDTkoQChUny
         M8pdu3Uwo+FuO5tY9jwV3BEjU/xNQZ4NjzjbpbhG+hIkywZEA+som4x+6kzLuyawe4D9
         KWhGlz1pRJs3RF8th44BJt5OOF4f3eok2PWo+BCqTVKCi44oBdthWTcXnDHArbQwthb3
         3JngkVM0Joh2Y3BsM3yDOrxUzktC8VuexXjh9IC6yvJ36mHBWCEQLqftk2UbosXJo7tn
         /Qhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cEolFnUN/t+wEEkqvrOkRxcHa27Zt3g8edVMbne8uFY=;
        b=QhTS8mhipeYKSck0h919XHrY1HqCPmhP6ZQmctRuiCqHmBmGleLsukDyaXq2aMifUG
         /mgANdIQBqaVKx9lb2Nb0J8UXCBjGRVllx02ridfMdRTSt0qVeHFdgef6suvnflRe+/M
         JBHOOlHMy2Y7lo+7APVrgLGcn3GlqjSpTg74F118Fz5LD5RyUhXopYCTFVWWSafAyTJv
         WzhKJSzYjpB/0PSBdM/1DV7Gni5cG3eF/oTBe8NfEq1EPivp6PfmedScqDQ3U7mIgwsB
         PkVOWDKCW2Sw3k5NcyB3bN9k8tjgvyhukK5N428v42wuGdOzV810u/veSPstk5h0lupx
         b91g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YXCpGc5X;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.44 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70044.outbound.protection.outlook.com. [40.107.7.44])
        by gmr-mx.google.com with ESMTPS id 6si352634wrg.2.2020.11.29.22.57.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Nov 2020 22:57:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.44 as permitted sender) client-ip=40.107.7.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOI9HrlOh1v/vHifQQZ0P4rHjVfcxX/cFACzp95o2PtYQuPhcch7imrqOXk6jPbk2heghaPE5OLv0TFXNj75Zbo2ZI3s7QIrxMGahEnhKqze9dwdcpVxZrog5iJlCg2D2Lt+XQbzPfCmTnUF/CSiDopQeuPavApv5SEXeydRCTHuwwUT4Tv7f0N7QMPbh3dB/OBOmuiGyyFrDAWr3Kr8gyKKBey//6SyadoYyf3ih5V+nPng+qoHDPt5UrhsQHuyaBkl2DpJhA4SJtdR4jgfR5vUqIPBnHlcHy2nFjUfY6WtpMreRh1g1uKukqjE8qdLl/e3Wz8VPhpbMzS4enSr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEolFnUN/t+wEEkqvrOkRxcHa27Zt3g8edVMbne8uFY=;
 b=ZdnCwHsJ3Xq4VaGX4k00nBCDT7L4B4QSTqs+fnpD1U0Z71ACK3Hxgu3ad5P30kflcptFdhKQ+Djyx6vdyFP/heYJZ93XC1I+xPkqieWQRpMEtmRbbj2waYiKf2JLTvY8XN2fmiPsbWn1/LW0/HZ6Wz6pYxMkO2+syCgoRUw/z9Wcn6GKrjt2Os69I7HR38F6n+3eQD/mWqGITV+ywAtuoM6/m9RQ4Wd8kpTdknV85JQSp218uCRDMrabouunVy6cAQaZE1UMneOxIUkquVoqTnh4lpgpo5fKOBChi+0AXUp+F6700OzbpgyCqTkOV0u+x7cfprzXZTyo46XbQCqS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
 by AM0PR04MB4386.eurprd04.prod.outlook.com (2603:10a6:208:7b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 06:57:10 +0000
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795]) by AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795%2]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 06:57:10 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH] configs: add ls1046ardb linux demo
Date: Mon, 30 Nov 2020 15:05:15 +0800
Message-Id: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend Transport; Mon, 30 Nov 2020 06:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae798dab-aa08-42ce-60b8-08d894fd2891
X-MS-TrafficTypeDiagnostic: AM0PR04MB4386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB43860222C0D865EDBED0F03C8AF50@AM0PR04MB4386.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGHUWG8r1Xw+yWJ1odsKPeCOhfI44x0LwGUQzaI5/MpGSFwXOZHIYpFhI56XTBZ+6jGGQyFW7cFf9WliQYNL3HF0G4W1edR+3VrY7+Fx0GdjYZ8hcBqOJ3opa6QxfuebBkRzoFP4KyXwlglJHOfnV3UQhIprxnuOdqMlg6Yp976HQgA/PL9vxKMPa6+bXEgKMMSITdu1Hhe8/4IOt1vYWvEjBt5aJ+Ek92LaZvLBR1vbwtOTFDcwMmonQdhPRmSSAAnTFN42iPHuKmwHdLq+ykC5KgvH5axrvIqqTl2b+QSSGvRqbBaV7jXZQbI538Iq4dIWZ+Tq7vFb1IbsJocsXUxszfiHirOvYizegQyOyo4OQXMmd2kjKAIla/u5qE/A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4772.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(6666004)(16526019)(83380400001)(186003)(26005)(316002)(6512007)(478600001)(4326008)(6506007)(36756003)(8676002)(66476007)(66556008)(8936002)(52116002)(66946007)(2906002)(1076003)(86362001)(69590400008)(2616005)(6916009)(30864003)(6486002)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pOnCCONeoR7ltv5jyeh8m1GVqqUbPS3CZixv+caTNPLS+ipFlm9h++5Vw5cB?=
 =?us-ascii?Q?YfqNJfu4h+6hzk+LFD0rUiR+sM1cyvkVVtp1IFaMlaUoOGgQeBAB0jX2jfxv?=
 =?us-ascii?Q?goIX5TdhXJ3+1mYLqqpjFEtaEinBgzXg6fbSr0E9AvamSNaO47AeFjKxeL6T?=
 =?us-ascii?Q?rLNoICrP08KgiQp0fl8N3dLBaQ/QoSFv4clvl/gXr5HCfIdhbO1yar+f3vLW?=
 =?us-ascii?Q?uue6cXtakOyNGDfxl0i2PbW6FRJD1Q6OVpY3C+sh5GQ8JeduJxsqqiQKcydq?=
 =?us-ascii?Q?iyMKWhPc5BUmw9sk7oqWtavLlRTzq4PTLhQkiGTcK+B87OLAHG7hj406HUWD?=
 =?us-ascii?Q?ae1m454tE8Ayt5E63/NKa5Am/vf25ssGZwz+hpdwgl5knmbFVNGcVzc27Vdo?=
 =?us-ascii?Q?uoMAzMyjRywpL7BBWHhIFItR3jOQet0+nuHidr+YDu8AtKzeqvZ0UKCl1u3x?=
 =?us-ascii?Q?PkmkZHalzHTxwP/be9A1v9yhNDX0rGTms8/I4gVqoh4kqMotXHiovwO5UUfh?=
 =?us-ascii?Q?lpAbUiKhmLV/SmYEEj5uUZCxbadCA0WjBu/C8uocSefn8L8raZ/czrOLEriu?=
 =?us-ascii?Q?bZ3PBKzA3eyuKDC0uimkV3cEckBQ5cYR+0rElDe/kN4ENCMICZPGQmHI+R0b?=
 =?us-ascii?Q?SHv7tYdTs8QLIN3cE67ChwRtRcG1W/nT7Ov2E+LJ+DqIM37wZJ1nfJw/XWVA?=
 =?us-ascii?Q?Bzv3iPjq0ndrfqHopLXVx6q2Q/X0bcZMYdW0Wm6Yg1WtfLUh9xOdCs6d/AWC?=
 =?us-ascii?Q?19Orf43vn7B1fNQr2efRIqEr31yZLXdCwriZPRDJLWclkS3PCgKTEPIMRwZ/?=
 =?us-ascii?Q?Vxj9ThzQcZzepEwHpGku0wNwUMs5ALqWiox1YLez3ej8nXa7zicR0B4Ju15R?=
 =?us-ascii?Q?LwhNLGZY1JajWBIswBUEQLUPAnORWQsXEMei6r2n5JrkzNTkyPb4HDV77F4/?=
 =?us-ascii?Q?GiEPxA8zGYd2PK8nWH75At/TRfl+K3YULydFxjlCvE94KAcVNc9GU1zhZSIJ?=
 =?us-ascii?Q?Dx1b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae798dab-aa08-42ce-60b8-08d894fd2891
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4772.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 06:57:10.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onKpi8/r2ec3z0SNmNTFIaheBwRMSj7K0EcYyA92mvtpUaUIoQLf7TXS4AdoeBKa1aRTTmTx8YE57z92Inuk3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4386
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=YXCpGc5X;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.7.44 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
configure files for NXP ls1046a RDB platform.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
 configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++
 configs/arm64/ls1046a-rdb-linux-demo.c   | 165 ++++++++
 configs/arm64/ls1046a-rdb.c              | 517 +++++++++++++++++++++++
 4 files changed, 891 insertions(+)
 create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb.c

diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
new file mode 100644
index 00000000..0f4f2395
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -0,0 +1,67 @@
+/*
+ * ls1046a RDB - inmate demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 2GB DRAM1 Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
new file mode 100644
index 00000000..907ba1f1
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
@@ -0,0 +1,142 @@
+/*
+ * ls1046a RDB - ivshmem demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
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
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "ivshmem-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			//.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			//.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+			//	JAILHOUSE_MEM_ROOTSHARED,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
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
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
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
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+
+};
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
new file mode 100644
index 00000000..c8f699bb
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
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
+	struct jailhouse_memory mem_regions[16];
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
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
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
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
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
+				1 << (60 -32)  | 1 << (61 - 32) |
+					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
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
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
new file mode 100644
index 00000000..3eb58005
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb.c
@@ -0,0 +1,517 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[64];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfba00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x21c0500, /* Uart0 in DUART1 */
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfb500000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x1410000,
+				.gicc_base = 0x142f000,
+				.gich_base = 0x1440000,
+				.gicv_base = 0x146f000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1046a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 67 - 32, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
+		/* RAM - 1GB at DRAM1 region - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 6GB */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x180000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: Inmate */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: loader */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size =	          0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IFC */ {
+			.phys_start = 0x01530000,
+			.virt_start = 0x01530000,
+			.size =	         0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* QSPI */ {
+			.phys_start = 0x01550000,
+			.virt_start = 0x01550000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x01560000,
+			.virt_start = 0x01560000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* scfg */ {
+			.phys_start = 0x01570000,
+			.virt_start = 0x01570000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x01700000,
+			.virt_start = 0x01700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
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
+                /* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* rcpm */ {
+			.phys_start = 0x01ee2000,
+			.virt_start = 0x01ee2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f00000,
+			.virt_start = 0x01f00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi */ {
+			.phys_start = 0x02100000,
+			.virt_start = 0x02100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c2 */ {
+			.phys_start = 0x021a0000,
+			.virt_start = 0x021a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c3 */ {
+			.phys_start = 0x021b0000,
+			.virt_start = 0x021b0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart1 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart2 */ {
+			.phys_start = 0x021d0000,
+			.virt_start = 0x021d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio0 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02330000,
+			.virt_start = 0x02330000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart0 */ {
+			.phys_start = 0x02950000,
+			.virt_start = 0x02950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02960000,
+			.virt_start = 0x02960000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02970000,
+			.virt_start = 0x02970000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02980000,
+			.virt_start = 0x02980000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x02990000,
+			.virt_start = 0x02990000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x029a0000,
+			.virt_start = 0x029a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x02ad0000,
+			.virt_start = 0x02ad0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x02c00000,
+			.virt_start = 0x02c00000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x02f00000,
+			.virt_start = 0x02f00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03000000,
+			.virt_start = 0x03000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb2 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi1 */ {
+			.phys_start = 0x01580000,
+			.virt_start = 0x01580000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi2 */ {
+			.phys_start = 0x01590000,
+			.virt_start = 0x01590000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi3 */ {
+			.phys_start = 0x015a0000,
+			.virt_start = 0x015a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie0 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03600000,
+			.virt_start = 0x03600000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x036c0000,
+			.virt_start = 0x036c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 0 */ {
+			.phys_start = 0x4000000000,
+			.virt_start = 0x4000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 1 */ {
+			.phys_start = 0x4800000000,
+			.virt_start = 0x4800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 2 */ {
+			.phys_start = 0x5000000000,
+			.virt_start = 0x5000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
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
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201130070515.21504-1-Jiafei.Pan%40nxp.com.
