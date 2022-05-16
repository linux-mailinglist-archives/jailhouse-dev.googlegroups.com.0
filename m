Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB662Q6KAMGQEZVPSOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC7527D81
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 May 2022 08:21:48 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id bc17-20020a056402205100b0042aa0e072d3sf2728164edb.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 15 May 2022 23:21:48 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652682107; cv=pass;
        d=google.com; s=arc-20160816;
        b=xFfhXqSe79kHzkdcdPdThxGTXMoQeXhecrqzY/0sfkotvFy3N/w+cTKf/Tzv055tCy
         XqRUvlj0QB/YJUWwGInTCL/6B9TwgMZpDpvSQRmJMSvJb0FCaFhZE7IdDYeBjCkvY7/W
         Qa5Y8t97QT+u/k8fjpT5PTNto2AaUvMvrMxTqYcm96NY1bjMbe7qXMKhWLo3Y1BZDP0q
         Mu1AQQIBPMLChnpcKGe5E5w4NdDJeD4aBTpnz/85h0kjj6ySHsHATDLHp2iQqmrnvxTw
         BMqhRJZ3k88rN2cIN3rxmWhsbX9iBsMEhWs5y6r/ZYx958CYBzQKK38wr3PQPN7j01k4
         jbKg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=lEJQM21RhpgjiiXIvGkhQMJs5LSw/dpmeWDo+/KIkwY=;
        b=pfYO3c2+cjeNH6RRVBFOeMCL2XJOs77fYn10sCxgQHp1Q6TQtAZbFslE7TxQ15nTPt
         AakQ6HtF2UKP8QeiPLvM1Bf97vEj078oUqH1xi+HqA1vvZ01PiOhjYwu59d4wqCl0kMV
         8EQpAiM3P3Hwwvusz/S2WOssRh4osH08p1xjfWIAmkMPN+M2qCHpsy5/S5me3l1JayJG
         Q7S3PxTO2avfxG61+B3iQclC7XuhqN/Xnd+2PMr34DI1nqrwErCWsC7i5MZRp3eyPHZ5
         b7tRXgYXzvja3sByzDGtzA/TQI3nZDKSucTfjYAdVkNpUzRPV1oUBVCKkCFZjlDj5gXE
         fbpQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=b5Gs09fR;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::62b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lEJQM21RhpgjiiXIvGkhQMJs5LSw/dpmeWDo+/KIkwY=;
        b=SKwwyNm02aSuuctAEWhRG3Hi5Dgil5nz8RNtY1Ks7Y5y7QnIvWVvV23VxyY2Op7Dg7
         il2izgVpy6BjggKcug5wYQa6gcf+8K47kPlzdSk9GJCPCZsqyfjzwXymLCjvBKqqXq3U
         PZP7FeFZO2q/BFYJzCeywntwO9Eg/8zlrQrklUeDLPbMqIU5ARfQihcEtSAqGH92Mslq
         DnB7z3u6tWVF+v0V1gJ/RRneT3P6NI1u2gM5KRTQ3XBvu2BVB99bVyzN+0I2hRtS6hJU
         +ausDllKlmQY0jwk+xqNTt9yKH1d/03xxwGN/GKHLjvRzjPriF1CwIIWi63q5BcHdre7
         btOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lEJQM21RhpgjiiXIvGkhQMJs5LSw/dpmeWDo+/KIkwY=;
        b=If7hskt12yJ3truk+lnc622fuaOx6mt1rxe7Y4qOjn1P3XTwGyzpjZciRoclRVEfcc
         9EIWuhrWbKYGkSx78OJ12ndPasevT+LRp6Z8orq0DKb/00h6Dse4gkn6zT3zkDcgZ3gv
         bOQDV8MFqVtBz8toSwk2z/JG7Ra6YlbXGrlFSVF0CgT9d9WqxcsKJU/RLsYHxQ0z4hVc
         ZN3s6JHaBxglFyydovGS/R4tlOxUJytiJ/7hHBA0YOJy4i7wCl2XDOuqt2+g7oucnAiP
         Ys3U4+1uTYrYkmpEg7Yh+JJWx+iOudXEEBnZCdRHbN6Hm+PIYSxWHdzihvJGR3iLPYws
         F+lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530E8LXgnS36dwh+m8yKEosxXkAL1lkvAuvkyHRXSu3hTYRJWkKV
	VaGCgAJSjw9jOBCVi3MJcrU=
