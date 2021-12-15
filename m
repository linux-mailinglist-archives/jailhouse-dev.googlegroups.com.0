Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5XJ42GQMGQENV3TWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940A475525
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Dec 2021 10:27:20 +0100 (CET)
Received: by mail-il1-x138.google.com with SMTP id j1-20020a056e02154100b002a181a1ce89sf20029957ilu.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Dec 2021 01:27:20 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1639560439; cv=pass;
        d=google.com; s=arc-20160816;
        b=udu6eRtRaTHQtGAzzRM4ibpvJttn9hVNIs4x/cu1ecRCeYxtneBq5h4wnBfOh4o2OH
         bYKWzlmsn/fSxBqFc8yeosx9WQD6CImPDhjhPWT0wxL6rM9+bAsWOJgvlgLez0F5mRg6
         dfNNt/wuCc0lumQqDxjyRcae0a4YB3FSMJ8whWuM38Ybdv/uqXPkJ2kIIlNL9rQ339EK
         POZl+wSElu0VnNfECGUF1D/iJk4/SANUunBScYkg2cSRe3gltS5N18qJow1xyaHadlSu
         94I35Mb2O4TR+lvKoEqXaNp8Qz2vSeSu/ccs0NHQh9OeYR1tXbc8f0n5viXlKaCEQdxL
         RBTQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=FILF3uNjMpIkGyZN9bKd3sY+8o8OYalGVx+dwKD/D7A=;
        b=ckJYBPT8X/u8r4UsLqtNkMwO+Cb0AB+yAPk86jXBeScKJ30OGBNWnmRAAxlWr6TCFw
         DWK5Gczgbas8kEloguAmE0FE+p4VlB0xY1nBIa+N2c1nD9rTJsr6yJMRVpBSs3pZ8eei
         O4Yue1TPS6iXc8np/LC6BlyCJYG+A0u8F0Rd3wC1SJa+Lo7XkcGwZkKxuIK8G8PvBAzR
         ma0eoJN5L5qvsmhGx5kgstyR5SLTOc7tV4gitCC9UmocNHNhleXUdhC+hUvzKJL2AFTW
         MVO0SwN1Y/NKMfhjIY2FXmtCUWWB3qXQNmdaHUeeJqErhHsqd78TdkxLrmpkmrrXtrxB
         LI+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=eT+DqR45;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.4.46 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FILF3uNjMpIkGyZN9bKd3sY+8o8OYalGVx+dwKD/D7A=;
        b=K3af0JT2glVlJCuSs86ML2Vw35gw470X+cHD40HdZSeltEcmEKH+YflPxN3YHEMVVC
         RSPISUGeWIE7e2SllO0hh/Y3pImJ2W/nAdJKPyZ7q4r9YKs27O0xNNwnIySPwP3o3zuo
         oa9c83nLzcgQMeCEnEJNiRdQrmSR4HmsWuYSgrxsnPNLXk4qfaRY9XdETWkjFTmZRrs5
         hlh1eR/Jy/Xd4ZRAcpIZEp8/vnToHm+GYe4vEzJmpQUtz4MCxu+H5SuKE/Do7ncXQ7jT
         tUm0UbaX4gqnFRQ2QsnSKVYcSFQJUWT8ZFgIN5c324lu1jlP8KSXfOlg6mc25/Bb4F3g
         99Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FILF3uNjMpIkGyZN9bKd3sY+8o8OYalGVx+dwKD/D7A=;
        b=Ka+jSdAWx+vnkROWWmf3bq8YB/xPJjEKtXwcXYZIKdOIv0Oe56ZiGWta2TKkGFrl/S
         /tVJqYp/DQrtrr+qfIszk5utaSqhtrEM8WgyS+CNQMRA46TCUZf/8+G61eAc4temJCFF
         akf2kKXZZT8Rh30KlPxh7c5vJyMr6t7ver8/ybJ2H8knHDlKs2vH6Hf/PXfSDpqOjVJ1
         Hp5k9PIZpzxWN+KoPL/Qh92gAc/wsWPBAFQiM0Pm+AWIzV4915QE6rGQirLTXPAte+JM
         JSxFympz0X9rmfLZLBYMa0/UARRdUPb/p8C9MqDYb2yHQUDgyKQ/RLoCFHrNTgdupraO
         F/aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gC/OUhYrfAAIYgcfaklUQGpy1eEV8i1Mw6ZAcMv1hsRWQ/0ET
	FGn2wKK5CNx9iB8Xa/zfXjw=
X-Google-Smtp-Source: ABdhPJzF2IiKZYy1HDkMfOwNOhcoGlWaQwmoWaZG49fRyEkqDVMw6adiedegxY+bb+qO1TBe+Q503g==
X-Received: by 2002:a05:6638:1481:: with SMTP id j1mr5435057jak.59.1639560438735;
        Wed, 15 Dec 2021 01:27:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:8588:: with SMTP id f8ls137305ioj.0.gmail; Wed, 15 Dec
 2021 01:27:18 -0800 (PST)
