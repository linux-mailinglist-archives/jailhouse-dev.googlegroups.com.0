Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3GEUOJQMGQEPSJSBRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4BD511125
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 08:27:57 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id hr35-20020a1709073fa300b006f3647cd980sf548065ejc.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 23:27:57 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651040877; cv=pass;
        d=google.com; s=arc-20160816;
        b=RK4z/Ql+RomG2zGqmrGn1+/iGvaV7Di3n2f2cyhKkZMDx+4qHmwVXTTdXl3EanhmOk
         Jtt5Q/HRaDBpyLQgcKfUfaD54Cz+0KzzfbcYbyCOcRcwiZTufrYgR4vVTl9L2vgecCXQ
         djrSV9yfXdvLNZWFoN+y/tlyODIrJ40FQZ5LNbzdKm+Ci0LbmaJmQYSYJ8sz2cDJrWB9
         ZGovy2i7/AatzZCU021MMpwvXS2b+ie7/HPpmj8Ee5oHCfwXvknh2oflxiyTAH4Drxm4
         hpvexnoKuloUZ+PNhOMUKc9oE/zXkvkA/cdyNpRXkb1PDyxOWqkVErUkALBE/99VBSxp
         9jBw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=PIx0dG05/+a6N6cdT1Ws86uNDlCgqm8dhfCSHQO08w4=;
        b=gDcUL9f1+evK6RsdDyEZdCnBK0SQI99V99EJVyDLJOMnDq+hn2Y3n5Evc85u3Gehfk
         Xld/ih6QKe6A3qcelyJZ8eVst4v0/j8/slT+XNEbxn5m6bjRpTpzNE2QyPzVDfiQDZ0T
         4pgxKZiTJKwpJZ4232U8KuaUgbuVqi8pkFmiGUDe+/0xQfioaEKxzTgnAhNx8I6/J3ck
         JlBCxlxPlKRyuK/kR+4OMX2cKjeEF7ekktqotUU7UNiSJeT2+LYbihEOpTWUoukU9neK
         HzHRLlVsvBXPoehK/nEnhoS/zTg1vtMRwRo4Ni9XQQOS7a7P0+RHdoYR+i7eVLZehb1a
         vMGA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kW6K7fB3;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PIx0dG05/+a6N6cdT1Ws86uNDlCgqm8dhfCSHQO08w4=;
        b=YaZvu44SnUfasrUaKe9UsSb7Q6F78hIUV6rRN+sukHaTAA2Xn4hJuDapxGRueCAL7x
         p6cNPMCZEKfwnTF+SSxOZgOJxQEggWbWS8CdBSMkh4jfYTB9hkYUmV4Sv3fRk2qcc6ln
         n+GzPoeOUdBxdytTjiLhCaincvkiQ+q2icIMxKes3ZQJgneEyv0wh0pT1hSMU0E60mBU
         mjYugyJh4rI2i4um57d6DynofISjTgc03fFHznSMCmRSjmD2SWL4qmYKg3OMdbCr2Yvl
         Cq6ouhBEk2H19s2e8pB/zrJKV3BBgxtxxLl4c0IQ8ogNCJZzcGS7N2SQ/gm+Vas8U84x
         JRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PIx0dG05/+a6N6cdT1Ws86uNDlCgqm8dhfCSHQO08w4=;
        b=0b2xuxRHuO0EVjooWf+aPAhAqZYhuFVPAH1L1P5TTNLHCXNIGfnX46/TTtQt86221p
         uxTLnBpJmm3E0uxHZJ7icZqG12SaKPA9tJdRbtzuz5abGxv4f0HO7CuAbnnIcL5CYU06
         wFjDrqcBGFxZoliCHTXlN/e0TNhx7SuMABdHcIA/UzGzyVlphPOlR1HTpGStjIVmx070
         4f7obbswKEGzKoj6EH4fXhBmt/B/lduXO/9DQLwzaG7SRhQ2fx7FGtW5ciGhsilIxR/w
         L7Z1Ae6OxoOqmoDWQbRNaxg7jqFsYTbcjsOx1fWgcY7uglTDNlSYU1azZ3cAXqG5ZDMs
         1zzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532MdoMcdXa9DUhk05Dngcw9jMmszRs8z5Uh/SZe+ENAfdg7/r03
	yMTmjs1kQPnkZTbhDCJZgGM=
X-Google-Smtp-Source: ABdhPJwk2brzj9M6RAiZHp37M/7tChcpCymh/1KYKtw5OZR7wj5NZsW9EoXRz2rb+Gt73yZAtrxoUQ==
X-Received: by 2002:a17:906:d555:b0:6da:ac8c:f66b with SMTP id cr21-20020a170906d55500b006daac8cf66bmr24728949ejc.107.1651040877111;
        Tue, 26 Apr 2022 23:27:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:274f:b0:6d6:e53e:993f with SMTP id
 a15-20020a170906274f00b006d6e53e993fls6218784ejd.2.gmail; Tue, 26 Apr 2022
 23:27:55 -0700 (PDT)
