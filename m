Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7LW2GQMGQEEFCZ53A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE046909C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 08:03:08 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id z8-20020a056512370800b0041bf49128a9sf960950lfr.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Dec 2021 23:03:08 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638774187; cv=pass;
        d=google.com; s=arc-20160816;
        b=AXRNLZaimeBb97Kg9OWvg14/P/AgOkxa4HKKAp5M4dJIWbtb0a8AxBMSsRxY59H16l
         80h4krMZSgEAK2/E/QAPlke1fQmCCvURJYoApbEDlEgC/UJMMw3ybgUbmaeCUAfHyF2h
         2yXhCEgCAeHnUi6MP8SlAiKRWZDeKascv7wqPgDTknCvKWHccmn+AIpkR6Cn7lUeAMRH
         122H9eG7mUPY/ESAC+wAd+WdLLUeZ/UZpKdbHjPPafLfP65CU7ft77RXZPOmKlBHEhIc
         QbuwmAlAGktycKOeyOXHXM/hgPtwcIS1yndFbTonQJqgd6FIxNG+NWtgqrBrWp9ODbq9
         PJLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ljCyErlB4uzQXV87SvMIYEauxh7aH7ae/A+5UPqzxkM=;
        b=dAjtXSgauVRUJgvjsu4OKuR4kJKK9M+nN8ISC6c6pafFgioRfqzilBwRZFVv8mfZa9
         WaComSE+QuIDm9d/QCQh8s2LrouvET82FjxgLe8yQE9sOCpRRUMOqyuykL15z+4uBbe5
         Ur2n84utEN5AU7cj/BFUk6f8Ss1DNunPpJK4vcLA1eYtEnGEe7XGqTyeWMKi3iZ5vKJe
         SSBQtmB16wwtb8HzlsQGRWOY/Wt9HcAODxGs8Vg5VP6x72129VMN7Fe3hpOD+1Si98jM
         51hNo0FlJ8iKx4EMCOGa3mo7VEMmbqltsLfyB+8qzm9/O6TFEGnVMGF5XgaYJUPBfhi9
         G79A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XvTdx29o;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.5.71 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljCyErlB4uzQXV87SvMIYEauxh7aH7ae/A+5UPqzxkM=;
        b=j4PwrwZui9nYMUXfi9pYxicLSsgqOFm9RvFh2FWsr/rcIjo29R1JpbkJxlQlBO8vMV
         KkAOpyEO1nI6zj9i+u/M4y4iykc1sVUAjSfpDCX+v268eG+kgFBYbZFhwBzuhUC9Ds9c
         fnY5w2/W9MxXKGDEROp3DIKAg5+GM8QPXj/cSxQ8rofFaAYoGwBg3H8fDgEKHXkGagMU
         vyOAtX83r59ICMb8bjVszqaGV6pNaPFhu6JFAAoxkv5b9VsvZzbM7czjWLzywiLsXRz6
         p7ko3osW5ZgSA4F0/J0WCpaFvkuq/cpNPh9IFllMn0XQRr9+NIpWMBvtP106Gj5dS6li
         Y9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljCyErlB4uzQXV87SvMIYEauxh7aH7ae/A+5UPqzxkM=;
        b=KHV9l6Y2y/ONEqlEOAOFGqqiwlow6dOWEUaJ4/b3hoau1yyLD48VJxJQ2BWiMTKTWU
         iprC15EjUpOE9WPDiAtqfDOv8pS1fyoCRlWXgB/AZOJHOwzxLoqnnrpwYJMrqnjUzfmh
         EjMf0uOn3KXIZ5aGsCi8iSAaRdcJZbaQih8AhcK5nL9vwuXCcgwfOefSI6wAdNuABSiY
         VNu/wsaiYt0v//Xwr3BjvbiCzaZW1oi479aOf/49jhgR+l1aOIoF5tbpS32LoRtxHj2X
         O9Nxq6bKCh+cvY2Lbxbj2j9zBpf7wD8f/+zpEI0JPN21GHnzFc7gWI00umKCXIwc5+n8
         3g/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Dc71dBz6d/qZlY48JVJrtKklmW7wrPkf9C+H++seGDFCxiH6O
	HHBeFT/XM0w1HTudikQTrss=
X-Google-Smtp-Source: ABdhPJxYTtBpmqLZfMJh03fqbUb+5TTbtOVBAvjZ4i5UHoByUGUjPLS0zrJBZoZNhzWgb7XNa99LUA==
X-Received: by 2002:a05:6512:2351:: with SMTP id p17mr34289400lfu.243.1638774187691;
        Sun, 05 Dec 2021 23:03:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d9e:: with SMTP id k30ls293806lfv.1.gmail; Sun, 05
 Dec 2021 23:03:06 -0800 (PST)
