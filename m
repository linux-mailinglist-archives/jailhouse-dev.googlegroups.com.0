Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBYW5U37AKGQETO55PAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id E98842CE697
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 04:37:06 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id c23sf1813213edr.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 19:37:06 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607053026; cv=pass;
        d=google.com; s=arc-20160816;
        b=IP+ka7a2dOo7KT+H9dSQFG9CusSKt1YU5QHidNZPgQlGwoK1ZG1TAv8Sf+/hPRsNVz
         GZcl8/a7uH8YpYpUIwr5n8z9kyM9yUk80u4wXF7f2DBXxGg8JGE0Do+i/BohitHHhx7m
         6S12Z4nK94pt1aFaIII0e/gXDuB1SlPTQL14qpWEDmrmy5FPj7cZHJJ3EqJ4TijxkguB
         wzdmRlVU+fQNkN/TiHElMOx9Vi55nYfA+bSLJbm00sSqxB6O7pEd2JitHTFUd0/B7XHx
         zQgV+MxGqIDJP93RXvhHHRuSi/GkcKKjEg8d0JN6GyeamuZgoaD5OMoidE/t4uHRb3Rm
         r3hw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=od75/Bf2zKp5Al7peWRNylt2Cq12lYSBnEVqZUcylNQ=;
        b=UhdPw7Cm8jl/CM7bG9nRBjAm1mqY+hRhH9cF60SdUGfMNZmEpK7nw7YnHnl0KUu438
         rXpQw9knoPlNoBXWpUYlceZJN3BbdWA97yUEB5w3kUnENQBeC9w/Jxmv4jqM8HB8aM6w
         w9TaAxhrS2LDWavM2ycJeGEZHL+E5v/1r/KengJE3etGWbUeXkzuQ5dU06TsA9tTESjl
         C9hzKAnL0Niz0CL4dpmbrDy8TZCslVxCrFwS3pBliMU5afOMKhgfcjuMEop39BIq0UOP
         VHnimE9Xz5PQxGgFl5Zf344YyAKRPMTCYFdXN6aPvmXYma6/KcaJRdAclUHFicSUfBd4
         bkPA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aHgGrc91;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.85 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=od75/Bf2zKp5Al7peWRNylt2Cq12lYSBnEVqZUcylNQ=;
        b=IQgSb9PIJkboGrCNjvotOyqYUxbb1awA5Hb1cyiCHCpGDXGdU2IOlmthE0nsdAk3M8
         vMDDNTh5WubZuKKwLGKwm565ZA1bPEDpnzV7phSwilsoxHEMkacTR0OOcq49PEqBxTHG
         lmh57GPyiAZpnX84qwxHJR67xFJXoSagECjDQ3IKHF4e7o8BY67FC31gvhWcUpSm2B01
         Z8NXKLA8bpvZU0HJtQw+4B9L7w/SzgPMU91a+EhnY2aeoQ6QuNZwR++NZmJzxtlaRzfB
         N0cw+5VIzbQZ5bDwc4OvGkwtJC9ar3FvclIYTk5UGDZZB//qGel+wKxJInnN3/ExkFjv
         zd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=od75/Bf2zKp5Al7peWRNylt2Cq12lYSBnEVqZUcylNQ=;
        b=lyqlDSWKw7+QpkNM7XXT3GCF+YC5+ICtLC3hjHHnl75lt4S6PhKc2jAL19nhOTTKjs
         uKuMocfqd23+ZT0tSG431TrMGMAAqsR3pLp3/X+9JRr5ErSUHiCEUpAQD8XWH9p7muuD
         Eo2Zf0YxNyi1eiHOwwn/LX2nSnU9z4indplCbvxIoceeJjalg7wb3hBxsRsKJTmOHe53
         biLlHE0qi7x9GocVQS6rSXnr6YKcg/G7lb+NJyzFBSTYOpFj4rnSw7kbSiXhiRw+41Fv
         Kj2OD/t9iU5RRYA5DE9iJzS/ou7hc2DLXcnN0GRPpChBYJWjFmGe2+EJexR/K6QwGb1f
         dIXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530JBXS+Gc4oAX1xFH5D2DGKrdzOVgB00bvNDWvfibJedbQ11MoO
	Rdn0t0ZZ6IE5OIYrE4eDjIw=
