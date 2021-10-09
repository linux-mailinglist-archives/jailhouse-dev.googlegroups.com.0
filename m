Return-Path: <jailhouse-dev+bncBAABBE6ZQOFQMGQE7CYW7LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D61427558
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Oct 2021 03:12:52 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id t26-20020a9d749a000000b00547047a5594sf6497130otk.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Oct 2021 18:12:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1633741971; cv=pass;
        d=google.com; s=arc-20160816;
        b=tAC4Mvv7mLggEDTOGaFCRXP70mW8+dXdA6MBkuHVP+CDDZffY+9D+Q9eHPgapcXN7c
         aCaaRkXKlCgBFh2uftsr1pJPDHeXylJ/FEyk99uG06Oj0Gu9vzDq1P/6y94QcbhF/m6X
         A3f/EQroyK6K2DxEcQXga/1C9W0gvTnMFASW4dk2gxSob3DJYNrYXFjQq2m5NhEqz1YH
         QZE28CDPK/B4Q1eYhgZG9HFfFYz2zBn5nu7+lVHI1QXPaU6BwU/U/uhU8grpYe1Mfm/9
         5i14nbVvFZ/k7+vnv+wIJvS+wMkXUX4FIZBzixPbvv0JpyukVRYRmvKTWxaH5u9Sz/oF
         Axkg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZTpkXVCJZctw49ZbTWGi9TLmDkbWx+7wboVZTHX56ZA=;
        b=vRMXrh37IuRkNV9Etaw2AMql5WvLPlQ39f87iTBWINTMoa75/Hbmr7pJM56ULGxOjs
         yhux57huKzcJTgp71q1fAHeHZTTJ9fQCR7UQCocrx6TeVpObgkiZlz0ZN2tKyOaqnyCM
         GhH+wD3gbhv3vgrAm7U073PtFhz953Z44CR/aUAJglcGAyc15W2OKgPFQTRLl1oi4Lhs
         gUY8BlrdidGnN8h9obZ43PEnxHCyCZs0/kOnlhWOfwuIePfIoXR9wJPbIWGe9+WYGygh
         oJNEUJClne7Aj8MB+HGB9c79txzFRturKMiVKswYZY8yoo4iWsYYWDsrI9ISp85sCsSP
         hYXg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=DpzjYvya;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.56 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZTpkXVCJZctw49ZbTWGi9TLmDkbWx+7wboVZTHX56ZA=;
        b=Vp7tiVOXPt/fjfpajTqPM/FqD1FMBeDz0wanqzHt0TZV+jmjZWEe63QgOUaWZqpMGX
         498UNAyGw/VvHYZAZw7JYDHqw+Jr5OOPgz8GA+v4YeuQ3YPZe7oabiVlBLaxwnu1Kjsj
         aQ+zhgcS4h2L4tDUdIPZFEG7QfwpI8A5NRBfVehtx7rwFJVS+gsU0A/fvPGGbiZWq8d6
         949y+syng3vFuDsHcWDwEirx32snt98N533CGpUV6L+6tPaiVwpP2AYq30pU50PLb+rM
         J0T1L76zjs0ll9Til852MaLeGgCJKIVAmpELVKUWle/bG2YfWvYKuHcsB61EspZZHcdz
         B1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZTpkXVCJZctw49ZbTWGi9TLmDkbWx+7wboVZTHX56ZA=;
        b=ryvFh83ta7Oj6Zizv61jg8LH26YLuBJ1WDxHFZaGvYDi/p4C+zaljYGTS0voOOzeVP
         RiDiZu10lLUa569PylyTbN4W+ZfO2OJG9DSRI0ao1XM8eR9M9/UdPi7C+sgPPCDxwAwX
         xvwnjN3y83kJadd0hMIWNM7gIs0htxlhc0Rknc8LUZfiCGVBzLzFIinBS4S5lh639bMp
         6TlOzfdJJTOHSod+TVDhL3Dq2wFUX0xBkc+rG4irSdVwgb5ZUlcf3Qjedl8AK2OfgdkM
         /4yGSpRKfuKdEJjx2VTvLPoU1ohYQp4IWk3l9lPMzoLsmyJLsHQGThJJH8Y/0BSAboc+
         NE+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326WBzgWPygT1AnuAGIWjW9ZKCzmRZgAWsEnOQEwZ5UHO5rKq9Q
	zFN5g/+GYgHRJzFyE5LR52I=