X-Received: by 2002:a05:6512:38c4:: with SMTP id p4mr34512703lft.248.1638774186436;
        Sun, 05 Dec 2021 23:03:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638774186; cv=pass;
        d=google.com; s=arc-20160816;
        b=E/eUVgMdM6VN5vmsUDEo8VLw8J4SnsNFH19dwiDjxsg5iD+4tDv6RWzLWB1xhSjgCg
         rSoWctjktFixVn6m0x6sjRqObdJkS0ZweEsubMrgh/1ebYTV4v0el2hH9zY0t0dlcwef
         NiSbUQtQad56tbGJnjQa3qe5c2uthXu4QTxlmPPE9RWq8WAReAHbMVt72sES2fJVhUgC
         tymVKIxMaV5Ap4fpruuwha/iP2YY9RCHVY8gWSjlaPVaAC/LIHWLh3/GZlFGRl4PjOc3
         mDanYNFY9r20mtvTxRxXCC6X1eO0RjRPyWpeBAHiVgqJ38Zuts7GpHi5qGBCKra7sxzA
         qKYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=kJWtf0iC8QugyPkmcUiJPrGsoDdA1PHIWe5wirx8WtY=;
        b=eEabkVtwPmMPMl7PSEnF6XVLjF9sEy7+qXtjs4CVNEkMNxaAPy51xDSZ1HOwc2v+vV
         8U3r9GCa4Vw7tY890hzZZ+JSwAdwk1wsvcviWk9D3tCk9ekUMcHHD327opsdUruHirOh
         CZK74cryfhIrmOAbN/K3uxu1CmKnnPirxQQSa6h1E0FakyWfYWQrKvv1i96KK7h2J7nh
         Gvd+ZdXH92iFB4aBgyKuve+OOZWFmJulAPRCf+aRNUVQoUGqiPKddbJD8TLdjOfDs0YZ
         Vv8oawSp6nWzHt5id5Nuu2dDptjzD/BzlXQxSprYOx8zhPgfMByBO61rejEkHNp+De61
         VqPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XvTdx29o;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.5.71 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50071.outbound.protection.outlook.com. [40.107.5.71])
        by gmr-mx.google.com with ESMTPS id r15si455023ljp.1.2021.12.05.23.03.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Dec 2021 23:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.5.71 as permitted sender) client-ip=40.107.5.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnXmnJHZ9Fh0WkIAkt2i/TwRVUJIJnpQ49hcT22ihAoUrQEVf/u93iMZphdB7urlEkNpPt+VhQqPXowC7hi3nDlJOO28w55lcoXGj3wUcl6FP9eqA2g4QOLARDYZGjpYul/eYeLw5h0WjFg+tgUqm7T+thGM+6Kd+8DjYAB8ZT+Rm8MuPWVgf8DEVp+M15PeSq8/+tv/wWEk3NYfUeZONS/BgxFRgkS6uvGm5DhA7fLHagyp/DH8ZuFLj4dlPc+pQLW3dh2p9sgey6ZnJzCb3vSD8ZEN/IhVtZHeaQ4gbwlMh0YxN8aDARSblBb4ADTCa/uWSAZMEBRH6S90E17G4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJWtf0iC8QugyPkmcUiJPrGsoDdA1PHIWe5wirx8WtY=;
 b=fO8RMiyeNXD50EuJMIL/LU3SynL1Op64BSPWXepNabImjnLcIEth42dhBASiyRDwmkZfAVo7+ajolEo/y5uhUr6QprXTgvo/+ebP/DAAK5otz2hpBpWgC1YEJjg8+PMl+jESOwDP9ZEPOqCqJM/hO5rYEmxtwhzr6dZkJyzT2sXI/01CpwOCbyCa7OYQN9FurXU8ueUJx3O2wHp1eHRj9mBjUB1oaZ6PHmvl/PVcVcj74pd6y5y0JslEPTHA/NBtGf8TQXDDZKkBoF6P4l5VE0xRcz4mIovBJv4SnrpC+Vhpi1T9WKGAhm1u42YpkbWSeDZnhfLNPqgOcjGqknDxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB9PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:10:1db::23)
 by PAXPR10MB5435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 07:03:04 +0000
