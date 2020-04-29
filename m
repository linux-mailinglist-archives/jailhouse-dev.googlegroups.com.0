Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBLNFUX2QKGQEZFGJP5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA81BD922
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 12:10:54 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id b22sf589028lfa.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 03:10:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1588155054; cv=pass;
        d=google.com; s=arc-20160816;
        b=ujvKScl8hpJ4/nXVsuADDLWoTIEf+727wnwFgHTpXOAfLECtF9TntBQJ7knl8pBQYU
         z7Cvmu4SpZ6eqYm4a1ZMNyZ+efMNJwVZKeMCGTLUxsN1y3zBZk2Xhqy8wk3FmLR/f1hs
         HN/AbKHVRxC8HMhvq+VEMMmYmUSU8F3aV+Qjcl9mSuTlCg/420o8fMuMKFEFWJS1qVgw
         Xlu7WpfFcTWfzCyMll7BCqFTUE+DYIw1g9bzp+4b3KK88XGcKuj4BbvgZTsWlfVKP+py
         8by5dweKZzr4e/fAYyE8zX/4LvLbi8KLkuMnYLSKm0/uMrmWr5C0K06K474UDsmQY2c7
         j0vQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=BNLKGpBI3dnQatfRwH2kpFhRa91qnWxgA4us97tU+7k=;
        b=reB2JONOS72L4nc1GOmJaHBj4OEeI9qLuMCfQT4FoygZga3r98yei+rDNabZ1l4ipR
         gTsjGV1QkdQmigbVa6cFxhGt+9bGIrEl+KjPd5K2WixRbQz6OuyoENC8Ixm6TFux0Goy
         z2rMiza3SBIVK1r9OE74gYrVun+sLt/9i/ZpYJ9TRL3QNu4nu7wgSd9PNjOb6HjX/Oes
         7GFkq9RoX6FlTkcmmRxWahMdeglmkHr/GKbDhGikgOg/pi/a9IS22eNfy4uTwYfS5j1w
         fk+a1bueauN4nhMSaB//4grHyqFt8YeKItgwsrjBmFrFlsM9i9REoQcRjmXQpTAjwiru
         doJA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dMb6gbC8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BNLKGpBI3dnQatfRwH2kpFhRa91qnWxgA4us97tU+7k=;
        b=KLvxxm3P08aAhdVEgDfGeWTYHaZRelKRwGK+QdF+w7jZ/tGCLLbsREShC2cITvx149
         0f6vLadGVng5f37JTVqq7NVsq0xHZkfc7CjJ9yn4eitU8/uyjiw2jB+k6m/Q4JCX4Tnk
         qLaP9K/k5UcZKbn5DLFq2y3YOxFN+spMmiWiZyR1x3+Epn6M/QxOnVNu8TGQbEAs9G/s
         KSF/TfPmNx5baTiwS701dMPUNdhK9/P49pkJsC8MwgMWuwBzkxF46sRachCEMvWrHqlX
         Vd68cPzuB0CWA3N7ymDfmdw4kEW5EfuX0lrAxt2uyKWW+8WQBsmdPK63M4Da0L1F+9mk
         tqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BNLKGpBI3dnQatfRwH2kpFhRa91qnWxgA4us97tU+7k=;
        b=fP1Hq2y31jZTnlg7nDp9oAk9DC79chxVAJkaqUefWVAE2kJiPG7mIHthxHLz+NfK2i
         7xl/H7vCHM1oFJpaCzEf+TBhXGZwIm8SHn/nbozV8yv2VoZxLriYEBmJx3OPQdh3j5YY
         hRI7SMjz1vJlrFM6aauUfSB5OiK5y180ce1mxQJntYsqII/5fB0j5y0e0BWiqye3Kf96
         m8tW+sEhWHXg0wjZD+1AyNIm/q3ruCL0aqNrUc9YemfO2pkYaUU39B0yaz2UHPQfD8PD
         rNgAEkDcXBCmal9spiZJKMXyp25nLJMsEhMrSj6qA2H4egFY9Hg7DxGUeofD0xik69nl
         6nDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYSsjgP2vZPEfV6Nie/LmsI4cIM5nr5ke5DUeQdzRKVN4trWvkp
	d2Kqh5BRDc6WCx4sMAt02ag=