X-Google-Smtp-Source: ABdhPJwLoYyhuhf4ZPbgdxlOP1O5RvRPV9WuAbMliFfoUItzx2PApgjVDrLBobgZSyN5UAEW3Lw0Vg==
X-Received: by 2002:a9d:1ab:: with SMTP id e40mr1956794ote.281.1633741971378;
        Fri, 08 Oct 2021 18:12:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:318b:: with SMTP id x133ls1438369oix.1.gmail; Fri, 08
 Oct 2021 18:12:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1889:: with SMTP id bi9mr10859429oib.164.1633741970710;
        Fri, 08 Oct 2021 18:12:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633741970; cv=pass;
        d=google.com; s=arc-20160816;
        b=vcXFT/5nx8zOoChdDD9SvsvGcP23q1tlyRWvvnnBuaDPR+bAV/P3Ig/q6i35I/1Ylj
         +Lr+QbR0XRFeHjeP7ffiJUYRQkycx0f1d7D0GT9XUPCdk+2PuDacDYCqYVKJ2UQ1ZI0w
         dd7O1cXa0lHWgXb4Xns7UgsRtibJPxQrRUlZYq1cQJIGEr6RP3v922/v+Tz4sg8rJ0x1
         YJPJh/jT+gQlY5GbCTUczSkbfH3vIPboOJ8wEK+5tu2+jTkiP3SurZd9Juw1HtPPk9ej
         aOM65WELX5vDXwsyQmKC61X4k/Oh7DjEk7UYYdVAyeLM2LjtVZlGX3WVZZrpt2UyIbhG
         XlWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TrDzyeEQm8/GaxLSFaon3rrbeUdG39aMj3z5oEt48XU=;
        b=mS/4L3sS8uptYieFb6Z60j7IrxYt3vu1E7qGklDbfyNBZFxx6BVzsG79ThiOOsCkPs
         OexBa0rdT1Vsz5bJECuMoWzpg9s6YgeFtKBi0S3LNXV5g46QgP/rKzb5FPlCFryQs/32
         4iZ4NIFIJWJV2w5+vASAx/EFf7Yd7dmhldCyP2+lvisoPYT7/iTV2pzvLIKRynjuPhnh
         HZCyWChU7U+50Yt/ef0SgJ4ytVpwFMJ7UCnZQJiYrO6JEncIvtIY/WXGk+aIIcpIHxYJ
         JvsVWaU2TT0GdjW9sPyLzd35OVrizvX9zjNFQ7qB93Awte+/R0l7Kkjg05l+YZfphPwW
         mXNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=DpzjYvya;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.56 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60056.outbound.protection.outlook.com. [40.107.6.56])
        by gmr-mx.google.com with ESMTPS id bj8si184625oib.1.2021.10.08.18.12.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 18:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.56 as permitted sender) client-ip=40.107.6.56;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e52tnPcuL6x3aS2PmSvupKlnNFgka1bsLG+qJ2b499mR+nMuCX7+iHHS0Vb/87iyPQhYPRHf7V7mSDBhPKyPGtQnpTDf0TJbVXtW3ff9deSDZ4AAodkW2N9Bk9GQgSp5NZycbX4VYzvA9SJMJFpF3rDzwiMw1ppq57MM38oi/yBIczfOAn9oAqNEq2gBeNuzdfq7lOvwkaJZFObPP/2BmGlu3mhTpzB7cifgZiP4RsRVAG3rh8s1oAV7QrQZkpSDH31gSCfnP1y5ukJNYGCH2JhB3Kx3cEvEORg1ajyzYdlWMUnJmElpvQtBvEW8L+u3iGe1UjEFcnetBfspjMVCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrDzyeEQm8/GaxLSFaon3rrbeUdG39aMj3z5oEt48XU=;
 b=ZTi7DteROW05sNn58DK3A+ikj4dXHIjhov4aCh3WHvIC0A5rYnOUHcFKPDu/LZQRvBOyndnfSx7wlpnL93sufG5rVwzz5wVM1JI5vz/Qv2Yw67ZoIXUnUFZwjexCYzIUjP2B1hf5SpMtIrxjbT67/OZnDGCSY+Pxl4moCBXGPil6hClKU/PamXwgRcwvQHefzwoTPC2cwUuyQSF0eXtJLbzPeCbN4oO8g0A24t5Ck9tzLvFD4ExQcx672sVEwxsd55S0tJQySQjWwjJ2jVPVhkCYZrjL6f+UjHbrdY9GGD5uk6xMuXkxBX3DWg0m+kYk5DtobqkayeqvMFz7ApIMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 01:12:48 +0000
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a]) by DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a%9]) with mapi id 15.20.4587.019; Sat, 9 Oct 2021
 01:12:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Stephane Viau <stephane.viau@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/3] Documentation: Add available NXP UART devices