Received: from DB5EUR01FT051.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::8c) by DB9PR06CA0018.outlook.office365.com
 (2603:10a6:10:1db::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 07:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT051.mail.protection.outlook.com (10.152.5.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 07:03:04 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Dec 2021 08:03:03 +0100
Received: from [139.22.134.173] (139.22.134.173) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Dec 2021 08:03:03 +0100
Subject: Re: Jailhouse-image
To: Dirk Boris <dirkboris12@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <2e90b2d1-9f38-49cf-b639-d6379acac961n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <93d2b391-774f-5d68-ceb7-7e3ea3e8eb79@siemens.com>
Date: Mon, 6 Dec 2021 08:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2e90b2d1-9f38-49cf-b639-d6379acac961n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.134.173]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d533e855-6185-4fca-888f-08d9b88672e2
X-MS-TrafficTypeDiagnostic: PAXPR10MB5435:EE_
X-Microsoft-Antispam-PRVS: <PAXPR10MB5435AB5175087C1CE6BCD155956D9@PAXPR10MB5435.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gUsY8g2jgrhSGgUeWrB27DT1pCmF9akITYSW8900ea6otlxCvbDbHqCvwCmnUJ3YYzeTUy69cR8NWBlfqa2Us0WhbJWJ6RJlYBQzJG00Xe/AzzJNYq15t907xYgRLHdcvtVygbAEjaJetZ5r4c4wmSonoAuWDVJu6Q7kmr8hbQZq8UR6ZVcFgV8WAMEhLbBOBG8yvc3dW9XCsAdxVKA1vUW43OtmLX0GxACFUMdtWO7YeQCqRvUgVtOwoJK223oOwXmIkCiUHtz3itRq2WiZt1h/s/xBpvQyUPOV1lmoCqNEiQJqeXOU56t9g1ZomCWhUqcMn3h2S+RlOp0ngeHuUtOw7VFBRdCWyOU3f/4FVA8907giRBwzMN4v0Bl++qh1HVpiARvJFAZFkYVJW6kPLePgMNvB0p+L49Sxon+50Nj4Juo82iFW0Pt2rT7Iy7RCYNUdby+ShBEj6yaBGpkDOtLicyB6f9rMOnIBv5KwoeJxueg+4O5SakJmLO1BuGQ2+EqDMy7dHTJNp7ESGM4u9v9XeLbw5dpRqJ8gKbQVRFlFkz4oN0LlxBkid3JJb41jUf56Em9I8ahu7dcnv2XcctC6hpJoZwWKuh1JS3J7isf/75g0j5DX+1gh+RHK7d2mZOdb5k4M5UHaAcHpmHnfN/a/ZWb7GrKRJjDM9YN3WDkJkxiiSgG+RPXBXbmRZKGi9V6n9tVheq7p0FfAM3O9OzO3aMXhjmZ1KjcyPqg705uSA/wei+lirDtn/SIBUXfR3I9VpnG53o3qMZGpFZ0uOnkkP4YU4p5BPOY2CWRTAP92m7TGHv1jor9+/SWAPO8H+0B/FxgX2qgq5RBIqR/yki6Pm7YSbimPNk/yzP03COY=
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(83380400001)(2906002)(40460700001)(82310400004)(31686004)(16526019)(36756003)(82960400001)(16576012)(70206006)(8936002)(53546011)(336012)(8676002)(86362001)(186003)(956004)(2616005)(6666004)(498600001)(26005)(36860700001)(110136005)(5660300002)(6706004)(70586007)(3480700007)(356005)(47076005)(81166007)(44832011)(31696002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 07:03:04.1431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d533e855-6185-4fca-888f-08d9b88672e2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT051.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5435
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=XvTdx29o;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.5.71 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.12.21 13:36, Dirk Boris wrote:
> Hello,
> I am trying to build a jailhouse-enabled image for Raspberry Pi4. I am
> encountering this error:
>=20
> Preparing to unpack .../73-wpasupplicant_2%3a2.9.0-21_arm64.deb ...
> Unpacking wpasupplicant (2:2.9.0-21) ...
> Errors were encountered while processing:
> =C2=A0/tmp/apt-dpkg-install-QpxilU/67-rpi-firmware-brcm80211_1.0_arm64.de=
b
> E: Sub-process /usr/bin/dpkg returned an error code (1)
> WARNING: exit code 100 from a shell command.
>=20
>=20
> ERROR: Logfile of failure stored in:
> /work/build/tmp/work/jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/=
temp/log.do_rootfs_install.73
> ERROR: Task
> (mc:rpi4-jailhouse-demo:/repo/recipes-core/images/demo-image.bb:do_rootfs=
_install)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 139 tasks of which 138 didn't need to be
> rerun and 1 failed.
>=20
> Summary: 1 task failed:
> =C2=A0
> mc:rpi4-jailhouse-demo:/repo/recipes-core/images/demo-image.bb:do_rootfs_=
install
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 2021-12-05 12:30:19 - ERROR=C2=A0=C2=A0=C2=A0 - Command returned non-zero=
 exit status 1
>=20
> As I understand, a docker is required, so I installed docker, added user
> to the group and ran ./build-images.sh without root. So, I would really
> appreciate any help.
>=20

I suppose you were bitten by the issue that was only fixed in 'next' so
far. Now it's also in master, please retry.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/93d2b391-774f-5d68-ceb7-7e3ea3e8eb79%40siemens.com.
