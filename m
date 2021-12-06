Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM5MXCGQMGQEXBTV2PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD046978C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 14:54:59 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id n16-20020a05600c3b9000b003331973fdbbsf4483193wms.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 05:54:59 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638798899; cv=pass;
        d=google.com; s=arc-20160816;
        b=DLkPzS/HrEIKtsQhnZm3td6ZfGjphJlgqAumUTGE/Zcl1sZ+V7t8f9KvGzS/AFZfJx
         DXZ1cFUlxC5KJm1jh4n/1Cl3PfFEt1VAtsZ1y3wT0KikZwzdEyfEV8d3Oz4Pv4q6tAq/
         JcDPiiMb+UVrlGfltaaHjSiJ0lq/9i99JdpRQgJ79wX6uywr/CQpLZZ4VZJGoytOKJ84
         bJf7b3roMiiFYKuVGiSGy8pnVlgGO2Ng1MI3Arj/CCwAaR+qAVPuOlXmrYTsDoIfxw63
         LvTn5rQObktKlbS0iU3lQf11tNNT5Fq9P/HT0KLdS9o4wb6sPMsDC5BdhJtCO5A9Xa1d
         ofzQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=6GpCDUSvbyHogAQ6QmakaVvoft1sS+D2TOxE2w0yaMk=;
        b=IEJ0WDk6H2jBXJeQKgc26vPWdCnS/ebA9Ta/Sg4ibqzL7vwfqWcJrnYtkfDu1B5RwM
         tCStpIrAtv1qLP8gwRZ9IRJQZHNFlcTuR1vaZewXakYKetNJNwZ6bZTXmsWHXpnQBBag
         FiJPK/ZRrtRr7/Tvj1mbV7miRAZ8Iag10O9ccJ1zrqVaPLGomGW23DZ4vQ8RVPgJ99Y0
         RaPV2zzOwoQcxD25aWPGSAIzJPnML3aCAHtEOpV/UlDgmsOVKg/nPUsnqvQmtFhMF5JJ
         Wgii55/pOb65d81oNDjqbOM7hfVMO8v126ZfhiRhqWtBKBSPw6g27/T/9PjPElWTlF0b
         RoZQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=PtJhPbYI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6GpCDUSvbyHogAQ6QmakaVvoft1sS+D2TOxE2w0yaMk=;
        b=K3NDwTY+8/4jQqdQ9+7KCVyIzXcnSWprWYGksDFb9rO/By6XBRNzLzbUsSjI3k2RTm
         dwzGZvph4CaYBBmom4A6bgaiZCnnqch11z/R2FqNHjytXJpjGB7x0ekWJGi0uf9NX2np
         Abw6L4UrEFX1yG/a1Rd+woMsbHdubI4hZFY+0Glirc+ybrKkLIcWrrsye7apd9Oj201D
         eq83j8Q7eR31z5WhkLifcRAwKdxWw4iE7iM0Wmwst6NwGcnu6TXmgeRXgYsigiF3O+os
         HNpR+neOMZj0Vj976gZwAh4l/+w5FHx5IvXzXqB5VxxbplzEt7GYQU3ZLOb+kyP/8kTL
         AwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6GpCDUSvbyHogAQ6QmakaVvoft1sS+D2TOxE2w0yaMk=;
        b=2VFPw0OwXx8rwK0UxPyVRgDCi9x1HZV34mwyZNFtH4dcHEXV9Qp10fDIE5uSiufR+t
         DAPovQjGah9YoVlqZdxeFv7AEIkfesDaSR1hOTvtjxZ8sMdtOXxmNFaM3eevnIV+Ayhw
         ilBKT1rId6awDnF4wSq+Al9rgk3G2Z9LxBOGvcNFtSmrxe8W1CWqHp746h0brpTrSJtF
         V/PWMyAiJJ1NvXSSfuWKmcZ5sOJjNPFtHdD2ns3sfLw/xrLbQhWXxmoBdslF42jFUvyA
         SGE2r42eow2/GSWeF58UUHYFXBFykDcnd6b6Dk2QWwarZzveoDolM19QWeWpxt4ZADUu
         XI6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532s3A3go8BKJoEsy0NPmPXNFjIkTydFbiIxCSKPW5SdXKgF6sz6
	/rsTPeJs89JvzEVbBDBXzQU=