X-Received: by 2002:a6b:d804:: with SMTP id y4mr6042169iob.184.1639560438138;
        Wed, 15 Dec 2021 01:27:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1639560438; cv=pass;
        d=google.com; s=arc-20160816;
        b=D9KhpYR3HGFB/XO1QneonenV/siIjL4A6EEtwja903T5+ZGpQWOUgIgjIn6uh5vhnR
         yKIQRfvc723H6T/SmTtKk4BcpcLEOhESZJYnnsj+V4x9DyEmCugEOHy5T7IR/WQtZJs5
         HLVZ9+ZIK1j3QvtwTTMqal7tUO7qHJK2v6PPa3tuBjM8PTyW+6WKFGIfY8Tp/0e/e09I
         CWdVbBvqxzMt4gKDxeRImDN+GwE1fL3MsWTtQ8pZ8Pq1TLCgVQb6vy2ikYkjwfS/sk9O
         I63wTn0HHtsGC9ZCKDFolpxxLDdTieA61CbGPRl8yBOiKaSb8nh3OKAKiVXoUcVUXO78
         eUYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Vf5/lf/og4O/6CMhXJDk+g/7bWQX0u3csKAC0TWvB7c=;
        b=rFEQK63Q5hGJuOEJ5nOAgkmKuvn97j895d/lcb+D9VgWTuCuyGFgHiNdMyRf69Tggi
         4B/SyoghBIXYuApLwi/D13nVdF/E+jBUE/bGgyJrw1TduqMvFj8kBHBZ+NbQpQzUz95L
         XQWsHyM32iOZgRJaG9jJXGPXLRQpTZRFi1s1S0QkTztUDalTytD3Ld6XpZ4GlYrWwP4U
         FzOvwjq2qrshbTvTiPS9jCWh5kO+a4r5PK+HDmpJccdMIVSZ4BNO+cHw8HykxDRJxNq0
         0roa33nQp7BZsmVvXP5hW1Hu7kq6dSbLymXoM0Ff5QFoyRyjxNQCw1wAqYnAQc/LPquu
         YZIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=eT+DqR45;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.4.46 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40046.outbound.protection.outlook.com. [40.107.4.46])
        by gmr-mx.google.com with ESMTPS id 8926c6da1cb9f-2faa6b53fc6si248324173.7.2021.12.15.01.27.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Dec 2021 01:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.4.46 as permitted sender) client-ip=40.107.4.46;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMp/T16dRBOLr3mH8TqYsh15/bF6FsH7C/uvYBWz3Woxklh+AQIMSztKGeXEWd+CTjDd8ojVUK7eedTq4awFqigRSN3uUz2TReW7DMFkbCQ8XCsRHBd8p+F/PWk+BPfauZnZqtyU2AYC/JK6krI5hzVPa3y1DwcTW/9NpchnEck6w3FuPiKdXO/nluW36sjKhEpg1JuYB3Rm3Pe6JtnSjFju66wuipPgCKG/v7BE9uizFS9odT4zoA3LdxLia9O3p4mO7tivLeV5krRAgmnBuypH/kXKn3ZgYMzbpR4TJLn5poHQGlydH2HKCzGhVCbokRy8OYmuSLrPtSaid2XKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf5/lf/og4O/6CMhXJDk+g/7bWQX0u3csKAC0TWvB7c=;
 b=HC29DkogvH+glEVMj/vjA4g5EysmbqHEN3muLWkK3DL3V2Pqc4rwHabMGgjxtcltnKUwr9V61H6KuA8YSeWiFcvK7Sa3PAmAcH7KD+H+c/1e2w659Rme23yzP5Z2F8C/zhEqNumh4dOxTeSjeOUsLfwvJCCmmesPxprGZ4DBbDToJbeAt9+fHHTkL6playpssvXISeDiVuNY4HBH8deUvYZKqa2OdLEb4xud30BCPSKQKFXN1V9ZsK3i3ot9JuIr27Y7qeEU0ara03gJFpoH1YmZuUCWQzDkc7nQUf28Ewua0J1oD7GABct0Y7MxaQOCKWegOjUzTKFcplfZFFJ84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0046.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::15)
 by VI1PR10MB2080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 09:27:16 +0000