X-Google-Smtp-Source: APiQypL+LdMOqu5z/IpYA/Z1+uFafCVd5dyM35P1s04DCi4iLP+A9mfinSCTSEKRJpGUBvnf2d1Usg==
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr21698434lfc.217.1588155054156;
        Wed, 29 Apr 2020 03:10:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:55ba:: with SMTP id y26ls5912777lfg.11.gmail; Wed, 29
 Apr 2020 03:10:53 -0700 (PDT)
X-Received: by 2002:ac2:569b:: with SMTP id 27mr22447359lfr.134.1588155053433;
        Wed, 29 Apr 2020 03:10:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588155053; cv=pass;
        d=google.com; s=arc-20160816;
        b=iGR3+INoQ9jUFSkyCppRD8Qv8S0ZMAyirNld4D9TsDy//+l0fhQF5kOp8FpjZ367BX
         obXPBY3GrdorQwDpTMCCdG2dQA3EJ7etEtK2mz2pP+Fm67FO2XI0cKUxsgn+hvccT/0F
         nfwcgyTEUbgwsHlscge1Z/J2TIuQkTu/I3AKB8DX7c7JRxwtjj90J0eAeEKuRrgczMH9
         /IHVAofUvGNymuZWMdCJAgRz/nrGxpdz9XU9Hdqu1ByUif8PcpcSu+Rsw0Teu9LEbaeK
         674weEYQsnPJaHyYiVRbFzSjB7K74IPAA0R2AWCvviyS8ordeSoICwsfpMspIhzvTz7b
         E6Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tYeeOx+XNUznKc3ANwq3WKKbKim0OgJArOgtt/wj+nw=;
        b=PZVOkKGSW2DXKordI1mU6uE4IrezbVb3P2KZaQt1mqkHc9GR3cts5OTbS21wtEfJME
         9hD5lfuhN0d25XUPtJ9xwlqq1vU7VVosUAYXx2NmtgbDyiCvATP7Ua8pBvst50veWo8f
         sM91AIg03tH+aJi4t4DzzZeKJhGdlUOnnSMEpa8Z8Gb+86yV5nS+vmanPH9JaRtZwJGL
         FphQLboUTUJd3Ho2g3jcUyBrrUkxn/NJzAHkvzK5ZMrgpnQeTG/o6P5XL/5Gzq/Lnfr2
         3PbGYHmjuktCZCDQqZHUbqD8QRuLxsNV1kRHpnLZyfWL64Rc5LEG3s69UUnsbhwMcwBR
         zPVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dMb6gbC8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com. [40.107.22.59])
        by gmr-mx.google.com with ESMTPS id f17si118397lfp.0.2020.04.29.03.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 03:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) client-ip=40.107.22.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPZLL5iaBLDQIZxA0MHLSu4vz0mSX6BUHFSMrrwEPyUOYeSUEp+764qh3wPnW/HkpogFmBKyXNqMywQBb1msFrFQJQPIia8VMJZXtwmJYGU8h+YHeAt616bXMJdQ/6VUexYoq7kzcEexG1Y+txF1ma66WyqejBuOOU3meFvorg9mCgFmLQNDbSp2HZbXQHH3M0rc927UocLHGm0DsXX77RjOpXt0sbRKX1XUqB3xKPXReZ/Mafiom6YxXCvgCTCdHWGuzVOsPtXUHShstJTeBIluaDRxWyFpZcT7ygtG37cbpi5gKUYFkIjVcqKcE4838yMyjJWOWxNgl5oePN0TAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYeeOx+XNUznKc3ANwq3WKKbKim0OgJArOgtt/wj+nw=;
 b=NOxB+hzcvJMSjKsRvr61j8UQ9H4iKQuJAN2mMZeSXWR4TIx1MFILnDjIhyZX53ZhvCKv3J6FhPNpKy2Mtm741o1bY8xPgCWjSL4LYWEwHAim4obworTx8RdVKh1sz948mzpfOGKHm9a4rrIjakl7qC8Gh8HXkWtG41T6x+VjSEmkgfG9TelkA4uqO5nPUGGPdtWxc6mMENuBvF9+djXQlg6ZFuy2ufMjR+Aa3kTNe4CTWyDyrQ+ntwtge+EPpJGkypRIKlVm1FvJyRZiCNfQIFhSUpjwfoS8GPrEqcwEFQ3NaJkp60/UzZ7pQmEwwF2WRoz9nzwaNDLJU3XssFmr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2741.eurprd04.prod.outlook.com (2603:10a6:4:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 29 Apr
 2020 10:10:52 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 10:10:52 +0000
From: peng.fan@nxp.com
To: alice.guo@nxp.com,
	jailhouse-dev@googlegroups.com
Subject: [PATCH V1 2/2] configs: imx8qm: enable smmu
Date: Wed, 29 Apr 2020 18:02:01 +0800
Message-Id: <1588154521-2897-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
References: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR04CA0128.apcprd04.prod.outlook.com
 (2603:1096:3:16::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0128.apcprd04.prod.outlook.com (2603:1096:3:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.19 via Frontend Transport; Wed, 29 Apr 2020 10:10:50 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb6441c9-3eb6-44b8-e022-08d7ec2598d8
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2741:|DB6PR0402MB2741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2741604037C89422335DA26588AD0@DB6PR0402MB2741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03883BD916
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /v6LK8UOFMEltZIsrNVkfFBkvPIAhLHPuOwF7UQEkJpPbmgkkFj0BKudL1Tj3O9+qBb3k87nX4Erpupu+tGvuOmOGW43EuanMiWaz32vU/hjsofi3C4axKO8f6O8Y6bmCQeETHcEDUya6c0z056SzXv9NNFKMVbuIksgcvX89UUS+aD6uPAZEJvPYuzq8VhJE5JgnU1rihA1cG/0I37ETGmpMa9Y1Yb0S9XgCQvLinbgaY8Mjk7AJIOSXoOMzjuKTHJ23r/qeeMaCq4rXoBpfUWCoIhI5AUSITNyw08+W90+F41iuEZOICohr3ZxhYQyAAsq44G9s1bfT+Y0bQ31fOraaGmKshVBsRgAsP+V3kbdZjFq9XF0EhYryEInkJURtXqNbeXBBnbRv6Ykq/9RDfVzJHO5QUpGHEl1Y2r3Pl7GyMRqpt91sg6fZNsaBv4Xss0y90asTaY2zlPSEXnFzGjMezh8VCUzt0OexQ06UlUHHTeZj7QnRP52sOap4aeEeTmZfQlvzfzJwgOWWvzmXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(30864003)(2906002)(26005)(5660300002)(6506007)(36756003)(316002)(66556008)(66476007)(186003)(52116002)(6666004)(16526019)(9686003)(8676002)(69590400007)(66946007)(8936002)(6512007)(478600001)(2616005)(956004)(86362001)(6486002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: GyQurZgIzxasjywFOVR3qPdbgifde0XU3t1bQlKH5UNtPgRuYczvLLgtAiPhPj8bUcZK6/1/K6EfMh9d+LgYng8Wpx09SEDm4uEjLZP+YtvJ+ls1j+J3HdfY8tW6Ix0cJUAi3RmLxyITFfE5uWRi0IBN35qA+PP6Dh/UvlAjf5CjEsjGjcQF8cAtjtIyh57Aaho7RmztPvXOrDeqA2Wztu+5klBFp++B6gZAQXUpD6ymMriGhUne0HH87opZ3Nv8PK/GjYY+41Dcxp2VwkZAoXvG59ORjpfejKY1KZZADjF8BXAk9jJk1UcM5EL5G1Mu/ljytWHN7lNJkNXTgtNeQFIY4Ypbu4tcJY2+y2LFp4I8YhudyRgnc74n/+Yw68qprPg8Lc6cpzNLPvkWRs0jBTX7hb82lokXC19OSptfyy7NVCHbqmJ/FqI4RTEqblXWieQzb0xqagNmuQ9mvL2nCVHyWGBCSq5Q9R0nJrL8w5tizrDYWilWn1Zzem3yA/V2h9PZ5YdvfYCrLKrBmLbRSx9Z7NNQAqbqgeThm5l/G8qFikzmpoKJfEVkkjUKGXEWeiNODLioJybX7Wyyo8eu9TLgGeBFaEUuco9Yyi/qHodPZgLTQJT9nXmxhCqcHVUA3wWanpMPP0bZhuWAj4dh1W53SZ2e5HVV705Ad5kUNE3ZDlEVhVobZOJJZ7D5odOhrcl/ufnqGO9hFwQctWk8IPkqY7XBokMji8ES5y6Y8r8zzq9tsJgx5aBvMsdHlgOD4JyQgg9fjobm9yeNG6Ycp9fYyls1l8vop5FGlZPFO9I=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6441c9-3eb6-44b8-e022-08d7ec2598d8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 10:10:52.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOUcjC082NISGyaJNaZENQoFguHjoeQyEpJM5YluCEohIW5W+RJKnL523cEIVaeiv73lxDEIw9iaE/CNhnNK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2741
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dMb6gbC8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Alice Guo <alice.guo@nxp.com>

Enable smmu for i.MX8QM.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qm-ivshmem-demo.c | 124 ++++++++++++++++
 configs/arm64/imx8qm-linux-demo.c   | 199 ++++++++++++++++++++++++++
 configs/arm64/imx8qm.c              | 213 ++++++++++++++++++++++++++++
 include/jailhouse/console.h         |   1 +
 4 files changed, 537 insertions(+)
 create mode 100644 configs/arm64/imx8qm-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8qm-linux-demo.c
 create mode 100644 configs/arm64/imx8qm.c

diff --git a/configs/arm64/imx8qm-ivshmem-demo.c b/configs/arm64/imx8qm-ivshmem-demo.c
new file mode 100644
index 00000000..2bfe88d5
--- /dev/null
+++ b/configs/arm64/imx8qm-ivshmem-demo.c
@@ -0,0 +1,124 @@
+/*
+ * iMX8QM target - ivshmem-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
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
+	struct jailhouse_irqchip irqchips[1];
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
+		.vpci_irq_base = 90, /* Not include 32 base */
+
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: from Inmate memory of imx8qm.c */ {
+			.phys_start = 0xdf700000,
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
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (90 + 32 - 96) /* irq 122 */
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
+};
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
new file mode 100644
index 00000000..f13ca7bc
--- /dev/null
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -0,0 +1,199 @@
+/*
+ * iMX8QM target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
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
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[4];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "imx8qm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 124, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
+		/* UART0 earlycon */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2*/ {
+			.phys_start = 0x5a080000,
+			.virt_start = 0x5a080000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART2_LPCG*/ {
+			.phys_start = 0x5a480000,
+			.virt_start = 0x5a480000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0 */ {
+			.phys_start = 0x5b010000,
+			.virt_start = 0x5b010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0_LPCG */ {
+			.phys_start = 0x5b200000,
+			.virt_start = 0x5b200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MU2 */ {
+			.phys_start = 0x5d1d0000,
+			.virt_start = 0x5d1d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Bottom at 4GB Space */ {
+			.phys_start = 0xfdb00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
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
+		/* IVSHMEM */ {
+			.address = 0x51a00000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0xf << (124 + 32 - 128)
+			},
+		},
+		/* MU2_A */ {
+			.address = 0x51a00000,
+			.pin_base = 192,
+			.pin_bitmap = {
+				(1 << (178 + 32 - 192))
+			},
+		},
+		/* sdhc1 */ {
+			.address = 0x51a00000,
+			.pin_base = 256,
+			.pin_bitmap = {
+				(1 << (232 + 32 - 256))
+			},
+		},
+		/* lpuart2 */ {
+			.address = 0x51a00000,
+			.pin_base = 352,
+			.pin_bitmap = {
+				(1 << (347 + 32 - 352))
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
+
+	.stream_ids = {
+		0x10,
+	},
+};
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
new file mode 100644
index 00000000..53f00391
--- /dev/null
+++ b/configs/arm64/imx8qm.c
@@ -0,0 +1,213 @@
+/*
+ * i.MX8QM Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
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
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[3];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfdc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+				.iommu_units = {
+					{
+						.base = 0x51400000,
+						.size = 0x40000,
+						.arm_sid_mask = 0x7f80,
+						.arm_smmu_arch = ARM_SMMU_V2,
+						.arm_smmu_impl = ARM_MMU500,
+					},
+				},
+			},
+		},
+
+		.root_cell = {
+			.name = "imx8qm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/*
+			 * vpci_irq_base not include base 32
+			 */
+			.vpci_irq_base = 53,
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x5f500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xfdb00000,
+			.virt_start = 0xfdb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* RAM2 */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
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
+
+	.stream_ids = {
+		0x11, 0x12, 0x13,
+	},
+};
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index a6efd37a..34dd7209 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -49,6 +49,7 @@
 #define JAILHOUSE_CON_TYPE_HSCIF	0x0006
 #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
+#define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1588154521-2897-2-git-send-email-peng.fan%40nxp.com.