X-Google-Smtp-Source: ABdhPJwJLoc1uhFMG+fLVSI+PJIC7grx2pOlJJjL5vmXUWfJ4BRVTCZaqWt+ugg/3dLozOzSVP4E7Q==
X-Received: by 2002:a05:6402:3906:b0:42a:ad43:6477 with SMTP id fe6-20020a056402390600b0042aad436477mr5392137edb.20.1652682107907;
        Sun, 15 May 2022 23:21:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:3f8a:b0:6f4:31e5:5c0 with SMTP id
 hr10-20020a1709073f8a00b006f431e505c0ls6664251ejc.4.gmail; Sun, 15 May 2022
 23:21:46 -0700 (PDT)
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id nd41-20020a17090762a900b006da79534df0mr13696623ejc.316.1652682106328;
        Sun, 15 May 2022 23:21:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652682106; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yapx3Y4wfIryGkcPh5CzOfnv7gbDKt3GtI3trTB3twd6rHTurGfsnRjZoR71s4XG6F
         aDJ/zwjiA6J9r4qppolkOm2ZZjtN2e+j4FkCwfollP6+cRznbmeBjSayBzcH3CQKzdS/
         8q/LBwXN73v84kOLzDi0k+w+TY35tyF6SPqbjLij/5Aqrbb3RPhH2byoBPyOzfX6DrZp
         EcT+BF8fzLB0kXmK6r/xxxL1dU3Siv6CdADc33WJoyh8xESuXAuUUouH7GGRPMfj+mq3
         gyHiWpDXV2TY9jEMon5iXezfwN0aC2yiaEG3+umHoqAAOzVTA/pXLP0ANVhtk073QHIM
         GW7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7VclDuHaOisJ1vQ+ePL1oTNi/BDfErC5FXxima8WWBc=;
        b=dZwnlVu2u9LxaftDVBeRl70eq2pvxRB3zfoAOrsXfuS8pcKzP6/+frQxBJbBX/kr9U
         G4F6TNkq6wSrwMhrUXNualVzfg/qZGh2vt/swL3J4zWZ7hQIAxvUDBud6+io4CD8UUg2
         RQ38auHnvW2AvHPjhEZXuqemvRM6JvVmoq1yGhybuK65iu09OLxI3Ffgb8GPK4nwCSkZ
         bejPyBzMmGRBuI9kWxm7ENW7Fs7xVALNqL+RO72uOQyUVFIyEK6Y1pHid00/yDbx8Nx8
         b0KJES9ru5L3LDtbIqzFWJf081ZUDqcSsSBS8aB6xNvoF7ikZBkSkoUqKKXkRadmRzFi
         5+yw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=b5Gs09fR;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::62b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on062b.outbound.protection.outlook.com. [2a01:111:f400:fe0c::62b])
        by gmr-mx.google.com with ESMTPS id b22-20020a50e796000000b0041cf5333d81si512477edn.4.2022.05.15.23.21.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 May 2022 23:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::62b as permitted sender) client-ip=2a01:111:f400:fe0c::62b;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6wvVfCGkM8qIiE1gb2V/J5dwKWYazXsTXRvoh66Iv8BP8dTdMNrKm2STVJvj6yCfzA13M1nNEmGXzCXPB795Tymbr8g9sf/m9dPK6I09i79b5vGOOi1PNSuQ9xXLJB5ZEyXFw9ILJXoZZXt2pzrTXoD8bleL/QxjKSAk1nUFVj5LfbVJQpLnQ3eOu2sGL2TXM6gvDe6G/b/K33RbOL65ZLHS+KQvyDbo0Q/e40Xz240acIbahaJzm8lmXiatIm7jd7z346qiQAibNc1e8EoRo2QOlKd2h05xH9YONbcjPb+OoUkdhLJ+CqlUzgXAUJXZSeUl3Z6AJRMNmVEun2BTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VclDuHaOisJ1vQ+ePL1oTNi/BDfErC5FXxima8WWBc=;
 b=frjedfPuQrNlQZTb18noZnlVEgY9mc4kuSYMZRaKHODcHXPsKrLLCBdShLGn9+Iit85dijDNg2ZKL5CkIB+vaPqMY5TD4HpInkMaxDDGge7RHt9coVCh/Jnnkxe6L3mSXCvRteFMhm6bLR7vDlCCV1j+ai/v2liqJIZCRh6vLF0y3bWpeMFqst6L78UK0TgGEH52ffPs37Ues0NRB3gmIJl6AUsmhm8ElUMTCce/QqfjkCHFyQ8N7h7WcTUuMdwo3iYfuEmu0dG8W7D2pGDbhmT6xw/qkpWwWUBx4LJ5gKQ50JnM2aZnKzwzcbfJVSudeWuHhLrTPsABbeZON5vpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM6P193CA0038.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::15)
 by AS1PR10MB5216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 06:21:45 +0000