X-Received: by 2002:a17:906:6a19:b0:6ef:5af4:de05 with SMTP id qw25-20020a1709066a1900b006ef5af4de05mr25604954ejc.672.1651040875521;
        Tue, 26 Apr 2022 23:27:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651040875; cv=pass;
        d=google.com; s=arc-20160816;
        b=i1uTePypVM9O+3Yd4j/zSF8ob4QB8zLdValotku32ZKvAU1a77LP38/chSn9Uwb92I
         zcKXaIswAvXEXWYZ0+kUTJTusCE9H+i0TP+11Hv/0zrneGJ77e/rM3TUzdAjGOjWysvm
         VaY0iBzcO8VxoMwEQRhm7pHx3A84dottMngIoInWhHzrmCdLlaRGeWODNhQ5+I3X18If
         T3FEV+APjNrpIwtDKBupNhH3KDN/4sfbb8JRTo9TvSz4bWLSFZkdu6Kj4ERJHjPOv3Hh
         I3xxy5MO647RpOPeLg4Qo/UpYcHbRUvhb3+xKJ5c30QpbqYNfo/eVDBoHpAbEUzIjmJ5
         poxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=a2gLbt5p0SSlntF+FCCLltGdXj6siWy6OryTZXNb+nY=;
        b=uO3CJAmlWOaRlj82HfoNdeo0TGgeGC+izX5M3d+L1DAx20dFCgiwYOo4QOH4Bd3Lmp
         D03Nfzm3AtQma43dD2BNkvRrqwjGMS0tZMiTeAYsnHabqHwPaAsADQgmvFKBrE+tN0kM
         yq5tKLFaR3IvwcVoCUzVUUahyLjpK/hk1J+eCJQvSer3cNRPTsO2l5F07BkvhQtAwYVj
         h2/0Zy32O/gAZMzjG+Wl2CirOU/uKAsWpyoY8RjULP8Pb0rXQw8/xTzolPFmv3eTt33T
         B6cO+Ngx+e1m+DCjgJEC/s0tbWXvV2HMbAMlxct4kLUUYX3HnPIUsWnEDMxL9u/q6VTt
         ztEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kW6K7fB3;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060e.outbound.protection.outlook.com. [2a01:111:f400:7e1b::60e])
        by gmr-mx.google.com with ESMTPS id s5-20020a05640217c500b0041cf5333d81si31298edy.4.2022.04.26.23.27.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::60e as permitted sender) client-ip=2a01:111:f400:7e1b::60e;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBmdV3wBhnkjkyPoPwKYlvKCYixcLxpZf9HkBG6qN0HlGI70BLdSQYlzH1Y6DT5riWg/jOpQDv3nkbI/EH4lkz3v+smL3bVssED24iXSZbEuld5ZGK3WkAX8FjtglrwXdVL1GgtDyJz4gTr6sdMHdtk83I/W6wVW/Kug4ma8UJjqVEu+Cn55l/4GM/hNchG4dSlkrtTPf+09BGb7fKKCrWj7CV0JmQyA0mR+DdI6sIJXwfnsGZznHGTh532RU3rR9Ift2cNmVbE/mrPK9G6zSQVry8VbWfFAR4guwsWH2GM7wj+y9VhbsVETgtcvgyah9YKsh/apPXlbooGgYWkkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2gLbt5p0SSlntF+FCCLltGdXj6siWy6OryTZXNb+nY=;
 b=FafIOgp3d9NrMm87OXOIs45vnk8+pk8fewcQ0dl8m9jrMNLwhPkrE5QsmT7LREQbpIm2+g9FPb2PwppKzU+3IvQzLb2jULxOXUWBtQ96ub93J8sWaryNz/qPOz2ihGA28T20rSsYvC3+mpY3rFShdWEnhnW0OeYDM9wrofcJGjwoo5CCDuF7Kjwl1NAVQ/8HvtHkvz8iRIRKQcfpF0FXTJoB2EtpjCpOOuoL8lk12cIsifhBDcKNV6ku1DIkCTS8vToZFuL31cfjbtnM52v4lblMhUanLz59JRinRYdKOXnv8NgA5E11jgWmyXC/OYTzo9JmNUMhzUXMLDhlxBONRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0015.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::20)
 by AM5PR10MB1747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:1d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 06:27:54 +0000