Date: Sat,  9 Oct 2021 09:11:38 +0800
Message-Id: <20211009011138.469592-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009011138.469592-1-peng.fan@oss.nxp.com>
References: <20211009011138.469592-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0099.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::25) To DU2PR04MB9020.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0099.apcprd01.prod.exchangelabs.com (2603:1096:3:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend Transport; Sat, 9 Oct 2021 01:12:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb75fce-36e3-4390-813d-08d98ac1e869
X-MS-TrafficTypeDiagnostic: DU2PR04MB8967:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB89677BBAE87B7E5FF53BF041C9B39@DU2PR04MB8967.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2JXlX/y7ElL0dIVdIuu6b5K0Jm7DkhPJZWMUiV6yxI1TExnZM/clIERdUyoDu/X30OsQesG79MJf5pr0SS/GNgCSQ4FzGquMEIHVixZ2pUaW/enTZzTXVxmRGh1svHxUbDpolpEKlg4bdaWQMgt/xHIYUEMiCqt7yRI5hORAmEbwZyyfix41aYTi/LTfL5gppjttTVVwhmO+StLbZ6kj7JnymlEZE9jrNY3NZEIDOmC7WRGLFzqwlnHJOiF29Q+gR6R9vynvgek6JKChM2QtY0rizw5y3o6B4bOVztMQXxL2FqxlHE0HT8oWx70WHSbkyvrMXA+YXVC3ogGWjanfrTwcU4olsL9xrikyQcPvmRvVoy/rR37ePSO9+DKS+jqswkGuSSKwomFqXH5Us/OjXZ0t1ZYLLxM3zdEI9n0Y8jZ6DrnwAa7cHNP0ZCT6bPCYdNFQKjS8j+boCC7x2/vIeldkqm8Sm683IIu9blHM4MDHjTWObQ8d+IDSLg0cKup2+bkwR3naR3GkOFtzSZs/Vwe4CF0YQzCsKb0l39Bsh1t1Jr3Kj0eABbxBb/p0hnd/opnR5tSAPF0QMtDbJnEVodJVBevS3dHMRndB/R1m5XO0fWI5wk97o1Pxq2DJ4VbnyUu85hM4WkPUN+8goqrO7p07XSOi9zH8r0WY5rraUXjR601ZYOEOxMoq01M9JcNC09csA1giAP35MXfMWPA6Mb97Eqa7ZJbdxP/g4rquLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9020.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6512007)(1076003)(66946007)(8936002)(8676002)(4326008)(6916009)(2616005)(956004)(54906003)(66476007)(38350700002)(66556008)(38100700002)(6666004)(5660300002)(186003)(83380400001)(26005)(6506007)(508600001)(86362001)(6486002)(52116002)(2906002)(131093003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CWmgqjRFWE58SVvmafNrp5vjdXl1cNgybStzX/mC7Em9HxOBq/yn1bNLxk/8?=
 =?us-ascii?Q?OrsPqIYsaUeiyMvfywrlNn1qnoxv19ISugR+cwSPVyQVCoj3HJpQHC/VQ2iM?=
 =?us-ascii?Q?1glkKz6rJWhJ+Hg7kcO46RoDo/G2MuofywVOHzpCK/K4Tw3CRaxXQrgjYsJ3?=
 =?us-ascii?Q?uz8gpdpiiFGQX1ZqTnNtEPyBu+wgewjH6pBtAZP4o9zL3+R9TS5VC4U1JPgv?=
 =?us-ascii?Q?q2suws/VFLHeejMFVgkRgHG23Uf3+3CXiOiQ5vKtrhOgN/LM4T94bRfD97td?=
 =?us-ascii?Q?PI8QihdZCc0n48SC0vMAU8fbS+ZKM8qehXh5LMeKQFuHifRLnS12V2oRKS7C?=
 =?us-ascii?Q?BibIACSI/Rejc860WiNm+9WMEEWP42oJwm+hAeclqIslnpnUqF0y1EqdOTqS?=
 =?us-ascii?Q?8GqZJc5alN1W3yH/mpnGXfw0ZZLugvkruyxNz5oj2sxYb7EJHulwe03v746t?=
 =?us-ascii?Q?g6ZBpz0XQOjAxyGESGNimNUd7L5ICM5stM0pyub/gqKEglyUe//VQadyPwy3?=
 =?us-ascii?Q?2q+ryrMFuEVMEXFCVCnDWJOnugj9Nqntx0+1kfKq8U1JloW4zfyQ1jDNsDL0?=
 =?us-ascii?Q?/1aGTLkTq7KnPmpPs1NOFvTCQ9GUkjA2er4EWIWnaRzVvSMXuIh/tZXcCxCJ?=
 =?us-ascii?Q?2Q7T5TXPAuvIu3WfEAoJA0g0pezeXOKbA7RNlHvb9/nxZGUnjf2hbyMD1azz?=
 =?us-ascii?Q?feZIs9bbuekm7Sbw06HttUWbLBYLKxDRKuVTg5EoAfFp0zbQXYtvW229Uhs6?=
 =?us-ascii?Q?Foi1byYBJFgxaMogcGePS4p0I2/gpznRJphhD48YDvHO83Q+zHIWiRBuI8ht?=
 =?us-ascii?Q?j792MoPVFQxkWRTzKqwp2iTxnk9A3VUQoqoiQM5UTVocSvABVXPs35podsg+?=
 =?us-ascii?Q?b943CfGU5J1ExlqYtjJyY1NPQE2p4UQAxLWno6jYXJH4rNRow8vP1lUc6cmx?=
 =?us-ascii?Q?QyIjUkV/ppvjy3FS+QKx5aYwd0PQ3H13vn/Vp9Ssd3KYH0cM+y9zhDBV8gt0?=
 =?us-ascii?Q?47OeOz+tHLzzt/3Q3lvmFGcg/BTjvwJwGHU2fEXTX4J47gAQYCKdWNbldbZA?=
 =?us-ascii?Q?HKfUJshXYZybCi8QJbu5uoAV4TrMVBEmo0k8ZcJ4UzwgECdVBMIpb27DVgL+?=
 =?us-ascii?Q?8wFIB2/Bny1NgTzs5cUIm/0m6QgxT09FabjZRgoqHak3Ot0swQOizzkZNddK?=
 =?us-ascii?Q?nKFQ4nKCYRfQvYPX8t5ltXBwqWLP16QBJ0WugDMi+vgw8MFglfvA83xY+II9?=
 =?us-ascii?Q?5r0P0YkfPxP0YYT0mCBW32aBU0oaxwb3g8JvLUCUP23T0IrNQj3F/7jQn3Rt?=
 =?us-ascii?Q?VAKlWv5BGdhIxqZbVAUw5q1W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb75fce-36e3-4390-813d-08d98ac1e869
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9020.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 01:12:48.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 450A3JmUUlOBvWlHkH15xmmU2XJy8Y+TPhtk/JKVfMp74J/5Urzc3ya1YqSconW1faHeMRXn1A04ZNJkxVzftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=DpzjYvya;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.6.56 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

From: Stephane Viau <stephane.viau@nxp.com>

Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/debug-output.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
index c86270eb..50d91e29 100644
--- a/Documentation/debug-output.md
+++ b/Documentation/debug-output.md
@@ -5,7 +5,7 @@ System Configuration
 --------------------
 
 Jailhouse supports various debug output drivers.  The debug output of the
-hypervisor is selected in the system configuration inside the debug_output
+hypervisor is selected in the system configuration inside the debug_console
 structure.  The 'type' member selects the output driver and the 'flags' member
 specifies additional options.
 
@@ -28,6 +28,8 @@ Possible debug outputs for arm and arm64:
     - JAILHOUSE_CON_TYPE_MVEBU     /* Marvell UART */
     - JAILHOUSE_CON_TYPE_HSCIF     /* Renesas HSCIF UART */
     - JAILHOUSE_CON_TYPE_SCIFA     /* Renesas SCIFA UART */
+    - JAILHOUSE_CON_TYPE_IMX       /* NXP i.MX UART */
+    - JAILHOUSE_CON_TYPE_IMX_LPUART/* NXP i.MX LPUART */
 
 Possible access modes, to be or'ed:
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211009011138.469592-3-peng.fan%40oss.nxp.com.