Received: from VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::69) by AM6P193CA0038.outlook.office365.com
 (2603:10a6:209:8e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Mon, 16 May 2022 06:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT020.mail.protection.outlook.com (10.152.2.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 06:21:45 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 08:21:44 +0200
Received: from [167.87.72.34] (167.87.72.34) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Mon, 16 May
 2022 08:21:44 +0200
Message-ID: <364721db-8754-728e-e117-df4df2e757a1@siemens.com>
Date: Mon, 16 May 2022 08:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: phys_start and virt_start relationship with IPA, PA and VA
Content-Language: en-US
To: Jean de Bonfils <jdebonfils5@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <57292f2e-56a8-4692-915a-023583501d66n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <57292f2e-56a8-4692-915a-023583501d66n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.72.34]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--13.242800-8.000000
X-TMASE-MatchedRID: RfRf601lRZE5QaOxwNGfvo9bHfxDWoibZFnOBL1vNaYzxdO2BTO207/I
	3arxTrviZJxd1CJuMIDZ3ya1EhGxQ4ApEalY153Wt5HxbF5ws0le2wadKADqqt5x7RpGJf1aqyb
	8uklAH9Wzht7teFbZnjUeevPcUyNZINQrslQ0hebr9E4aIltZg/cP4R8hkkRzqug9vIA2WOB+CW
	CcHScOE+goDXVX5gF6C7wCgDJ8bdEr59u/gzv5MLUzq8RBkJuGcNYIRle9ggeeAiCmPx4NwHJnz
	Nw42kCxxEHRux+uk8h+ICquNi0WJE/Cirmwpl4zt+/oxsG7FQK/RbGN9oXPoyCHAfIB2N81ftwZ
	3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.242800-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: F5C9A40A182E236B5F95F90CB3FD59C903474DDC32EF29A95DCFCDCC6010AA322000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9ddcab5-1f53-4cf9-531d-08da370459c3
X-MS-TrafficTypeDiagnostic: AS1PR10MB5216:EE_
X-Microsoft-Antispam-PRVS: <AS1PR10MB521684C55DE8CE5819CB7BAC95CF9@AS1PR10MB5216.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rp8A1S8UufAEof2bigCwAyz5LI0hVB6Ui0ywwgru8485H7a9Tq1cGTq3XgUjx7MqVfuyFRa1IiCfikwLj6kBhOZvfC9EkjOGPA5jMph3jcg1YYv8H2VJxjyZmjixlJ5Se/RLyq3U0GDVroNZ7PFeW5oRX0gyQG6YUUQuSdVexJ2TeWdHXninok6cBLaUMP9eTKOK0deItzEM5dKznB7iTuBbjH9LHmHSOytcGHzGc9ICC5XuY+eicVDwvYMNkIsmcOAZVfj9UY2OK9FLoIE0ogtBL1UfjHD3vQIfKE0iJ9/+NC2WXNFacN0hzw5yprSyORIWzwxMr9/GeRFFn6kp0FTW3+85mRPFedCXnhDoNfOAjJL8KjlEwXMiR5xH7zALGHD3qC2zC/nnaHadYdUWtYka3QYLXM6ycJ6UeCEDP25UxqqiiOcSM065P9dgbvulTPOddtDcbb4oOgaywXmDDgeC7zqRQkZqCBIEFnkO5V/yJUN1pI5HaxXOpyUk6C3WsYCN9WxYjyzCHyOcKmlWxEZPyEdLzLzdp/A7IevI4eTB91waXaJwAarDG0O+I6xUc9npovaDfhdROsV/XizwMNkl2yVs7F34/Hu4IrZlTPEMEnNeDhtMDLVzAcFr518oZfEpj7nuOfoI0A1XKx5qaapyayCmFyeDqinMDZ2oyLGcn+lEzLvbo27KfzUQiX+u2loEDuUE1Z++4DLysKaxPKqJB74NDusk7k05TpjmweygiXROYnz7nOD2dCsytcfzt4gPoeZRuBOEkquwWfmP9g==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(2906002)(956004)(47076005)(356005)(336012)(82960400001)(82310400005)(31686004)(316002)(6706004)(110136005)(36860700001)(70586007)(186003)(16526019)(40460700003)(44832011)(8676002)(70206006)(508600001)(8936002)(5660300002)(26005)(53546011)(31696002)(86362001)(16576012)(36756003)(2616005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 06:21:45.1091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ddcab5-1f53-4cf9-531d-08da370459c3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5216
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=b5Gs09fR;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::62b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.05.22 15:42, Jean de Bonfils wrote:
> Hi everyone,
> I can not understand the relationship between=C2=A0*phys_start *and
> *virt_start* defined in cells and Intermediate Physical Address,
> Physical address...
>=20
> Are phys_start addresses defined in cells IPA or PA ?

It's PA, the host's view of physical addresses.

> Are virt_start addresses defined in cells VA or IPA ?

IPA. The hypervisor does not mess with the guest's own translation
tables (IPA->VA).

> Why in inmate cell samples virt_start are equals to phys_start ? What if
> I would set a different mapping ?

There are basically two reason to ID-map resources into the cell:

 - for physical resources, it avoids having to invent an own guest
   address layout and permits to reuse device tree fragments from the
   host

 - for RAM, this works around missing IOMMUs (which has isolation
   implications as well, obviously)

If non-of that matters, you may also relocate the resources of a
non-root cell.

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
jailhouse-dev/364721db-8754-728e-e117-df4df2e757a1%40siemens.com.
