Return-Path: <jailhouse-dev+bncBAABBSWE2WFAMGQEOQCICFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F141D3E8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 09:07:55 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id j21-20020a05600c1c1500b00300f1679e4dsf3889323wms.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 00:07:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632985675; cv=pass;
        d=google.com; s=arc-20160816;
        b=ONlMTaPWzqtmSecJLkEXJ+D+JUZkCREcIMTFKRqOV+tmPibQ3kWVuPTCcsPWwHOkoN
         REsczLWyiz8P+NyY9WF6c0lLyAAODTnhs9rghbmGDgwktZnLjmza7EXxJ/+QejZlJmul
         RVZRMEwHUMTKDhJo2DaIxYbu7WnczzPCNIUUD84mb+Y/Qo4gVR50XkbhdiNet7Iz6Q/c
         1eKQOdGh94Mh0c/5HgQjzV6NAYFSQaoqG7+X60Dc8mF3exydTo9/K5KHCPDmcDiax3cQ
         lLoL4Vvje68RYE6w6XYh1E8Q3xMj8IECPmi3ptPWzCPNtY4FOlT29M9B1zR6OKpF+dxo
         bEzw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GMzspVCYz8tHvnRgbdocc3FpBgoM7KkZKNf8bcX/j2A=;
        b=j6TtoA+CKfoWkbefxGpbAAOjP3uu18MfGygziD7cCkhagtBCCUDNkAg25TrJt2omfH
         6lpwr+FP1gDvogY254CxB+HMPHMAS7kL50tqfeSB//QkNsI5UUUAW3d8sul1/6HcHk1e
         zN121grcOraztaYugyej+s1wNguYEYXxgBeK5o4SNMwDbCKKNW011sadLIAdQRLFwjy7
         hmrjt/oH+I8EyHN5MO9bUnejtncSwTOX/+Pi+RrziDptD3ZhH6sxvvSPVZkN/BT0pGeW
         JErmc9HifaJqSfmDQ52a59NabFrVjct54nuEg5Q6rQ0HfDNIqsw8OJE4GtFmfUfAKVmB
         7qxg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=JduSEo63;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.0.88 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GMzspVCYz8tHvnRgbdocc3FpBgoM7KkZKNf8bcX/j2A=;
        b=KxsZL7gpmAz1Z6Jbi27RgsH78YgvRKSaB+CRw6TE7S+SO2qjZHHgLaeVJ29olMVKM3
         yRRVslq0lgwWl2YyM1Kw0edWy9zTRJdir9RhiWyK5kBCqEKiAf5M62thE656uWhg+5AX
         sfO+8hf//6oBR3luqQRPLFd4yzqo617SmWT15RRU1MGHUWPWATQQCH/wcWKyaRoe5FcY
         25M1oWoOjIEafN2nvj6NLORmsVXFIWF+sxmmczxZ0/b67D3I6ISwiERe7gveP3y0LhDP
         OQUe294jMSWB6EmneEUIYfCYbBoB49hgWdesjBlCH1bvnGKdRb7Dwheh3dbR4/T1Scrn
         mT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GMzspVCYz8tHvnRgbdocc3FpBgoM7KkZKNf8bcX/j2A=;
        b=jc5pYJC5+so+MKeXC3glufPDaE6fMFyk2jCTzQD9RuNvLKQC/bU/t5wFi9gkFUtdTn
         uHgJcVqEW+EUxjRP6C/p4N2DHoR9JZfILzxAdTPCFdYkial08/kgLdSfC9q0eGW1s7FA
         nIp20Lj03RoR6jqDRh6FkFFOZrC5ha/eJ827ukMEB/0p3oUCSPWqfwjw+3nipIDlWchJ
         H1MBSephbis4P+Jtm8BUr3Hal1VWHI2drtPkwouD9XJ0BaI+tjgo0irtFy48QksJdKBM
         zYcoxqV8dEtlgIcN0MV2KiXP+xRu6Vj896Z9olO3bZHl9TaSsLSsJAuBLPBdYTBEz40W
         G34A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303s989y/zoYfub7c0PXcAQDxF3ICNl20lW8eJnkxfz37/ptVLY
	2PkgVbRZADzWSPOJiKWweBo=