Received: from HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::48) by SV0P279CA0046.outlook.office365.com
 (2603:10a6:f10:13::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Wed, 15 Dec 2021 09:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT034.mail.protection.outlook.com (10.152.0.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Wed, 15 Dec 2021 09:27:15 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Dec 2021 10:27:14 +0100
Received: from [167.87.1.63] (167.87.1.63) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 10:27:13 +0100
Subject: Re: Help Needed Regarding Virtio IVSHMEM
To: Anmol <anmol.karan123@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
Date: Wed, 15 Dec 2021 10:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.1.63]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54081591-0d85-43f8-6306-08d9bfad1563
X-MS-TrafficTypeDiagnostic: VI1PR10MB2080:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB20804C0FC2E62822D9B9506A95769@VI1PR10MB2080.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0jdZsToOYA0foeU62zFq4SLWfE6i9EojWzUkVwkhIs8TjobPCRU5yopWRJYdBIxMPCim4wT5aWjVls9wwSHTWN2t9CtwzkcA6DxnOqVK9hohwGd3yipwYmc0XgVHf/MJz5bsWHZet60VWMzJ09P80zg6EyvgdOo3HJFTl6gi5Yt+VhM5d2aNG9C6PoOFOTuPbMXKzezLX4l/tBrW3zIhyqefBIoC9OD78oCjUp36rAUR4DHe4n1GdAcuv1E8+TZplnig+UjFbZj9j7YE1QAcVN+xi4PlgAvfAZE2V17Xtcj6U8Cv9Azu5ffOw9I2zzlDa5sM2ON/7+z9/QnYgxWTJPUzbqw4tMWyMXWFaaZ1ONzcXgnYIq6Y9HOQZ1oWcOS5pp+skbdIU83WHgLIPq0bud60KDUc7oaElkWiSZum3VAe6yQbxgPc4DmXzG1Z+EKhkq0KdZtzWyGFPpvyFa9NaHRQyg3lYR54CFbL31bdSiqVdBm1+U35Gw/hs9I9/xQ7j0sogXVRvoMcdiSYJK8+dVSwIzhO74S0WlgvfN+gx68OI01Gh6BiORXxQ4XpwW9KpeiNsJInPOiVJ/UCd9kLNgz6QomuAazxGe1cWV2yVlqm6KtxbOewC0SVN+7H6dXTp8XAeT5v4EUM93afQd1f5v6NYpR24q+xI273vV+w+S8dmhrL0boDEgEF4tipRryKDlrJ+yys6Szod2dfWfknRTu/gD4HzikEnho+G5TZ4J7N2m5DDE5fAXLmGncQSH132xpNl4Chcctzaj7VbuL0+Qw9bkqmrB5lxIVQAJ3ShYLKAWLHTYAI/KrDZBAJx9ZbbgcYd9elBUShyuyNXGKQHlazTHso8VMXp5GB2+eahs=
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(8936002)(86362001)(31696002)(110136005)(16576012)(44832011)(316002)(40460700001)(82310400004)(6706004)(2906002)(82960400001)(5660300002)(8676002)(336012)(81166007)(16526019)(186003)(508600001)(83380400001)(26005)(47076005)(956004)(36860700001)(53546011)(2616005)(31686004)(356005)(70586007)(70206006)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 09:27:15.7937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54081591-0d85-43f8-6306-08d9bfad1563
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2080
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=eT+DqR45;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.4.46 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.12.21 16:48, Anmol wrote:
> Hi,
>=20
> I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(arm64)
> board.
>=20
> Things I have prepared/setup:
> -> Collected the patches of virtio-ivshmem from `queues/jailhouse-5.14`
> and applied them to the `xilinx_rebase_v5.4`.
>=20
> These patches includes:
> =C2=A0- uio: Enable read-only mappings (with some modifications, as xilin=
x
> `renamed uio.c -> uio_core.c & unified into uio.ko`)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-ivshmem-Add-header-file
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-virtio-Add-virtio-over-ivshmem-transpor=
t-driver
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-uio-Add-driver-for-inter-VM-shared-memo=
ry-device
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-tools-Add-virtio-ivshmem-console-demo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-tools-Add-virtio-ivshmem-block-demo
> =C2=A0- virtio: ivshmem: check peer_state early
>=20
> -> Cross-Compiled `virtio-ivshmem-{console, block}`.
> -> Added common shared PCI devices to the root and non-root cell.
> -> Root cell contains (`uio_ivshmem` driver)
> -> I can see `/dev/uio0`.
> -> Non-root cells contain (contain `virtio_ivshmem`).
>=20
> -> Also, after loading the jailhouse it's showing PCI devices I have adde=
d:
>=20
> ```
> Adding virtual PCI device 00:0c.0 to cell "ZynqMP-ZCU102"
> Adding virtual PCI device 00:0d.0 to cell "ZynqMP-ZCU102"
>=20
> ```
>=20
> After testing it, I am getting this(even after cross compiling the
> application):,
>=20
> root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
> -sh: ./virtio-ivshmem-console: cannot execute binary file: Exec format er=
ror
>=20
> I am a little confused here, please let me know about anything I am missi=
ng.
>=20

Double-check with "file virtio-ivshmem-console" if that binary is really
of the right type. Also use "ldd virtio-ivshmem-console" on the target
to see if it lacks some dependencies there (due to mismatch in toolchains).

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
jailhouse-dev/7a34f1dd-243c-2df1-4bfa-b2b86faac8d9%40siemens.com.