X-Google-Smtp-Source: ABdhPJy8Rm3Ikfgvw2DN0xADmCNdHX+iRkCoWbJAqBVl+oECSBdVLjWNj424XwfThFJWkTbT5eXDww==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr43118611wrz.545.1638798899614;
        Mon, 06 Dec 2021 05:54:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe0b:: with SMTP id n11ls1065546wrr.0.gmail; Mon, 06 Dec
 2021 05:54:58 -0800 (PST)
X-Received: by 2002:a5d:604a:: with SMTP id j10mr42787403wrt.93.1638798898663;
        Mon, 06 Dec 2021 05:54:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638798898; cv=pass;
        d=google.com; s=arc-20160816;
        b=nDTw3GVjtsNof+VR59dO9oKcf0J0lbFZFmMoLWfo0sLhLcrNNhKtTgBnrqtnxhXDvM
         6VjdalBXcJTrDhJCnN4Bdh3j0oblipp7SzWIb1OVIPbhh7fu2/kpMNWr3t+Z7lV8AkuW
         oWtAXJHkdbzP7q8nEXGzCI0DMDeLx2Np77aosaqPnYe59B33m/go9/S2Tq6o7PBQ/Rm9
         nhbul41shsa3bJG+wgu4yYjqKjo0Glvzm7kpeK8IfFbYfmukIlrn93LQTd4BYmVaMVOJ
         fPL/h7UPbNTgMVnWJxS93N1lZ2bGGjYEgeZDeIfRCtNnUdR9DdzpXzwb4b4/+tVooHMr
         Y+pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=tNQgYoeWkz0GYbRbiFiyBOsp3Yd7sacIl5pvi8oTNFg=;
        b=GhPpFnSzWtuMrLXVoKWR5OsoSFW/s0e0S3OQlbN64GrR3jvwsFDfb3iOYnuGbcxoAF
         N04hiA+Vravy/i2qPWY/vCgbDdkXo8BdBstTMO5u4j4vExdx+8WV8oZq9Kd2x32XySle
         W3ZGDuqJUwpDUaN+PZwXEARSsjAmDkOqU7OPnZvGzIMucqiw+as3TfDwBB0qZGUZAUMg
         RLZmXinYuWralWrEotB3xhgYgrn16JAv1hu16ykTVK9jQYPD4/e4+iXfMdR3WMcnM5Av
         ciZJKMiiE4E0s50Qc1mDHMpDoFbD9E4ch921GCHX+859SZQnnCsR0CbY7bLK9OmoaLup
         niFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=PtJhPbYI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70042.outbound.protection.outlook.com. [40.107.7.42])
        by gmr-mx.google.com with ESMTPS id 138si802835wme.0.2021.12.06.05.54.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) client-ip=40.107.7.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlQJEB4wQq08O59fZJroYYjYSHnbckk3z9lJQjO3ccZlfu0jYM8UrU59RDQF+owcyuARSDjlBT3Rgmr38ra0sC4CaaXtSItwXD6VV9svIzWpRFYo3HdyjKZr8idOqgc0pZejtZC7HXb0pGXp6Pwz3ybEJiENeD1A5+yezzj3Yo2Gj5DIdluArSKMrii10ZWCNxFp3mALW59T8cae2aYuSzMPGD5GXfG2KimThFo48ElQUTqpstrPKyiG65PGVGOYvCEyhljJ/HoMHrmoUoU8MwabAsFhBFmuR86p4oWZeqkh4E+Pwrqe8suIvmMjyaj2L0ro+PePSpCEJVW3YY65qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNQgYoeWkz0GYbRbiFiyBOsp3Yd7sacIl5pvi8oTNFg=;
 b=dx7eDLtAoGOTlbQO3U9aXnEx4bHS3o8OBWS6d2j1DBGyALrjVVQZPoMlmoWsH6fVNiyBV3Mpvn9tIn9RU6dDz8ZPBa9PwcwS86cLux12jTNjuiwFJwTu1lawuL5YKMyH8eaU267xepChuengCE0e/IYin38Agpg+O25qGnjvhFarMsLZ+lSoQYfh67gse3lAtOC6SJZUszdmxDjpl1VMEJbh/RA6+U2s5i1q0erqBfsw3opTmHbjBp57P7ueyxnqmZmcxifK3H677PyHKyzQ8MqIXFTqIgz48H41Kxfi3SBsb8wuCcqxkFuWahjrG+UK5Vi7D1Z5m2g7M1Aik32foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=binary-kitchen.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::22)
 by DBAPR10MB4266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:54:57 +0000