X-Google-Smtp-Source: ABdhPJx8eDW0t6eUA1K1MJH2qkGNG1OkXlQ3ypHJjLasHt+uZe+QQEPrjwCp/TebEsLzJuu36qCqNQ==
X-Received: by 2002:a05:600c:1d16:: with SMTP id l22mr14187335wms.44.1632985675137;
        Thu, 30 Sep 2021 00:07:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4646:: with SMTP id n6ls4548791wmo.3.canary-gmail;
 Thu, 30 Sep 2021 00:07:54 -0700 (PDT)
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr3769660wmg.37.1632985674311;
        Thu, 30 Sep 2021 00:07:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632985674; cv=pass;
        d=google.com; s=arc-20160816;
        b=HCjHAksETVb52fk1XIi1gXDIn6OfUIpwDlBLj4fDrMyub7dLaT8IseuuXZegyC4gQ5
         MXiCC0b/eNAuoIrcTtQWtN8Zc7pzBhshhL00gonBh0/yYMrgJ7UPlsvBbF4/BsDIAvsf
         4+pBoJFtGhgo3QgY7bnfcHNcfwPjrJ8wOu/rVBacbcg9qnp9dGqFy9i3oUqUQF0Kc5q+
         PdQUdXNgb7asz7Pn+eJflgdtDBMicGWEzc7ZrXuRvGRLkhzhCAuYF6G0Qc6Bb+kBzMSK
         sgDFdjgitQtoU2FdvspSgeA1NiUYanidYFstpp6EWg1NDmHyQFSapWoS4Ng/pBidntU9
         8a6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M/+4fNw2Jns79RG7KsIpwAHfxII1trw/HysP+P19+Xs=;
        b=c5PjPSrdjf6YBZpYyXS0gSC0532DeuliYoeutrJ/PHUCYbQWdWpIZBz+PY/FWRLaLM
         BmiSQXznI1VDe+uf//IDj2+JhprDb7clH4mIkYyzJwcCnVxQbKx8spA0zhV2jfX9v840
         012nEANyN4TlyeavTJ3nkQpkxuMG27dAwVjLE0kcamr771zomWSbna/ZyV1Y8178GPy3
         6f1qOaXzpCTj67tjrULJMn8inCgT2otjHsNmBrdlPs5Lo1YXmaYjAuchRv4D7Ygonmvd
         dLiYN0iuTG9f7lZZVNfu8AMOFgFZEGBX5lGTUHaQjr99x9C1lgyl9EqqJKEYtq7WpWPq
         uEvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=JduSEo63;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.0.88 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00088.outbound.protection.outlook.com. [40.107.0.88])
        by gmr-mx.google.com with ESMTPS id y1si57108wmj.1.2021.09.30.00.07.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Sep 2021 00:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.0.88 as permitted sender) client-ip=40.107.0.88;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdmemgxHj9SP6b9D57pKBVdUKRgjlubGJ55V67svv8DfquSMR3YRpBJKh99E+DaOHdNGexcouSFcz+guxj880/7X+YJTopaGOdRhaOWCORyfS/8ru1yd7w9v63Kj80B29h9ngus+A7tXO9jrkrMhev/ht1akQQ+5vrG0W4Dyc6KQf45SdAcr96+RRfcSrpOllB78PjsY0QlI1L/jGIZADJwXvNTWWzIDtOJ8Jge2YWKbgTSCyOq4VlGpfaujjswbUyddP+34iUVQeSGzJH2AtFOoCw28i8RfPI0eEpWBSrQTBM4AKSKCgT5306nLTiZdKdgxJZkEJhCjHS/gVxDNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=M/+4fNw2Jns79RG7KsIpwAHfxII1trw/HysP+P19+Xs=;
 b=hktJTfQ9bqxHhfqNBv4ZdGX9reQ8vs2wY2h1KIpivjcDRteUb9pAdKRIzbQa59WEMPeymjuX8top+Jqz414RfaTSr9aca3pubNwOsSnjZUVojXUDYLWKq2CzZksBYIBRIft4ELkorixI28D1S1gcHy3pjiuR+JlfQkvjseJzc2GGEJE265ieb4hTolffqrTt9eZBio3cF53vW3NrRe5+LxkuEeahalE4v0RvAgLJv+B/HguRn0pcWBQ1IpJYM8cEaUB83k++WyT+3S44mIZ0ItXHnitr3nSzb+5hp1Q0YVz71D1qci4Nlic/43jEH6hnhfFA+GFB0Iab2OkcO2LDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22)
 by AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 07:07:53 +0000
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b]) by AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 07:07:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] arm: gic-v2: clear SGI GICD active flag
Date: Thu, 30 Sep 2021 15:07:04 +0800
Message-Id: <20210930070704.2315052-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0103.apcprd06.prod.outlook.com
 (2603:1096:3:14::29) To AM9PR04MB9015.eurprd04.prod.outlook.com
 (2603:10a6:20b:40b::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0103.apcprd06.prod.outlook.com (2603:1096:3:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aaf1809-a108-4c09-e1e7-08d983e10512
X-MS-TrafficTypeDiagnostic: AM9PR04MB9015:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB901522C84146964B41FAA165C9AA9@AM9PR04MB9015.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JV5g3Jhg8/SWu3idag6ArVVU/Vudl6B3oaFPztZlcYLnVWEkYRDDUP8C7dWAuIKpe5sXLvDCH6Pbu6jSot7CZLJdJKPoWWziyABrvF6hsqleskqcNJE2Pnpz3GYvhfmiQgbCsW6VAnvdVxo5jwV+vMvIDIU53nXNOOVBL3WC7VAVZ6FmrzFh6SJ/WhkoUrs+UYpP4vB4rk6ZlVwUUb1KNKGq+esRNLTV+oVLukUZtOWeKAvuaj/jkk0GqDNH9d+39n79qXtjZQUvwQtAlkuCPM6qCvIrVnG4mROSKXDkguE845Qz0XnSjrLhmpfIkYmR9c5MP5v08xmMILTPsrpZ7pTqsmFT7wkRCz/MLvr7I1CbtUBWaqDvlgNXHccz7fc+2GxxtMQSkqH7ImDTEoqiurjUgU7pgrufNcy6iczWjAaIdFK/R7aWDBksdXbPowIju8v2J7UdeOoTo81WWQOTiysz8IK+snUSX1tiOgDuTDrbmDELbQsnCcvNToljDGUUHCivtSTX9NyGAvXDjYQT3ZvJiIdvT06Hibf3uXKxLlCmouyGb5GJPXm7CQvHdridJD88wnRQZ4oRuIu0NQooLC5GZTYDCitCGebkYjdwWLBcrVoxbBWwgItYKQTOJCkF1Ib3rxebLLAzQ6VzClKAkkStd3dIe8VyfmJZfySjlDCrjEl/C14ihLamIFx5PvC3i5yntZX3MnlFH5YFrRnvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB9015.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(1076003)(66476007)(316002)(86362001)(6916009)(38350700002)(38100700002)(508600001)(52116002)(83380400001)(956004)(6506007)(8676002)(6486002)(6512007)(66946007)(26005)(186003)(5660300002)(6666004)(4326008)(2906002)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cSOCgkSJcrVwf1pbiK1eQa24ttiVKRZBG1Zyy+uII/URwiWIDLQ/GbBb/4qe?=
 =?us-ascii?Q?z937XGmI+zSymEKObvFVSH+CHBC/mzNhD5vBxNQRud0bmjyqQzM8Uu2pxtjn?=
 =?us-ascii?Q?XB1ozaWL/n0l+k0uj9kXM2tOWE0LatN/SsK2tTaKrRD50G7Ial5uA06DhByf?=
 =?us-ascii?Q?YzZSqZOssHOxXi58qmSotBDJEyvnYRNPHN2BAaUvs3q/UWcTz4HdiNXvARRl?=
 =?us-ascii?Q?MDAHd2qJbJ0+BNLORHPMoeqtUc4Bda8fYM1mtk8swegKLWjNFlJx4ELg4zuj?=
 =?us-ascii?Q?mdAaVOms7Zhyhft4F+1hAtDTWIP1Dm2pwqhwvnletjxxkXlEV+rlRDDFzAu0?=
 =?us-ascii?Q?2LaHzDBwGAaChlSfsVnI0XNYkMx69RTKapJT9bzfEDwerexeuQ6sNemuSUtH?=
 =?us-ascii?Q?Oe2CmGDNZ+Q2beT7vIE0cWA9gaPKIYdzPs3KQ9bVQKWE0uPZGmJVA49fGeRp?=
 =?us-ascii?Q?lkDfKV2+1pg8ihyAgIS168OM6bZzurUcdhfADLWq5sBGSlf6TqYmPCiSF6Fs?=
 =?us-ascii?Q?Ul9fzX8fatlkVllAbvevVdPDaD6QGvRsTsD9CvKDavyZZuGtxd1GvAS9rf6w?=
 =?us-ascii?Q?hXcgNBgFHzmvY/jw3vOci/PGeo0ZXNheJy+vnh/TCdeb6oryE/0D5BqqgWi3?=
 =?us-ascii?Q?IE6sqkbbviSdeqdT6u19WfqXRNcFFxSgJwDmZ1SqQHvgQbJZLo5Wv5580vl5?=
 =?us-ascii?Q?XtvJ50VsjjeRQe/7ZO7BWIUBMlDgxmg3ZmvCC7x2GpD85LtfJeU8hqkl7Gmj?=
 =?us-ascii?Q?FHtHdSY395eSbMtoCQo6s4Y/b/JKvuXYy3pSypckECXr0tuSiWb3doj3wQIU?=
 =?us-ascii?Q?QB8G/RwqBc3eWcCh2qKVQzpip1sr3CtIKTDV3fIP3XFMTSL15LpmbzMd2QfX?=
 =?us-ascii?Q?lEW5OoJIC79U21Gzvr0X4LQf1Dwg1Fo4Ce+nkyPIjzbgmIUUsgIZUIYapjKH?=
 =?us-ascii?Q?eBD7Z9NXobjTCWXiegPrt48h5bUUTKdnEzy8Gon0ZKl6AFnkylC3NPAY25cd?=
 =?us-ascii?Q?RBQxrnEqrwP5qVtWKrOpszIRsEpE+dKBTymQJBrl7Vp68rl+kZ46zbDv8CGq?=
 =?us-ascii?Q?v2qJlh2sUahryQCMmYtlXsh/HJimuJ2UzbjIWZfA7rjpuosPEBhlchIeFPVB?=
 =?us-ascii?Q?/Q+SxprOas0qsI/GyhcM/XtOI+oIOuM8ud8pdyMzXvllbFnN3iQHabY7o5ul?=
 =?us-ascii?Q?awaES0QLRuj+ewImmEQ60shpHV46P3sV+6Ihm5tTqs0Tt3eXzaxwnvx3TQ7n?=
 =?us-ascii?Q?8vYmIf6BLrQrxqo5amxHa9dQxPyr6uomMbtuUZhx8ptIFSE6tly67//I9S6t?=
 =?us-ascii?Q?AvMYA/pPnfsFQY4UM32hBBub?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaf1809-a108-4c09-e1e7-08d983e10512
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB9015.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:07:52.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oy00HY3DTLL0HHgqXje7b/xkCSupqtrslAwlZwvcfBET2Fa0wp4JzhdaxVeSLu/7HP8cU3DrVIrmphEcz5DRHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9015
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=JduSEo63;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.0.88 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

With Linux Kernel 5.15
commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()"),
the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
until interrupt handler finish.

Without Jailhouse hypervisor enabled, everything is ok, but when
enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
is actually accessing GICV_DIR when eoi_irq after enter_hypervisor
return. It not able to deactive the interrupt that is actually a
phyiscal irq which in active state.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

Note:
 Not tested on Hardware.

 hypervisor/arch/arm-common/gic-v2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 31371de9..8a9f6201 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -101,6 +101,7 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
 	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
 	u32 vtr, vmcr;
 	u32 cell_gicc_ctlr, cell_gicc_pmr;
+	u32 gicd_isacter;
 	unsigned int n;
 
 	/*
@@ -168,6 +169,10 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
 
 	cpu_data->public.gicc_initialized = true;
 
+	/* Deactivate all active SGIs */
+	gicd_isacter = mmio_read32(gicd_base + GICD_ISACTIVER);
+	mmio_write32(gicd_base + GICD_ICACTIVER, gicd_isacter & 0xffff);
+
 	/*
 	 * Forward any pending physical SGIs to the virtual queue.
 	 * We will convert them into self-inject SGIs, ignoring the original
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210930070704.2315052-2-peng.fan%40oss.nxp.com.