X-Google-Smtp-Source: ABdhPJyYMzpm9m+4JqAdxiycLa47RK61LgybrGT3GAy8eUKUskyhcpV1plQIGHkMFVVcSJ6yKwlsBA==
X-Received: by 2002:aa7:cc8f:: with SMTP id p15mr5624985edt.240.1607053026611;
        Thu, 03 Dec 2020 19:37:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a190:: with SMTP id s16ls3558347ejy.3.gmail; Thu, 03
 Dec 2020 19:37:05 -0800 (PST)
X-Received: by 2002:a17:906:edb2:: with SMTP id sa18mr5117871ejb.264.1607053025598;
        Thu, 03 Dec 2020 19:37:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607053025; cv=pass;
        d=google.com; s=arc-20160816;
        b=IU3blr05PELMqr5VEm48KvVZzc6VEOAmHWd7yrffTfQYnCjhknYZeJRFVoitQ5xCrf
         nzjvyX+U4/fFdQ9VrjvQJir9+wde6ELNZLguQaMGhnwB/pWIHfmwBEi8XlrkiwoC4mXe
         E/Wsff4K2XmUA0Ph1g1lMk+7uj2v3HLxERgor1nMYgS58+KxC7m+ZHX/oixDwHAz+59t
         SabTGXu8uTD5hpkqQMhyKiD8bX6tbHjaK/0U7A2ihaMD+RChusGzl0OuWOgSXEfcXQUy
         ej0nr+jJYndvijtDUb/KcLuQMVmdMC9KPziEZaomhO1OLQuoLEn5vImgJQD+RciVj9M+
         a9fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NRtGPw1lrLfO4+0uXuC4cZsh9QXVg354YzMDYF5YadI=;
        b=OwOJloPYpt/58BNFH7hOQvDwG+nJr/C5ZvoXrghkUCiRyWlbxm8wQmcwRgqjclCxXf
         uFDbtO2HepfgqAAaspN5si1orPInb97HQgBUQe5BHPskO3w3Hg7U8xMaDG9pWVr7rOES
         ncVE+h07z/d3hlVVc6vEz9CrlPsQDvtl0nQ2bU562rPnLLptsg/b1YZp+rnsX3sNBuOF
         SlwkZEEcFuqDPcKerj6v/3LqLggLy39cudBhBpoa4Fsg4VTqS1JlptG9LqWH6CUA0h3o
         ei8njDcBhRLkk0+jqFfPnnjHIVvimxGkK2NeJoMslLOo4wTXFlZj8hBBo22RBRHy8lGU
         36XA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aHgGrc91;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.85 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com. [40.107.6.85])
        by gmr-mx.google.com with ESMTPS id r16si106128edx.1.2020.12.03.19.37.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 19:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.85 as permitted sender) client-ip=40.107.6.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buc2B3T4Q+g9tx0k8k9+ZTudfsrKyI04sm5Fh9oixa4GrWgEm85XioGLXwbbsQ6kXjARqubjodLTA9tg8cBRphKDgYind+eIgEnxdW/Vo2iAsDKFJxWrXydtrOyFcUzZ6P5PWrINqv+ZMpzM1aU+wGNSu6lNo9Sk57X04BJgmHJoahiHy1tm3XkIyin1dBNPZDz+kHnSK4R7EK6DokkxUuC8vTSqlvbp4HB9uDTGPyuy/chwyF2vVExw+ZxtdaW1LMfTNhnIbe7m4QsoMGYfNG9zs93wpvCUDWsNS0o1iNTn6ds8Zdit0/ugMBJL9Ej9iPkGKpb63pWocN833OdspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRtGPw1lrLfO4+0uXuC4cZsh9QXVg354YzMDYF5YadI=;
 b=MZhVUZWbizhgZhfePn8hNStf+r+Q+scZHij2BeW/xCmKdLb9fsLBTKvcsi+8B7WqnzmAVdVrAqvEjoRVIuB3UbTTpY3rV26GOyVt1Bgh8QeG3NDTtxF9BlIO2257aU6nPkOpoLdpQswIorNqNfgThDYiAE1B+qvP62I8mnjfJcBRb4aBoIncgH41X8n2iQ/rb6S2AMgvoz/NTLyAV4ZdHlj/lesty96UPsBhEQd27dVQgzlpSQsuuvDWUlzkCe2RXeEg76/f7dBd7Vpdz+Sw0DfNBkMljrwx1fjB5nGiw9DvZkW7VjyqPvujorI+5m2KbmRDL2+cbwtE5etZ767EkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
 by AM0PR04MB5203.eurprd04.prod.outlook.com (2603:10a6:208:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 03:37:04 +0000
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795]) by AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795%2]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 03:37:04 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v3 2/2] configs: ls1046a-rdb: Add linux inmate dts demo
Date: Fri,  4 Dec 2020 11:45:16 +0800
Message-Id: <20201204034516.20000-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
References: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM0PR04MB4772.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:37:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ff8889f-8269-4401-b8f8-08d89805de51
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5203EEE3171B348D95AA3F338AF10@AM0PR04MB5203.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEIoWm5vMvPptDeDhU7AVgPZEk5lkokt2ytbYdeLUrijQSfKEuQJEAb3YcN81isGdwpnrUCskRX2kw9vKM7g2GPRf+j8DjV5NWDoLRZcG676eoCI8Wv1XPAj9Y6UVPXLp5jCtsrySrSIO1P6ywoYZzTRHtUlbFyrx/QzNkYIrkMJFGOrRd88lxUIuCbmJRCH9wHExtvvVxa1LSNGi5B5gD/V9QOZFQVyNTqSof4Im7dv0V+++fshTc/Rm2mXgGR2GBr3zJUVDejmuuy0Zp1S9zpcvzxpSiXd7gaZDVznnIK7Rf7721imnqLq61R2EME0ylhzIE0eIdsEOgKeLe1TsRb16NAw0mkVlq+rBGqX8LjpV2STrFYigbUciozfEk6l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4772.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(956004)(8676002)(2616005)(316002)(36756003)(6666004)(86362001)(1076003)(16526019)(186003)(6506007)(5660300002)(66556008)(66476007)(4326008)(66946007)(69590400008)(2906002)(52116002)(26005)(6512007)(6916009)(83380400001)(8936002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JEhZRnYlCs7ZDFi6Lys5dVlWS9aIy53JYerBIqPOBZzbICSh7mv7FKHwynOr?=
 =?us-ascii?Q?qKgs0tvOjUCheZ+B7SkzUdHDbrrLM9iB4yNBIh5A73fmXxBybjt7/aWeviuk?=
 =?us-ascii?Q?a1rKYPhWqxSWltqkL3MjjYGRKmCH4/acizj3rrjYiga/L7THiaFe7XjV0tB4?=
 =?us-ascii?Q?nGqzMutrqrvupKhFjoc03+7aGTNpMa5L872tDnyDFmZDE8P+Lnfqh8z1c2y0?=
 =?us-ascii?Q?T+y1TYUfCXKmYjMDlXAmp9LxT9dbsZWfhvfKC3k3KhAKYcD9IsLyzL+nXPd7?=
 =?us-ascii?Q?hadJpyp7pqpdLPGIJSuJNbGFOZfiSdhqyvzYD5y80E80vTN5i7be8HGAfdUF?=
 =?us-ascii?Q?3W4AYRgvlo78V465lB+KFWaDTTZQ5sblexIDibMjfqmOqchHnxaU3AvG4Yln?=
 =?us-ascii?Q?2fgKJ+GTy3on/z9QIoDCWQDtPctU1gyRdB4id/nZrCRPiVl0OXUcn9wK84rf?=
 =?us-ascii?Q?88e723YsCfYNaOPQBHzlU2NykWFRkb/IvWkf2j8LJFqBoWtIjbeqHXjSjmcz?=
 =?us-ascii?Q?RIqJQQI0+mOn4e8XMIxbek3yMoWahCHtNd2HBBWGhOtE0OTfalYtRICFbt9r?=
 =?us-ascii?Q?zwvMsYF45CILIwq4LqCpV0ufW0SJueKmowygUVm6vrsvEgEXKq5CH1fXrLE1?=
 =?us-ascii?Q?Li0U0ANfVW2ZCU6pjvoDBVCXZVMT7Ua0JDoZ0xguveD6+KXYf0al1E9hUUQc?=
 =?us-ascii?Q?37ZLTsH+bwtdURfxXWZ0fDLCfA6u2D+BiAwPoSXrhQLfXABEe/NxfWriMAL6?=
 =?us-ascii?Q?35sWnJHvPzErlesU1KsS13r2kUUYXciCdPw620ruYJI/JTgXNK1E21+2QJpQ?=
 =?us-ascii?Q?6E4g2fhOp25OTNYdMxQCd/PAveZG+wjGlyNejrVpOvfe1AlVvs+lkneH998i?=
 =?us-ascii?Q?ZI/06oLlh68psSp72W/6EOzFajLTCmzpQBe77hzAdo1xibwgIFSPuIlv+phl?=
 =?us-ascii?Q?8MGHMbRDZnA3vfyDdN4nwYVjYSJ6eBE4hBCq3I7Zso940wpomBN28xKGZa/c?=
 =?us-ascii?Q?tPUd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff8889f-8269-4401-b8f8-08d89805de51
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4772.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:37:04.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIgxvKM4+kTdvjK+B3YSmAkaGwZDsdJCIMb/+/MdVbYfI9brmaZ62AEuvvmvwXLARMmnC50MAh6jRL+e+QEGpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=aHgGrc91;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.6.85 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

Add device tree demo for running Linux as an inmate on
NXP ls1046a RDB board.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Change in v2:
	- Added inmate dts

 configs/arm64/dts/inmate-ls1046a-rdb.dts | 177 +++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1046a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1046a-rdb.dts b/configs/arm64/dts/inmate-ls1046a-rdb.dts
new file mode 100644
index 00000000..8dcda43c
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1046a-rdb.dts
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP ls1046a RDB platform
+ *
+ * Copyright 2020 NXP
+ *
+ * Jiafei Pan <jiafei.pan@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
+	model = "LS1046A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x2>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x3>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		CPU_PH20: cpu-ph20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PH20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <1000>;
+			exit-latency-us = <1000>;
+			min-residency-us = <3000>;
+		};
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	reboot {
+		compatible ="syscon-reboot";
+		regmap = <&dcfg>;
+		offset = <0xb0>;
+		mask = <0x02>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	gic: interrupt-controller@1410000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
+		      <0x0 0x142f000 0 0x1000>, /* GICC */
+		      <0x0 0x1440000 0 0x20000>, /* GICH */
+		      <0x0 0x146f000 0 0x1000>; /* GICV */
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
+					 IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
+		dma-coherent;
+
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
+
+		scfg: scfg@1570000 {
+			compatible = "fsl,ls1046a-scfg", "syscon";
+			reg = <0x0 0x1570000 0x0 0x10000>;
+			big-endian;
+		};
+
+		dcfg: dcfg@1ee0000 {
+			compatible = "fsl,ls1046a-dcfg", "syscon";
+			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			big-endian;
+		};
+
+		clockgen: clocking@1ee1000 {
+			compatible = "fsl,ls1046a-clockgen";
+			reg = <0x0 0x1ee1000 0x0 0x1000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 1>;
+			status = "okay";
+		};
+
+	};
+
+	pci@fb500000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xfb500000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+};
+
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201204034516.20000-2-Jiafei.Pan%40nxp.com.