Received: from HE1EUR01FT043.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::bd) by SV0P279CA0015.outlook.office365.com
 (2603:10a6:f10:11::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 06:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT043.mail.protection.outlook.com (10.152.0.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:27:54 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 08:27:53 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 08:27:52 +0200
Message-ID: <f7188ad3-72bc-0c21-3373-9f1e4728d27a@siemens.com>
Date: Wed, 27 Apr 2022 08:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
Content-Language: en-US
To: "vsun...@gmail.com" <vsuneja63@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <fd90fac9-bb12-4839-b659-c417b236e04an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <fd90fac9-bb12-4839-b659-c417b236e04an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.065000-8.000000
X-TMASE-MatchedRID: a2rrTcOVXHmwaJhCGD0doHUu7PS8tlw4AioGpYo1Fp3x5KZMlKYS/YkT
	1Or73o1yhrrEcugeVJO2pj/QQ7dQ3ejSGf37erKAbnkyuYycPa1wVHk6n/j/BAi/ERREf4/TjWP
	6asaL88W/md2adk3dRGBt9mS7pKVTeoqVs1ZLrvCG184Y5LIrab9ZdlL8eonaXDuuY6zZZfPZs3
	HUcS/scCq2rl3dzGQ1YKjldhK/3R5zp2lp9BVJynUEr2HgRmcLN0vR9ana2uzvZ7r/PoNKZQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.065000-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 46158454140F81F6AE5480FB2096B00A3623D57BFFD34169DA61240DB542BA7B2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38462ff4-0a7d-4737-d4ca-08da28171004
X-MS-TrafficTypeDiagnostic: AM5PR10MB1747:EE_
X-Microsoft-Antispam-PRVS: <AM5PR10MB17478B5A318482E9FB0A90E595FA9@AM5PR10MB1747.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmJRHEac9/xVZrshGGSl8WHTTas4KczR06Xt1y/7mxKlq512tKfnl3ZHcXK9C/47hOXnpeEGuGZ+pGoqthb26zuP/MY1tUbSHVHBeeHo5Y6dQSeVhhxy1yrX5BYZqH9I6YHipzyR5EOmwJ5mx+LS8mZ8KDta+kGE4clVF+PE8ztktcBd069ahAXl1YeEdg/z0PwsZQIruF3U606lYFu38wT57EvTM2wONCL+zc2Mw384ZPrbAyfu5q8YbBKGXa22Ze2gIxqwR39JRyWkw+754DsDptIfN1fE1NCVCulG7/3f3xhVRRSOUVNFsNMKYFFbHq+ZJDkEdcr609ugReuBZFgvA3as3C9ktIonH4zA2Xmdu+XtafXE8hNMJaQfg/ZT++f3CzBlIgLLxW+piMP/uminZ3aawCy4boSpmIsHCpVvqEuTsAtpJXTB71SjqyVJ3JFsTtLHB73EieUl64J5k4JZSciP9ayK6U1mo+rSionTy10AfhYNGjvVVSnzeG3dR+lQqhk71VOa0QfePssgH8iV8AzM+Bu2Fo2EjsD05vFw1xYLDDYvL0xmm1sFjZRp3lvyT6Nd2mORRPzebom7pQnBvtnCeYvQQULlT/nfUNYjytqPDjwBH/1qsL6SY33XCpXNS6XHpdsK+IChzIsgH6U/nYmfRP+1ry0X8ujtwT1u9e4kYfgNuU8q1zzqZ3HTj6jIBbwkPjAfRFRPCIF+FfMYdOkLRX2VXo6rDvdG8i0XYu/w03mMsw0Kw6IBDPRYNppMhtcKYCZUQ8mJe+HTDKCGrDHWOvkuo9khDlWc62MYJuYohx8hXQNAp7PWLhCX
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(186003)(16526019)(336012)(47076005)(31696002)(8676002)(2616005)(956004)(31686004)(316002)(81166007)(86362001)(36860700001)(44832011)(70586007)(8936002)(5660300002)(40460700003)(4744005)(82310400005)(26005)(70206006)(53546011)(110136005)(16576012)(508600001)(2906002)(82960400001)(6706004)(356005)(3940600001)(15583001)(43740500002)(36900700001)(491001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:27:54.3676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38462ff4-0a7d-4737-d4ca-08da28171004
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB1747
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=kW6K7fB3;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1b::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 26.04.22 19:25, vsun...@gmail.com wrote:
> Hi,
>=20
> I could load custom image in emmc & that boot up successfully via
> jailhouse non-root cell in console. Root cell image shell getting
> displayed on hdmi but not getting how to display 2nd linux shell on
> imx8mq. How to achieve this or any other way for display? =C2=A0

Do you just need a shell? Via a UART or via network/ssh? Or do you need
two cells writing onto real displays?

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f7188ad3-72bc-0c21-3373-9f1e4728d27a%40siemens.com.