Received: from VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::9f) by FR0P281CA0017.outlook.office365.com
 (2603:10a6:d10:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Mon, 6 Dec 2021 13:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT035.mail.protection.outlook.com (10.152.2.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 13:54:57 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Dec 2021 14:54:56 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 14:54:56 +0100
Subject: Re: [PATCH v2] configs: x86: qemu: Add an extra variant for AMD
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: <meep@binary-kitchen.de>
References: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
 <c18c7102-1368-7a84-9ebe-a1cc730e85c6@siemens.com>
Message-ID: <91187804-a222-cfe1-a2a2-f1c54ea8ef24@siemens.com>
Date: Mon, 6 Dec 2021 14:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c18c7102-1368-7a84-9ebe-a1cc730e85c6@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee2986cd-98fa-486c-f5e3-08d9b8bffd05
X-MS-TrafficTypeDiagnostic: DBAPR10MB4266:EE_
X-Microsoft-Antispam-PRVS: <DBAPR10MB4266F075F95C7756C66083FE956D9@DBAPR10MB4266.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltLZ4m9+LrlhohQrUvB3iIjaNNAExr59s58xm6xl1Y/Y+ilWAp0aeV3Pyju0K6iJTnXKQXerHED/68CAKmA5FNG+ZY1eXCRLUbEsb4W4M1UoBQeaIwC5Kw4utl5JbmXcNL/uscmI+R0+kC9A2WylGC1VQ35qo3yyIH3hxQ6tu2akKCPIX3TazdVV79uIJseo3QTY2o3sGTPVlu8fbw2QCkwlGQ4SVCCLKJYfHBE1vP+d75NYMZBybXb5Mr702X1CrdZO/AIZsssMbUXnsfF4wKlL34Y5GAEmJnF2HgI1C2OYplaFQ56UddDFlND81gUOv2USusp6bHbT2dmFpP2htK1QPAjqDUhG0x9tkdkTezzBoogM69JS672zv8L8Tmn45b37iz37ubeCp2qtbsrKH+XZgRboM+4jWhZh1oy48VFJeAxD6BAPhGOoJy8SjiLUdTs+rR5Llnf3nvU4LYeQ4xqtmhlHhVjqSYAscnSr3fPUAjjb4cH3pL38CgK5WI9P9PXiWyL+UCxl0TFBNCv+Nhofh/Rmrpje401SK7l6FFY1mFpSt0oDM/1KFkMTol73bFOxOnMFrR5DRO2W52ONGUOCKxeFXepbq4IwlnCI0k1FFmMWoG9AhuDIXF4TBGAFfx4MhLsPxp4XcEJnDXIMj1Is47i4Cc52Ehi1wvdazxFNP/dNkwTPe/hm9qQf/XRkjcWbb1ESNqeuG/FMPIbI5dsqTUV4zHwu9Rh7lMyeg2RO3zWhUXEtM7YgdvQCQKwwyHOOW5DtT9HFyVL5VC5shtGtDetP4Jps4b04mZtJhFQjNx5fBFMsGiAz1ioUtr9ZKo19V0Wch/iWkk8OzG3Kswq4RG+PNmlxAIatVVfcyKU=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(44832011)(82960400001)(82310400004)(5660300002)(31686004)(356005)(31696002)(110136005)(53546011)(16576012)(81166007)(86362001)(316002)(47076005)(26005)(6706004)(508600001)(70586007)(4326008)(36756003)(8936002)(2616005)(956004)(8676002)(186003)(16526019)(83380400001)(70206006)(2906002)(336012)(40460700001)(36860700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:54:57.2301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2986cd-98fa-486c-f5e3-08d9b8bffd05
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4266
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=PtJhPbYI;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.7.42 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 06.12.21 14:41, Jan Kiszka wrote:
> On 06.12.21 14:34, Ralf Ramsauer wrote:
>> If we want to use the qemu-x86.c on AMD platforms, we must not define
>> Intel IOMMU units. Build an extra variant for AMD platforms.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  README.md              |  8 ++++++--
>>  configs/Makefile       | 11 +++++++++++
>>  configs/x86/qemu-x86.c |  2 ++
>>  3 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index f1b0cbe3..ac457119 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -288,11 +288,15 @@ installation steps.
>>  The Jailhouse QEMU cell config will block use of the serial port by the guest
>>  OS, so make sure that the guest kernel command line does NOT have its console
>>  set to log to the serial port (ie remove any 'console=ttyS0' arguments from the
>> -grub config). Reboot the guest and load jailhouse.ko. Then enable Jailhouse
>> -like this:
>> +grub config). Reboot the guest and load jailhouse.ko. On Intel x86 platforms,
>> +enable Jailhouse like this:
>>  
>>      jailhouse enable /path/to/qemu-x86.cell
>>  
>> +On AMD platforms, use:
>> +
>> +    jailhouse enable /path/to/qemu-x86-amd.cell
>> +
>>  Next you can create a cell with a demonstration application as follows:
>>  
>>      jailhouse cell create /path/to/apic-demo.cell
>> diff --git a/configs/Makefile b/configs/Makefile
>> index 327043b7..5af0647a 100644
>> --- a/configs/Makefile
>> +++ b/configs/Makefile
>> @@ -28,6 +28,17 @@ OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
>>  CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
>>  
>>  always-y := $(CONFIGS:.c=.cell)
>> +ifeq ($(SRCARCH),x86)
>> +	always-y += x86/qemu-x86-amd.cell
>> +	targets += x86/qemu-x86-amd.o
>> +endif
>> +
>> +$(obj)/x86/qemu-x86-amd.cell: $(obj)/x86/qemu-x86-amd.o
>> +
>> +$(obj)/x86/qemu-x86-amd.o: $(obj)/x86/qemu-x86.c FORCE
>> +	$(call if_changed,cc_o_c)
>> +
>> +CFLAGS_x86/qemu-x86-amd.o += -D__IS_AMD
>>  
>>  targets += $(CONFIGS:.c=.o) $(CONFIGS:.c=.cell)
>>  
>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>> index 9ca5c528..3f8f673b 100644
>> --- a/configs/x86/qemu-x86.c
>> +++ b/configs/x86/qemu-x86.c
>> @@ -45,6 +45,7 @@ struct {
>>  		.platform_info = {
>>  			.pci_mmconfig_base = 0xb0000000,
>>  			.pci_mmconfig_end_bus = 0xff,
>> +#ifndef __IS_AMD
>>  			.iommu_units = {
>>  				{
>>  					.type = JAILHOUSE_IOMMU_INTEL,
>> @@ -52,6 +53,7 @@ struct {
>>  					.size = 0x1000,
>>  				},
>>  			},
>> +#endif /* !__IS_AMD */
> 
> Nope, please not. Rather enable the AMD IOMMU in a separate AMD config
> (common inclusion would be fine). Will require some tuning of the QEMU
> command line, and we may also have to think about what to do with SMI
> blocking which is demanded by Jailhouse but not emulated by QEMU. The
> rest is supposed to work, though.
> 

And that would likely reduce the number of

$ git grep HACK hypervisor/

noteworthy.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/91187804-a222-cfe1-a2a2-f1c54ea8ef24%40siemens.com.
